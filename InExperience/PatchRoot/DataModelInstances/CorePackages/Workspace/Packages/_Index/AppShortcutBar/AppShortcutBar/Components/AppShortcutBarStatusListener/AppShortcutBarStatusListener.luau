local AppShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local Parent = AppShortcutBar.Parent
local ReactModule = require(Parent.React)
local HooksModule = require(AppShortcutBar.Hooks)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy

return function(p1)
	-- upvalues: HooksModule (copy), UseAppPolicyFunction (copy), ReactModule (copy)
	local UseAppShortcutBarHeightResult = HooksModule.useAppShortcutBarHeight()
	local UseShortcutBarVisibleResult = HooksModule.useShortcutBarVisible()
	local UseShortcutBarVisibleResult1 = UseAppPolicyFunction(function(p2)
		return p2.getStickyShortcutBarEnabled()
	end) and UseShortcutBarVisibleResult
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseShortcutBarVisibleResult1 (copy), UseAppShortcutBarHeightResult (copy)
		if p1.onHeightChanged then
			p1.onHeightChanged(if UseShortcutBarVisibleResult1 then UseAppShortcutBarHeightResult else 0)
		end
	end, {
		UseShortcutBarVisibleResult1,
		UseAppShortcutBarHeightResult,
		p1.onHeightChanged
	})
	
	return nil
end