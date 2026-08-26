local parent = script:FindFirstAncestor("UserLib").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal(false)
	
	return {
		getIsLocalUserUnder13 = var1,
		setIsLocalUserUnder13 = var2,
		reset = function()
			-- upvalues: var2 (ref)
			var2(false)
		end
	}
end