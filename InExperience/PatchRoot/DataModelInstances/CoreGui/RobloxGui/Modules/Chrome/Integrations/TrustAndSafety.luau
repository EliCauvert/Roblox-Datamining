local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local FFlagStandardizeSafetyIcon = SharedFlagsModule.FFlagStandardizeSafetyIcon
local IsNameMatch = false
local NewSignal = Signal.new()
local NewResult = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewSignal, function()
	-- upvalues: IsNameMatch (ref)
	return IsNameMatch
end)
task.defer(function()
	-- upvalues: RobloxGui (copy), IsNameMatch (ref), NewSignal (copy)
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	SettingsHubModule.CurrentPageSignal:connect(function(Name)
		-- upvalues: IsNameMatch (upval), SettingsHubModule (copy), NewSignal (upval)
		IsNameMatch = Name == SettingsHubModule.Instance.ReportAbusePage.Page.Name
		NewSignal:fire()
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
	isActivated = NewResult,
	components = {
		Icon = function(_)
			-- upvalues: FFlagStandardizeSafetyIcon (copy), CommonIconModule (copy), NewResult (copy)
			return if FFlagStandardizeSafetyIcon then CommonIconModule("Flag", nil, NewResult) else CommonIconModule("icons/menu/safety_off", "icons/menu/safety_on", NewResult)
		end
	}
})