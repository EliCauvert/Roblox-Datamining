local homeStore = script:FindFirstAncestor("HomeStore")
local _ = require(homeStore.FriendRecommendationTypes)
local recommendationTypeModule = require(homeStore.RecommendationType)

local function _(p1)
	-- upvalues: recommendationTypeModule (ref)
	return if p1 == "RECOMMENDATION_TYPE_USER" or p1 == recommendationTypeModule.User then recommendationTypeModule.User elseif p1 == "RECOMMENDATION_TYPE_CONTACT" or p1 == recommendationTypeModule.Contact then recommendationTypeModule.Contact else recommendationTypeModule.Invalid
end

return function(p1)
	-- upvalues: recommendationTypeModule (ref)
	local t = {}
	
	for i, v in p1 do
		local cloned = table.clone(v)
		local recommendationType = cloned.recommendationType
		cloned.recommendationType = if recommendationType == "RECOMMENDATION_TYPE_USER" or recommendationType == recommendationTypeModule.User then recommendationTypeModule.User elseif recommendationType == "RECOMMENDATION_TYPE_CONTACT" or recommendationType == recommendationTypeModule.Contact then recommendationTypeModule.Contact else recommendationTypeModule.Invalid
		t[i] = cloned
	end
	return t
end