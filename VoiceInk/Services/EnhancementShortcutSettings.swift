import Foundation
import SwiftUI

class EnhancementShortcutSettings: ObservableObject {
    static let shared = EnhancementShortcutSettings()

    @Published var isToggleEnhancementShortcutEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isToggleEnhancementShortcutEnabled, forKey: "isToggleEnhancementShortcutEnabled")
            NotificationCenter.default.post(name: .AppSettingsDidChange, object: nil)
        }
    }

    @Published var isSwitchPromptShortcutEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isSwitchPromptShortcutEnabled, forKey: "isSwitchPromptShortcutEnabled")
            NotificationCenter.default.post(name: .AppSettingsDidChange, object: nil)
        }
    }

    private init() {
        self.isToggleEnhancementShortcutEnabled = UserDefaults.standard.object(forKey: "isToggleEnhancementShortcutEnabled") as? Bool ?? true
        self.isSwitchPromptShortcutEnabled = UserDefaults.standard.object(forKey: "isSwitchPromptShortcutEnabled") as? Bool ?? true
    }
}
