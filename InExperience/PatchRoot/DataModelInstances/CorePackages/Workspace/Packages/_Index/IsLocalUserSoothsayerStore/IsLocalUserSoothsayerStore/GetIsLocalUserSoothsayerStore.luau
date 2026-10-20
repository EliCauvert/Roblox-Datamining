local Parent = script:FindFirstAncestor("IsLocalUserSoothsayerStore").Parent
local SignalsUtilsModule = require(Parent.SignalsUtils)

return require(Parent.Signals).createComputed(function()
	-- upvalues: SignalsUtilsModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal(false)
	
	return {
		getIsLocalUserSoothsayer = SessionScopedSignal,
		setIsLocalUserSoothsayer = function(p1)
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end
	}
end)