local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local selectors = require(parent.NavigationRodux).Selectors

return function(p0) --[[ line: 6 | named "selectCurrentAvatarRoute" ]]
	-- upvalues: fFlagUseNavigationSelectors (ref), selectors (ref)
	local var0 = if fFlagUseNavigationSelectors then p0.Navigation and selectors.selectCurrentRoactNavigationRoute(p0) else p0.Navigation and p0.Navigation.currentRoute
	local fromAvatarRoute = var0 and (var0.params and var0.params.fromAvatarRoute)
	
	return fromAvatarRoute and fromAvatarRoute.current
end