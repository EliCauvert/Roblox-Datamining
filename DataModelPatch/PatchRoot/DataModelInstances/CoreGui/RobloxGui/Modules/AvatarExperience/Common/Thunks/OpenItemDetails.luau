local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Packages.Dash)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local NavigateIntoItemDetailsPageModule = require(Modules.AvatarExperience.Common.Thunks.NavigateIntoItemDetailsPage)
local _ = require(Modules.AvatarExperience.Common.Context.WidgetInfoContext)
local _ = require(Modules.AvatarExperience.Common.Types)
local SelectSearchKeywordFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword
local GetFFlagAXItemDetailsAnalyticsV2Module = require(Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsAnalyticsV2)

return function(p1)
	-- upvalues: ArgCheckModule (copy), NavigationUtilsModule (copy), UtilsModule (copy), GetFFlagAXItemDetailsAnalyticsV2Module (copy), SelectSearchKeywordFunction (copy), CatalogUtilsModule (copy), NavigateIntoItemDetailsPageModule (copy)
	ArgCheckModule.assert(not (p1.mountAsFullView and p1.showFullWithNoPeekView))
	
	return function(p2)
		-- upvalues: p1 (copy), NavigationUtilsModule (upval), UtilsModule (upval), GetFFlagAXItemDetailsAnalyticsV2Module (upval), SelectSearchKeywordFunction (upval), CatalogUtilsModule (upval), NavigateIntoItemDetailsPageModule (upval)
		if p1.closePreviousItemDetails then
			NavigationUtilsModule.closeFiltersAndItemDetails(p1.navigation)
		end
		local config = {
			isFirstItemDetails = true,
			itemId = p1.itemId,
			itemType = p1.itemType,
			itemSubType = p1.itemSubType,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			resultsListRef = p1.resultsListRef,
			mountAsFullView = p1.mountAsFullView,
			showFullWithNoPeekView = p1.showFullWithNoPeekView,
			widgetInfo = p1.widgetInfo,
			onItemDetailsClosed = p1.onItemDetailsClosed
		}
		
		if p1.showFullWithNoPeekView or p1.mountAsFullView then
			local CurrentScreenIgnoreItemDetails = UtilsModule.getCurrentScreenIgnoreItemDetails(p1.avatarRoute)
			
			if GetFFlagAXItemDetailsAnalyticsV2Module() then
				local State = p2:getState()
				local SelectSearchKeywordResult = SelectSearchKeywordFunction(State)
				local CategoryAndSubcategory, CategoryAndSubcategory2 = CatalogUtilsModule.getCategoryAndSubcategory(State)
				p1.catalogAnalytics.openItemDetailsV2(p1.itemId, p1.itemType, p1.priceInRobux, CurrentScreenIgnoreItemDetails, State.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, SelectSearchKeywordResult, CategoryAndSubcategory, CategoryAndSubcategory2, State.AvatarExperience.AnalyticsMetadata)
			else
				p1.catalogAnalytics.openItemDetails(p1.itemId, p1.itemType, p1.priceInRobux, CurrentScreenIgnoreItemDetails)
			end
		end
		p2:dispatch(NavigateIntoItemDetailsPageModule(p1.navigation, config))
	end
end