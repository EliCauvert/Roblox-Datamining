local Parent = script.Parent.Parent.Parent
local RecommendationContextTypes = require(Parent.Analytics.Enums).RecommendationContextTypes
local FFlagSocialCarouselMigrateRecommendations = require(Parent.Parent.SharedFlags).FFlagSocialCarouselMigrateRecommendations

return function(p1)
	-- upvalues: FFlagSocialCarouselMigrateRecommendations (copy), RecommendationContextTypes (copy)
	if p1 == nil then
		return nil
	elseif FFlagSocialCarouselMigrateRecommendations then
		local RecommendationContextType = RecommendationContextTypes[if type(p1) == "string" then p1 else p1.rawValue()]
		
		return if RecommendationContextType then RecommendationContextType.rawValue() else nil
	else
		return RecommendationContextTypes[p1.rawValue()].rawValue()
	end
end