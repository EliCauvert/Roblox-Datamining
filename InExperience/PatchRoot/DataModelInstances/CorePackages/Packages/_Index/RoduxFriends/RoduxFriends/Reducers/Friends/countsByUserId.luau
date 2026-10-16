local RoduxFriends = script:FindFirstAncestor("RoduxFriends")
local LlamaModule = require(RoduxFriends.Parent.llama)
local Actions = RoduxFriends.Actions
local FriendshipCreatedModule = require(Actions.FriendshipCreated)
local FriendshipDestroyedModule = require(Actions.FriendshipDestroyed)
local AddUserModule = require(script.Parent.utils.addUser)
local RemoveUserModule = require(script.Parent.utils.removeUser)
local SetFriendshipsInStoreModule = require(script.Parent.utils.setFriendshipsInStore)
local RemoveTargetUserFriendshipInStoreModule = require(script.Parent.utils.removeTargetUserFriendshipInStore)
local CountUserFriendsInStoreModule = require(script.Parent.utils.countUserFriendsInStore)
local config = { byUserId = {}, countsByUserId = {} }

return function(p1) --[[ Line: 20 ]]
	-- upvalues: config (copy), FriendshipCreatedModule (copy), LlamaModule (copy), AddUserModule (copy), FriendshipDestroyedModule (copy), RemoveUserModule (copy), SetFriendshipsInStoreModule (copy), CountUserFriendsInStoreModule (copy), RemoveTargetUserFriendshipInStoreModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return function(p2, p3) --[[ Line: 23 ]]
		-- upvalues: config (upval), FriendshipCreatedModule (upval), LlamaModule (upval), AddUserModule (upval), FriendshipDestroyedModule (upval), RemoveUserModule (upval), FriendsNetworking (copy), SetFriendshipsInStoreModule (upval), CountUserFriendsInStoreModule (upval), RemoveTargetUserFriendshipInStoreModule (upval)
		local P1 = p2 or config
		
		if p3 and p3.type == FriendshipCreatedModule.name then
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return LlamaModule.Dictionary.join(P1.countsByUserId, {
				[p3.payload.userId1] = #AddUserModule(P1.byUserId[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = #AddUserModule(P1.byUserId[p3.payload.userId2], p3.payload.userId1)
			})
		elseif p3 and p3.type == FriendshipDestroyedModule.name then
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return LlamaModule.Dictionary.join(P1.countsByUserId, {
				[p3.payload.userId1] = #RemoveUserModule(P1.byUserId[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = #RemoveUserModule(P1.byUserId[p3.payload.userId2], p3.payload.userId1)
			})
		else
			return if p3 and p3.type == FriendsNetworking.GetFriendsFromUserId.Succeeded.name then CountUserFriendsInStoreModule((SetFriendshipsInStoreModule(P1.byUserId, p3))) elseif p3 and p3.type == FriendsNetworking.UnfriendTargetUserId.Succeeded.name then CountUserFriendsInStoreModule((RemoveTargetUserFriendshipInStoreModule(p2.byUserId, p3))) else P1.countsByUserId
		end
	end
end