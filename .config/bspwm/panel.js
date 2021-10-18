const readline = require('readline')
const process = require('process')
const { stdout } = require('process')
const { exec } = require('child_process')

const blocks = [
  // [cmd, sleepTimeInSeconds]
  ["echo -n `date '+%-d.%-m.%Y %H.%M'`", 1],
  ["export POSIXLY_CORRECT=1; sensors -u | awk '/temp1_input/{printf(\"%0.1f °C\", $2)}'", 10],
  ["export POSIXLY_CORRECT=1; mpstat 1 1 | awk '/\\.*:/{printf(\"%s %\",$3)}'", 5],
  ["export POSIXLY_CORRECT=1; awk '/^MemTotal:/{mt=$2}/^MemAvailable:/{ma=$2}END{used=(mt-ma)/1048576;printf(\"%.1f G\",used)}' /proc/meminfo", 10],
  ["df -h -P / | awk '/\\/.*/{printf gensub(/([0-9]+)/,\"\\\\1 \",\"g\",$4);}'", 30]
]

const backgroundUrgent = "#FFE08300"
const backgroundFocused = "#FFC7C99B"
const backgroundUnfocused = "#FF000000"
const foregroundUrgent = "#FFFFFF"
const foregroundFocused = "#FF14213D"
const foregroundUnfocused = "#FFBFD4E1"
let wmStatusConsoleOut = ""
const wmStatusCommand = "bspc subscribe report"

const signalHandler = () => process.exit(0)
process.on("SIGTERM", signalHandler)
process.on("SIGINT", signalHandler)

let printCall = null

function printBar() {
  let output = "%{l}"
  output += wmStatusConsoleOut
  output += "%{r}"
  for (let i = blocks.length; i >= 0; i--) {
    output += "  "
    output += (blocksData[i] ?? "").replace("%", "%%")
    output += "  "
  }
  console.log(output)
  printCall = null
}

const blocksData = new Proxy({}, {
  set: (obj, prop, value) => {
    obj[prop] = value
    if (printCall === null) {
      printCall = setTimeout(printBar, 0)
    }
    return true
  }
})

blocks.forEach(function callback(block, index) {
  const [command, interval] = block
  let output = ""
  const proc = exec(command)
  proc.stderr.pipe(stdout)
  proc.stdout.on("data", (msg) =>
    output += msg
  )
  proc.on("close", () => {
    blocksData[index] = output
    setTimeout(() => {
      callback(block, index)
    }, interval * 1000)
  })
})

const wmStatus = exec(wmStatusCommand)
readline.createInterface({ input: wmStatus.stdout }).on("line", (line) => {
  wmStatusConsoleOut = ""
  const items = line.split(":")
  items.forEach(item => {
    const value = item.substring(1)
    switch (item[0]) {
      case "U": // urgent
      case "u": // urgent unfocused
        wmStatusConsoleOut += `%{F${foregroundUrgent}}`
        wmStatusConsoleOut += `%{B${backgroundUrgent}}`
        break
      case "O": // focused
      case "F":
        wmStatusConsoleOut += `%{F${foregroundFocused}}`
        wmStatusConsoleOut += `%{B${backgroundFocused}}`
        break
      case "o": // unfocused
        wmStatusConsoleOut += `%{F${foregroundUnfocused}}`
        wmStatusConsoleOut += `%{B${backgroundUnfocused}}`
        break
      default:
        return
    }

    wmStatusConsoleOut += `%{A:bspc desktop -f ${value}:}  ${value}  %{A}`
  })
  wmStatusConsoleOut += "%{B-}%{F-}"

  if (printCall === null) {
    printCall = setTimeout(printBar, 0)
  }
})

wmStatus.stderr.pipe(stdout)
wmStatus.on("close", () => {
  console.error(wmStatusCommand, "failed")
  process.exit(1)
})
