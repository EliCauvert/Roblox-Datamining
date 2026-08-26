local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local useComposedRefModule = require(script.Parent.useComposedRef)
local useEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p1, p2)
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), useEventLifecycleRefModule (ref), useComposedRefModule (ref)
	local var1 = reactModule.useContext(focusNavigationContextModule)
	
	return useComposedRefModule(useEventLifecycleRefModule(reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), p1 (ref)
		if var1 then
			assert(p3:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects")
			var1:registerEventMap(p3, p1)
		end
	end, { var1, p1 }), reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), p1 (ref)
		if var1 then
			assert(p3:IsA("GuiObject"), "EventMaps can only be mapped to GuiObjects")
			var1:deregisterEventMap(p3, p1)
		end
	end, { var1, p1 })), p2)
end