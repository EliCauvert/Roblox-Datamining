local isBlockedByMeModule = require(script:FindFirstAncestor("UserBlockingRodux").Reducers.UserBlocking.isBlockedByMe)
local t = { isBlockedByMe = {} }

return function(p0) --[[ line: 9 ]]
	-- upvalues: isBlockedByMeModule (ref), t (ref)
	local var2 = isBlockedByMeModule(p0)
	
	return function(p1, p2) --[[ line: 12 ]]
		-- upvalues: t (copy), var2 (ref)
		return { isBlockedByMe = var2((p1 or t).isBlockedByMe, p2) }
	end
end