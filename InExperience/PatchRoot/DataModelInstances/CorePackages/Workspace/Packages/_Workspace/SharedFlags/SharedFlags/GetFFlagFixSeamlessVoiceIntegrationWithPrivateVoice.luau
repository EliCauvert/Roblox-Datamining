game:DefineFastFlag("FixSeamlessVoiceIntegrationWithPrivateVoice2", false)
local getFFlagEnableCrossExpVoiceModule = require(script.Parent.GetFFlagEnableCrossExpVoice)

return function() --[[ line: 5 ]]
	-- upvalues: getFFlagEnableCrossExpVoiceModule (ref)
	return getFFlagEnableCrossExpVoiceModule() and game:GetFastFlag("FixSeamlessVoiceIntegrationWithPrivateVoice2")
end