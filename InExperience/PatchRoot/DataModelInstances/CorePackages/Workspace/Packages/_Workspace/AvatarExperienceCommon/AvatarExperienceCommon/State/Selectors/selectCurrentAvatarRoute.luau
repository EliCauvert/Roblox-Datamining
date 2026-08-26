local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local selectors = require(parent.NavigationRodux).Selectors
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore

return function(p1)
	-- upvalues: fFlagSignalsNavP3gAvatarExperience (ref), getLegacyNavigationStore (ref), fFlagUseNavigationSelectors (ref), selectors (ref)
	local var1 = if fFlagSignalsNavP3gAvatarExperience then getLegacyNavigationStore(false).getCurrentRoute(false) elseif fFlagUseNavigationSelectors then p1.Navigation and selectors.selectCurrentRoactNavigationRoute(p1) else p1.Navigation and p1.Navigation.currentRoute
	local fromAvatarRoute = var1 and (var1.params and var1.params.fromAvatarRoute)
	
	return fromAvatarRoute and fromAvatarRoute.current
end