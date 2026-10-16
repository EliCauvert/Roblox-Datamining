local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local Utils = require(CrossExperienceVoice.dependencies).CrossExperience.Utils
local UseVoiceStatusModule = require(CrossExperienceVoice.Hooks.useVoiceStatus)

return function() --[[ Line: 10 ]]
	-- upvalues: UseVoiceStatusModule (copy), Utils (copy)
	local UseVoiceStatusModuleResult = UseVoiceStatusModule()
	
	return UseVoiceStatusModuleResult ~= nil and Utils.VoiceStatus.isVoiceRetriableError(UseVoiceStatusModuleResult)
end