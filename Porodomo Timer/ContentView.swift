//
//  ContentView.swift
//  Porodomo Timer
//
//  Created by trinh.tin on 2020/05/23.
//  Copyright © 2020 New Tetra. All rights reserved.
//

import SwiftUI
import UserNotifications

var currentTimer: Timer = Timer.init()

struct ContentView: View {
    @State var porodomoTimeMinutes: String = "0"
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Porodomo Time in Miniutes:")
                TextField("", text: self.$porodomoTimeMinutes)
            }
            Button(action: {
                let min = Double(self.porodomoTimeMinutes) ?? 0
                currentTimer.invalidate()
                currentTimer = Timer.scheduledTimer(withTimeInterval: min, repeats: false) { (Timer) in
                    self.showNotification()
                    self.playAlarmSound()
                }
            }) {
                Text("Set Timer")
            }
        }
    }
    
    func playAlarmSound() -> Void {
        NSSound(named: "Purr")?.play()
    }
    
    func showNotification() -> Void {
        let notification = NSUserNotification()
        notification.title = "Porodomo Time'sup"
        notification.informativeText = "Please take a break"
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(notification)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
