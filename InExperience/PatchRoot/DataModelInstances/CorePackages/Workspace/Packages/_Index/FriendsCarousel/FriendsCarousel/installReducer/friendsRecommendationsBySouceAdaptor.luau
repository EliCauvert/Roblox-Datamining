local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)
local networkingFriends = dependenciesModule.NetworkingFriends
local roduxFriends = dependenciesModule.RoduxFriends
local llama = dependenciesModule.llama
local recommendationSourceEnum = dependenciesModule.SocialCommon.Enums.RecommendationSourceEnum

return function()
	-- upvalues: networkingFriends (ref), llama (ref), roduxFriends (ref), recommendationSourceEnum (ref)
	return {
		[networkingFriends.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p1)
			-- upvalues: llama (copy), roduxFriends (copy), recommendationSourceEnum (copy)
			return {
				p1,
				roduxFriends.Actions.RecommendationSourceCreated({
					source = recommendationSourceEnum.HomepageFriendsCarousel,
					recommendationIds = llama.List.map(p1.responseBody.data or {}, function(p2)
						return p2.id
					end)
				})
			}
		end
	}
end