local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local FFlagUseNavigationSelectors = require(Parent.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(Parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local Selectors = require(Parent.NavigationRodux).Selectors
local GetLegacyNavigationStoreFunction = require(Parent.NavigationRodux).GetLegacyNavigationStore

return function(p1) --[[ Line: 8 | Named "selectCurrentAvatarRoute" ]]
	-- upvalues: FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local CurrentRoute = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false) elseif FFlagUseNavigationSelectors then p1.Navigation and Selectors.selectCurrentRoactNavigationRoute(p1) else p1.Navigation and p1.Navigation.currentRoute
	local FromAvatarRoute = CurrentRoute and (CurrentRoute.params and CurrentRoute.params.fromAvatarRoute)
	
	return FromAvatarRoute and FromAvatarRoute.current
end