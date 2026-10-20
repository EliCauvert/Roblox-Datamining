local Parent = script:FindFirstAncestor("UserAccessStore").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	
	return {
		getUserAccessRestrictionDetail = SessionScopedSignal,
		setUserAccessRestrictionDetail = SessionScopedSignal2,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(nil)
		end
	}
end