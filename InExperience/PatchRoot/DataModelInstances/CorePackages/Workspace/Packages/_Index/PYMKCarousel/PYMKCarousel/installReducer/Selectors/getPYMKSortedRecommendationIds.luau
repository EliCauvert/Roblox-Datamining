local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local roduxFriends = dependenciesModule.RoduxFriends
local llama = dependenciesModule.llama
local _ = roduxFriends.Enums.RecommendationContextType
local filterOutPYMKRecommendationsModule = require(script.Parent.filterOutPYMKRecommendations)

return function(p1)
	-- upvalues: filterOutPYMKRecommendationsModule (ref), roduxFriends (ref), llama (ref)
	return function(p2)
		-- upvalues: filterOutPYMKRecommendationsModule (copy), roduxFriends (copy), p1 (ref), llama (copy)
		return llama.List.map(filterOutPYMKRecommendationsModule(roduxFriends.Selectors.getSortedByRankRecommendations(p2, p1))(p2), function(p3, p4)
			return {
				hasIncomingFriendRequest = nil,
				id = p3.id,
				absolutePosition = p4,
				recommendationRank = p3.rank,
				recommendationContextType = p3.contextType
			}
		end)
	end
end