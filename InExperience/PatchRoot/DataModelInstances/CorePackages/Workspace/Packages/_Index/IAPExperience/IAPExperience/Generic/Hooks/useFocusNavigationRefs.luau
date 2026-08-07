local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior

local function _(p0, p1) --[[ line: 13 | named "mergeRefs" ]]
	return function(p2) --[[ line: 14 ]]
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

return function(p3, p4) --[[ line: 31 | named "useFocusNavigationRefs" ]]
	-- upvalues: useDefaultFocusBehavior (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactModule (ref)
	local var3, var4 = useDefaultFocusBehavior()
	local var5 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p3) }
		}
	})
	local var6 = reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: var5 (ref), var4 (ref)
		return function(p5) --[[ line: 14 ]]
			-- upvalues: var5 (ref), var4 (ref)
			if type(var5) == "function" then
				var5(p5)
			elseif var5 ~= nil then
				var5.current = p5
			end
			if type(var4) == "function" then
				var4(p5)
				
				return
			elseif var4 ~= nil then
				var4.current = p5
			end
		end
	end, { var5, var4 })
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: var7 (ref), var3 (ref)
		return function(p6) --[[ line: 14 ]]
			-- upvalues: var7 (ref), var3 (ref)
			if type(var7) == "function" then
				var7(p6)
			elseif var7 ~= nil then
				var7.current = p6
			end
			if type(var3) == "function" then
				var3(p6)
				
				return
			elseif var3 ~= nil then
				var3.current = p6
			end
		end
	end, { var3 })
	local var9 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: var7 (ref), var9 (ref), p4 (ref)
		local current = var7.current
		
		if current and not var9.current then
			var9.current = true
			
			if p4 then
				p4(current)
			end
		end
	end, { var7.current, p4 })
	
	return var6, var8
end