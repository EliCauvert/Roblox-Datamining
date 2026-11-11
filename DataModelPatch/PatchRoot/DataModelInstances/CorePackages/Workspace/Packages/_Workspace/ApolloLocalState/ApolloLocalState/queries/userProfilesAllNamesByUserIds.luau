local GqlFunction = require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient).gql
local GqlResult = GqlFunction(require(script.Parent.schema.UserProfilesAllNamesByUserIdsNew))
local GqlResult1 = GqlFunction(require(script.Parent.schema.UserProfilesAllNamesByUserIds))

return if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then GqlResult else GqlResult1