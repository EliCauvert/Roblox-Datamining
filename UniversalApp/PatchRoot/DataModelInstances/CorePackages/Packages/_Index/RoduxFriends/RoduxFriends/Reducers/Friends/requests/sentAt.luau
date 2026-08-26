local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local _ = require(parent.roduxFriendsTypes)
local actions = parent.Actions
local friendRequestCreatedModule = require(actions.FriendRequestCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local friendshipCreatedModule = require(actions.FriendshipCreated)
local removeIdsFromRequestsStoreModule = require(parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
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
				t[tostring(v.id)] = DateTime.fromIsoDate(v.friendRequest.sentAt)
			end
			return llamaModule.Dictionary.join(p2, t)
		end,
		[friendRequestCreatedModule.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p4, {
				[tostring(p5.requesteeId)] = DateTime.fromIsoDate(p5.sentAt)
			})
		end,
		[friendRequestDeclinedModule.name] = function(p4, p5)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p4, p5.ids)
		end,
		[friendshipCreatedModule.name] = function(p4, p5)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p4, { p5.payload.userId1, p5.payload.userId2 })
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function()
			-- upvalues: t (copy)
			return t
		end
	})
end