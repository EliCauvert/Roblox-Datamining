local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local momentsHeaderContainerModule = require(moments.Components.MomentsHeader.MomentsHeaderContainer)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	defaultTitle = "Feature.Moments.Label.MomentsExperienceName"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), momentsHeaderContainerModule (ref)
	return reactModule.createElement(momentsHeaderContainerModule, {
		animateWithImmersiveChrome = true,
		layoutOrder = p1.layoutOrder,
		variant = if p1.isBaseScreen then "base" else "close",
		showFtuxTooltip = p1.showFtuxTooltip,
		onFtuxTooltipDismissed = p1.onFtuxTooltipDismissed,
		onCreatePressed = p1.onCreatePressed,
		onClose = p1.onClose,
		onNavigateToTrending = p1.onNavigateToTrending,
		onNavigateToMyMoments = p1.onNavigateToMyMoments,
		title = p1.title or useLocalization(t).defaultTitle,
		showTopScrim = p1.showTopScrim,
		showHamburger = p1.showHamburger
	})
end