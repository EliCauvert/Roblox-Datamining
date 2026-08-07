local _ = require(script.Parent.types)

local function _(p0, p1, p2, p3) --[[ line: 8 | named "createMockRouteState" ]]
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
	createMockStackState = function(p4, p5) --[[ line: 27 ]]
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
	createMockSwitchState = function(p6, p7) --[[ line: 31 ]]
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
	createMockScreenState = function(p8, p9) --[[ line: 35 ]]
		return {
			isTransitioning = nil,
			key = p8,
			routeName = p8,
			params = p9
		}
	end,
	createMockNavigationObject = function(p10) --[[ line: 39 ]]
		return {
			state = p10,
			dispatch = function() --[[ line: 42 ]]
				return true
			end,
			getParam = function(...) --[[ line: 45 ]] end,
			addListener = function(_, _) --[[ line: 48 ]]
				return { remove = function() --[[ line: 49 ]] end }
			end,
			isFocused = function() --[[ line: 51 ]] end,
			getChildNavigation = function(_) --[[ line: 52 ]]
				return nil
			end,
			router = {
				getScreenOptions = function(_, _) --[[ line: 56 ]]
					return {}
				end,
				getStateForAction = function(_, p11) --[[ line: 59 ]]
					return p11
				end,
				getComponentForRouteName = function(_) --[[ line: 62 ]]
					return function() --[[ line: 63 ]]
						return nil
					end
				end,
				getActionCreators = function() --[[ line: 67 ]]
					return {}
				end,
				childRouters = {}
			},
			_dangerouslyGetParent = function() --[[ line: 72 ]]
				return nil
			end
		}
	end
}