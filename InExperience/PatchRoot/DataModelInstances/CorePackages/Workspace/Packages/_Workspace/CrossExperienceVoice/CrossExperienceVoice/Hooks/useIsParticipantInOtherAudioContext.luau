local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseSelectorFunction (copy)
	return if GetFFlagEnableCrossExpVoiceFunction() then UseSelectorFunction(function(p3) --[[ Line: 12 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return if p3 and p3.Squad and p3.Squad.CrossExperienceVoice then p3.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[p1] == true ~= (p3.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds[p2] == true) else nil
	end) else nil
end