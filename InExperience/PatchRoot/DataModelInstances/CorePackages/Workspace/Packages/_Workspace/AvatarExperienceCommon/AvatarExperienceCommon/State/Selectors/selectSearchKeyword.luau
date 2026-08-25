local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local selectors = require(parent.NavigationRodux).Selectors
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore
local selectCurrentAvatarRouteModule = require(avatarExperienceCommon.State.Selectors.selectCurrentAvatarRoute)

return function(p0)
	-- upvalues: fFlagSignalsNavP3gAvatarExperience (ref), getLegacyNavigationStore (ref), fFlagUseNavigationSelectors (ref), selectors (ref), selectCurrentAvatarRouteModule (ref), avatarScreen (ref)
	local var2 = if fFlagSignalsNavP3gAvatarExperience then getLegacyNavigationStore(false).getCurrentRoute(false) elseif fFlagUseNavigationSelectors then p0.Navigation and selectors.selectCurrentRoactNavigationRoute(p0) else p0.Navigation and p0.Navigation.currentRoute
	local searchKeyword = var2 and (var2.params and (var2.params.searchParams and var2.params.searchParams.searchKeyword))
	
	if searchKeyword then
		return searchKeyword
	end
	local var4 = selectCurrentAvatarRouteModule(p0)
	
	if var4 and var4.name == avatarScreen.CatalogSearch then
		local key = var4.key
		
		return p0.Search and (p0.Search.SearchesInCatalog and (p0.Search.SearchesInCatalog[key] and p0.Search.SearchesInCatalog[key].keyword))
	end
	return nil
end