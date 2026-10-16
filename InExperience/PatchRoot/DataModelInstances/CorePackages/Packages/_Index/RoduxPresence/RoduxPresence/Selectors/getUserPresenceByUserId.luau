local GetDeepValueModule = require(script:FindFirstAncestor("RoduxPresence").getDeepValue)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: GetDeepValueModule (copy)
	local KeyPath = p1.keyPath
	
	return function(p2, p3) --[[ Line: 6 ]]
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy)
		return GetDeepValueModule(p2, KeyPath .. ".byUserId")[p3]
	end
end