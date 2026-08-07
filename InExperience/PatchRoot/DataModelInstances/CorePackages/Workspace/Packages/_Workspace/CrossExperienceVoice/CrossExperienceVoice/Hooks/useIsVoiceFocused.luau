local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local useAudioCurrentContextIdModule = require(crossExperienceVoice.Hooks.useAudioCurrentContextId)
local CONTEXT_ID = require(crossExperienceVoice.dependencies).CrossExperience.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID

return function() --[[ line: 10 ]]
	-- upvalues: useAudioCurrentContextIdModule (ref), CONTEXT_ID (ref)
	return useAudioCurrentContextIdModule() == CONTEXT_ID
end