local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1)
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseSelectorFunction (copy)
	return if GetFFlagEnableCrossExpVoiceFunction() then UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return if p2 and p2.Squad and p2.Squad.CrossExperienceVoice then p2.Squad.CrossExperienceVoice.Participants.participants[p1] else nil
	end) else nil
end