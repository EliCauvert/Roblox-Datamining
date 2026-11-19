local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local TutilsModule = require(Parent.tutils)
local _ = require(AvatarExperienceCommon.State.CharacterHistoryStateChangeButtonActivated)

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), TutilsModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	
	return {
		getSnapshot = SessionScopedSignal,
		captureSnapshot = function(p1)
			-- upvalues: SessionScopedSignal2 (copy), TutilsModule (upval)
			SessionScopedSignal2(TutilsModule.deepCopy(p1))
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(nil)
		end
	}
end