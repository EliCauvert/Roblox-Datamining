local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local FFlagStandardizeSafetyIcon = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStandardizeSafetyIcon
local IsNameMatch = false
local NewResult = require(CorePackages.Workspace.Packages.AppCommonLib).Signal.new()
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewResult, function()
	-- upvalues: IsNameMatch (ref)
	return IsNameMatch
end)
task.defer(function()
	-- upvalues: RobloxGui (copy), IsNameMatch (ref), NewResult (copy)
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	SettingsHubModule.CurrentPageSignal:connect(function(Name)
		-- upvalues: IsNameMatch (upval), SettingsHubModule (copy), NewResult (upval)
		IsNameMatch = Name == SettingsHubModule.Instance.ReportAbusePage.Page.Name
		NewResult:fire()
	end)
end)

return ServiceModule:register({
	id = "trust_and_safety",
	label = "CoreScripts.InGameMenu.QuickActions.Report",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = SideSheetPlacement.AboveFold,
	activated = function(_)
		-- upvalues: RobloxGui (copy), IsNameMatch (ref)
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		
		if not SettingsHubModule:GetVisibility() then
			SettingsHubModule:SetVisibility(true, false, SettingsHubModule.Instance.ReportAbusePage)
			
			return
		end
		if IsNameMatch then
			SettingsHubModule:SetVisibility(false)
			
			return
		else
			SettingsHubModule:SwitchToPage(SettingsHubModule.Instance.ReportAbusePage, true)
		end
	end,
	isActivated = NewResult1,
	components = {
		Icon = function(_)
			-- upvalues: FFlagStandardizeSafetyIcon (copy), CommonIconModule (copy), NewResult1 (copy)
			return if FFlagStandardizeSafetyIcon then CommonIconModule("Flag", nil, NewResult1) else CommonIconModule("icons/menu/safety_off", "icons/menu/safety_on", NewResult1)
		end
	}
})