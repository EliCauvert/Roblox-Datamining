local useLocalization = require(script:FindFirstAncestor("InExperienceShop").Parent.Localization).Hooks.useLocalization

return function(p1, p2)
	-- upvalues: useLocalization (ref)
	local var1 = useLocalization({
		viewTerms = "Feature.Catalog.Action.ViewTerms",
		descriptionWithTime = {
			"Feature.InExperienceShop.Label.DescriptionWithTime",
			description = p1,
			timeRemaining = useLocalization({
				endTime = {
					"Feature.InExperienceShop.Label.EndTime",
					timeRemaining = p2 or ""
				}
			}).endTime
		}
	})
	
	return {
		bodyText = if p2 ~= nil then p1 else var1.descriptionWithTime,
		viewTermsText = var1.viewTerms
	}
end