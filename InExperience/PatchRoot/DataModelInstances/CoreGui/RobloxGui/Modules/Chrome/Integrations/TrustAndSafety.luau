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
local var6 = false
local var7 = signal.new()
local var8 = mappedSignal.new(var7, function()
	-- upvalues: var6 (write)
	return var6
end)
task.defer(function()
	-- upvalues: robloxGui (ref), var6 (write), var7 (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.CurrentPageSignal:connect(function(p0)
		-- upvalues: var6 (copy), settingsHubModule (ref), var7 (copy)
		var6 = p0 == settingsHubModule.Instance.ReportAbusePage.Page.Name
		var7:fire()
	end)
end)

return serviceModule:register({
	id = "trust_and_safety",
	label = "CoreScripts.InGameMenu.QuickActions.Report",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: robloxGui (ref), var6 (write)
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		
		if not settingsHubModule:GetVisibility() then
			settingsHubModule:SetVisibility(true, false, settingsHubModule.Instance.ReportAbusePage)
			
			return
		elseif var6 then
			settingsHubModule:SetVisibility(false)
			
			return
		end
		settingsHubModule:SwitchToPage(settingsHubModule.Instance.ReportAbusePage, true)
	end,
	isActivated = var8,
	components = {
		Icon = function(_)
			-- upvalues: fFlagStandardizeSafetyIcon (ref), commonIconModule (ref), var8 (ref)
			return if fFlagStandardizeSafetyIcon then commonIconModule("Flag", nil, var8) else commonIconModule("icons/menu/safety_off", "icons/menu/safety_on", var8)
		end
	}
})