local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(false)
	
	return {
		getHasPlayedIntro = SessionScopedSignal,
		markIntroPlayed = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(true)
		end,
		getHasDragged = SessionScopedSignal1,
		markDragged = function()
			-- upvalues: SessionScopedSignal2_1 (copy)
			SessionScopedSignal2_1(true)
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SessionScopedSignal2(false)
			SessionScopedSignal2_1(false)
		end
	}
end