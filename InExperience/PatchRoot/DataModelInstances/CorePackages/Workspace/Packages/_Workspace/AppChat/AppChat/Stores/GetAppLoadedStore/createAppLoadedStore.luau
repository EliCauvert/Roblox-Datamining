local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
	
	return {
		getAppLoaded = SessionScopedSignal,
		setAppLoaded = function(p1)
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end
	}
end