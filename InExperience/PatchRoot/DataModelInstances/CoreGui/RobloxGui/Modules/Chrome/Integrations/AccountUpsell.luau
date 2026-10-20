local CorePackages = game:GetService("CorePackages")
local AccountUpgradeModule = require(CorePackages.Workspace.Packages.AccountUpgrade)
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local ReactModule = require(CorePackages.Packages.React)
local Pioneer = AccountUpgradeModule.AccountUpgradeFlow.Pioneer
local v1 = nil

local function openAccountUpsell()
	-- upvalues: AccountUpgradeModule (copy), Pioneer (copy), v1 (ref)
	if AccountUpgradeModule.InExperienceController.mount({
		flow = Pioneer,
		onComplete = function(p1)
			-- upvalues: v1 (upval)
			if p1.reason == "success" and v1 then
				v1.availability:unavailable()
			end
		end
	}) == "already_mounted" then
		AccountUpgradeModule.InExperienceController.unmount()
	end
end

local function AccountUpsellIntegration(p1)
	-- upvalues: ReactModule (copy), InExperienceSideSheetModule (copy), openAccountUpsell (copy)
	return ReactModule.createElement(InExperienceSideSheetModule.AccountUpsell, {
		layoutOrder = p1.layoutOrder,
		placement = p1.placement,
		onActivated = openAccountUpsell
	})
end

local Config = if require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch() then {
	id = "AccountUpsell",
	label = "CoreScripts.InGameMenu.UnlockMore.Title",
	activated = function() end,
	sideSheetPlacement = ChromeModule.Enums.SideSheetPlacement.ScrollableContentBottom,
	components = { Widget = AccountUpsellIntegration }
} else nil

if Config then
	Config.initialAvailability = ServiceModule.AvailabilitySignal.Unavailable
	local RegisterResult = ServiceModule:register(Config)
	v1 = RegisterResult
	task.spawn(function()
		-- upvalues: AccountUpgradeModule (copy), Pioneer (copy), RegisterResult (copy)
		if AccountUpgradeModule.Eligibility.getAvailability(Pioneer).granted then
			RegisterResult.availability:available()
		end
	end)
end
return v1 or {}