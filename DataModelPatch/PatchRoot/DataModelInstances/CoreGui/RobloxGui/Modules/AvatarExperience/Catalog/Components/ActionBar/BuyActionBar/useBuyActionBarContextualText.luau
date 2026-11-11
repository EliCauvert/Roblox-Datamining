local UseLocalizationFunction = require(game:GetService("CorePackages").Workspace.Packages.Localization).Hooks.useLocalization

return function(p1, p2)
	-- upvalues: UseLocalizationFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		preFaeInfoText = "Feature.MarketplaceFAEUpsell.ActionBar.InfoText.PreFAE",
		postFaeInfoText = "Feature.MarketplaceFAEUpsell.ActionBar.InfoText.PostFAE"
	})
	
	return if p1 then UseLocalizationResult.preFaeInfoText elseif p2 then UseLocalizationResult.postFaeInfoText else nil
end