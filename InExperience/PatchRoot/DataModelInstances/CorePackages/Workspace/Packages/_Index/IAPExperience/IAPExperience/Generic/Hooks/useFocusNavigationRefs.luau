local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior

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
	-- upvalues: useDefaultFocusBehavior (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactModule (ref)
	local var1, var2 = useDefaultFocusBehavior()
	local var3 = useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p1) }
		}
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref)
		return function(p3)
			-- upvalues: var3 (ref), var2 (ref)
			if type(var3) == "function" then
				var3(p3)
			elseif var3 ~= nil then
				var3.current = p3
			end
			if type(var2) == "function" then
				var2(p3)
				
				return
			elseif var2 ~= nil then
				var2.current = p3
			end
		end
	end, { var3, var2 })
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var1 (ref)
		return function(p3)
			-- upvalues: var5 (ref), var1 (ref)
			if type(var5) == "function" then
				var5(p3)
			elseif var5 ~= nil then
				var5.current = p3
			end
			if type(var1) == "function" then
				var1(p3)
				
				return
			elseif var1 ~= nil then
				var1.current = p3
			end
		end
	end, { var1 })
	local var7 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref), p2 (ref)
		local current = var5.current
		
		if current and not var7.current then
			var7.current = true
			
			if p2 then
				p2(current)
			end
		end
	end, { var5.current, p2 })
	
	return var4, var6
end