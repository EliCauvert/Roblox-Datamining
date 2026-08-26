local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1, p2)
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		return if p3 and p3.Squad and p3.Squad.CrossExperienceVoice then p3.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[p1] == true ~= (p3.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[p2] == true) else nil
	end) else nil
end