local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1)
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p2)
		-- upvalues: p1 (ref)
		return if p2 and p2.Squad and p2.Squad.CrossExperienceVoice then p2.Squad.CrossExperienceVoice.Participants.participants[p1] else nil
	end) else nil
end