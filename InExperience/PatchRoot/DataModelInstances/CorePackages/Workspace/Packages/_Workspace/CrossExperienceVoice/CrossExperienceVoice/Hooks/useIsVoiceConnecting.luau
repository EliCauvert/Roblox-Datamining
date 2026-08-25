local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local constants = require(crossExperienceVoice.dependencies).CrossExperience.Constants
local useVoiceStatusModule = require(crossExperienceVoice.Hooks.useVoiceStatus)

return function()
	-- upvalues: useVoiceStatusModule (ref), constants (ref)
	local var2 = useVoiceStatusModule()
	
	return if var2 ~= constants.VOICE_STATUS.RCC_CONNECTING then if var2 ~= constants.VOICE_STATUS.RCC_CONNECTED then if var2 ~= constants.VOICE_STATUS.RCC_RECONNECTING then if var2 ~= constants.VOICE_STATUS.VOICE_RECONNECTING then var2 == constants.VOICE_STATUS.VOICE_CONNECTING else true else true else true else true
end