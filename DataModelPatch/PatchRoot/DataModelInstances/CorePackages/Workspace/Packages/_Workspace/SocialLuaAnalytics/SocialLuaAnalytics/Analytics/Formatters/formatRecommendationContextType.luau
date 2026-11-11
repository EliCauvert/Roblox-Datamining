local RecommendationContextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).RecommendationContextTypes

return function(p1)
	-- upvalues: RecommendationContextTypes (copy)
	return if p1 == nil then nil else RecommendationContextTypes[p1.rawValue()].rawValue()
end