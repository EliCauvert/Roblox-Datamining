local parent = script.Parent.Parent
local parent_1 = parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.roduxFriendsTypes)
local object = require(parent_1.LuauPolyfill).Object

return function(p1)
	-- upvalues: getDeepValueModule (ref), object (ref)
	local keyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), object (copy)
		return function(p3)
			-- upvalues: getDeepValueModule (copy), p2 (ref), keyPath (copy), object (copy)
			return object.keys(getDeepValueModule(p2, string.format("%s.recommendations.bySource.%s", keyPath, p3 or "")) or {})
		end
	end
end