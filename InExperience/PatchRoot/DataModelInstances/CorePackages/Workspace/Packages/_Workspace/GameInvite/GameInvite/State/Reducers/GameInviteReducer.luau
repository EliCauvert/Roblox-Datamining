local parent = script:FindFirstAncestor("GameInvite").Parent
local reducerDependencies = require(parent.NotificationsCommon).ReducerDependencies

return require(parent.Rodux).combineReducers({
	FriendCount = require(parent.LegacyFriendsRodux).Reducers.FriendCount,
	GameInvitesStatus = if require(parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus then nil else require(script.Parent.Invites),
	Users = require(parent.UserLib).Reducers.UserReducer,
	ShareLinks = reducerDependencies.ShareLinksRodux.installReducer(),
	NetworkStatus = reducerDependencies.RoduxNetworking.installReducer()
})