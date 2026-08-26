local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local actions = parent.Actions
local friendRequestCreatedModule = require(actions.FriendRequestCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local _ = require(parent.roduxFriendsTypes)
local removeIdsFromRequestsStoreModule = require(parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local llamaModule = require(parent_1.llama)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), removeIdsFromRequestsStoreModule (ref), llamaModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref)
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
				t[tostring(v.id)] = v.friendRequest.sourceUniverseId
			end
			return llamaModule.Dictionary.join(p2, t)
		end,
		[friendRequestCreatedModule.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p4, { [tostring(p5.requesteeId)] = p5.sourceUniverseId })
		end,
		[friendRequestDeclinedModule.name] = function(p4, p5)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p4, p5.ids)
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function()
			return {}
		end
	})
end