local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local Constants = require(CrossExperienceVoice.dependencies).CrossExperience.Constants
local UseVoiceStatusModule = require(CrossExperienceVoice.Hooks.useVoiceStatus)

return function(): boolean
	-- upvalues: UseVoiceStatusModule (copy), Constants (copy)
	local UseVoiceStatusModuleResult = UseVoiceStatusModule()
	
	return UseVoiceStatusModuleResult == Constants.VOICE_STATUS.RCC_CONNECTING or (UseVoiceStatusModuleResult == Constants.VOICE_STATUS.RCC_CONNECTED or (UseVoiceStatusModuleResult == Constants.VOICE_STATUS.RCC_RECONNECTING or (UseVoiceStatusModuleResult == Constants.VOICE_STATUS.VOICE_RECONNECTING or UseVoiceStatusModuleResult == Constants.VOICE_STATUS.VOICE_CONNECTING)))
end