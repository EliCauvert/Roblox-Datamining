local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local appShortcutBarModule = require(appShortcutBar.Components.AppShortcutBar)
local appStickyShortcutBarModule = require(appShortcutBar.Components.AppStickyShortcutBar)
local useAppShortcutBarPropsModule = require(script.Parent.useAppShortcutBarProps)
local useIsStickyShortcutBarEnabled = require(appShortcutBar.Hooks).useIsStickyShortcutBarEnabled
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppEnableStickyShortcutBar = sharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar
local fFlagGuacStickyShortcutBarEnabled = sharedFlagsModule.FFlagGuacStickyShortcutBarEnabled

function AppShortcutBarContainer()
	-- upvalues: useAppShortcutBarPropsModule (ref), fFlagGuacStickyShortcutBarEnabled (ref), useAppPolicy (ref), fFlagLuaAppEnableStickyShortcutBar (ref), useIsStickyShortcutBarEnabled (ref), reactModule (ref), appStickyShortcutBarModule (ref), appShortcutBarModule (ref)
	local var6 = useAppShortcutBarPropsModule()
	
	return if (fFlagLuaAppEnableStickyShortcutBar or fFlagGuacStickyShortcutBarEnabled) and (if fFlagGuacStickyShortcutBarEnabled then useAppPolicy(function(p0)
		return p0.getStickyShortcutBarEnabled()
	end) elseif fFlagLuaAppEnableStickyShortcutBar then useIsStickyShortcutBarEnabled() else nil) then reactModule.createElement(appStickyShortcutBarModule, var6) else reactModule.createElement(appShortcutBarModule, var6)
end

return AppShortcutBarContainer