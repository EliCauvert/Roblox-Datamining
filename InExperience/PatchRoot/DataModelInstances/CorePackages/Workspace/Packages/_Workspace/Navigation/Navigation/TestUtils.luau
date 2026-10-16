local _ = require(script.Parent.types)

local function _(Key, Params, Routes, IsTransitioning) --[[ Line: 8 | Named "createMockRouteState" ]]
	local config = {
		key = Key,
		routeName = Key,
		params = Params,
		isTransitioning = IsTransitioning
	}
	
	if Routes ~= nil then
		config.routes = Routes
		config.index = #Routes
	end
	return config
end

return {
	createMockStackState = function(Key, Routes) --[[ Line: 27 ]]
		local config = {
			params = nil,
			isTransitioning = false,
			key = Key,
			routeName = Key
		}
		
		if Routes ~= nil then
			config.routes = Routes
			config.index = #Routes
		end
		return config
	end,
	createMockSwitchState = function(Key, Routes) --[[ Line: 31 ]]
		local config = {
			params = nil,
			isTransitioning = nil,
			key = Key,
			routeName = Key
		}
		
		if Routes ~= nil then
			config.routes = Routes
			config.index = #Routes
		end
		return config
	end,
	createMockScreenState = function(Key, Params) --[[ Line: 35 ]]
		return {
			isTransitioning = nil,
			key = Key,
			routeName = Key,
			params = Params
		}
	end,
	createMockNavigationObject = function(State) --[[ Line: 39 ]]
		return {
			state = State,
			dispatch = function(): boolean --[[ Line: 42 ]]
				return true
			end,
			getParam = function(...) --[[ Line: 45 ]] end,
			addListener = function(_, _) --[[ Line: 48 ]]
				return { remove = function() --[[ Line: 49 ]] end }
			end,
			isFocused = function() --[[ Line: 51 ]] end,
			getChildNavigation = function(_) --[[ Line: 52 ]]
				return nil
			end,
			router = {
				getScreenOptions = function(_, _) --[[ Line: 56 ]]
					return {}
				end,
				getStateForAction = function(_, p1) --[[ Line: 59 ]]
					return p1
				end,
				getComponentForRouteName = function(_) --[[ Line: 62 ]]
					return function() --[[ Line: 63 ]]
						return nil
					end
				end,
				getActionCreators = function() --[[ Line: 67 ]]
					return {}
				end,
				childRouters = {}
			},
			_dangerouslyGetParent = function() --[[ Line: 72 ]]
				return nil
			end
		}
	end
}