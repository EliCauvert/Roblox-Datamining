local DataHydration = script:FindFirstAncestor("DataHydration")
local GetGameInfoStoreModule = require(DataHydration.Game.GameInfo.getGameInfoStore)
local GetAgeRecommendationStoreModule = require(DataHydration.Game.AgeRecommendations.getAgeRecommendationStore)
local FFlagLuaAppDataHydrationUpdateItem = require(DataHydration.Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

return {
	syncGuidelinesAgeToGameStores = function(p1, p2)
		-- upvalues: FFlagLuaAppDataHydrationUpdateItem (copy), GetGameInfoStoreModule (copy), GetAgeRecommendationStoreModule (copy)
		local AgeRecommendationDetails = p2.ageRecommendationDetails
		local AgeRecommendationSummary = AgeRecommendationDetails and AgeRecommendationDetails.ageRecommendationSummary
		local AgeRecommendation = AgeRecommendationSummary and AgeRecommendationSummary.ageRecommendation
		
		if not AgeRecommendation then return end
		local Text = tostring(p1)
		
		if FFlagLuaAppDataHydrationUpdateItem then
			GetGameInfoStoreModule(false).updateGameInfo(Text, {
				gameMinimumAge = AgeRecommendation.minimumAge,
				gameAgeDisplayName = AgeRecommendation.displayName,
				contentMaturity = AgeRecommendation.contentMaturity
			})
		end
		GetAgeRecommendationStoreModule(false).updateAgeRecommendations({
			[Text] = {
				displayName = AgeRecommendation.displayName,
				displayNameWithHeaderShort = AgeRecommendation.displayNameWithHeaderShort,
				igrsRating = AgeRecommendation.igrsRating,
				igrsRatingDisplayMessage = AgeRecommendation.igrsRatingDisplayMessage
			}
		})
	end
}