//
//  DropGoApp.swift
//  DropGo
//
//  Created by Gojaehyun on 7/1/25.
//

import SwiftUI
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover: NSPopover?
    var inputWindowController: NSWindowController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // 핫키 등록: 옵션 + d
        HotKeyManager.shared.registerSavedOrDefaultHotKey(target: self, action: #selector(showInputWindow))
    }

    @objc func showInputWindow() {
        // 입력창(스포트라이트 스타일) 띄우기
        if inputWindowController == nil {
            let inputView = InputPanelView()
            let hosting = NSHostingController(rootView: inputView)
            let window = NSWindow(contentViewController: hosting)
            window.styleMask = [.titled, .fullSizeContentView]
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.isOpaque = false
            window.backgroundColor = .clear
            window.level = .floating
            window.center()
            inputWindowController = NSWindowController(window: window)
        }
        inputWindowController?.showWindow(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}

@main
struct DropGoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
