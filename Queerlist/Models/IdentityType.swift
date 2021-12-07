import Foundation

enum IdentityType: String {

    case lesbian = "👨‍🎤  Lesbian"
    case gay = "💁‍♂️  Gay"
    case bisexual = "👨‍❤️‍💋‍👨  Bisexual"
    case transgender = "🧑‍🦰  Transgender"
    case queer = "🌈  Queer"
    case intersex = "💜  Intersex"
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

}
