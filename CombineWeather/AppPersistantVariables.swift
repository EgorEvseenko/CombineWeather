//
//  AppPersistantVariables.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 29.01.22.
//
import Foundation

private enum VariablesKeys: String {
    case isUserAuthorized
    case email
    case password
    case profileType
    case isKnowYourCustomerNeeded
    case isKnowYourCustomerVerified
    case id
    case version
    case profiles
    case selectedPlanType
    case showLogoutAlert
    case contentfulProfile
    case profilesID
}

struct AppPersistantVariables {
    @Defaults<Bool>(key: .isUserAuthorized) static var isUserAuthorized
    @Defaults<String>(key: .email) static var email
    @Defaults<String>(key: .password) static var password
    @Defaults<String>(key: .profileType) static var profileType
    @Defaults<Bool>(key: .isKnowYourCustomerNeeded) static var isKnowYourCustomerNeeded
    @Defaults<Bool>(key: .isKnowYourCustomerVerified) static var isKnowYourCustomerVerified
    @Defaults<String>(key: .id) static var id
    @Defaults<Int>(key: .version) static var version
    @Defaults<[String]>(key: .profiles) static var profiles
    @Defaults<String>(key: .selectedPlanType) static var selectedPlanType
    @Defaults<Bool>(key: .showLogoutAlert) static var showLogoutAlert
    @Defaults<String>(key: .contentfulProfile) static var contentfulProfile
    @Defaults<Dictionary<String, String>>(key: .profilesID) static var profilesID
}

// MARK: - Property wrappers
@propertyWrapper
struct Defaults<T> {
    private var storage: UserDefaults = .standard

    let key: String

    var wrappedValue: T? {
        get {
            storage.value(forKey: key) as? T
        }
        set {
            storage.setValue(newValue, forKey: key)
        }
    }

    fileprivate init(key: VariablesKeys) {
        self.key = key.rawValue
    }
}
