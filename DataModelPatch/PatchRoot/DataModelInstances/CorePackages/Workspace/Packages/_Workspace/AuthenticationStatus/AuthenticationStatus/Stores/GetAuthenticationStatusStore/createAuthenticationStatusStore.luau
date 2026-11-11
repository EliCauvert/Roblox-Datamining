local Parent = script:FindFirstAncestor("AuthenticationStatus").Parent
local SignalsModule = require(Parent.Signals)
local UNKNOWN = require(Parent.RobloxAppEnums).LoginStatus.UNKNOWN

return function()
	-- upvalues: SignalsModule (copy), UNKNOWN (copy)
	local Signal, Signal2 = SignalsModule.createSignal(UNKNOWN)
	
	return {
		getStatus = Signal,
		setAuthenticationStatus = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		reset = function()
			-- upvalues: Signal2 (copy), UNKNOWN (upval)
			Signal2(UNKNOWN)
		end
	}
end