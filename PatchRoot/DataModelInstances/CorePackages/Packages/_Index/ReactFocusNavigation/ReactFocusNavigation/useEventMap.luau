-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local useComposedRefModule = require(script.Parent.useComposedRef)
local useEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p0, p1) --[[ line: 12 | named "useEventMap" ]]
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), useEventLifecycleRefModule (ref), useComposedRefModule (ref)
	local var4 = reactModule.useContext(focusNavigationContextModule)
	
	return useComposedRefModule(useEventLifecycleRefModule(reactModule.useCallback(function(p2) --[[ line: 15 ]]
		-- upvalues: var4 (ref), p0 (ref)
		if var4 then
			assert(p2:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects")
			var4:registerEventMap(p2, p0)
		end
	end, { var4, p0 }), reactModule.useCallback(function(p3) --[[ line: 22 ]]
		-- upvalues: var4 (ref), p0 (ref)
		if var4 then
			assert(p3:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects")
			var4:deregisterEventMap(p3, p0)
		end
	end, { var4, p0 })), p1)
end