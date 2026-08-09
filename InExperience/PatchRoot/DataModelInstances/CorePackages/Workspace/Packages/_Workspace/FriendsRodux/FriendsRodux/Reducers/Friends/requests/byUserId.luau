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

return function(p0) --[[ line: 19 ]]
	-- upvalues: roduxModule (ref), t (ref), removeIdsFromRequestsStoreModule (ref), llamaModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref), friendshipCreatedModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p1, p2) --[[ line: 24 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p1, p2.ids)
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p3, p4) --[[ line: 29 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p3, p4.ids)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p5, p6) --[[ line: 34 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p6.responseBody.data) do
				t[tostring(v.id)] = true
			end
			return llamaModule.Dictionary.join(p5, t)
		end,
		[friendRequestCreatedModule.name] = function(p7, p8) --[[ line: 49 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p7, { [tostring(p8.requesteeId)] = true })
		end,
		[friendRequestDeclinedModule.name] = function(p9, p10) --[[ line: 56 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p9, p10.ids)
		end,
		[friendshipCreatedModule.name] = function(p11, p12) --[[ line: 61 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			assert(type(p12.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p12.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return removeIdsFromRequestsStoreModule(p11, { p12.payload.userId1, p12.payload.userId2 })
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function() --[[ line: 67 ]]
			return {}
		end,
		[p0.networkingBlocking.BlockUserById.Succeeded.name] = function(p13, p14) --[[ line: 71 ]]
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p13, { tostring(p14.namedIds.users) })
		end
	})
end