local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1)
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseSelectorFunction (copy)
	return if GetFFlagEnableCrossExpVoiceFunction() then UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		if p2 and p2.Squad and p2.Squad.CrossExperienceVoice then
			local Participant = p2.Squad.CrossExperienceVoice.Participants.participants[p1]
			
			return if Participant then Participant.isMuted else nil
		else
			return nil
		end
	end) else nil
end