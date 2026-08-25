local _ = require(script.Parent.types)

local function _(p0, p1, p2, p3)
	local t = {
		key = p0,
		routeName = p0,
		params = p1,
		isTransitioning = p3
	}
	
	if p2 ~= nil then
		t.routes = p2
		t.index = #p2
	end
	return t
end

return {
	createMockStackState = function(p4, p5)
		local t = {
			params = nil,
			isTransitioning = false,
			key = p4,
			routeName = p4
		}
		
		if p5 ~= nil then
			t.routes = p5
			t.index = #p5
		end
		return t
	end,
	createMockSwitchState = function(p6, p7)
		local t = {
			params = nil,
			isTransitioning = nil,
			key = p6,
			routeName = p6
		}
		
		if p7 ~= nil then
			t.routes = p7
			t.index = #p7
		end
		return t
	end,
	createMockScreenState = function(p8, p9)
		return {
			isTransitioning = nil,
			key = p8,
			routeName = p8,
			params = p9
		}
	end,
	createMockNavigationObject = function(p10)
		return {
			state = p10,
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
				getStateForAction = function(_, p11)
					return p11
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