local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigation)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local UseComposedRefModule = require(script.Parent.useComposedRef)
local UseEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p1, p2) --[[ Line: 12 | Named "useEventHandlerMap" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy), UseEventLifecycleRefModule (copy), UseComposedRefModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	
	return UseComposedRefModule(UseEventLifecycleRefModule(ReactModule.useCallback(function(Gui) --[[ Line: 15 ]]
		-- upvalues: UseContextResult (copy), p1 (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "Event handler maps can only be applied to GuiObjects")
			UseContextResult:registerEventHandlers(Gui, p1)
		end
	end, { UseContextResult, p1 }), (ReactModule.useCallback(function(Gui) --[[ Line: 22 ]]
		-- upvalues: UseContextResult (copy), p1 (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "Event handler maps can only be applied to GuiObjects")
			UseContextResult:deregisterEventHandlers(Gui, p1)
		end
	end, { UseContextResult, p1 }))), p2)
end