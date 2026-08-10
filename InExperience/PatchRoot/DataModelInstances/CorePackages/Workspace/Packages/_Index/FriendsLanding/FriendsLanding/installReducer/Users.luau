local friendsLanding = script:FindFirstAncestor("FriendsLanding")

return if require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers) then nil else require(script.Parent.convertActions)(require(friendsLanding.dependencies).RoduxUsers.installReducer(), require(script.Parent.usersActionAdaptor), { byUserId = {}, byUsername = {} })