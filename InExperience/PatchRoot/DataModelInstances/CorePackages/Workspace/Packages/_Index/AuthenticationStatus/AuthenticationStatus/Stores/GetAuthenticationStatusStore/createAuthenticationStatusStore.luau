local parent = script:FindFirstAncestor("AuthenticationStatus").Parent
local signalsModule = require(parent.Signals)
local UNKNOWN = require(parent.RobloxAppEnums).LoginStatus.UNKNOWN

return function()
	-- upvalues: signalsModule (ref), UNKNOWN (ref)
	local var1, var2 = signalsModule.createSignal(UNKNOWN)
	
	return {
		getStatus = var1,
		setAuthenticationStatus = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		reset = function()
			-- upvalues: var2 (ref), UNKNOWN (copy)
			var2(UNKNOWN)
		end
	}
end