local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local hooksModule = require(appShortcutBar.Hooks)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local fFlagGuacStickyShortcutBarEnabled = require(parent.SharedFlags).FFlagGuacStickyShortcutBarEnabled

return function(p0)
	-- upvalues: hooksModule (ref), fFlagGuacStickyShortcutBarEnabled (ref), useAppPolicy (ref), reactModule (ref)
	local var3 = hooksModule.useAppShortcutBarHeight()
	local var4 = (if fFlagGuacStickyShortcutBarEnabled then useAppPolicy(function(p1)
		return p1.getStickyShortcutBarEnabled()
	end) else hooksModule.useIsStickyShortcutBarEnabled()) and hooksModule.useShortcutBarVisible()
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var4 (ref), var3 (ref)
		if p0.onHeightChanged then
			p0.onHeightChanged(if var4 then var3 else 0)
		end
	end, { var4, var3, p0.onHeightChanged })
	
	return nil
end