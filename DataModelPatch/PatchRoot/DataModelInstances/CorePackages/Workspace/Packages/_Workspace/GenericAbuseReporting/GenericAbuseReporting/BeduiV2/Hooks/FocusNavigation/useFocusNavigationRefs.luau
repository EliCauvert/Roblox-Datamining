local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local ComposeRefsModule = require(script.Parent.composeRefs)
local UseScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)
local FFlagAbuseReportV2ScrollNavigationModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportV2ScrollNavigation)

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

return function(SurfaceIdentifier, p1)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), FFlagAbuseReportV2ScrollNavigationModule (copy), UseScrollNavigationBindingsModule (copy), UseAppFocusRootFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactModule (copy), ComposeRefsModule (copy)
	local UseDefaultFocusBehaviorResult = UseDefaultFocusBehaviorFunction()
	local UseScrollNavigationBindingsModuleResult = if FFlagAbuseReportV2ScrollNavigationModule then UseScrollNavigationBindingsModule({ includeDiscreteScroll = false }) else nil
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = SurfaceIdentifier,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
		}
	})
	
	return (ReactModule.useMemo(function()
		-- upvalues: FFlagAbuseReportV2ScrollNavigationModule (upval), ComposeRefsModule (upval), UseAppFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy), UseScrollNavigationBindingsModuleResult (ref)
		return if FFlagAbuseReportV2ScrollNavigationModule then ComposeRefsModule(UseAppFocusRootResult, UseDefaultFocusBehaviorResult, UseScrollNavigationBindingsModuleResult) else function(Current)
			-- upvalues: UseAppFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy)
			if type(UseAppFocusRootResult) == "function" then
				UseAppFocusRootResult(Current)
			elseif UseAppFocusRootResult ~= nil then
				UseAppFocusRootResult.current = Current
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
		UseAppFocusRootResult,
		UseDefaultFocusBehaviorResult,
		if FFlagAbuseReportV2ScrollNavigationModule then UseScrollNavigationBindingsModuleResult else nil
	}))
end