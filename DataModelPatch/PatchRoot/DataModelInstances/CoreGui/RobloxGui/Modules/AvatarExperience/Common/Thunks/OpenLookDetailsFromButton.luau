local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local SelectSearchKeywordFunction = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return function(p1)
	-- upvalues: UtilsModule (copy), SelectSearchKeywordFunction (copy), CatalogUtilsModule (copy), ConstantsModule (copy), PeekViewState (copy), FFlagAXMISEnableMultiShopping (copy), AvatarScreen (copy), SetFullViewModule (copy), FullView (copy), SetTryOnManagerPeekViewStateFunction (copy)
	return function(p2)
		-- upvalues: p1 (copy), UtilsModule (upval), SelectSearchKeywordFunction (upval), CatalogUtilsModule (upval), ConstantsModule (upval), PeekViewState (upval), FFlagAXMISEnableMultiShopping (upval), AvatarScreen (upval), SetFullViewModule (upval), FullView (upval), SetTryOnManagerPeekViewStateFunction (upval)
		local State = p2:getState()
		local Name = p1.avatarRoute.opaque.name
		local CurrentScreenIgnoreItemDetails = UtilsModule.getCurrentScreenIgnoreItemDetails(p1.avatarRoute)
		local SelectSearchKeywordResult = SelectSearchKeywordFunction(State)
		local CategoryAndSubcategory, CategoryAndSubcategory2 = CatalogUtilsModule.getCategoryAndSubcategory(State)
		p1.catalogAnalytics.openItemDetailsV2(p1.lookId, ConstantsModule.ItemType.Look, p1.valueInRobux, CurrentScreenIgnoreItemDetails, nil, SelectSearchKeywordResult, CategoryAndSubcategory, CategoryAndSubcategory2, State.AvatarExperience.AnalyticsMetadata)
		local Full = if FFlagAXMISEnableMultiShopping and p1.avatarRoute and p1.avatarRoute.opaque and p1.avatarRoute.opaque.name ~= AvatarScreen.MySharedAvatars then PeekViewState.Full else PeekViewState.Brief
		p2:dispatch(SetFullViewModule(p1.catalogAnalytics, Name, FullView.None))
		p2:dispatch(SetTryOnManagerPeekViewStateFunction(Full))
	end
end