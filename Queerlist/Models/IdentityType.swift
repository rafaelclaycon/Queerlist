import UIKit

enum IdentityType: String {

    case lesbian = "👨‍🎤  Lesbian"
    case gay = "💁‍♂️  Gay"
    case bisexual = "👨‍❤️‍💋‍👨  Bisexual"
    case transgender = "🧑‍🦰  Transgender"
    case queer = "🌈  Queer"
    case intersex = "💛  Intersex"
    case asexual = "💘  Asexual"
    case transvestite = "🌺  Transvestite"
    
    static func getTypeNameForTinyHeader(_ type: IdentityType) -> String {
        switch type {
        case .lesbian:
            return self.lesbian.rawValue.uppercased()
        case .gay:
            return self.gay.rawValue.uppercased()
        case .bisexual:
            return self.bisexual.rawValue.uppercased()
        case .transgender:
            return self.transgender.rawValue.uppercased()
        case .queer:
            return self.queer.rawValue.uppercased()
        case .intersex:
            return self.intersex.rawValue.uppercased()
        case .asexual:
            return self.asexual.rawValue.uppercased()
        case .transvestite:
            return self.transvestite.rawValue.uppercased()
        }
    }
    
    static func getColorForTinyHeader(_ type: IdentityType) -> UIColor {
        switch type {
        case .lesbian:
            return .orange
        case .gay:
            return UIColor(displayP3Red: 0.35, green: 0.54, blue: 0.16, alpha: 1.00) // Rich green
        case .bisexual:
            return UIColor(displayP3Red: 0.07, green: 0.20, blue: 0.62, alpha: 1.00) // Marine blue
        case .transgender:
            return UIColor(displayP3Red: 0.90, green: 0.67, blue: 0.72, alpha: 1.00) // Pastel pink
        case .queer:
            return .red
        case .intersex:
            return .purple
        case .asexual:
            return UIColor(displayP3Red: 0.48, green: 0.36, blue: 0.49, alpha: 1.00) // Grayish light purple
        case .transvestite:
            return UIColor(displayP3Red: 0.80, green: 0.55, blue: 0.84, alpha: 1.00) // Neon pink
        }
    }

}
