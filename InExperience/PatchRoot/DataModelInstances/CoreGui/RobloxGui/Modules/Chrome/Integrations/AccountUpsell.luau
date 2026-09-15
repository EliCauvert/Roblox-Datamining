local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local accountUpgradeModule = require(corePackagesService.Workspace.Packages.AccountUpgrade)
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local serviceModule = require(chrome.Service)
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
local isPioneerLaunch = require(corePackagesService.Workspace.Packages.PioneerUtils).isPioneerLaunch
local reactModule = require(corePackagesService.Packages.React)
local pioneer = accountUpgradeModule.AccountUpgradeFlow.Pioneer
local var1 = nil

local function openAccountUpsell()
	-- upvalues: accountUpgradeModule (ref), pioneer (ref), var1 (write)
	if accountUpgradeModule.InExperienceController.mount({
		flow = pioneer,
		onComplete = function(p1)
			-- upvalues: var1 (copy)
			if p1.reason == "success" and var1 then
				var1.availability:unavailable()
			end
		end
	}) == "already_mounted" then
		accountUpgradeModule.InExperienceController.unmount()
	end
end

local var2 = if isPioneerLaunch() then {
	id = "AccountUpsell",
	label = "CoreScripts.InGameMenu.UnlockMore.Title",
	activated = function() end,
	sideSheetPlacement = chromeModule.Enums.SideSheetPlacement.ScrollableContentBottom,
	components = {
		Widget = function(p1)
			-- upvalues: reactModule (ref), inExperienceSideSheetModule (ref), openAccountUpsell (ref)
			return reactModule.createElement(inExperienceSideSheetModule.AccountUpsell, {
				layoutOrder = p1.layoutOrder,
				placement = p1.placement,
				onActivated = openAccountUpsell
			})
		end
	}
} else nil

if var2 then
	var2.initialAvailability = serviceModule.AvailabilitySignal.Unavailable
	local var3 = serviceModule:register(var2)
	var1 = var3
	task.spawn(function()
		-- upvalues: accountUpgradeModule (ref), pioneer (ref), var3 (ref)
		if accountUpgradeModule.Eligibility.getAvailability(pioneer).granted then
			var3.availability:available()
		end
	end)
end
return var1 or {}