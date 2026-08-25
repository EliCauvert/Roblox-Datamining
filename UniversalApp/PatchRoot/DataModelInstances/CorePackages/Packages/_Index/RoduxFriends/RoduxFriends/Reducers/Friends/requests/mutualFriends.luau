local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local actions = parent.Actions
local friendRequestCreatedModule = require(actions.FriendRequestCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local removeIdsFromRequestsStoreModule = require(parent.Reducers.Friends.utils.removeIdsFromRequestsStore)
local _ = require(parent.roduxFriendsTypes)
local llamaModule = require(parent_1.llama)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), removeIdsFromRequestsStoreModule (ref), llamaModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p1, p2)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p1, p2.ids)
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p3, p4)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p3, p4.ids)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p5, p6)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p6.responseBody.data) do
				if v.mutualFriendsList then
					t[tostring(v.id)] = llamaModule.List.map(v.mutualFriendsList, function(p7)
						return tostring(p7)
					end)
				end
			end
			return llamaModule.Dictionary.join(p5, t)
		end,
		[friendRequestCreatedModule.name] = function(p8, p9)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p8, {
				[tostring(p9.requesteeId)] = llamaModule.List.map(p9.mutualFriends, function(p10)
					return tostring(p10)
				end)
			})
		end,
		[friendRequestDeclinedModule.name] = function(p11, p12)
			-- upvalues: removeIdsFromRequestsStoreModule (copy)
			return removeIdsFromRequestsStoreModule(p11, p12.ids)
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function()
			return {}
		end
	})
end