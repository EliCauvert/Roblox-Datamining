local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local composeRefsModule = require(script.Parent.composeRefs)
local useScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1, p2, p3, p4)
	-- upvalues: useDefaultFocusBehavior (ref), useScrollNavigationBindingsModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref), reactModule (ref), composeRefsModule (ref)
	local var1 = useDefaultFocusBehavior()
	local var2 = useScrollNavigationBindingsModule()
	local var3 = useFocusRoot({
		surfaceIdentifier = p1,
		eventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p2) }
		},
		eventMap = t,
		isFocusable = p4 == nil or p4,
		isAutoFocusRoot = p3 == nil or p3
	})
	
	return reactModule.useMemo(function()
		-- upvalues: composeRefsModule (copy), var3 (ref), var1 (ref), var2 (ref)
		return composeRefsModule(var3, var1, var2)
	end, { var3, var1, var2 })
end