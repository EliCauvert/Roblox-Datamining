local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
	
	return {
		getApplyingLayeredClothing = SessionScopedSignal,
		startedApplyingLayeredClothing = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(true)
		end,
		finishedApplyingLayeredClothing = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end
	}
end