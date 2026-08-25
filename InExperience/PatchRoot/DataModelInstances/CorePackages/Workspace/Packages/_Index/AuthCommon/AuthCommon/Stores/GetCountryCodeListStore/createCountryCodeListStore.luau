local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local _ = require(authCommon.Common.Types)

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal({})
	
	return {
		getCountryCodeList = var1,
		setCountryCodeList = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		reset = function()
			-- upvalues: var2 (ref)
			var2({})
		end
	}
end