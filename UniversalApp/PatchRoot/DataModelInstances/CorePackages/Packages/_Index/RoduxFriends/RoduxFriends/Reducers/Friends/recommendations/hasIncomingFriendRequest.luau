local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local Actions = Parent.Actions
local RecommendationCreatedModule = require(Actions.RecommendationCreated)
local FriendRequestDeclinedModule = require(Actions.FriendRequestDeclined)
local _ = require(Parent.roduxFriendsTypes)
local t = {}

return function(p1) --[[ Line: 17 ]]
	-- upvalues: RoduxModule (copy), t (copy), RecommendationCreatedModule (copy), LlamaModule (copy), FriendRequestDeclinedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[RecommendationCreatedModule.name] = function(p2, p3) --[[ Line: 21 ]]
			-- upvalues: LlamaModule (upval)
			local RecommendedUser = p3.payload.recommendedUser
			
			return LlamaModule.Dictionary.join(p2, {
				[tostring(RecommendedUser.id)] = if RecommendedUser.hasIncomingFriendRequest then true else false
			})
		end,
		[FriendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 33 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p2, (LlamaModule.List.reduce(LlamaModule.List.filter(p3.responseBody.data, function(p4): boolean --[[ Line: 37 ]]
				return p4.contextType ~= "Contacts"
			end, {}), function(p4, p5) --[[ Line: 41 ]]
				p4[tostring(p5.id)] = if p5.friendRequest then true else false
				
				return p4
			end, {})))
		end,
		[FriendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 50 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p2, (LlamaModule.List.reduce(p3.ids, function(p4, p5) --[[ Line: 55 ]]
				p4[tostring(p5)] = false
				
				return p4
			end, {})))
		end,
		[FriendRequestDeclinedModule.name] = function(p2, p3) --[[ Line: 63 ]]
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p2, (LlamaModule.List.reduce(p3.ids, function(p4, p5) --[[ Line: 68 ]]
				p4[tostring(p5)] = false
				
				return p4
			end, {})))
		end,
		[FriendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_) --[[ Line: 76 ]]
			-- upvalues: t (upval)
			return t
		end
	})
end