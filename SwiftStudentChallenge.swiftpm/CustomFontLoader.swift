import SwiftUI

class customFontLoader {
 @MainActor static let shared = FontLoader()
    func customFont() {
         if let cfURL = Bundle.main.url(forResource: "CantoraOne-Regular", withExtension: "ttf") as CFURL? {
          CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
         }
    }
}
