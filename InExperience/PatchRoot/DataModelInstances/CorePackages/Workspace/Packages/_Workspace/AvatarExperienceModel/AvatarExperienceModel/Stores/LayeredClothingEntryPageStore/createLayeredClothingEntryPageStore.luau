local Parent = script:FindFirstAncestor("AvatarExperienceModel").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), AvatarScreen (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(AvatarScreen.None)
	
	return {
		getEntryPage = SessionScopedSignal,
		setEntryPage = function(p1)
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy), AvatarScreen (upval)
			SessionScopedSignal2(AvatarScreen.None)
		end
	}
end