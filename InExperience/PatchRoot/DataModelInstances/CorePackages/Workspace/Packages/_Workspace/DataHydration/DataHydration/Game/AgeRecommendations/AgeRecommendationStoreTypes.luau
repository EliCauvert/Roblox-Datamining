local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local TModule = require(Parent.t)
local FFlagShowGameAgeRating = require(Parent.SharedFlags).FFlagShowGameAgeRating
local InterfaceResult = TModule.interface({
	displayName = TModule.optional(TModule.string),
	displayNameWithHeaderShort = TModule.optional(TModule.string),
	igrsRating = TModule.optional(TModule.string),
	igrsRatingDisplayMessage = TModule.optional(TModule.string),
	minimumAgeDisplay = if FFlagShowGameAgeRating then TModule.optional(TModule.string) else nil
})

return {
	ageRecommendationResponseValidator = TModule.interface({
		ageRecommendationDetails = TModule.interface({
			summary = TModule.interface({
				ageRecommendation = if FFlagShowGameAgeRating then TModule.optional(InterfaceResult) else InterfaceResult
			})
		})
	})
}