local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p0) --[[ line: 8 ]]
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p1) --[[ line: 12 ]]
		-- upvalues: p0 (ref)
		return if p1 and p1.Squad and p1.Squad.CrossExperienceVoice then p1.Squad.CrossExperienceVoice.Participants.participants[p0] else nil
	end) else nil
end