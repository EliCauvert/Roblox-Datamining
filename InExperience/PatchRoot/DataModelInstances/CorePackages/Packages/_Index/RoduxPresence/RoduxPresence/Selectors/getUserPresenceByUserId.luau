local getDeepValueModule = require(script:FindFirstAncestor("RoduxPresence").getDeepValue)

return function(p1)
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p1.keyPath
	
	return function(p2, p3)
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		return getDeepValueModule(p2, keyPath .. ".byUserId")[p3]
	end
end