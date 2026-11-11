local Parent = script:FindFirstAncestor("SearchBarStore").Parent
local SignalsUtilsModule = require(Parent.SignalsUtils)

return require(Parent.Signals).createComputed(function()
	-- upvalues: SignalsUtilsModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal(false)
	
	return {
		getFocused = SessionScopedSignal,
		setFocused = SessionScopedSignal2,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end
	}
end)