local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local Constants = require(CrossExperienceVoice.dependencies).CrossExperience.Constants
local UseVoiceStatusModule = require(CrossExperienceVoice.Hooks.useVoiceStatus)

return function(): boolean
	-- upvalues: UseVoiceStatusModule (copy), Constants (copy)
	return UseVoiceStatusModule() == Constants.VOICE_STATUS.VOICE_CONNECTED
end