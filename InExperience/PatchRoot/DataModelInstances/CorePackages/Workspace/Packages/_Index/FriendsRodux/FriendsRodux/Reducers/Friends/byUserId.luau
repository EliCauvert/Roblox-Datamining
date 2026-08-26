local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(parent.Rodux)
local llamaModule = require(parent.llama)
local actions = friendsRodux.Actions
local friendshipCreatedModule = require(actions.FriendshipCreated)
local friendshipDestroyedModule = require(actions.FriendshipDestroyed)
local _ = require(friendsRodux.roduxFriendsTypes)
local addUserModule = require(script.Parent.utils.addUser)
local removeUserModule = require(script.Parent.utils.removeUser)
local setFriendshipsInStoreModule = require(script.Parent.utils.setFriendshipsInStore)
local removeTargetUserFriendshipInStoreModule = require(script.Parent.utils.removeTargetUserFriendshipInStore)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), friendshipCreatedModule (ref), llamaModule (ref), addUserModule (ref), friendshipDestroyedModule (ref), removeUserModule (ref), setFriendshipsInStoreModule (ref), removeTargetUserFriendshipInStoreModule (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendshipCreatedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), addUserModule (copy)
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p2, {
				[p3.payload.userId1] = addUserModule(p2[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = addUserModule(p2[p3.payload.userId2], p3.payload.userId1)
			})
		end,
		[friendshipDestroyedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), removeUserModule (copy)
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return llamaModule.Dictionary.join(p2, {
				[p3.payload.userId1] = removeUserModule(p2[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = removeUserModule(p2[p3.payload.userId2], p3.payload.userId1)
			})
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: setFriendshipsInStoreModule (copy)
			return setFriendshipsInStoreModule(p2, p3)
		end,
		[friendsNetworking.UnfriendTargetUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: removeTargetUserFriendshipInStoreModule (copy)
			return removeTargetUserFriendshipInStoreModule(p2, p3)
		end,
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy), addUserModule (copy)
			local var1 = tostring(p3.ids[1])
			local var2 = tostring(p3.additionalData.currentUserId)
			
			return llamaModule.Dictionary.join(p2, {
				[var1] = addUserModule(p2[var1], var2),
				[var2] = addUserModule(p2[var2], var1)
			})
		end
	})
end