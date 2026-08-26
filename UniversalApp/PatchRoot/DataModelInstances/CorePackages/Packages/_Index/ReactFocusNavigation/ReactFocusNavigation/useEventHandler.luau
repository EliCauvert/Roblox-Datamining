local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local useComposedRefModule = require(script.Parent.useComposedRef)
local useEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), useEventLifecycleRefModule (ref), useComposedRefModule (ref)
	local var1 = reactModule.useContext(focusNavigationContextModule)
	
	return useComposedRefModule(useEventLifecycleRefModule(reactModule.useCallback(function(p5)
		-- upvalues: var1 (ref), p1 (ref), p2 (ref), p3 (ref)
		if var1 then
			assert(p5:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects")
			var1:registerEventHandler(p5, p1, p2, p3)
		end
	end, { var1, p1, p2, p3 }), reactModule.useCallback(function(p5)
		-- upvalues: var1 (ref), p1 (ref), p2 (ref), p3 (ref)
		if var1 then
			assert(p5:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects")
			var1:deregisterEventHandler(p5, p1, p2, p3)
		end
	end, { var1, p1, p2, p3 })), p4)
end