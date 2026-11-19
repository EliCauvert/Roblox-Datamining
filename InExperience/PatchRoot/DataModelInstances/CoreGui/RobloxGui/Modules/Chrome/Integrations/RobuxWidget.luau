local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagLogFreeTrialDotAndMenuItemClickModule = require(Chrome.Flags.FFlagLogFreeTrialDotAndMenuItemClick)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagHideHeaderForBuyRobuxInExperienceShop = SharedFlagsModule.FFlagHideHeaderForBuyRobuxInExperienceShop
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior

local function _(): boolean
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	return ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID] ~= nil and ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) == true
end

local function openShop()
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), FFlagHideHeaderForBuyRobuxInExperienceShop (copy), InExperienceShopModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), FFlagLogFreeTrialDotAndMenuItemClickModule (copy), Chrome (copy)
	if not ServiceModule:isIntegrationValid(ConstantsModule.IN_EXPERIENCE_SHOP_ID) and not FFlagHideHeaderForBuyRobuxInExperienceShop then
		return not FFlagKeepSideSheetOpenBesideMenu and nil
	end
	if FFlagHideHeaderForBuyRobuxInExperienceShop then
		InExperienceShopModule.setOpenedFromBuyRobux(true)
	end
	if not (if FFlagKeepSideSheetOpenBesideMenu then ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID] ~= nil and ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) == true else ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID)) then
		InExperienceShopModule.requestOpenToRobuxTab()
	end
	if FFlagLogFreeTrialDotAndMenuItemClickModule then
		require(Chrome.Integrations.InExperienceShop.trialIndicatorShopOpen).beginOutsideTrialIndicator()
	end
	ServiceModule:activate(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	
	if FFlagLogFreeTrialDotAndMenuItemClickModule then
		require(Chrome.Integrations.InExperienceShop.trialIndicatorShopOpen).finishOutsideTrialIndicator()
	end
	return if FFlagKeepSideSheetOpenBesideMenu then ServiceModule:integrations()[ConstantsModule.IN_EXPERIENCE_SHOP_ID] ~= nil and ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) == true else nil
end

local function RobuxWidgetIntegration(p1)
	-- upvalues: ReactModule (copy), InExperienceSideSheetModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), openShop (copy)
	return ReactModule.createElement(InExperienceSideSheetModule.RobuxWidget, {
		layoutOrder = p1.layoutOrder,
		placement = p1.placement,
		sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then p1.sideSheetOpenBehavior else nil,
		onBuyActivated = openShop,
		firstIntegrationToFocusCallback = p1.firstIntegrationToFocusCallback
	})
end

return (if require(Chrome.Flags.FFlagEnableSideSheetRobuxWidget) and IsSideSheetEnabledModule then ServiceModule:register({
	id = "RobuxWidget",
	label = "Feature.Catalog.Label.BuyRobux",
	activated = function() end,
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = ChromeModule.Enums.SideSheetPlacement.ScrollableContentTop,
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.WindowBesideSheet else nil,
	components = { Widget = RobuxWidgetIntegration }
}) else nil) or {}