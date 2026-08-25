local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p0, p1)
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p2)
		-- upvalues: p0 (ref), p1 (ref)
		return if p2 and p2.Squad and p2.Squad.CrossExperienceVoice then p2.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[p0] == true ~= (p2.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[p1] == true) else nil
	end) else nil
end