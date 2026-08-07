local gql = require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient).gql

return if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then gql(require(script.Parent.schema.UserProfilesAllNamesByUserIdsNew)) else gql(require(script.Parent.schema.UserProfilesAllNamesByUserIds))