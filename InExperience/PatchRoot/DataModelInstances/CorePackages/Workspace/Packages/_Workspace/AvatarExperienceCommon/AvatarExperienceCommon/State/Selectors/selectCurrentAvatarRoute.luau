local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local selectors = require(parent.NavigationRodux).Selectors
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore

return function(p0)
	-- upvalues: fFlagSignalsNavP3gAvatarExperience (ref), getLegacyNavigationStore (ref), fFlagUseNavigationSelectors (ref), selectors (ref)
	local var0 = if fFlagSignalsNavP3gAvatarExperience then getLegacyNavigationStore(false).getCurrentRoute(false) elseif fFlagUseNavigationSelectors then p0.Navigation and selectors.selectCurrentRoactNavigationRoute(p0) else p0.Navigation and p0.Navigation.currentRoute
	local fromAvatarRoute = var0 and (var0.params and var0.params.fromAvatarRoute)
	
	return fromAvatarRoute and fromAvatarRoute.current
end