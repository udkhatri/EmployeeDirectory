import SwiftUI

final class SettingViewModel: ObservableObject {
    let navTitle: String = NSLocalizedString("settting_view_navigation_title", comment: "Languages")
    let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    let bundleId = Bundle.main.bundleIdentifier ?? "Bundle id not found"
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    let appIdentifier = Bundle.main.bundleIdentifier ?? NSLocalizedString(" bundle_id_not_found", comment: "id of app")
    let devBy: String = NSLocalizedString("dev_by", comment: "devloped by")
    let devName: String = NSLocalizedString("dev_name", comment: "name of developer")
    let name: String = NSLocalizedString("name", comment: "name")
    let version: String = NSLocalizedString("version", comment: "version")
    let id: String = NSLocalizedString("id", comment: "identifier")
    let bundleInfo: String = NSLocalizedString("bundle_info", comment: "bundle info")
}
