local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local serviceModule = require(chrome.Service)
local isPioneerLaunch = require(corePackagesService.Workspace.Packages.PioneerUtils).isPioneerLaunch
local reactModule = require(corePackagesService.Packages.React)

local function openAccountUpsell() end

local var1 = if isPioneerLaunch() then {
	id = "AccountUpsell",
	label = "CoreScripts.InGameMenu.UnlockMore.Title",
	activated = function() end,
	sideSheetPlacement = chromeModule.Enums.SideSheetPlacement.FixedFooterTop,
	components = {
		Widget = function(p1)
			-- upvalues: corePackagesService (ref), reactModule (ref), openAccountUpsell (ref)
			return reactModule.createElement(require(corePackagesService.Workspace.Packages.InExperienceSideSheet).AccountUpsell, {
				layoutOrder = p1.layoutOrder,
				placement = p1.placement,
				onActivated = openAccountUpsell
			})
		end
	}
} else nil
local var2 = nil

if var1 then
	var1.initialAvailability = serviceModule.AvailabilitySignal.Available
	var2 = serviceModule:register(var1)
end
return var2 or {}