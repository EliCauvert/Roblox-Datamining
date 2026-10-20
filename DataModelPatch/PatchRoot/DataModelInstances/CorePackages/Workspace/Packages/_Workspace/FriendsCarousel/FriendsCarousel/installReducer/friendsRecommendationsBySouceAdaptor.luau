local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local NetworkingFriends = DependenciesModule.NetworkingFriends
local RoduxFriends = DependenciesModule.RoduxFriends
local Llama = DependenciesModule.llama
local RecommendationSourceEnum = DependenciesModule.SocialCommon.Enums.RecommendationSourceEnum

return function()
	-- upvalues: NetworkingFriends (copy), Llama (copy), RoduxFriends (copy), RecommendationSourceEnum (copy)
	return {
		[NetworkingFriends.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p1)
			-- upvalues: Llama (upval), RoduxFriends (upval), RecommendationSourceEnum (upval)
			return {
				p1,
				(RoduxFriends.Actions.RecommendationSourceCreated({
					source = RecommendationSourceEnum.HomepageFriendsCarousel,
					recommendationIds = Llama.List.map(p1.responseBody.data or {}, function(p2)
						return p2.id
					end)
				}))
			}
		end
	}
end