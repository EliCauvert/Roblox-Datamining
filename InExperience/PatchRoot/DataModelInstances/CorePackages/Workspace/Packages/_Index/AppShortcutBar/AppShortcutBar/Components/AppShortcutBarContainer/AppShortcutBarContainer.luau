local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local appShortcutBarModule = require(appShortcutBar.Components.AppShortcutBar)
local appStickyShortcutBarModule = require(appShortcutBar.Components.AppStickyShortcutBar)
local useAppShortcutBarPropsModule = require(script.Parent.useAppShortcutBarProps)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy

function AppShortcutBarContainer()
	-- upvalues: useAppShortcutBarPropsModule (ref), useAppPolicy (ref), reactModule (ref), appStickyShortcutBarModule (ref), appShortcutBarModule (ref)
	local var1 = useAppShortcutBarPropsModule()
	
	return if useAppPolicy(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end) then reactModule.createElement(appStickyShortcutBarModule, var1) else reactModule.createElement(appShortcutBarModule, var1)
end

return AppShortcutBarContainer