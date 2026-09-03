local parent = script:FindFirstAncestor("UserAccessStore").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal(nil)
	
	return {
		getUserAccessRestrictionDetail = var1,
		setUserAccessRestrictionDetail = var2,
		reset = function()
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end