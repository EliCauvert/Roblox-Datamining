local parent = script.Parent.Parent
local parent_1 = parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.roduxFriendsTypes)
local object = require(parent_1.LuauPolyfill).Object

return function(p0)
	-- upvalues: getDeepValueModule (ref), object (ref)
	local keyPath = p0.keyPath
	
	return function(p1)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), object (copy)
		return function(p2)
			-- upvalues: getDeepValueModule (copy), p1 (ref), keyPath (copy), object (copy)
			return object.keys(getDeepValueModule(p1, string.format("%s.recommendations.bySource.%s", keyPath, p2 or "")) or {})
		end
	end
end