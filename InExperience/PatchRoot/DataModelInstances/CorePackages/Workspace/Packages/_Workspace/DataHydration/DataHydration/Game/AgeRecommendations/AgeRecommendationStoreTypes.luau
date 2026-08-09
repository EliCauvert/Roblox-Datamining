local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local tModule = require(parent.t)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return {
	ageRecommendationResponseValidator = tModule.interface({
		ageRecommendationDetails = tModule.interface({
			summary = tModule.interface({
				ageRecommendation = tModule.interface({
					displayName = tModule.optional(tModule.string),
					displayNameWithHeaderShort = tModule.optional(tModule.string),
					igrsRating = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil,
					igrsRatingDisplayMessage = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
				})
			})
		})
	})
}