local HomeStore = script:FindFirstAncestor("HomeStore")
local _ = require(HomeStore.FriendRecommendationTypes)
local RecommendationTypeModule = require(HomeStore.RecommendationType)

local function _(Contact)
	-- upvalues: RecommendationTypeModule (copy)
	return if Contact == "RECOMMENDATION_TYPE_USER" or Contact == RecommendationTypeModule.User then RecommendationTypeModule.User elseif Contact == "RECOMMENDATION_TYPE_CONTACT" or Contact == RecommendationTypeModule.Contact then RecommendationTypeModule.Contact else RecommendationTypeModule.Invalid
end

return function(List)
	-- upvalues: RecommendationTypeModule (copy)
	local t = {}
	
	for i, value in List do
		local Copy = table.clone(value)
		local RecommendationType = Copy.recommendationType
		Copy.recommendationType = if RecommendationType == "RECOMMENDATION_TYPE_USER" or RecommendationType == RecommendationTypeModule.User then RecommendationTypeModule.User elseif RecommendationType == "RECOMMENDATION_TYPE_CONTACT" or RecommendationType == RecommendationTypeModule.Contact then RecommendationTypeModule.Contact else RecommendationTypeModule.Invalid
		t[i] = Copy
	end
	return t
end