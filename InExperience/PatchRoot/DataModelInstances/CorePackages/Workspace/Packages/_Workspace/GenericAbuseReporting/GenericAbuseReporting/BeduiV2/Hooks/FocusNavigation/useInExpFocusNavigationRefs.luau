local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local composeRefsModule = require(script.Parent.composeRefs)
local useScrollNavigationBindingsModule = require(script.Parent.useScrollNavigationBindings)
local fFlagAbuseReportV2ScrollNavigationModule = require(genericAbuseReporting.Flags.FFlagAbuseReportV2ScrollNavigation)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

local function _(p0, p1)
	return function(p2)
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

return function(p3, p4, p5, p6)
	-- upvalues: useDefaultFocusBehavior (ref), fFlagAbuseReportV2ScrollNavigationModule (ref), useScrollNavigationBindingsModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref), reactModule (ref), composeRefsModule (ref)
	local var8 = useDefaultFocusBehavior()
	local var9 = if fFlagAbuseReportV2ScrollNavigationModule then useScrollNavigationBindingsModule() else nil
	local var10 = useFocusRoot({
		surfaceIdentifier = p3,
		eventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p4) }
		},
		eventMap = t,
		isFocusable = p6 == nil or p6,
		isAutoFocusRoot = p5 == nil or p5
	})
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagAbuseReportV2ScrollNavigationModule (copy), composeRefsModule (copy), var10 (ref), var8 (ref), var9 (write)
		return if fFlagAbuseReportV2ScrollNavigationModule then composeRefsModule(var10, var8, var9) else function(p7)
			-- upvalues: var10 (ref), var8 (ref)
			if type(var10) == "function" then
				var10(p7)
			elseif var10 ~= nil then
				var10.current = p7
			end
			if type(var8) == "function" then
				var8(p7)
				
				return
			elseif var8 ~= nil then
				var8.current = p7
			end
		end
	end, {
		var10,
		var8,
		if fFlagAbuseReportV2ScrollNavigationModule then var9 else nil
	})
end