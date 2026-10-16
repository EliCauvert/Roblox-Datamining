local GetFFlagEnableCrossExpVoiceModule = require(script.Parent.GetFFlagEnableCrossExpVoice)

return function() --[[ Line: 3 ]]
	-- upvalues: GetFFlagEnableCrossExpVoiceModule (copy)
	return GetFFlagEnableCrossExpVoiceModule() and game:GetEngineFeature("CrossExperienceVoiceMuteAll")
end