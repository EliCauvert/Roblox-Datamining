local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local appShortcutBarModule = require(appShortcutBar.Components.AppShortcutBar)
local appStickyShortcutBarModule = require(appShortcutBar.Components.AppStickyShortcutBar)
local useAppShortcutBarPropsModule = require(script.Parent.useAppShortcutBarProps)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local fFlagEnableStickyShortcutBarOnAllPlatforms = require(parent.SharedFlags).FFlagEnableStickyShortcutBarOnAllPlatforms

function AppShortcutBarContainer(p1)
	-- upvalues: useAppShortcutBarPropsModule (ref), useAppPolicy (ref), fFlagEnableStickyShortcutBarOnAllPlatforms (ref), reactModule (ref), appStickyShortcutBarModule (ref), cryoModule (ref), appShortcutBarModule (ref)
	local var1 = useAppShortcutBarPropsModule()
	
	return if useAppPolicy(function(p2)
		return p2.getStickyShortcutBarEnabled()
	end) or fFlagEnableStickyShortcutBarOnAllPlatforms then reactModule.createElement(appStickyShortcutBarModule, if fFlagEnableStickyShortcutBarOnAllPlatforms then cryoModule.Dictionary.join(var1, {
		isLeftNavVisible = p1.isLeftNavVisible,
		currentPage = p1.currentPage
	}) else var1) else reactModule.createElement(appShortcutBarModule, var1)
end

return AppShortcutBarContainer