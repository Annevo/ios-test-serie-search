import Foundation

protocol Localizable {
    var tableName: String { get }
    var localized: String { get }
}

extension String {

    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "<~(\(self))~>", comment: "")
    }

}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {

    var localized: String {
        return rawValue.localized(tableName: tableName)
    }

}
