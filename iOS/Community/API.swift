// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getFeed($limit: Int!) {
      getFeed(limit: $limit) {
        __typename
        nodes {
          __typename
          id
          title
          reactionsCount
          repliesCount
          owner {
            __typename
            member {
              __typename
              id
              name
              username
              profilePicture {
                __typename
                ... on Image {
                  id
                  name
                  url
                }
              }
            }
          }
          postType {
            __typename
            name
          }
          shortContent
          seoDetail {
            __typename
            title
            description
          }
        }
      }
    }
    """

  public let operationName: String = "getFeed"

  public var limit: Int

  public init(limit: Int) {
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getFeed", arguments: ["limit": GraphQLVariable("limit")], type: .nonNull(.object(GetFeed.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getFeed: GetFeed) {
      self.init(unsafeResultMap: ["__typename": "Query", "getFeed": getFeed.resultMap])
    }

    @available(*, deprecated, message: "This query will be replaced by feed")
    public var getFeed: GetFeed {
      get {
        return GetFeed(unsafeResultMap: resultMap["getFeed"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getFeed")
      }
    }

    public struct GetFeed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaginatedPost"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.nonNull(.object(Node.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node]? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaginatedPost", "nodes": nodes.flatMap { (value: [Node]) -> [ResultMap] in value.map { (value: Node) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var nodes: [Node]? {
        get {
          return (resultMap["nodes"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Node] in value.map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node]) -> [ResultMap] in value.map { (value: Node) -> ResultMap in value.resultMap } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Post"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("reactionsCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("repliesCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("owner", type: .object(Owner.selections)),
            GraphQLField("postType", type: .object(PostType.selections)),
            GraphQLField("shortContent", type: .scalar(String.self)),
            GraphQLField("seoDetail", type: .nonNull(.object(SeoDetail.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String? = nil, reactionsCount: Int, repliesCount: Int, owner: Owner? = nil, postType: PostType? = nil, shortContent: String? = nil, seoDetail: SeoDetail) {
          self.init(unsafeResultMap: ["__typename": "Post", "id": id, "title": title, "reactionsCount": reactionsCount, "repliesCount": repliesCount, "owner": owner.flatMap { (value: Owner) -> ResultMap in value.resultMap }, "postType": postType.flatMap { (value: PostType) -> ResultMap in value.resultMap }, "shortContent": shortContent, "seoDetail": seoDetail.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var reactionsCount: Int {
          get {
            return resultMap["reactionsCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "reactionsCount")
          }
        }

        public var repliesCount: Int {
          get {
            return resultMap["repliesCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "repliesCount")
          }
        }

        public var owner: Owner? {
          get {
            return (resultMap["owner"] as? ResultMap).flatMap { Owner(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "owner")
          }
        }

        public var postType: PostType? {
          get {
            return (resultMap["postType"] as? ResultMap).flatMap { PostType(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "postType")
          }
        }

        public var shortContent: String? {
          get {
            return resultMap["shortContent"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "shortContent")
          }
        }

        public var seoDetail: SeoDetail {
          get {
            return SeoDetail(unsafeResultMap: resultMap["seoDetail"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "seoDetail")
          }
        }

        public struct Owner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SpaceMember"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("member", type: .object(Member.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(member: Member? = nil) {
            self.init(unsafeResultMap: ["__typename": "SpaceMember", "member": member.flatMap { (value: Member) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var member: Member? {
            get {
              return (resultMap["member"] as? ResultMap).flatMap { Member(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "member")
            }
          }

          public struct Member: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Member"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("profilePicture", type: .object(ProfilePicture.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, username: String, profilePicture: ProfilePicture? = nil) {
              self.init(unsafeResultMap: ["__typename": "Member", "id": id, "name": name, "username": username, "profilePicture": profilePicture.flatMap { (value: ProfilePicture) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var username: String {
              get {
                return resultMap["username"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }

            public var profilePicture: ProfilePicture? {
              get {
                return (resultMap["profilePicture"] as? ResultMap).flatMap { ProfilePicture(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "profilePicture")
              }
            }

            public struct ProfilePicture: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Emoji", "Image"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLTypeCase(
                    variants: ["Image": AsImage.selections],
                    default: [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    ]
                  )
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeEmoji() -> ProfilePicture {
                return ProfilePicture(unsafeResultMap: ["__typename": "Emoji"])
              }

              public static func makeImage(id: GraphQLID, name: String? = nil, url: String) -> ProfilePicture {
                return ProfilePicture(unsafeResultMap: ["__typename": "Image", "id": id, "name": name, "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var asImage: AsImage? {
                get {
                  if !AsImage.possibleTypes.contains(__typename) { return nil }
                  return AsImage(unsafeResultMap: resultMap)
                }
                set {
                  guard let newValue = newValue else { return }
                  resultMap = newValue.resultMap
                }
              }

              public struct AsImage: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Image"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .scalar(String.self)),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, name: String? = nil, url: String) {
                  self.init(unsafeResultMap: ["__typename": "Image", "id": id, "name": name, "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String? {
                  get {
                    return resultMap["name"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }
          }
        }

        public struct PostType: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PostType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "PostType", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct SeoDetail: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PostSeoDetail"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String, description: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PostSeoDetail", "title": title, "description": description])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }
        }
      }
    }
  }
}

public final class LoginNetworkQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query loginNetwork($email: String!, $password: String!) {
      loginNetwork(input: {usernameOrEmail: $email, password: $password}) {
        __typename
        accessToken
        role {
          __typename
          name
          scopes
        }
        member {
          __typename
          id
          name
          displayName
        }
      }
    }
    """

  public let operationName: String = "loginNetwork"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("loginNetwork", arguments: ["input": ["usernameOrEmail": GraphQLVariable("email"), "password": GraphQLVariable("password")]], type: .nonNull(.object(LoginNetwork.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loginNetwork: LoginNetwork) {
      self.init(unsafeResultMap: ["__typename": "Query", "loginNetwork": loginNetwork.resultMap])
    }

    public var loginNetwork: LoginNetwork {
      get {
        return LoginNetwork(unsafeResultMap: resultMap["loginNetwork"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "loginNetwork")
      }
    }

    public struct LoginNetwork: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthToken"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
          GraphQLField("role", type: .nonNull(.object(Role.selections))),
          GraphQLField("member", type: .nonNull(.object(Member.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String, role: Role, member: Member) {
        self.init(unsafeResultMap: ["__typename": "AuthToken", "accessToken": accessToken, "role": role.resultMap, "member": member.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }

      public var role: Role {
        get {
          return Role(unsafeResultMap: resultMap["role"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "role")
        }
      }

      public var member: Member {
        get {
          return Member(unsafeResultMap: resultMap["member"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "member")
        }
      }

      public struct Role: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Role"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("scopes", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, scopes: [String]) {
          self.init(unsafeResultMap: ["__typename": "Role", "name": name, "scopes": scopes])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var scopes: [String] {
          get {
            return resultMap["scopes"]! as! [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "scopes")
          }
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Member"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("displayName", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, displayName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Member", "id": id, "name": name, "displayName": displayName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var displayName: String? {
          get {
            return resultMap["displayName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "displayName")
          }
        }
      }
    }
  }
}
