local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)

local function openShop()
	-- upvalues: serviceModule (ref), constantsModule (ref), inExperienceShopModule (ref)
	if serviceModule:isIntegrationValid(constantsModule.IN_EXPERIENCE_SHOP_ID) then
		inExperienceShopModule.requestOpenToRobuxTab()
		serviceModule:activate(constantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

return (if require(chrome.Flags.FFlagEnableSideSheetRobuxWidget) and require(corePackagesService.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled) then serviceModule:register({
	id = "RobuxWidget",
	label = "Feature.Catalog.Label.BuyRobux",
	activated = function() end,
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = chromeModule.Enums.SideSheetPlacement.ScrollableContentTop,
	components = {
		Widget = function(p1)
			-- upvalues: reactModule (ref), inExperienceSideSheetModule (ref), openShop (ref)
			return reactModule.createElement(inExperienceSideSheetModule.RobuxWidget, {
				layoutOrder = p1.layoutOrder,
				placement = p1.placement,
				onBuyActivated = openShop
			})
		end
	}
}) else nil) or {}