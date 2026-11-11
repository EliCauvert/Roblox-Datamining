local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(Parent.t)
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return {
	ageRecommendationResponseValidator = TModule.interface({
		ageRecommendationDetails = TModule.interface({
			summary = TModule.interface({
				ageRecommendation = TModule.interface({
					displayName = TModule.optional(TModule.string),
					displayNameWithHeaderShort = TModule.optional(TModule.string),
					igrsRating = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil,
					igrsRatingDisplayMessage = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
				})
			})
		})
	})
}