local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local actions = parent.Actions
local recommendationCreatedModule = require(actions.RecommendationCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local _ = require(parent.roduxFriendsTypes)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), recommendationCreatedModule (ref), llamaModule (ref), friendRequestDeclinedModule (ref)
	local friendsNetworking = p1.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[recommendationCreatedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			local recommendedUser = p3.payload.recommendedUser
			
			return llamaModule.Dictionary.join(p2, {
				[tostring(recommendedUser.id)] = if recommendedUser.hasIncomingFriendRequest then true else false
			})
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p2, llamaModule.List.reduce(llamaModule.List.filter(p3.responseBody.data, function(p4)
				return p4.contextType ~= "Contacts"
			end, {}), function(p4, p5)
				p4[tostring(p5.id)] = if p5.friendRequest then true else false
				
				return p4
			end, {}))
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p2, llamaModule.List.reduce(p3.ids, function(p4, p5)
				p4[tostring(p5)] = false
				
				return p4
			end, {}))
		end,
		[friendRequestDeclinedModule.name] = function(p2, p3)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p2, llamaModule.List.reduce(p3.ids, function(p4, p5)
				p4[tostring(p5)] = false
				
				return p4
			end, {}))
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_)
			-- upvalues: t (copy)
			return t
		end
	})
end