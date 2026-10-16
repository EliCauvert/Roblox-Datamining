local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigation)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local UseComposedRefModule = require(script.Parent.useComposedRef)
local UseEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p1, p2, p3, p4) --[[ Line: 14 | Named "useEventHandler" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy), UseEventLifecycleRefModule (copy), UseComposedRefModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	
	return UseComposedRefModule(UseEventLifecycleRefModule(ReactModule.useCallback(function(Gui) --[[ Line: 17 ]]
		-- upvalues: UseContextResult (copy), p1 (copy), p2 (copy), p3 (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects")
			UseContextResult:registerEventHandler(Gui, p1, p2, p3)
		end
	end, { UseContextResult, p1, p2, p3 }), (ReactModule.useCallback(function(Gui) --[[ Line: 24 ]]
		-- upvalues: UseContextResult (copy), p1 (copy), p2 (copy), p3 (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "Event handlers can only be applied to GuiObjects")
			UseContextResult:deregisterEventHandler(Gui, p1, p2, p3)
		end
	end, { UseContextResult, p1, p2, p3 }))), p4)
end