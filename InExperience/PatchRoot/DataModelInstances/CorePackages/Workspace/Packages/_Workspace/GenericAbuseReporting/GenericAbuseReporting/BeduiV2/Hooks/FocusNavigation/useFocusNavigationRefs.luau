local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local composeRefsModule = require(script.Parent.composeRefs)
local useScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)
local fFlagAbuseReportV2ScrollNavigationModule = require(genericAbuseReporting.Flags.FFlagAbuseReportV2ScrollNavigation)

local function _(p0, p1) --[[ line: 22 | named "mergeRefs" ]]
	return function(p2) --[[ line: 23 ]]
		-- upvalues: p0 (ref), p1 (ref)
		if type(p0) == "function" then
			p0(p2)
		elseif p0 ~= nil then
			p0.current = p2
		end
		if type(p1) == "function" then
			p1(p2)
			
			return
		elseif p1 ~= nil then
			p1.current = p2
		end
	end
end

return function(p3, p4) --[[ line: 49 | named "useFocusNavigationRefs" ]]
	-- upvalues: useDefaultFocusBehavior (ref), fFlagAbuseReportV2ScrollNavigationModule (ref), useScrollNavigationBindingsModule (ref), useAppFocusRoot (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactModule (ref), composeRefsModule (ref)
	local var7 = useDefaultFocusBehavior()
	local var8 = if fFlagAbuseReportV2ScrollNavigationModule then useScrollNavigationBindingsModule({ includeDiscreteScroll = false }) else nil
	local var9 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = p3,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p4) }
		}
	})
	
	return reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: fFlagAbuseReportV2ScrollNavigationModule (copy), composeRefsModule (copy), var9 (ref), var7 (ref), var8 (write)
		return if fFlagAbuseReportV2ScrollNavigationModule then composeRefsModule(var9, var7, var8) else function(p5) --[[ line: 23 ]]
			-- upvalues: var9 (ref), var7 (ref)
			if type(var9) == "function" then
				var9(p5)
			elseif var9 ~= nil then
				var9.current = p5
			end
			if type(var7) == "function" then
				var7(p5)
				
				return
			elseif var7 ~= nil then
				var7.current = p5
			end
		end
	end, {
		var9,
		var7,
		if fFlagAbuseReportV2ScrollNavigationModule then var8 else nil
	})
end