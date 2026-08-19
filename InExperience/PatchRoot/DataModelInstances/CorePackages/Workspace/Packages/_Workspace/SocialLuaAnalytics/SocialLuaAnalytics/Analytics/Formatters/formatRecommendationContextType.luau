local parent = script.Parent.Parent.Parent
local recommendationContextTypes = require(parent.Analytics.Enums).RecommendationContextTypes
local fFlagSocialCarouselMigrateRecommendations = require(parent.Parent.SharedFlags).FFlagSocialCarouselMigrateRecommendations

return function(p0) --[[ line: 9 ]]
	-- upvalues: fFlagSocialCarouselMigrateRecommendations (ref), recommendationContextTypes (ref)
	if p0 == nil then
		return nil
	elseif not fFlagSocialCarouselMigrateRecommendations then
		return recommendationContextTypes[p0.rawValue()].rawValue()
	end
	local var0 = recommendationContextTypes[if type(p0) == "string" then p0 else p0.rawValue()]
	
	return if var0 then var0.rawValue() else nil
end