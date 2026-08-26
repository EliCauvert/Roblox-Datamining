local _ = require(script.Parent.types)

local function _(p1, p2, p3, p4)
	local t = {
		key = p1,
		routeName = p1,
		params = p2,
		isTransitioning = p4
	}
	
	if p3 ~= nil then
		t.routes = p3
		t.index = #p3
	end
	return t
end

return {
	createMockStackState = function(p1, p2)
		local t = {
			params = nil,
			isTransitioning = false,
			key = p1,
			routeName = p1
		}
		
		if p2 ~= nil then
			t.routes = p2
			t.index = #p2
		end
		return t
	end,
	createMockSwitchState = function(p1, p2)
		local t = {
			params = nil,
			isTransitioning = nil,
			key = p1,
			routeName = p1
		}
		
		if p2 ~= nil then
			t.routes = p2
			t.index = #p2
		end
		return t
	end,
	createMockScreenState = function(p1, p2)
		return {
			isTransitioning = nil,
			key = p1,
			routeName = p1,
			params = p2
		}
	end,
	createMockNavigationObject = function(p1)
		return {
			state = p1,
			dispatch = function()
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
				getStateForAction = function(_, p2)
					return p2
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