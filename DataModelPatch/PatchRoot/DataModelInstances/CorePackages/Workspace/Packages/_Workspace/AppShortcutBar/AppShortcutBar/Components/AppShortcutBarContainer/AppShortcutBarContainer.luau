local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local AppShortcutBarModule = require(AppShortcutBar.Components.AppShortcutBar)
local AppStickyShortcutBarModule = require(AppShortcutBar.Components.AppStickyShortcutBar)
local UseAppShortcutBarPropsModule = require(script.Parent.useAppShortcutBarProps)
local UseIsStickyShortcutBarEnabledFunction = require(AppShortcutBar.Hooks).useIsStickyShortcutBarEnabled
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppEnableStickyShortcutBar = SharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar
local FFlagGuacStickyShortcutBarEnabled = SharedFlagsModule.FFlagGuacStickyShortcutBarEnabled

function AppShortcutBarContainer()
	-- upvalues: UseAppShortcutBarPropsModule (copy), FFlagGuacStickyShortcutBarEnabled (copy), UseAppPolicyFunction (copy), FFlagLuaAppEnableStickyShortcutBar (copy), UseIsStickyShortcutBarEnabledFunction (copy), ReactModule (copy), AppStickyShortcutBarModule (copy), AppShortcutBarModule (copy)
	local UseAppShortcutBarPropsModuleResult = UseAppShortcutBarPropsModule()
	local UseAppPolicyResult = if FFlagGuacStickyShortcutBarEnabled then UseAppPolicyFunction(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end) elseif FFlagLuaAppEnableStickyShortcutBar then UseIsStickyShortcutBarEnabledFunction() else nil
	
	if (FFlagLuaAppEnableStickyShortcutBar or FFlagGuacStickyShortcutBarEnabled) and UseAppPolicyResult then
		return ReactModule.createElement(AppStickyShortcutBarModule, UseAppShortcutBarPropsModuleResult)
	else
		return ReactModule.createElement(AppShortcutBarModule, UseAppShortcutBarPropsModuleResult)
	end
end

return AppShortcutBarContainer