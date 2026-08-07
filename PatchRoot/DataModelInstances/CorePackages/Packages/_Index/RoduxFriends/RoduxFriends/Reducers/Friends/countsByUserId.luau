-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:06 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 20 ]]
	-- upvalues: t (ref), friendshipCreatedModule (ref), llamaModule (ref), addUserModule (ref), friendshipDestroyedModule (ref), removeUserModule (ref), setFriendshipsInStoreModule (ref), countUserFriendsInStoreModule (ref), removeTargetUserFriendshipInStoreModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return function(p1, p2) --[[ line: 23 ]]
		-- upvalues: t (copy), friendshipCreatedModule (copy), llamaModule (copy), addUserModule (copy), friendshipDestroyedModule (copy), removeUserModule (copy), friendsNetworking (ref), setFriendshipsInStoreModule (copy), countUserFriendsInStoreModule (copy), removeTargetUserFriendshipInStoreModule (copy)
		p1 = p1 or t
		
		if p2 and p2.type == friendshipCreatedModule.name then
			assert(type(p2.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p2.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p1.countsByUserId, {
				[p2.payload.userId1] = #addUserModule(p1.byUserId[p2.payload.userId1], p2.payload.userId2),
				[p2.payload.userId2] = #addUserModule(p1.byUserId[p2.payload.userId2], p2.payload.userId1)
			})
		elseif p2 and p2.type == friendshipDestroyedModule.name then
			assert(type(p2.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p2.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p1.countsByUserId, {
				[p2.payload.userId1] = #removeUserModule(p1.byUserId[p2.payload.userId1], p2.payload.userId2),
				[p2.payload.userId2] = #removeUserModule(p1.byUserId[p2.payload.userId2], p2.payload.userId1)
			})
		end
		return if p2 and p2.type == friendsNetworking.GetFriendsFromUserId.Succeeded.name then countUserFriendsInStoreModule(setFriendshipsInStoreModule(p1.byUserId, p2)) elseif p2 and p2.type == friendsNetworking.UnfriendTargetUserId.Succeeded.name then countUserFriendsInStoreModule(removeTargetUserFriendshipInStoreModule(p1.byUserId, p2)) else p1.countsByUserId
	end
end