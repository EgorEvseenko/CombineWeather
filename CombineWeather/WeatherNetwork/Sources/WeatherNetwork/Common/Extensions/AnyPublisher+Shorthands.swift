import Combine

extension AnyPublisher {
    public static func just(_ output: Output) -> AnyPublisher<Output, Failure> {
        return Just(output)
            .setFailureType(to: Failure.self)
            .eraseToAnyPublisher()
    }

    public static func fail(_ error: Failure) -> AnyPublisher<Output, Failure> {
        return Fail(error: error)
            .eraseToAnyPublisher()
    }
}

extension Publisher {
    public func mapCatch(_ handler: @escaping (Self.Failure) -> AnyPublisher<Self.Output, Self.Failure>)
    -> AnyPublisher<Self.Output, Self.Failure> {
        return tryCatch({ (error) -> AnyPublisher<Self.Output, Self.Failure> in
            return handler(error)
        })
        .mapError({ (error) -> Self.Failure in
            guard let error = error as? Self.Failure else {
                preconditionFailure()
            }
            return error
        })
        .eraseToAnyPublisher()
    }
}
