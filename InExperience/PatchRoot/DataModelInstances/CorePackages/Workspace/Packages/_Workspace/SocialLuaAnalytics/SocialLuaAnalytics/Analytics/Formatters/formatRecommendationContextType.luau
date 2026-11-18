local RecommendationContextTypes = require(script.Parent.Parent.Parent.Analytics.Enums).RecommendationContextTypes

return function(p1)
	-- upvalues: RecommendationContextTypes (copy)
	if p1 == nil then
		return nil
	else
		local RecommendationContextType = RecommendationContextTypes[if type(p1) == "string" then p1 else p1.rawValue()]
		
		return if RecommendationContextType then RecommendationContextType.rawValue() else nil
	end
end