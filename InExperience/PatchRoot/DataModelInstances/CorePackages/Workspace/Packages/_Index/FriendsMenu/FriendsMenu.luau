local v1 = script
local _ = require(v1.friendsMenuModalType)

return {
	["jest.config"] = script["jest.config"],
	FriendsListContext = require(script.Context.FriendsListContext),
	FriendsMenuContextWrapper = require(script.Context.FriendsMenuContextWrapper),
	FriendsMenuFriendsList = require(v1.Components.FriendsMenuFriendsList),
	FriendsMenuSearch = require(script.Components.FriendsMenuSearch),
	FriendsMenuShareGameInviteLink = require(script.Components.FriendsMenuShareGameInviteLink),
	InviteFriendContext = require(script.Context.InviteFriendContext),
	InviteCallbackContext = require(script.Context.InviteCallbackContext),
	FriendsListContextProvider = if require(v1.Flags.FFlagUpdateInvitesToUsePaginatedFriends) then require(script.Context.FriendsListContextProvider2) else require(script.Context.FriendsListContextProvider),
	InviteStatus = require(script.Constants).InviteStatus,
	FriendMenuType = require(script.Enums.FriendMenuType),
	SelectedUsersContext = require(script.Context.SelectedUsersContext),
	SelectedUsersScroller = require(script.Components.SelectedUsersScroller)
}