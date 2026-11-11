local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local RoduxModule = require(Parent.Dev.Rodux)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local MockProvidersFunction = require(Parent.Dev.UnitTestHelpers).mockProviders

local function FocusNavigationWrapper(p1)
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	
	return ReactModule.createElement("Frame", {
		ref = ReactFocusNavigationModule.useEventHandlerMap(p1.eventHandlerMap, (ReactFocusNavigationModule.useEventMap(p1.eventMap, (ReactModule.useCallback(function(p2)
			-- upvalues: UseFocusGuiObjectResult (copy)
			if p2 then
				UseFocusGuiObjectResult(p2, false)
			end
		end, { UseFocusGuiObjectResult })))))
	}, p1.children)
end

return function(p1, p2)
	-- upvalues: RoduxModule (copy), ReactModule (copy), ReactFocusNavigationModule (copy), FocusNavigationWrapper (copy), MockProvidersFunction (copy)
	local NewResult = RoduxModule.Store.new(function(p3)
		return p3
	end, p2 or {})
	
	return function(p3)
		-- upvalues: ReactModule (upval), ReactFocusNavigationModule (upval), p1 (copy), FocusNavigationWrapper (upval), MockProvidersFunction (upval), NewResult (copy)
		return MockProvidersFunction(ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = p1.focusNavigation }, ReactModule.createElement(FocusNavigationWrapper, {
			eventMap = p1.eventMap or {},
			eventHandlerMap = p1.eventHandlerMap or {}
		}, p3.children)), { store = NewResult })
	end
end