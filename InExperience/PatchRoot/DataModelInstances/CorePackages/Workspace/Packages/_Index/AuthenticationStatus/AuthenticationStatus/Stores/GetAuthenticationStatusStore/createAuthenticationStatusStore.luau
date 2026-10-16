local Parent = script:FindFirstAncestor("AuthenticationStatus").Parent
local SignalsModule = require(Parent.Signals)
local UNKNOWN = require(Parent.RobloxAppEnums).LoginStatus.UNKNOWN

return function() --[[ Line: 9 | Named "createAuthenticationStatusStore" ]]
	-- upvalues: SignalsModule (copy), UNKNOWN (copy)
	local Signal, Signal2 = SignalsModule.createSignal(UNKNOWN)
	
	return {
		getStatus = Signal,
		setAuthenticationStatus = function(p1) --[[ Line: 12 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		reset = function() --[[ Line: 16 ]]
			-- upvalues: Signal2 (copy), UNKNOWN (upval)
			Signal2(UNKNOWN)
		end
	}
end