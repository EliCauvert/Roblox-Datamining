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

local function _(p1, p2)
	return function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		if type(p1) == "function" then
			p1(p3)
		elseif p1 ~= nil then
			p1.current = p3
		end
		if type(p2) == "function" then
			p2(p3)
			
			return
		elseif p2 ~= nil then
			p2.current = p3
		end
	end
end

return function(p1, p2)
	-- upvalues: useDefaultFocusBehavior (ref), fFlagAbuseReportV2ScrollNavigationModule (ref), useScrollNavigationBindingsModule (ref), useAppFocusRoot (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactModule (ref), composeRefsModule (ref)
	local var1 = useDefaultFocusBehavior()
	local var2 = if fFlagAbuseReportV2ScrollNavigationModule then useScrollNavigationBindingsModule({ includeDiscreteScroll = false }) else nil
	local var3 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = p1,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p2) }
		}
	})
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagAbuseReportV2ScrollNavigationModule (copy), composeRefsModule (copy), var3 (ref), var1 (ref), var2 (write)
		return if fFlagAbuseReportV2ScrollNavigationModule then composeRefsModule(var3, var1, var2) else function(p3)
			-- upvalues: var3 (ref), var1 (ref)
			if type(var3) == "function" then
				var3(p3)
			elseif var3 ~= nil then
				var3.current = p3
			end
			if type(var1) == "function" then
				var1(p3)
				
				return
			elseif var1 ~= nil then
				var1.current = p3
			end
		end
	end, {
		var3,
		var1,
		if fFlagAbuseReportV2ScrollNavigationModule then var2 else nil
	})
end