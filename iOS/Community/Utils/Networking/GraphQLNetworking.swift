//
//  GraphQLNetworking.swift
//  GraphQLNetworking
//
//  Created by Vlad Z. on 8/2/21.
//

import Foundation
import Apollo

class GraphQLNetworking {
    static let shared = GraphQLNetworking()
    
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJKRldERXNNOWsiLCJuZXR3b3JrSWQiOiJNYTZPenMwN29TIiwibmV0d29ya0RvbWFpbiI6Im9jdG9lbnQudHJpYmVwbGF0Zm9ybS5jb20iLCJ0b2tlblR5cGUiOiJVU0VSIiwiZW50aXR5SWQiOm51bGwsInBlcm1pc3Npb25Db250ZXh0IjpudWxsLCJwZXJtaXNzaW9ucyI6bnVsbCwiaWF0IjoxNjI3OTQ4MDE2LCJleHAiOjE2MzA1NDAwMTZ9.OkWGXIugwccA_xljqohkco12gd0dOdQdMzXwYDGK1M8"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        
        let client = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client, shouldInvalidateClientOnDeinit: true, store: store)
        
        let url = URL(string: "https://app.tribe.so/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
}

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            request.addHeader(name: "Authorization", value: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJKRldERXNNOWsiLCJuZXR3b3JrSWQiOiJNYTZPenMwN29TIiwibmV0d29ya0RvbWFpbiI6Im9jdG9lbnQudHJpYmVwbGF0Zm9ybS5jb20iLCJ0b2tlblR5cGUiOiJVU0VSIiwiZW50aXR5SWQiOm51bGwsInBlcm1pc3Npb25Db250ZXh0IjpudWxsLCJwZXJtaXNzaW9ucyI6bnVsbCwiaWF0IjoxNjI3OTQ4MDE2LCJleHAiOjE2MzA1NDAwMTZ9.OkWGXIugwccA_xljqohkco12gd0dOdQdMzXwYDGK1M8")
            
            print("request :\(request)")
            print("response :\(String(describing: response))")
            
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
}
