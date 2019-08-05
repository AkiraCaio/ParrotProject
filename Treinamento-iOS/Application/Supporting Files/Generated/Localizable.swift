// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Common {
    /// Ok
    internal static let ok = L10n.tr("Localizable", "common.ok")
  }

  internal enum Controller {

    internal enum Title {
      /// Perfil
      internal static let profile = L10n.tr("Localizable", "controller.title.profile")
    }
  }

  internal enum Tabbar {
    /// Home
    internal static let home = L10n.tr("Localizable", "tabBar.home")
    /// Perfil
    internal static let profile = L10n.tr("Localizable", "tabBar.profile")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
