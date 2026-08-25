local roduxFriends = script:FindFirstAncestor("RoduxFriends")
local parent = roduxFriends.Parent
local roduxModule = require(parent.Rodux)
local llamaModule = require(parent.llama)
local actions = roduxFriends.Actions
local friendshipCreatedModule = require(actions.FriendshipCreated)
local friendshipDestroyedModule = require(actions.FriendshipDestroyed)
local addUserModule = require(script.Parent.utils.addUser)
local removeUserModule = require(script.Parent.utils.removeUser)
local setFriendshipsInStoreModule = require(script.Parent.utils.setFriendshipsInStore)
local removeTargetUserFriendshipInStoreModule = require(script.Parent.utils.removeTargetUserFriendshipInStore)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), friendshipCreatedModule (ref), llamaModule (ref), addUserModule (ref), friendshipDestroyedModule (ref), removeUserModule (ref), setFriendshipsInStoreModule (ref), removeTargetUserFriendshipInStoreModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendshipCreatedModule.name] = function(p1, p2)
			-- upvalues: llamaModule (copy), addUserModule (copy)
			assert(type(p2.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p2.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p1, {
				[p2.payload.userId1] = addUserModule(p1[p2.payload.userId1], p2.payload.userId2),
				[p2.payload.userId2] = addUserModule(p1[p2.payload.userId2], p2.payload.userId1)
			})
		end,
		[friendshipDestroyedModule.name] = function(p3, p4)
			-- upvalues: llamaModule (copy), removeUserModule (copy)
			assert(type(p4.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p4.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p3, {
				[p4.payload.userId1] = removeUserModule(p3[p4.payload.userId1], p4.payload.userId2),
				[p4.payload.userId2] = removeUserModule(p3[p4.payload.userId2], p4.payload.userId1)
			})
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p5, p6)
			-- upvalues: setFriendshipsInStoreModule (copy)
			return setFriendshipsInStoreModule(p5, p6)
		end,
		[friendsNetworking.UnfriendTargetUserId.Succeeded.name] = function(p7, p8)
			-- upvalues: removeTargetUserFriendshipInStoreModule (copy)
			return removeTargetUserFriendshipInStoreModule(p7, p8)
		end,
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p9, p10)
			-- upvalues: llamaModule (copy), addUserModule (copy)
			local var10 = tostring(p10.ids[1])
			local var11 = tostring(p10.additionalData.currentUserId)
			
			return llamaModule.Dictionary.join(p9, {
				[var10] = addUserModule(p9[var10], var11),
				[var11] = addUserModule(p9[var11], var10)
			})
		end
	})
end