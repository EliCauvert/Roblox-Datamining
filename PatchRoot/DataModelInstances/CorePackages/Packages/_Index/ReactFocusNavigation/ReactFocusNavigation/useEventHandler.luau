-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local useComposedRefModule = require(script.Parent.useComposedRef)
local useEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p0, p1, p2, p3) --[[ line: 14 | named "useEventHandler" ]]
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), useEventLifecycleRefModule (ref), useComposedRefModule (ref)
	local var4 = reactModule.useContext(focusNavigationContextModule)
	
	return useComposedRefModule(useEventLifecycleRefModule(reactModule.useCallback(function(p4) --[[ line: 17 ]]
		-- upvalues: var4 (ref), p0 (ref), p1 (ref), p2 (ref)
		if var4 then
			assert(p4:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects")
			var4:registerEventHandler(p4, p0, p1, p2)
		end
	end, { var4, p0, p1, p2 }), reactModule.useCallback(function(p5) --[[ line: 24 ]]
		-- upvalues: var4 (ref), p0 (ref), p1 (ref), p2 (ref)
		if var4 then
			assert(p5:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects")
			var4:deregisterEventHandler(p5, p0, p1, p2)
		end
	end, { var4, p0, p1, p2 })), p3)
end