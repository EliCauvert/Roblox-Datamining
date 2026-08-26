local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local tModule = require(parent.t)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local var1 = tModule.interface({
	displayName = tModule.optional(tModule.string),
	displayNameWithHeaderShort = tModule.optional(tModule.string),
	igrsRating = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil,
	igrsRatingDisplayMessage = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil,
	minimumAgeDisplay = if fFlagShowGameAgeRating then tModule.optional(tModule.string) else nil
})

return {
	ageRecommendationResponseValidator = tModule.interface({
		ageRecommendationDetails = tModule.interface({
			summary = tModule.interface({
				ageRecommendation = if fFlagShowGameAgeRating then tModule.optional(var1) else var1
			})
		})
	})
}