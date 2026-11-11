local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local Utils = require(CrossExperienceVoice.dependencies).CrossExperience.Utils
local UseVoiceStatusModule = require(CrossExperienceVoice.Hooks.useVoiceStatus)

return function()
	-- upvalues: UseVoiceStatusModule (copy), Utils (copy)
	local UseVoiceStatusModuleResult = UseVoiceStatusModule()
	
	return UseVoiceStatusModuleResult ~= nil and Utils.VoiceStatus.isMicPermissionsError(UseVoiceStatusModuleResult)
end