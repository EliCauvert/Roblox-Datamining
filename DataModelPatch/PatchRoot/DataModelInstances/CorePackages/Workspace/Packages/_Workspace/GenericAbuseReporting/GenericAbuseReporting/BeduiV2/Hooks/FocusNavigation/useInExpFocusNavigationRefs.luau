local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local ComposeRefsModule = require(script.Parent.composeRefs)
local UseScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)
local FFlagAbuseReportV2ScrollNavigationModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportV2ScrollNavigation)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function _(p1, p2)
	return function(Current)
		-- upvalues: p1 (copy), p2 (copy)
		if type(p1) == "function" then
			p1(Current)
		elseif p1 ~= nil then
			p1.current = Current
		end
		if type(p2) == "function" then
			p2(Current)
			
			return
		end
		if p2 ~= nil then
			p2.current = Current
		end
	end
end

return function(SurfaceIdentifier, p1, p2, p3)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), FFlagAbuseReportV2ScrollNavigationModule (copy), UseScrollNavigationBindingsModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), EventMap (copy), ReactModule (copy), ComposeRefsModule (copy)
	local UseDefaultFocusBehaviorResult = UseDefaultFocusBehaviorFunction()
	local UseScrollNavigationBindingsModuleResult = if FFlagAbuseReportV2ScrollNavigationModule then UseScrollNavigationBindingsModule() else nil
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
		-- upvalues: FFlagAbuseReportV2ScrollNavigationModule (upval), ComposeRefsModule (upval), UseFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy), UseScrollNavigationBindingsModuleResult (ref)
		return if FFlagAbuseReportV2ScrollNavigationModule then ComposeRefsModule(UseFocusRootResult, UseDefaultFocusBehaviorResult, UseScrollNavigationBindingsModuleResult) else function(Current)
			-- upvalues: UseFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy)
			if type(UseFocusRootResult) == "function" then
				UseFocusRootResult(Current)
			elseif UseFocusRootResult ~= nil then
				UseFocusRootResult.current = Current
			end
			if type(UseDefaultFocusBehaviorResult) == "function" then
				UseDefaultFocusBehaviorResult(Current)
				
				return
			end
			if UseDefaultFocusBehaviorResult ~= nil then
				UseDefaultFocusBehaviorResult.current = Current
			end
		end
	end, {
		UseFocusRootResult,
		UseDefaultFocusBehaviorResult,
		if FFlagAbuseReportV2ScrollNavigationModule then UseScrollNavigationBindingsModuleResult else nil
	}))
end