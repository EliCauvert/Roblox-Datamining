local parent = script:FindFirstAncestor("UserLib").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var0, var1 = createSessionScopedSignal(false)
	
	return {
		getIsLocalUserUnder13 = var0,
		setIsLocalUserUnder13 = var1,
		reset = function()
			-- upvalues: var1 (ref)
			var1(false)
		end
	}
end