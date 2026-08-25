local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local constants = require(crossExperienceVoice.dependencies).CrossExperience.Constants
local useVoiceStatusModule = require(crossExperienceVoice.Hooks.useVoiceStatus)

return function()
	-- upvalues: useVoiceStatusModule (ref), constants (ref)
	return useVoiceStatusModule() == constants.VOICE_STATUS.DISCONNECTED
end