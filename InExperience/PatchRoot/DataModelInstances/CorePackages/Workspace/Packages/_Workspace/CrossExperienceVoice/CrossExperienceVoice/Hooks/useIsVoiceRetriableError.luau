local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local utils = require(crossExperienceVoice.dependencies).CrossExperience.Utils
local useVoiceStatusModule = require(crossExperienceVoice.Hooks.useVoiceStatus)

return function()
	-- upvalues: useVoiceStatusModule (ref), utils (ref)
	local var1 = useVoiceStatusModule()
	
	return if var1 == nil then false else utils.VoiceStatus.isVoiceRetriableError(var1)
end