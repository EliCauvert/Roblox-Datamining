local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local selectors = require(parent.NavigationRodux).Selectors
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore
local selectCurrentAvatarRouteModule = require(avatarExperienceCommon.State.Selectors.selectCurrentAvatarRoute)

return function(p1)
	-- upvalues: fFlagSignalsNavP3gAvatarExperience (ref), getLegacyNavigationStore (ref), fFlagUseNavigationSelectors (ref), selectors (ref), selectCurrentAvatarRouteModule (ref), avatarScreen (ref)
	local var1 = if fFlagSignalsNavP3gAvatarExperience then getLegacyNavigationStore(false).getCurrentRoute(false) elseif fFlagUseNavigationSelectors then p1.Navigation and selectors.selectCurrentRoactNavigationRoute(p1) else p1.Navigation and p1.Navigation.currentRoute
	local searchKeyword = var1 and (var1.params and (var1.params.searchParams and var1.params.searchParams.searchKeyword))
	
	if searchKeyword then
		return searchKeyword
	end
	local var2 = selectCurrentAvatarRouteModule(p1)
	
	if var2 and var2.name == avatarScreen.CatalogSearch then
		local key = var2.key
		
		return p1.Search and (p1.Search.SearchesInCatalog and (p1.Search.SearchesInCatalog[key] and p1.Search.SearchesInCatalog[key].keyword))
	end
	return nil
end