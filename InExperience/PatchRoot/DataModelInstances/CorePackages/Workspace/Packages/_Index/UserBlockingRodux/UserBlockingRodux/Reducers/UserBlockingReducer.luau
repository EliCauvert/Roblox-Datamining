local IsBlockedByMeModule = require(script:FindFirstAncestor("UserBlockingRodux").Reducers.UserBlocking.isBlockedByMe)
local config = { isBlockedByMe = {} }

return function(p1) --[[ Line: 9 ]]
	-- upvalues: IsBlockedByMeModule (copy), config (copy)
	local IsBlockedByMeModule1 = IsBlockedByMeModule(p1)
	
	return function(p2, p3) --[[ Line: 12 ]]
		-- upvalues: config (upval), IsBlockedByMeModule1 (copy)
		return {
			isBlockedByMe = IsBlockedByMeModule1((p2 or config).isBlockedByMe, p3)
		}
	end
end