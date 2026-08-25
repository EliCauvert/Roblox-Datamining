local getFFlagEnableCrossExpVoiceModule = require(script.Parent.GetFFlagEnableCrossExpVoice)

return function()
	-- upvalues: getFFlagEnableCrossExpVoiceModule (ref)
	return getFFlagEnableCrossExpVoiceModule() and game:GetEngineFeature("CrossExperienceVoiceMuteAll")
end