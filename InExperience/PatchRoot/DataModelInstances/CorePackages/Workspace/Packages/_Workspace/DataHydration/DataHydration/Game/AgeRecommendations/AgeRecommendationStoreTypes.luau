local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(DataHydration.Parent.t)

return {
	ageRecommendationResponseValidator = TModule.interface({
		ageRecommendationDetails = TModule.interface({
			summary = TModule.interface({
				ageRecommendation = TModule.optional((TModule.interface({
					displayName = TModule.optional(TModule.string),
					displayNameWithHeaderShort = TModule.optional(TModule.string),
					igrsRating = TModule.optional(TModule.string),
					igrsRatingDisplayMessage = TModule.optional(TModule.string),
					minimumAgeDisplay = TModule.optional(TModule.string)
				})))
			})
		})
	})
}