local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagHideHeaderForBuyRobuxInExperienceShop = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHideHeaderForBuyRobuxInExperienceShop

local function openShop()
	-- upvalues: ServiceModule (copy), ConstantsModule (copy), FFlagHideHeaderForBuyRobuxInExperienceShop (copy), InExperienceShopModule (copy)
	if ServiceModule:isIntegrationValid(ConstantsModule.IN_EXPERIENCE_SHOP_ID) or FFlagHideHeaderForBuyRobuxInExperienceShop then
		if FFlagHideHeaderForBuyRobuxInExperienceShop then
			InExperienceShopModule.setOpenedFromBuyRobux(true)
		end
		if not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) then
			InExperienceShopModule.requestOpenToRobuxTab()
		end
		ServiceModule:activate(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

local function RobuxWidgetIntegration(p1)
	-- upvalues: ReactModule (copy), InExperienceSideSheetModule (copy), openShop (copy)
	return ReactModule.createElement(InExperienceSideSheetModule.RobuxWidget, {
		layoutOrder = p1.layoutOrder,
		placement = p1.placement,
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
	components = { Widget = RobuxWidgetIntegration }
}) else nil) or {}