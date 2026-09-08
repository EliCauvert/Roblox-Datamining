local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local composeRefsModule = require(script.Parent.composeRefs)
local useScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)

return function(p1, p2)
	-- upvalues: useDefaultFocusBehavior (ref), useScrollNavigationBindingsModule (ref), useAppFocusRoot (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactModule (ref), composeRefsModule (ref)
	local var1 = useDefaultFocusBehavior()
	local var2 = useScrollNavigationBindingsModule({ includeDiscreteScroll = false })
	local var3 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = p1,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p2) }
		}
	})
	
	return reactModule.useMemo(function()
		-- upvalues: composeRefsModule (copy), var3 (ref), var1 (ref), var2 (ref)
		return composeRefsModule(var3, var1, var2)
	end, { var3, var1, var2 })
end