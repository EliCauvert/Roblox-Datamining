-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local parent = script.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local eventsModule = require(parent.Events)
local getNavigationActionCreatorsModule = require(parent.routers.getNavigationActionCreators)
local getChildNavigationModule = require(parent.getChildNavigation)
local getChildrenNavigationCacheModule = require(parent.getChildrenNavigationCache)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 13 ]]
	-- upvalues: getChildrenNavigationCacheModule (ref), getChildNavigationModule (ref), eventsModule (ref), object (ref), getNavigationActionCreatorsModule (ref)
	local actionCreators = p0.getActionCreators(p1, nil)
	local t = {
		actions = actionCreators,
		router = p0,
		state = p1,
		dispatch = p2,
		getScreenProps = p4,
		_dangerouslyGetParent = function() --[[ line: 24 ]]
			return nil
		end,
		isFirstRouteInParent = function() --[[ line: 27 ]]
			return true
		end,
		_childrenNavigation = getChildrenNavigationCacheModule(p5())
	}
	
	function t.getChildNavigation(p6) --[[ line: 33 ]]
		-- upvalues: getChildNavigationModule (copy), t (ref), p5 (ref)
		return getChildNavigationModule(t, p6, p5)
	end
	
	function t.isFocused(p7) --[[ line: 37 ]]
		-- upvalues: p5 (ref)
		local state = p5().state
		
		return if p7 ~= nil then state.routes[state.index].key == p7 else true
	end
	
	function t.addListener(p8, p9) --[[ line: 45 ]]
		-- upvalues: eventsModule (copy), p3 (ref)
		if p8 == eventsModule.Action then
			p3[p9] = true
			
			return {
				remove = function() --[[ line: 51 ]]
					-- upvalues: p3 (copy), p9 (ref)
					p3[p9] = nil
				end
			}
		end
		return { remove = function() --[[ line: 47 ]] end }
	end
	
	local var6 = object.assign(getNavigationActionCreatorsModule(t.state), actionCreators)
	
	for i, v in var6 do
		t[i] = function(...) --[[ line: 61 ]]
			-- upvalues: t (ref), var6 (ref), i (ref)
			t.dispatch(var6[i](...))
		end
	end
	return t
end