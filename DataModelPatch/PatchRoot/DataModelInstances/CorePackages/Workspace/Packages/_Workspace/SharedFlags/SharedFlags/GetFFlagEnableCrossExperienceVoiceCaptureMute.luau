local GetFFlagEnableCrossExpVoiceModule = require(script.Parent.GetFFlagEnableCrossExpVoice)

return function()
	-- upvalues: GetFFlagEnableCrossExpVoiceModule (copy)
	return GetFFlagEnableCrossExpVoiceModule() and game:GetEngineFeature("CrossExperienceVoiceMuteAll")
end