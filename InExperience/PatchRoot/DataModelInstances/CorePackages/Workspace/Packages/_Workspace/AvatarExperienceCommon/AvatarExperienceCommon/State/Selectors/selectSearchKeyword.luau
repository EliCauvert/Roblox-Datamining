local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagUseNavigationSelectors = require(Parent.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(Parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local Selectors = require(Parent.NavigationRodux).Selectors
local GetLegacyNavigationStoreFunction = require(Parent.NavigationRodux).GetLegacyNavigationStore
local SelectCurrentAvatarRouteModule = require(AvatarExperienceCommon.State.Selectors.selectCurrentAvatarRoute)

return function(p1) --[[ Line: 10 | Named "selectSearchKeyword" ]]
	-- upvalues: FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), SelectCurrentAvatarRouteModule (copy), AvatarScreen (copy)
	local CurrentRoute = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false) elseif FFlagUseNavigationSelectors then p1.Navigation and Selectors.selectCurrentRoactNavigationRoute(p1) else p1.Navigation and p1.Navigation.currentRoute
	local SearchKeyword = CurrentRoute and (CurrentRoute.params and (CurrentRoute.params.searchParams and CurrentRoute.params.searchParams.searchKeyword))
	
	if SearchKeyword then
		return SearchKeyword
	end
	local SelectCurrentAvatarRouteModuleResult = SelectCurrentAvatarRouteModule(p1)
	
	if SelectCurrentAvatarRouteModuleResult and SelectCurrentAvatarRouteModuleResult.name == AvatarScreen.CatalogSearch then
		local Key = SelectCurrentAvatarRouteModuleResult.key
		
		return p1.Search and (p1.Search.SearchesInCatalog and (p1.Search.SearchesInCatalog[Key] and p1.Search.SearchesInCatalog[Key].keyword))
	else
		return nil
	end
end