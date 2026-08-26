local parent = script.Parent.Parent.Parent
local recommendationContextTypes = require(parent.Analytics.Enums).RecommendationContextTypes
local fFlagSocialCarouselMigrateRecommendations = require(parent.Parent.SharedFlags).FFlagSocialCarouselMigrateRecommendations

return function(p1)
	-- upvalues: fFlagSocialCarouselMigrateRecommendations (ref), recommendationContextTypes (ref)
	if p1 == nil then
		return nil
	elseif not fFlagSocialCarouselMigrateRecommendations then
		return recommendationContextTypes[p1.rawValue()].rawValue()
	end
	local var1 = recommendationContextTypes[if type(p1) == "string" then p1 else p1.rawValue()]
	
	return if var1 then var1.rawValue() else nil
end