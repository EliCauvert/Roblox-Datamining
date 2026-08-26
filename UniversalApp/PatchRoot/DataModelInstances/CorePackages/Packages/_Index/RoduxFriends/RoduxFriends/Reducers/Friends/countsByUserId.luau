local roduxFriends = script:FindFirstAncestor("RoduxFriends")
local llamaModule = require(roduxFriends.Parent.llama)
local actions = roduxFriends.Actions
local friendshipCreatedModule = require(actions.FriendshipCreated)
local friendshipDestroyedModule = require(actions.FriendshipDestroyed)
local addUserModule = require(script.Parent.utils.addUser)
local removeUserModule = require(script.Parent.utils.removeUser)
local setFriendshipsInStoreModule = require(script.Parent.utils.setFriendshipsInStore)
local removeTargetUserFriendshipInStoreModule = require(script.Parent.utils.removeTargetUserFriendshipInStore)
local countUserFriendsInStoreModule = require(script.Parent.utils.countUserFriendsInStore)
local t = { byUserId = {}, countsByUserId = {} }

return function(p1)
	-- upvalues: t (ref), friendshipCreatedModule (ref), llamaModule (ref), addUserModule (ref), friendshipDestroyedModule (ref), removeUserModule (ref), setFriendshipsInStoreModule (ref), countUserFriendsInStoreModule (ref), removeTargetUserFriendshipInStoreModule (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return function(p2, p3)
		-- upvalues: t (copy), friendshipCreatedModule (copy), llamaModule (copy), addUserModule (copy), friendshipDestroyedModule (copy), removeUserModule (copy), friendsNetworking (ref), setFriendshipsInStoreModule (copy), countUserFriendsInStoreModule (copy), removeTargetUserFriendshipInStoreModule (copy)
		p2 = p2 or t
		
		if p3 and p3.type == friendshipCreatedModule.name then
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p2.countsByUserId, {
				[p3.payload.userId1] = #addUserModule(p2.byUserId[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = #addUserModule(p2.byUserId[p3.payload.userId2], p3.payload.userId1)
			})
		elseif p3 and p3.type == friendshipDestroyedModule.name then
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p2.countsByUserId, {
				[p3.payload.userId1] = #removeUserModule(p2.byUserId[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = #removeUserModule(p2.byUserId[p3.payload.userId2], p3.payload.userId1)
			})
		end
		return if p3 and p3.type == friendsNetworking.GetFriendsFromUserId.Succeeded.name then countUserFriendsInStoreModule(setFriendshipsInStoreModule(p2.byUserId, p3)) elseif p3 and p3.type == friendsNetworking.UnfriendTargetUserId.Succeeded.name then countUserFriendsInStoreModule(removeTargetUserFriendshipInStoreModule(p2.byUserId, p3)) else p2.countsByUserId
	end
end