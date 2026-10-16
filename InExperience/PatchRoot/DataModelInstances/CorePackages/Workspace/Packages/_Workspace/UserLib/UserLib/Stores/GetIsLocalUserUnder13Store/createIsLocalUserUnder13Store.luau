local Parent = script:FindFirstAncestor("UserLib").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function() --[[ Line: 15 ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
	
	return {
		getIsLocalUserUnder13 = SessionScopedSignal,
		setIsLocalUserUnder13 = SessionScopedSignal2,
		reset = function() --[[ Line: 18 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end
	}
end