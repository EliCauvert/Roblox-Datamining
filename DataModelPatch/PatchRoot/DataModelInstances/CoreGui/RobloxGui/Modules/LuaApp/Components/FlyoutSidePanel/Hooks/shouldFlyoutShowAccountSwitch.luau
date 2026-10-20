local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local FFlagLuaAccountSwitchExperimentBypassBackdoorDevModule = require(Modules.LuaApp.Flags.FFlagLuaAccountSwitchExperimentBypassBackdoorDev)
local FFlagEnableAuthButtonShownEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAuthButtonShownEvent
local FFlagAuthSecExclusions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP

return function()
	-- upvalues: UseAppPolicyFunction (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), UserModule (copy), FFlagLuaAccountSwitchExperimentBypassBackdoorDevModule (copy), FFlagAuthSecExclusions (copy), FFlagEnableLuaAccountSwitchModule (copy), EventStreamConstantsModule (copy), FFlagEnableAuthButtonShownEvent (copy), UseRoactServiceFunction (copy), RoactAnalyticsAuthEventsModule (copy), ReactModule (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1
	end)
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AccountSwitcherLayer }, function(p1)
		-- upvalues: AppBtidLayers (upval)
		return p1[AppBtidLayers.AccountSwitcherLayer] or {}
	end)
	local IsAccountSwitcherEnabled = UseBrowserTrackerExperimentResult.isAccountSwitcherEnabled or FFlagLuaAccountSwitchExperimentBypassBackdoorDevModule
	local IsNotIsUnder = UserModule.fromLocalStorage().isUnder13 ~= true
	local ExcludeAccountSwitcher = FFlagAuthSecExclusions and UseAppPolicyResult.getExcludeAccountSwitcher()
	local IsAccountSwitcherEnabled1 = FFlagEnableLuaAccountSwitchModule and (not ExcludeAccountSwitcher and (IsNotIsUnder and IsAccountSwitcherEnabled))
	local SwitchAccountsExclusionsHidden = if ExcludeAccountSwitcher then EventStreamConstantsModule.State.SwitchAccountsExclusionsHidden elseif IsNotIsUnder then if IsAccountSwitcherEnabled1 then EventStreamConstantsModule.State.SwitchAccountsShown else EventStreamConstantsModule.State.SwitchAccountsIxpHidden else EventStreamConstantsModule.State.SwitchAccountsU13Hidden
	
	if FFlagEnableAuthButtonShownEvent then
		local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsAuthEventsModule)
		ReactModule.useEffect(function()
			-- upvalues: UseRoactServiceResult (copy), EventStreamConstantsModule (upval), SwitchAccountsExclusionsHidden (copy)
			UseRoactServiceResult.reportAuthButtonShown(EventStreamConstantsModule.Context.FlyoutSidePanel, EventStreamConstantsModule.Button.SwitchAccounts, SwitchAccountsExclusionsHidden, EventStreamConstantsModule.Origin.FlyoutSidePanel)
		end, { SwitchAccountsExclusionsHidden })
	end
	local IsEnableAccountSwitcherFoundationDesign = nil
	local IsEnableAccountSwitcherSignedOutAccounts = nil
	if GetFFlagEnableAccountSwitcherRedesignIXPFunction() then
		IsEnableAccountSwitcherFoundationDesign = UseBrowserTrackerExperimentResult.enableAccountSwitcherFoundationDesign == true
		IsEnableAccountSwitcherSignedOutAccounts = UseBrowserTrackerExperimentResult.enableAccountSwitcherSignedOutAccounts == true
	else
		IsEnableAccountSwitcherFoundationDesign = true
		IsEnableAccountSwitcherSignedOutAccounts = true
	end
	return IsAccountSwitcherEnabled1, IsEnableAccountSwitcherFoundationDesign, IsEnableAccountSwitcherSignedOutAccounts
end