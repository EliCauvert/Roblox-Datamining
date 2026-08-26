local isBlockedByMeModule = require(script:FindFirstAncestor("UserBlockingRodux").Reducers.UserBlocking.isBlockedByMe)
local t = { isBlockedByMe = {} }

return function(p1)
	-- upvalues: isBlockedByMeModule (ref), t (ref)
	local var1 = isBlockedByMeModule(p1)
	
	return function(p2, p3)
		-- upvalues: t (copy), var1 (ref)
		return { isBlockedByMe = var1((p2 or t).isBlockedByMe, p3) }
	end
end