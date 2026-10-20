local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local SponsoredItemsWidgetRowModule = require(Modules.AvatarExperience.Common.Components.SponsoredItemsWidgetRow)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local StoresModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXHideEmptySponsoredRow = AvatarExperienceFlagsModule.FFlagAXHideEmptySponsoredRow
local SelectSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Selectors.selectSponsoredItems)
local SponsoredItemsKey = require(Modules.AvatarExperience.Catalog.CatalogUtils).GetSponsoredItemsKey(CatalogConstantsModule.SponsoredItemsCategoryRecommended, CatalogConstantsModule.SponsoredItemsToFetch)

return function(p1, p2, p3)
	-- upvalues: UseSelectorFunction (copy), PerformFetch (copy), SponsoredItemsKey (copy), GetUseSelectorDeepEqualsFunction (copy), UtilsModule (copy), FFlagAXHideEmptySponsoredRow (copy), SelectSponsoredItemsModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), StoresModule (copy), UseSignalStateFunction (copy), ReactModule (copy), RetrievalStatusModule (copy), CryoModule (copy), CatalogCategories (copy), ConstantsModule (copy), SponsoredItemsWidgetRowModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p4)
		-- upvalues: PerformFetch (upval), SponsoredItemsKey (upval)
		return PerformFetch.GetStatus(p4, SponsoredItemsKey)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p4)
		-- upvalues: UtilsModule (upval), p1 (copy), PerformFetch (upval)
		return PerformFetch.GetStatus(p4, (UtilsModule.getSearchKey(p4, p1)))
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(function(p4)
		return p4.AvatarExperience.Catalog.SortAndFilters.SelectedTopics
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p4)
		-- upvalues: p1 (copy)
		return p4.SearchesParameters[p1]
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = if FFlagAXHideEmptySponsoredRow then UseSelectorFunction(SelectSponsoredItemsModule, GetUseSelectorDeepEqualsFunction()) else nil
	local UseSignalStateResult = if FFlagAXMoveAllTabToWidgetOnly then UseSignalStateFunction(StoresModule.getFetchMarketplaceStore(false).getFetchingMarketplaceProcessed) else nil
	
	return {
		row = ConstantsModule.SponsoredItemsRow,
		component = SponsoredItemsWidgetRowModule,
		isEnabled = ReactModule.useMemo(function(): boolean
			-- upvalues: UseSelectorResult (copy), RetrievalStatusModule (upval), FFlagAXHideEmptySponsoredRow (upval), UseSelectorResult4 (copy), UseSelectorResult2 (copy), FFlagAXMoveAllTabToWidgetOnly (upval), UseSelectorResult1 (copy), UseSelectorResult3 (copy), CryoModule (upval), CatalogCategories (upval), UseSignalStateResult (ref), p2 (copy), p3 (copy)
			if UseSelectorResult == RetrievalStatusModule.Failed then
				return false
			end
			if FFlagAXHideEmptySponsoredRow and (not UseSelectorResult4 or #UseSelectorResult4 == 0) then
				return false
			end
			local v1: boolean = UseSelectorResult2 ~= nil and #UseSelectorResult2 > 0
			local IsUseSelectorResultMatch = if FFlagAXMoveAllTabToWidgetOnly then nil else UseSelectorResult1 == RetrievalStatusModule.Done
			local IsIdMatch = not FFlagAXMoveAllTabToWidgetOnly and nil
			local ShowSponsored = false
			
			if UseSelectorResult3 and UseSelectorResult3.categoryInfo and not CryoModule.isEmpty(UseSelectorResult3.categoryInfo) then
				local CategoryInfo = UseSelectorResult3.categoryInfo
				ShowSponsored = CategoryInfo.ShowSponsored or false
				
				if FFlagAXMoveAllTabToWidgetOnly then
					IsIdMatch = CategoryInfo.Id == CatalogCategories.Recommended:rawValue()
				end
			end
			if FFlagAXMoveAllTabToWidgetOnly then
				IsUseSelectorResultMatch = UseSelectorResult1 == RetrievalStatusModule.Done or FFlagAXMoveAllTabToWidgetOnly and (UseSignalStateResult and IsIdMatch)
			end
			return p2 and (IsUseSelectorResultMatch and (ShowSponsored and (not v1 and not p3)))
		end, {
			UseSelectorResult, UseSelectorResult2, UseSelectorResult1, p2,
			UseSelectorResult3, p3,
			if FFlagAXMoveAllTabToWidgetOnly then UseSignalStateResult else nil,
			if FFlagAXHideEmptySponsoredRow then UseSelectorResult4 else nil
		})
	}
end