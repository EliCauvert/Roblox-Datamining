local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigation)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)
local UseComposedRefModule = require(script.Parent.useComposedRef)
local UseEventLifecycleRefModule = require(script.Parent.useEventLifecycleRef)

return function(p1, p2) --[[ Line: 13 | Named "useContainerFocusBehavior" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy), UseEventLifecycleRefModule (copy), UseComposedRefModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	
	return UseComposedRefModule(UseEventLifecycleRefModule(ReactModule.useCallback(function(Gui) --[[ Line: 16 ]]
		-- upvalues: UseContextResult (copy), p1 (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects")
			UseContextResult:registerFocusBehavior(Gui, p1)
		end
	end, { UseContextResult, p1 }), (ReactModule.useCallback(function(Gui) --[[ Line: 23 ]]
		-- upvalues: UseContextResult (copy), p1 (copy)
		if UseContextResult then
			assert(Gui:IsA("GuiObject"), "FocusBehaviors can only be applied to GuiObjects")
			UseContextResult:deregisterFocusBehavior(Gui, p1)
		end
	end, { UseContextResult, p1 }))), p2)
end