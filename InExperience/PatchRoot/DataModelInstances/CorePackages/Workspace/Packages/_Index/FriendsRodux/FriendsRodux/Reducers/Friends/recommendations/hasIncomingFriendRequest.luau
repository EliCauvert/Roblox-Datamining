local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local actions = parent.Actions
local recommendationCreatedModule = require(actions.RecommendationCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local _ = require(parent.roduxFriendsTypes)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), recommendationCreatedModule (ref), llamaModule (ref), friendRequestDeclinedModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[recommendationCreatedModule.name] = function(p1, p2)
			-- upvalues: llamaModule (copy)
			local recommendedUser = p2.payload.recommendedUser
			
			return llamaModule.Dictionary.join(p1, {
				[tostring(recommendedUser.id)] = if recommendedUser.hasIncomingFriendRequest then true else false
			})
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p3, p4)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p3, llamaModule.List.reduce(llamaModule.List.filter(p4.responseBody.data, function(p5)
				return p5.contextType ~= "Contacts"
			end, {}), function(p6, p7)
				p6[tostring(p7.id)] = if p7.friendRequest then true else false
				
				return p6
			end, {}))
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p8, p9)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p8, llamaModule.List.reduce(p9.ids, function(p10, p11)
				p10[tostring(p11)] = false
				
				return p10
			end, {}))
		end,
		[friendRequestDeclinedModule.name] = function(p12, p13)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p12, llamaModule.List.reduce(p13.ids, function(p14, p15)
				p14[tostring(p15)] = false
				
				return p14
			end, {}))
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_)
			-- upvalues: t (copy)
			return t
		end
	})
end