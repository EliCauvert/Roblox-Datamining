local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local UseGetSelectedCategoryAndSubcategoryIdModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local SelectFilterCountModule = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local config = {
	[AvatarExperienceCommonModule.Enums.CatalogCategories.Recommended:rawValue()] = true
}

local function useSearchKeywordFromSignals()
	-- upvalues: GetLegacyNavigationStoreFunction (copy), UseSignalStateFunction (copy), AvatarScreen (copy), UseSelectorFunction (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStoreFunction(false).getCurrentRoute)
	local FromAvatarRoute = UseSignalStateResult and (UseSignalStateResult.params and UseSignalStateResult.params.fromAvatarRoute)
	local Current = FromAvatarRoute and FromAvatarRoute.current
	local Key = if Current and Current.name == AvatarScreen.CatalogSearch then Current.key else nil
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: Key (copy)
		return if Key then p1.Search and (p1.Search.SearchesInCatalog and (p1.Search.SearchesInCatalog[Key] and p1.Search.SearchesInCatalog[Key].keyword)) else nil
	end)
	local SearchKeyword = UseSignalStateResult and (UseSignalStateResult.params and (UseSignalStateResult.params.searchParams and UseSignalStateResult.params.searchParams.searchKeyword))
	
	return if SearchKeyword then SearchKeyword else UseSelectorResult
end

return function(): boolean
	-- upvalues: UseGetSelectedCategoryAndSubcategoryIdModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), useSearchKeywordFromSignals (copy), UseSelectorFunction (copy), SelectSearchKeyword (copy), SelectFilterCountModule (copy), config (copy)
	local UseGetSelectedCategoryAndSubcategoryIdModuleResult, _ = UseGetSelectedCategoryAndSubcategoryIdModule()
	local UseSearchKeywordFromSignalsResult = if FFlagSignalsNavP3gAvatarExperience then useSearchKeywordFromSignals() else UseSelectorFunction(SelectSearchKeyword)
	local UseSelectorResult = UseSelectorFunction(SelectFilterCountModule)
	
	return UseGetSelectedCategoryAndSubcategoryIdModuleResult ~= nil and (config[UseGetSelectedCategoryAndSubcategoryIdModuleResult] == true and (if UseSearchKeywordFromSignalsResult == nil then UseSelectorResult == 0 else UseSearchKeywordFromSignalsResult == "" and UseSelectorResult == 0))
end