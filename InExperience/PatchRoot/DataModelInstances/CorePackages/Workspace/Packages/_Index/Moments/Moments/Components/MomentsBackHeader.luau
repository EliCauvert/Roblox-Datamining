local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsHeaderContainerModule = require(Moments.Components.MomentsHeader.MomentsHeaderContainer)
local FFlagMomentsCreateAvatarPosts = require(Parent.SharedFlags).FFlagMomentsCreateAvatarPosts

return function(p1)
	-- upvalues: ReactModule (copy), MomentsHeaderContainerModule (copy), FFlagMomentsCreateAvatarPosts (copy)
	return ReactModule.createElement(MomentsHeaderContainerModule, {
		variant = "back",
		showTopScrim = true,
		layoutOrder = p1.layoutOrder,
		onBack = p1.onBack,
		onCreatePressed = p1.onCreatePressed,
		onCreateAvatarMomentPressed = if FFlagMomentsCreateAvatarPosts then p1.onCreateAvatarMomentPressed else nil,
		onNavigateToTrending = p1.onNavigateToTrending,
		onNavigateToMyMoments = p1.onNavigateToMyMoments
	})
end