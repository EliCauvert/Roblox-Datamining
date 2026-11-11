local Parent = script:FindFirstAncestor("OnPlatformSurveys").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
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

return function(SurfaceIdentifier, p1)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), UseAppFocusRootFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactModule (copy)
	local UseDefaultFocusBehaviorResult = UseDefaultFocusBehaviorFunction()
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = SurfaceIdentifier,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
		}
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseAppFocusRootResult (copy), UseDefaultFocusBehaviorResult (copy)
		return function(Current)
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
	end, { UseAppFocusRootResult, UseDefaultFocusBehaviorResult })
end