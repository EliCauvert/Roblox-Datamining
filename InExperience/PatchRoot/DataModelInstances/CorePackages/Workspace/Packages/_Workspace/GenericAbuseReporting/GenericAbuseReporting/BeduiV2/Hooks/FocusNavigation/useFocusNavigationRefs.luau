local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local ComposeRefsModule = require(script.Parent.composeRefs)
local UseScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)

return function(SurfaceIdentifier, p1) --[[ Line: 26 | Named "useFocusNavigationRefs" ]]
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), UseScrollNavigationBindingsModule (copy), UseAppFocusRootFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactModule (copy), ComposeRefsModule (copy)
	local UseDefaultFocusBehaviorResult = UseDefaultFocusBehaviorFunction()
	local UseScrollNavigationBindingsModuleResult = UseScrollNavigationBindingsModule({ includeDiscreteScroll = false })
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = SurfaceIdentifier,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
		}
	})
	
	return (ReactModule.useMemo(function() --[[ Line: 41 ]]
		-- upvalues: ComposeRefsModule (upval), UseAppFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy), UseScrollNavigationBindingsModuleResult (copy)
		return ComposeRefsModule(UseAppFocusRootResult, UseDefaultFocusBehaviorResult, UseScrollNavigationBindingsModuleResult)
	end, {
		UseAppFocusRootResult,
		UseDefaultFocusBehaviorResult,
		UseScrollNavigationBindingsModuleResult
	}))
end