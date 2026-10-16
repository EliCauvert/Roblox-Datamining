local Parent = script:FindFirstAncestor("IsLocalUserSoothsayerStore").Parent
local SignalsUtilsModule = require(Parent.SignalsUtils)

return require(Parent.Signals).createComputed(function() --[[ Line: 13 ]]
	-- upvalues: SignalsUtilsModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal(false)
	
	return {
		getIsLocalUserSoothsayer = SessionScopedSignal,
		setIsLocalUserSoothsayer = function(p1) --[[ Line: 16 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		reset = function() --[[ Line: 20 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end
	}
end)