local parent = script.Parent.Parent
local getDeepValueModule = require(parent.getDeepValue)
local _ = require(parent.roduxFriendsTypes)
local filterByKeysModule = require(script.Parent.filterByKeys)

return function(p1)
	-- upvalues: getDeepValueModule (ref), filterByKeysModule (ref)
	local keyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: getDeepValueModule (copy), keyPath (ref), filterByKeysModule (copy)
		return function(p3, p4)
			-- upvalues: getDeepValueModule (copy), p2 (ref), keyPath (copy), filterByKeysModule (copy)
			local var1 = getDeepValueModule(p2, string.format("%s.recommendations.byUserId.%s", keyPath, p3 or "")) or {}
			
			return if p4 then filterByKeysModule(p4, var1) else var1
		end
	end
end