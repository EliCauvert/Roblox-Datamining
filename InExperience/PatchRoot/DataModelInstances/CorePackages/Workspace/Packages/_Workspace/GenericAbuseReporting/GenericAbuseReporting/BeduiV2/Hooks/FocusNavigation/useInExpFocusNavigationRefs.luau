local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local ComposeRefsModule = require(script.Parent.composeRefs)
local UseScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(SurfaceIdentifier, p1, p2, p3)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), UseScrollNavigationBindingsModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), EventMap (copy), ReactModule (copy), ComposeRefsModule (copy)
	local UseDefaultFocusBehaviorResult = UseDefaultFocusBehaviorFunction()
	local UseScrollNavigationBindingsModuleResult = UseScrollNavigationBindingsModule()
	local UseFocusRootResult = UseFocusRootFunction({
		surfaceIdentifier = SurfaceIdentifier,
		eventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
		},
		eventMap = EventMap,
		isFocusable = p3 == nil or p3,
		isAutoFocusRoot = p2 == nil or p2
	})
	
	return (ReactModule.useMemo(function()
		-- upvalues: ComposeRefsModule (upval), UseFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy), UseScrollNavigationBindingsModuleResult (copy)
		return ComposeRefsModule(UseFocusRootResult, UseDefaultFocusBehaviorResult, UseScrollNavigationBindingsModuleResult)
	end, {
		UseFocusRootResult,
		UseDefaultFocusBehaviorResult,
		UseScrollNavigationBindingsModuleResult
	}))
end