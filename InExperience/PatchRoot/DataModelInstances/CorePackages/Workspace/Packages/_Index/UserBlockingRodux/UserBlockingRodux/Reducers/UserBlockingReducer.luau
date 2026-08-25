local isBlockedByMeModule = require(script:FindFirstAncestor("UserBlockingRodux").Reducers.UserBlocking.isBlockedByMe)
local t = { isBlockedByMe = {} }

return function(p0)
	-- upvalues: isBlockedByMeModule (ref), t (ref)
	local var2 = isBlockedByMeModule(p0)
	
	return function(p1, p2)
		-- upvalues: t (copy), var2 (ref)
		return { isBlockedByMe = var2((p1 or t).isBlockedByMe, p2) }
	end
end