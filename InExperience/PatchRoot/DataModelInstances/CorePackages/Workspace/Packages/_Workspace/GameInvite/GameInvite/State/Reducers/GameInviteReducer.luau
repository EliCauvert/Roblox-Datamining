local Parent = script:FindFirstAncestor("GameInvite").Parent
local FFlagUseSignalsForGameInvitesStatus = require(Parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local ReducerDependencies = require(Parent.NotificationsCommon).ReducerDependencies
local FriendCount = require(Parent.LegacyFriendsRodux).Reducers.FriendCount
local InvitesModule = require(script.Parent.Invites)

return require(Parent.Rodux).combineReducers({
	FriendCount = if require(Parent.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice then nil else FriendCount,
	GameInvitesStatus = if FFlagUseSignalsForGameInvitesStatus then nil else InvitesModule,
	Users = require(Parent.UserLib).Reducers.UserReducer,
	ShareLinks = ReducerDependencies.ShareLinksRodux.installReducer(),
	NetworkStatus = ReducerDependencies.RoduxNetworking.installReducer()
})