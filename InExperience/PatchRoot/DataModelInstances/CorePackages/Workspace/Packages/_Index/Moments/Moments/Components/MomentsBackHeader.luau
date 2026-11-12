local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local MomentsHeaderContainerModule = require(Moments.Components.MomentsHeader.MomentsHeaderContainer)

return function(p1)
	-- upvalues: ReactModule (copy), MomentsHeaderContainerModule (copy)
	return ReactModule.createElement(MomentsHeaderContainerModule, {
		variant = "back",
		showTopScrim = true,
		layoutOrder = p1.layoutOrder,
		onBack = p1.onBack,
		onCreatePressed = p1.onCreatePressed,
		onNavigateToTrending = p1.onNavigateToTrending,
		onNavigateToMyMoments = p1.onNavigateToMyMoments
	})
end