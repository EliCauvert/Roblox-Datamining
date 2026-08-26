local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local fFlagStandardizeSafetyIcon = sharedFlagsModule.FFlagStandardizeSafetyIcon
local var1 = false
local var2 = signal.new()
local var3 = mappedSignal.new(var2, function()
	-- upvalues: var1 (write)
	return var1
end)
task.defer(function()
	-- upvalues: robloxGui (ref), var1 (write), var2 (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.CurrentPageSignal:connect(function(p1)
		-- upvalues: var1 (copy), settingsHubModule (ref), var2 (copy)
		var1 = p1 == settingsHubModule.Instance.ReportAbusePage.Page.Name
		var2:fire()
	end)
end)

return serviceModule:register({
	id = "trust_and_safety",
	label = "CoreScripts.InGameMenu.QuickActions.Report",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: robloxGui (ref), var1 (write)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		
		if not settingsHubModule:GetVisibility() then
			settingsHubModule:SetVisibility(true, false, settingsHubModule.Instance.ReportAbusePage)
			
			return
		elseif var1 then
			settingsHubModule:SetVisibility(false)
			
			return
		end
		settingsHubModule:SwitchToPage(settingsHubModule.Instance.ReportAbusePage, true)
	end,
	isActivated = var3,
	components = {
		Icon = function(_)
			-- upvalues: fFlagStandardizeSafetyIcon (ref), commonIconModule (ref), var3 (ref)
			return if fFlagStandardizeSafetyIcon then commonIconModule("Flag", nil, var3) else commonIconModule("icons/menu/safety_off", "icons/menu/safety_on", var3)
		end
	}
})