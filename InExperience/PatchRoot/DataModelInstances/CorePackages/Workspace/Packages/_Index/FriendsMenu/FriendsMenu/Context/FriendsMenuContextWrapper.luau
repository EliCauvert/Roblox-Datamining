local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local var1 = if require(parent_1.Flags.FFlagUpdateInvitesToUsePaginatedFriends) then require(parent.FriendsListContextProvider2) else require(parent.FriendsListContextProvider)
local inviteCallbackProviderModule = require(parent.InviteCallbackProvider)
local selectedUsersContextProviderModule = require(parent.SelectedUsersContextProvider)
local cryoModule = require(parent_2.Cryo)
local reactModule = require(parent_2.React)

return function(p1)
	-- upvalues: cryoModule (ref), reactModule (ref), var1 (ref), inviteCallbackProviderModule (ref), selectedUsersContextProviderModule (ref)
	local excludedFriendsSet = p1.excludedFriendsSet
	
	if p1.preselectedUsersUnremovable and p1.preselectedUsers then
		excludedFriendsSet = cryoModule.Dictionary.union(excludedFriendsSet or {}, cryoModule.List.toSet(p1.preselectedUsers))
	end
	return reactModule.createElement(var1, {
		excludedFriendsSet = excludedFriendsSet,
		isLoadingCustomParams = p1.isLoadingCustomParams
	}, reactModule.createElement(inviteCallbackProviderModule, {
		inviteSingleFriend = p1.inviteSingleFriend,
		inviteMultiFriends = p1.inviteMultiFriends
	}, reactModule.createElement(selectedUsersContextProviderModule, {
		selectionLimit = p1.selectionLimit,
		preselectedUsers = p1.preselectedUsers,
		preselectedUsersUnremovable = p1.preselectedUsersUnremovable,
		onRemoveCallback = p1.onRemoveCallback
	}, p1.children)))
end