game:DefineFastFlag("FixSeamlessVoiceIntegrationWithPrivateVoice2", false)
local GetFFlagEnableCrossExpVoiceModule = require(script.Parent.GetFFlagEnableCrossExpVoice)

return function()
	-- upvalues: GetFFlagEnableCrossExpVoiceModule (copy)
	return GetFFlagEnableCrossExpVoiceModule() and game:GetFastFlag("FixSeamlessVoiceIntegrationWithPrivateVoice2")
end