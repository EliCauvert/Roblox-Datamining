local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsHeaderContainerModule = require(Moments.Components.MomentsHeader.MomentsHeaderContainer)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	defaultTitle = "Feature.Moments.Label.MomentsExperienceName"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), MomentsHeaderContainerModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(MomentsHeaderContainerModule, {
		animateWithImmersiveChrome = true,
		layoutOrder = p1.layoutOrder,
		variant = if p1.isBaseScreen then "base" else "close",
		showFtuxTooltip = p1.showFtuxTooltip,
		onFtuxTooltipDismissed = p1.onFtuxTooltipDismissed,
		onCreatePressed = p1.onCreatePressed,
		onClose = p1.onClose,
		onNavigateToTrending = p1.onNavigateToTrending,
		onNavigateToMyMoments = p1.onNavigateToMyMoments,
		title = p1.title or UseLocalizationResult.defaultTitle,
		showTopScrim = p1.showTopScrim,
		showHamburger = p1.showHamburger
	})
end