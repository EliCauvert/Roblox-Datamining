local Parent = script:FindFirstAncestor("GameInvite").Parent
local UserReducer = require(Parent.UserLib).Reducers.UserReducer
local RoduxModule = require(Parent.Rodux)
local FFlagUseSignalsForGameInvitesStatus = require(Parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local FFlagRemoveUnusedFriendCountRoduxSlice = require(Parent.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice
local ReducerDependencies = require(Parent.NotificationsCommon).ReducerDependencies
local FriendCount = require(Parent.LegacyFriendsRodux).Reducers.FriendCount
local InvitesModule = require(script.Parent.Invites)

return RoduxModule.combineReducers({
	FriendCount = if FFlagRemoveUnusedFriendCountRoduxSlice then nil else FriendCount,
	GameInvitesStatus = if FFlagUseSignalsForGameInvitesStatus then nil else InvitesModule,
	Users = UserReducer,
	ShareLinks = ReducerDependencies.ShareLinksRodux.installReducer(),
	NetworkStatus = ReducerDependencies.RoduxNetworking.installReducer()
})