local UseLocalizationFunction = require(script:FindFirstAncestor("InExperienceShop").Parent.Localization).Hooks.useLocalization

return function(Description, p1)
	-- upvalues: UseLocalizationFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		viewTerms = "Feature.Catalog.Action.ViewTerms",
		descriptionWithTime = {
			"Feature.InExperienceShop.Label.DescriptionWithTime",
			description = Description,
			timeRemaining = UseLocalizationFunction({
				endTime = {
					"Feature.InExperienceShop.Label.EndTime",
					timeRemaining = p1 or ""
				}
			}).endTime
		}
	})
	
	return {
		bodyText = if p1 == nil then Description else UseLocalizationResult.descriptionWithTime,
		viewTermsText = UseLocalizationResult.viewTerms
	}
end