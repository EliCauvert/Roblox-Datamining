local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local actions = parent.Actions
local friendRequestCreatedModule = require(actions.FriendRequestCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local friendshipCreatedModule = require(actions.FriendshipCreated)
local removeIdsFromRequestsStoreModule = require(parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local _ = require(parent.roduxFriendsTypes)
local llamaModule = require(parent_1.llama)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), removeIdsFromRequestsStoreModule (ref), llamaModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref), friendshipCreatedModule (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p2, p3.ids)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p3.responseBody.data) do
				t[tostring(v.id)] = true
			end
			return llamaModule.Dictionary.join(p2, t)
		end,
		[friendRequestCreatedModule.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = true })
		end,
		[friendRequestDeclinedModule.name] = function(p4, p5)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p4, p5.ids)
		end,
		[friendshipCreatedModule.name] = function(p4, p5)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			assert(type(p5.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p5.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return removeIdsFromRequestsStoreModule(p4, { p5.payload.userId1, p5.payload.userId2 })
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function()
			return {}
		end,
		[p1.networkingBlocking.BlockUserById.Succeeded.name] = function(p4, p5)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p4, { tostring(p5.namedIds.users) })
		end
	})
end