local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigation)
local focusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local useComposedRefModule = require(script.Parent.useComposedRef)
local useEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p0, p1) --[[ line: 13 | named "useContainerFocusBehavior" ]]
	-- upvalues: reactModule (ref), focusNavigationContextModule (ref), useEventLifecycleRefModule (ref), useComposedRefModule (ref)
	local var4 = reactModule.useContext(focusNavigationContextModule)
	
	return useComposedRefModule(useEventLifecycleRefModule(reactModule.useCallback(function(p2) --[[ line: 16 ]]
		-- upvalues: var4 (ref), p0 (ref)
		if var4 then
			assert(p2:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects")
			var4:registerFocusBehavior(p2, p0)
		end
	end, { var4, p0 }), reactModule.useCallback(function(p3) --[[ line: 23 ]]
		-- upvalues: var4 (ref), p0 (ref)
		if var4 then
			assert(p3:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects")
			var4:deregisterFocusBehavior(p3, p0)
		end
	end, { var4, p0 })), p1)
end