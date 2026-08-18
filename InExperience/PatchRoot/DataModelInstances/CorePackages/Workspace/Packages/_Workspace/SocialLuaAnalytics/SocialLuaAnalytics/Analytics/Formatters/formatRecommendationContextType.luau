local recommendationContextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).RecommendationContextTypes

return function(p0) --[[ line: 5 ]]
	-- upvalues: recommendationContextTypes (ref)
	return if p0 == nil then nil else recommendationContextTypes[p0.rawValue()].rawValue()
end