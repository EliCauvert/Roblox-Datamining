local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local var0 = if require(parent_1.Flags.FFlagUpdateInvitesToUsePaginatedFriends) then require(parent.FriendsListContextProvider2) else require(parent.FriendsListContextProvider)
local inviteCallbackProviderModule = require(parent.InviteCallbackProvider)
local selectedUsersContextProviderModule = require(parent.SelectedUsersContextProvider)
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)

return function(p0)
	-- upvalues: cryoModule (ref), reactModule (ref), var0 (ref), inviteCallbackProviderModule (ref), selectedUsersContextProviderModule (ref)
	local excludedFriendsSet = p0.excludedFriendsSet
	
	if p0.preselectedUsersUnremovable and p0.preselectedUsers then
		excludedFriendsSet = cryoModule.Dictionary.union(excludedFriendsSet or {}, cryoModule.List.toSet(p0.preselectedUsers))
	end
	return reactModule.createElement(var0, {
		excludedFriendsSet = excludedFriendsSet,
		isLoadingCustomParams = p0.isLoadingCustomParams
	}, reactModule.createElement(inviteCallbackProviderModule, {
		inviteSingleFriend = p0.inviteSingleFriend,
		inviteMultiFriends = p0.inviteMultiFriends
	}, reactModule.createElement(selectedUsersContextProviderModule, {
		selectionLimit = p0.selectionLimit,
		preselectedUsers = p0.preselectedUsers,
		preselectedUsersUnremovable = p0.preselectedUsersUnremovable,
		onRemoveCallback = p0.onRemoveCallback
	}, p0.children)))
end