local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local momentsHeaderContainerModule = require(moments.Components.MomentsHeader.MomentsHeaderContainer)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	defaultTitle = "Feature.Moments.Label.MomentsExperienceName"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), momentsHeaderContainerModule (ref)
	return reactModule.createElement(momentsHeaderContainerModule, {
		animateWithImmersiveChrome = true,
		layoutOrder = p0.layoutOrder,
		variant = if p0.isBaseScreen then "base" else "close",
		showFtuxTooltip = p0.showFtuxTooltip,
		onFtuxTooltipDismissed = p0.onFtuxTooltipDismissed,
		onCreatePressed = p0.onCreatePressed,
		onClose = p0.onClose,
		onNavigateToTrending = p0.onNavigateToTrending,
		onNavigateToMyMoments = p0.onNavigateToMyMoments,
		title = p0.title or useLocalization(t).defaultTitle,
		showTopScrim = p0.showTopScrim,
		showHamburger = p0.showHamburger
	})
end