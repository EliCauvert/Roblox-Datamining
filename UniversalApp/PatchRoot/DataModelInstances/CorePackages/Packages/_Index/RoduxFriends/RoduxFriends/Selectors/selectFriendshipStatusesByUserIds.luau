local parent = script.Parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.roduxFriendsTypes)
local filterByKeysModule = require(script.Parent.filterByKeys)

return function(p0)
	-- upvalues: getDeepValueModule (ref), filterByKeysModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), filterByKeysModule (copy)
		return function(p2)
			-- upvalues: getDeepValueModule (copy), p1 (ref), keyPath (copy), filterByKeysModule (copy)
			local var2 = getDeepValueModule(p1, string.format("%s.friendshipStatus", keyPath)) or {}
			
			return if p2 then filterByKeysModule(p2, var2) else var2
		end
	end
end