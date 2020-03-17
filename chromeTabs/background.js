'use strict';

const moveCurrentTab = (direction) => {
    chrome.tabs.query({ active: true, currentWindow: true }, (tab) => {
        const { id: currentId, index: currentIndex } = tab[0];
        chrome.tabs.move(currentId, { index: currentIndex + 1 * direction })
    })
}

const focusTab = (direction) => {
    chrome.tabs.query({ active: true, currentWindow: true }, (currentTab) => {
        const { index: currentIndex } = currentTab[0];
        chrome.tabs.query({ index: currentIndex + 1 * direction, currentWindow: true }, (focusTab) => {
            const { id } = focusTab[0];
            chrome.tabs.update(id, {
                active: true
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