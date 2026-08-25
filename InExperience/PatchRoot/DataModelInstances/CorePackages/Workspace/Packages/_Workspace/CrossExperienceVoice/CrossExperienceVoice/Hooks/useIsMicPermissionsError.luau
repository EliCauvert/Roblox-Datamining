local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local utils = require(crossExperienceVoice.dependencies).CrossExperience.Utils
local useVoiceStatusModule = require(crossExperienceVoice.Hooks.useVoiceStatus)

return function()
	-- upvalues: useVoiceStatusModule (ref), utils (ref)
	local var2 = useVoiceStatusModule()
	
	return if var2 == nil then false else utils.VoiceStatus.isMicPermissionsError(var2)
end