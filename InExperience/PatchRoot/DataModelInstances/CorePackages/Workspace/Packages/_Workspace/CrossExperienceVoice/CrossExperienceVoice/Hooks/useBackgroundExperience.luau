local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local UseSelectorFunction = DependenciesModule.RoactUtils.Hooks.RoactRodux.useSelector

return function() --[[ Line: 9 ]]
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseSelectorFunction (copy)
	return if GetFFlagEnableCrossExpVoiceFunction() then UseSelectorFunction(function(p1) --[[ Line: 13 ]]
		return if p1 and p1.Squad and p1.Squad.CrossExperienceVoice then p1.Squad.CrossExperienceVoice.Experience else nil
	end) else nil
end