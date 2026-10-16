local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local AppShortcutBarModule = require(AppShortcutBar.Components.AppShortcutBar)
local AppStickyShortcutBarModule = require(AppShortcutBar.Components.AppStickyShortcutBar)
local UseAppShortcutBarPropsModule = require(script.Parent.useAppShortcutBarProps)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local FFlagEnableStickyShortcutBarOnAllPlatforms = require(Parent.SharedFlags).FFlagEnableStickyShortcutBarOnAllPlatforms

function AppShortcutBarContainer(p1) --[[ Line: 18 ]]
	-- upvalues: UseAppShortcutBarPropsModule (copy), UseAppPolicyFunction (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (copy), ReactModule (copy), AppStickyShortcutBarModule (copy), CryoModule (copy), AppShortcutBarModule (copy)
	local UseAppShortcutBarPropsModuleResult = UseAppShortcutBarPropsModule()
	
	return if UseAppPolicyFunction(function(p2) --[[ Line: 21 ]]
		return p2.getStickyShortcutBarEnabled()
	end) or FFlagEnableStickyShortcutBarOnAllPlatforms then ReactModule.createElement(AppStickyShortcutBarModule, if FFlagEnableStickyShortcutBarOnAllPlatforms then CryoModule.Dictionary.join(UseAppShortcutBarPropsModuleResult, {
		isLeftNavVisible = p1.isLeftNavVisible,
		currentPage = p1.currentPage
	}) else UseAppShortcutBarPropsModuleResult) else ReactModule.createElement(AppShortcutBarModule, UseAppShortcutBarPropsModuleResult)
end

return AppShortcutBarContainer