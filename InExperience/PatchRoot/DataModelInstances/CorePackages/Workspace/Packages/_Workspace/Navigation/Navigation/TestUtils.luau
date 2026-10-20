local _ = require(script.Parent.types)

local function _(Key, Params, Routes, IsTransitioning)
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
	createMockStackState = function(Key, Routes)
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
	createMockSwitchState = function(Key, Routes)
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
	createMockScreenState = function(Key, Params)
		return {
			isTransitioning = nil,
			key = Key,
			routeName = Key,
			params = Params
		}
	end,
	createMockNavigationObject = function(State)
		return {
			state = State,
			dispatch = function(): boolean
				return true
			end,
			getParam = function(...) end,
			addListener = function(_, _)
				return { remove = function() end }
			end,
			isFocused = function() end,
			getChildNavigation = function(_)
				return nil
			end,
			router = {
				getScreenOptions = function(_, _)
					return {}
				end,
				getStateForAction = function(_, p1)
					return p1
				end,
				getComponentForRouteName = function(_)
					return function()
						return nil
					end
				end,
				getActionCreators = function()
					return {}
				end,
				childRouters = {}
			},
			_dangerouslyGetParent = function()
				return nil
			end
		}
	end
}