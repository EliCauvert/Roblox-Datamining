local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local InGameMenuIntegrationUtilsModule = require(Chrome.Integrations.Pages.InGameMenuIntegrationUtils)
local FFlagStandardizeSafetyIcon = SharedFlagsModule.FFlagStandardizeSafetyIcon
local IsNameMatch = false
local NewSignal = Signal.new()
local NewMappedSignal = MappedSignal.new(NewSignal, function()
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
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.MenuBesideSheet else nil,
	activated = function(_)
		-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy), InGameMenuIntegrationUtilsModule (copy), IsNameMatch (ref), RobloxGui (copy)
		if FFlagKeepSideSheetOpenBesideMenu then
			InGameMenuIntegrationUtilsModule.toggleIGMPage("ReportAbusePage", IsNameMatch)
			
			return
		end
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
	isActivated = NewMappedSignal,
	components = {
		Icon = function(_)
			-- upvalues: FFlagStandardizeSafetyIcon (copy), CommonIconModule (copy), NewMappedSignal (copy)
			return if FFlagStandardizeSafetyIcon then CommonIconModule("Flag", nil, NewMappedSignal) else CommonIconModule("icons/menu/safety_off", "icons/menu/safety_on", NewMappedSignal)
		end
	}
})