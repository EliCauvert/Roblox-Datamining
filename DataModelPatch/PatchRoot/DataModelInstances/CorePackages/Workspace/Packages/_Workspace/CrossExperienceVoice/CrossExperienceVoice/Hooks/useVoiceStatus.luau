local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice

return function()
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseSelectorFunction (copy)
	return if GetFFlagEnableCrossExpVoiceFunction() then UseSelectorFunction(function(p1)
		return if p1 and p1.Squad and p1.Squad.CrossExperienceVoice then p1.Squad.CrossExperienceVoice.Experience.voiceStatus else nil
	end) else nil
end