local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local FriendsListContextProvider2Module = if require(Parent1.Flags.FFlagUpdateInvitesToUsePaginatedFriends) then require(Parent.FriendsListContextProvider2) else require(Parent.FriendsListContextProvider)
local InviteCallbackProviderModule = require(Parent.InviteCallbackProvider)
local SelectedUsersContextProviderModule = require(Parent.SelectedUsersContextProvider)
local CryoModule = require(Parent2.Cryo)
local ReactModule = require(Parent2.React)

return function(p1)
	-- upvalues: CryoModule (copy), ReactModule (copy), FriendsListContextProvider2Module (copy), InviteCallbackProviderModule (copy), SelectedUsersContextProviderModule (copy)
	local ExcludedFriendsSet = p1.excludedFriendsSet
	
	if p1.preselectedUsersUnremovable and p1.preselectedUsers then
		ExcludedFriendsSet = CryoModule.Dictionary.union(ExcludedFriendsSet or {}, CryoModule.List.toSet(p1.preselectedUsers))
	end
	return ReactModule.createElement(FriendsListContextProvider2Module, {
		excludedFriendsSet = ExcludedFriendsSet,
		isLoadingCustomParams = p1.isLoadingCustomParams
	}, ReactModule.createElement(InviteCallbackProviderModule, {
		inviteSingleFriend = p1.inviteSingleFriend,
		inviteMultiFriends = p1.inviteMultiFriends
	}, ReactModule.createElement(SelectedUsersContextProviderModule, {
		selectionLimit = p1.selectionLimit,
		preselectedUsers = p1.preselectedUsers,
		preselectedUsersUnremovable = p1.preselectedUsersUnremovable,
		onRemoveCallback = p1.onRemoveCallback
	}, p1.children)))
end