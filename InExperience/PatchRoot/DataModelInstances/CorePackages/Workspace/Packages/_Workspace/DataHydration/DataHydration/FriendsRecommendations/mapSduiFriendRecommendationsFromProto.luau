local _ = require(script.Parent.SduiFriendRecommendationTypes)
local SduiRecommendationTypeModule = require(script.Parent.SduiRecommendationType)

local function _(Contact)
	-- upvalues: SduiRecommendationTypeModule (copy)
	return if Contact == "RECOMMENDATION_TYPE_USER" or Contact == SduiRecommendationTypeModule.User then SduiRecommendationTypeModule.User elseif Contact == "RECOMMENDATION_TYPE_CONTACT" or Contact == SduiRecommendationTypeModule.Contact then SduiRecommendationTypeModule.Contact else SduiRecommendationTypeModule.Invalid
end

return function(List)
	-- upvalues: SduiRecommendationTypeModule (copy)
	local t = {}
	
	for i, value in List do
		local Copy = table.clone(value)
		local RecommendationType = Copy.recommendationType
		Copy.recommendationType = if RecommendationType == "RECOMMENDATION_TYPE_USER" or RecommendationType == SduiRecommendationTypeModule.User then SduiRecommendationTypeModule.User elseif RecommendationType == "RECOMMENDATION_TYPE_CONTACT" or RecommendationType == SduiRecommendationTypeModule.Contact then SduiRecommendationTypeModule.Contact else SduiRecommendationTypeModule.Invalid
		t[i] = Copy
	end
	return t
end