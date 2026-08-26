local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local hooksModule = require(appShortcutBar.Hooks)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local fFlagGuacStickyShortcutBarEnabled = require(parent.SharedFlags).FFlagGuacStickyShortcutBarEnabled

return function(p1)
	-- upvalues: hooksModule (ref), fFlagGuacStickyShortcutBarEnabled (ref), useAppPolicy (ref), reactModule (ref)
	local var1 = hooksModule.useAppShortcutBarHeight()
	local var2 = (if fFlagGuacStickyShortcutBarEnabled then useAppPolicy(function(p2)
		return p2.getStickyShortcutBarEnabled()
	end) else hooksModule.useIsStickyShortcutBarEnabled()) and hooksModule.useShortcutBarVisible()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref)
		if p1.onHeightChanged then
			p1.onHeightChanged(if var2 then var1 else 0)
		end
	end, { var2, var1, p1.onHeightChanged })
	
	return nil
end