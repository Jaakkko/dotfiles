'use strict';

const moveCurrentTab = (direction) => {
    chrome.tabs.query({ currentWindow: true }, (tabs) => {
        const tabCount = tabs.length
        chrome.tabs.query({ active: true, currentWindow: true }, (tab) => {
            const { id: currentId, index: currentIndex } = tab[0];
            let nextIndex = currentIndex + 1 * direction
            if (nextIndex < 0) {
                nextIndex = tabCount - 1
            }
            else if (nextIndex === tabCount) {
                nextIndex = 0
            }

            chrome.tabs.move(currentId, { index: nextIndex })
        })
    })
}

const focusTab = (direction) => {
    chrome.tabs.query({ currentWindow: true }, (tabs) => {
        const tabCount = tabs.length
        chrome.tabs.query({ active: true, currentWindow: true }, (currentTab) => {
            const { index: currentIndex } = currentTab[0];
            let nextIndex = currentIndex + 1 * direction
            if (nextIndex < 0) {
                nextIndex = tabCount - 1
            }
            else if (nextIndex === tabCount) {
                nextIndex = 0
            }

            chrome.tabs.query({ index: nextIndex, currentWindow: true }, (focusTab) => {
                const { id } = focusTab[0];
                chrome.tabs.update(id, {
                    active: true
                })
            })
        })
    })
}

chrome.commands.onCommand.addListener(function (command) {
    switch (command) {
        case 'nextTab':
            focusTab(1)
            break
        case 'previousTab':
            focusTab(-1)
            break
        case 'moveTabRight':
            moveCurrentTab(1)
            break
        case 'moveTabLeft':
            moveCurrentTab(-1)
            break
    }
})