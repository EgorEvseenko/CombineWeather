import Resolver

extension Resolver: ResolverRegistering {
    static let scope = ResolverScopeCache()

    public static func registerAllServices() {
        registerNetwork()
        registerScenes()
    }
}
