local parent = script.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local eventsModule = require(parent.Events)
local getNavigationActionCreatorsModule = require(parent.routers.getNavigationActionCreators)
local getChildNavigationModule = require(parent.getChildNavigation)
local getChildrenNavigationCacheModule = require(parent.getChildrenNavigationCache)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: getChildrenNavigationCacheModule (ref), getChildNavigationModule (ref), eventsModule (ref), object (ref), getNavigationActionCreatorsModule (ref)
	local actionCreators = p1.getActionCreators(p2, nil)
	local t = {
		actions = actionCreators,
		router = p1,
		state = p2,
		dispatch = p3,
		getScreenProps = p5,
		_dangerouslyGetParent = function()
			return nil
		end,
		isFirstRouteInParent = function()
			return true
		end,
		_childrenNavigation = getChildrenNavigationCacheModule(p6())
	}
	
	function t.getChildNavigation(p7)
		-- upvalues: getChildNavigationModule (copy), t (ref), p6 (ref)
		return getChildNavigationModule(t, p7, p6)
	end
	
	function t.isFocused(p7)
		-- upvalues: p6 (ref)
		local state = p6().state
		
		return if p7 ~= nil then state.routes[state.index].key == p7 else true
	end
	
	function t.addListener(p7, p8)
		-- upvalues: eventsModule (copy), p4 (ref)
		if p7 == eventsModule.Action then
			p4[p8] = true
			
			return {
				remove = function()
					-- upvalues: p4 (copy), p8 (ref)
					p4[p8] = nil
				end
			}
		end
		return { remove = function() end }
	end
	
	local var1 = object.assign(getNavigationActionCreatorsModule(t.state), actionCreators)
	
	for i, v in var1 do
		t[i] = function(...)
			-- upvalues: t (ref), var1 (ref), i (ref)
			t.dispatch(var1[i](...))
		end
	end
	return t
end