local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local UseAudioCurrentContextIdModule = require(CrossExperienceVoice.Hooks.useAudioCurrentContextId)
local CONTEXTID = require(CrossExperienceVoice.dependencies).CrossExperience.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID

return function(): boolean --[[ Line: 10 ]]
	-- upvalues: UseAudioCurrentContextIdModule (copy), CONTEXTID (copy)
	return UseAudioCurrentContextIdModule() == CONTEXTID
end