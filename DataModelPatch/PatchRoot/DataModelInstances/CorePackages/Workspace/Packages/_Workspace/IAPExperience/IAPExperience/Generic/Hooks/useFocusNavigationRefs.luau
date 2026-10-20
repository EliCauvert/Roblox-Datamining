local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior

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

return function(p1, Callback)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactModule (copy)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction()
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
		}
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseFocusRootResult (copy), UseDefaultFocusBehaviorResult2 (copy)
		return function(Current)
			-- upvalues: UseFocusRootResult (copy), UseDefaultFocusBehaviorResult2 (copy)
			if type(UseFocusRootResult) == "function" then
				UseFocusRootResult(Current)
			elseif UseFocusRootResult ~= nil then
				UseFocusRootResult.current = Current
			end
			if type(UseDefaultFocusBehaviorResult2) == "function" then
				UseDefaultFocusBehaviorResult2(Current)
				
				return
			end
			if UseDefaultFocusBehaviorResult2 ~= nil then
				UseDefaultFocusBehaviorResult2.current = Current
			end
		end
	end, { UseFocusRootResult, UseDefaultFocusBehaviorResult2 })
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), UseDefaultFocusBehaviorResult (copy)
		return function(Current)
			-- upvalues: UseRefResult (copy), UseDefaultFocusBehaviorResult (copy)
			if type(UseRefResult) == "function" then
				UseRefResult(Current)
			elseif UseRefResult ~= nil then
				UseRefResult.current = Current
			end
			if type(UseDefaultFocusBehaviorResult) == "function" then
				UseDefaultFocusBehaviorResult(Current)
				
				return
			end
			if UseDefaultFocusBehaviorResult ~= nil then
				UseDefaultFocusBehaviorResult.current = Current
			end
		end
	end, { UseDefaultFocusBehaviorResult })
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), Callback (copy)
		local Current = UseRefResult.current
		
		if Current and not UseRefResult1.current then
			UseRefResult1.current = true
			
			if Callback then
				Callback(Current)
			end
		end
	end, { UseRefResult.current, Callback })
	
	return UseMemoResult, UseMemoResult1
end