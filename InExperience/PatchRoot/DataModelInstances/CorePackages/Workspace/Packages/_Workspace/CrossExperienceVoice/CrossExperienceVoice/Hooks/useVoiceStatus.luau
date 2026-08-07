local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local useSelector = dependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function() --[[ line: 8 ]]
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useSelector (ref)
	return if getFFlagEnableCrossExpVoice() then useSelector(function(p0) --[[ line: 12 ]]
		return if p0 and p0.Squad and p0.Squad.CrossExperienceVoice then p0.Squad.CrossExperienceVoice.Experience.voiceStatus else nil
	end) else nil
end