local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local RoduxFriends = DependenciesModule.RoduxFriends
local Llama = DependenciesModule.llama
local _ = RoduxFriends.Enums.RecommendationContextType
local FilterOutPYMKRecommendationsModule = require(script.Parent.filterOutPYMKRecommendations)

return function(p1) --[[ Line: 23 ]]
	-- upvalues: FilterOutPYMKRecommendationsModule (copy), RoduxFriends (copy), Llama (copy)
	return function(p2) --[[ Line: 24 ]]
		-- upvalues: FilterOutPYMKRecommendationsModule (upval), RoduxFriends (upval), p1 (copy), Llama (upval)
		return Llama.List.map(FilterOutPYMKRecommendationsModule(RoduxFriends.Selectors.getSortedByRankRecommendations(p2, p1))(p2), function(p3, AbsolutePosition) --[[ Line: 28 ]]
			return {
				hasIncomingFriendRequest = nil,
				id = p3.id,
				absolutePosition = AbsolutePosition,
				recommendationRank = p3.rank,
				recommendationContextType = p3.contextType
			}
		end)
	end
end