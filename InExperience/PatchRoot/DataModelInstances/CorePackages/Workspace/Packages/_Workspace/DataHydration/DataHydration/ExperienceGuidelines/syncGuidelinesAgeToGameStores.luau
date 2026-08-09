local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local getGameInfoStoreModule = require(dataHydration.Game.GameInfo.getGameInfoStore)
local getAgeRecommendationStoreModule = require(dataHydration.Game.AgeRecommendations.getAgeRecommendationStore)
local fFlagLuaAppDataHydrationUpdateItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

return {
	syncGuidelinesAgeToGameStores = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: fFlagLuaAppDataHydrationUpdateItem (ref), getGameInfoStoreModule (ref), fFlagSduiExperienceDetailsSupport (ref), getAgeRecommendationStoreModule (ref)
		local ageRecommendationDetails = p1.ageRecommendationDetails
		local ageRecommendationSummary = ageRecommendationDetails and ageRecommendationDetails.ageRecommendationSummary
		local ageRecommendation = ageRecommendationSummary and ageRecommendationSummary.ageRecommendation
		
		if not ageRecommendation then return end
		local var5 = tostring(p0)
		
		if fFlagLuaAppDataHydrationUpdateItem then
			getGameInfoStoreModule(false).updateGameInfo(var5, {
				gameMinimumAge = ageRecommendation.minimumAge,
				gameAgeDisplayName = ageRecommendation.displayName,
				contentMaturity = ageRecommendation.contentMaturity
			})
		end
		if fFlagSduiExperienceDetailsSupport then
			getAgeRecommendationStoreModule(false).updateAgeRecommendations({
				[var5] = {
					displayName = ageRecommendation.displayName,
					displayNameWithHeaderShort = ageRecommendation.displayNameWithHeaderShort,
					igrsRating = ageRecommendation.igrsRating,
					igrsRatingDisplayMessage = ageRecommendation.igrsRatingDisplayMessage
				}
			})
		end
	end
}