local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReducerDependencies = require(Parent.NotificationsCommon).ReducerDependencies

return require(Parent.Rodux).combineReducers({
	FriendCount = require(Parent.LegacyFriendsRodux).Reducers.FriendCount,
	GameInvitesStatus = require(script.Parent.Invites),
	Users = require(Parent.UserLib).Reducers.UserReducer,
	ShareLinks = ReducerDependencies.ShareLinksRodux.installReducer(),
	NetworkStatus = ReducerDependencies.RoduxNetworking.installReducer()
})