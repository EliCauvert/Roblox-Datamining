local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local UseBillingTabVisibilityFunction = require(CorePackages.Workspace.Packages.SettingsTabVisibility).useBillingTabVisibility
local FFlagEnableBillingTabHideLogicModule = require(Modules.LuaApp.Flags.FFlagEnableBillingTabHideLogic)

return function(p1)
	-- upvalues: UseAppPolicyModule (copy), RobloxAppHooksModule (copy), UiMode (copy), FFlagEnableBillingTabHideLogicModule (copy), UseBillingTabVisibilityFunction (copy), ReactModule (copy), MorePageSettingsModule (copy), DashModule (copy)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		-- upvalues: p1 (copy)
		return p1 or p2.getSettingsPageType()
	end)
	local UseAppPolicyModuleResult1 = UseAppPolicyModule(function(p2)
		return p2.getAllowPlatformAccountSwitching()
	end)
	local IsUiModeMatch = RobloxAppHooksModule.useUiModeInfo().uiMode == UiMode.TenFoot
	local UseBillingTabVisibilityResult = if FFlagEnableBillingTabHideLogicModule then UseBillingTabVisibilityFunction() else { showBillingTab = true }
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MorePageSettingsModule (upval), UseAppPolicyModuleResult1 (copy)
		return {
			[MorePageSettingsModule.ItemType.Settings_SwitchProfileSection] = UseAppPolicyModuleResult1
		}
	end, { UseAppPolicyModuleResult1 })
	
	return ReactModule.useMemo(function()
		-- upvalues: FFlagEnableBillingTabHideLogicModule (upval), UseBillingTabVisibilityResult (copy), MorePageSettingsModule (upval), UseAppPolicyModuleResult (copy), DashModule (upval), IsUiModeMatch (copy), UseMemoResult (copy)
		return (DashModule.map(DashModule.map(MorePageSettingsModule.GetItemsInPage(UseAppPolicyModuleResult, nil, nil, if FFlagEnableBillingTabHideLogicModule then {
			hideBillingTab = not UseBillingTabVisibilityResult.showBillingTab
		} else nil), function(p2)
			return p2.contents
		end), function(p2)
			-- upvalues: DashModule (upval), IsUiModeMatch (upval), UseMemoResult (upval)
			return DashModule.filter(p2, function(p3): boolean
				-- upvalues: IsUiModeMatch (upval), UseMemoResult (upval)
				return if IsUiModeMatch then UseMemoResult[p3.itemInfo.itemType] ~= false else UseMemoResult[p3.itemType] ~= false
			end)
		end))
	end, {
		UseAppPolicyModuleResult,
		IsUiModeMatch,
		UseMemoResult,
		if FFlagEnableBillingTabHideLogicModule then not UseBillingTabVisibilityResult.showBillingTab else nil
	})
end