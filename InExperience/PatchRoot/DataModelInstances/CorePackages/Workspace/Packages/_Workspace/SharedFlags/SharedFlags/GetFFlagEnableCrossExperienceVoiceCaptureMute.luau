local getFFlagEnableCrossExpVoiceModule = require(script.Parent.GetFFlagEnableCrossExpVoice)

return function() --[[ line: 3 ]]
	-- upvalues: getFFlagEnableCrossExpVoiceModule (ref)
	return getFFlagEnableCrossExpVoiceModule() and game:GetEngineFeature("CrossExperienceVoiceMuteAll")
end