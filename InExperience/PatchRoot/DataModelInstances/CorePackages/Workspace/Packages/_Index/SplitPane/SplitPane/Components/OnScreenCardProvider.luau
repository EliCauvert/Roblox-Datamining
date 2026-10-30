local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local FFlagNavigationCommandHandle = require(Parent.SharedFlags).FFlagNavigationCommandHandle
local OnScreenStoreModule = require(script.Parent.Parent.Stores.OnScreenStore)
local OnScreenContext = require(Parent.RobloxAppNavigation).OnScreenContext

return function(p1)
	-- upvalues: ReactModule (copy), FFlagNavigationCommandHandle (copy), OnScreenStoreModule (copy), OnScreenContext (copy)
	local Value = p1.value
	local UseRefResult = ReactModule.useRef(nil)
	local Current = UseRefResult.current
	
	if Value == nil or Current == nil or Current.isOnScreen ~= Value.isOnScreen or Current.currentRouteKey ~= Value.currentRouteKey then
		if Value ~= nil then
			UseRefResult.current = Value
		end
	else
		Value = Current
	end
	if FFlagNavigationCommandHandle then
		ReactModule.useEffect(function()
			-- upvalues: Value (ref), OnScreenStoreModule (upval)
			if Value == nil or Value.isOnScreen ~= true or Value.currentRouteKey == nil then
				return function() end
			else
				local CurrentRouteKey = Value.currentRouteKey
				OnScreenStoreModule.setRouteOnScreen(CurrentRouteKey, Value)
				
				return function()
					-- upvalues: OnScreenStoreModule (upval), CurrentRouteKey (copy)
					OnScreenStoreModule.setRouteOnScreen(CurrentRouteKey, nil)
				end
			end
		end, { Value })
	end
	return ReactModule.createElement(OnScreenContext.Provider, { value = Value }, p1.children)
end