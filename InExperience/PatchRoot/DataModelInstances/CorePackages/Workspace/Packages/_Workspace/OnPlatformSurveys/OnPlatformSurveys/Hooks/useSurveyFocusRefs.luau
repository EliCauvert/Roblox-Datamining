local parent = script:FindFirstAncestor("OnPlatformSurveys").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior

local function _(p0, p1) --[[ line: 21 | named "mergeRefs" ]]
	return function(p2) --[[ line: 22 ]]
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

return function(p3, p4) --[[ line: 37 | named "useSurveyFocusRefs" ]]
	-- upvalues: useDefaultFocusBehavior (ref), useAppFocusRoot (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactModule (ref)
	local var3 = useDefaultFocusBehavior()
	local var4 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = p3,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p4) }
		}
	})
	
	return reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: var4 (ref), var3 (ref)
		return function(p5) --[[ line: 22 ]]
			-- upvalues: var4 (ref), var3 (ref)
			if type(var4) == "function" then
				var4(p5)
			elseif var4 ~= nil then
				var4.current = p5
			end
			if type(var3) == "function" then
				var3(p5)
				
				return
			elseif var3 ~= nil then
				var3.current = p5
			end
		end
	end, { var4, var3 })
end