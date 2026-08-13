local parent = script:FindFirstAncestor("UserLib").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function() --[[ line: 15 ]]
	-- upvalues: createSessionScopedSignal (ref)
	local var0, var1 = createSessionScopedSignal(false)
	
	return {
		getIsLocalUserUnder13 = var0,
		setIsLocalUserUnder13 = var1,
		reset = function() --[[ line: 18 ]]
			-- upvalues: var1 (ref)
			var1(false)
		end
	}
end