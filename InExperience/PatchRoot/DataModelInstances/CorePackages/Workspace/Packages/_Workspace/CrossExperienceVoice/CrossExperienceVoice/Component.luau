local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local useCrossExperienceVoiceModule = require(crossExperienceVoice.Hooks.useCrossExperienceVoice)
local fFlagEnableCEVForceInitialize = require(crossExperienceVoice.Flags).FFlagEnableCEVForceInitialize

return function() --[[ line: 6 | named "CrossExperienceVoiceComponent" ]]
	-- upvalues: useCrossExperienceVoiceModule (ref), fFlagEnableCEVForceInitialize (ref)
	useCrossExperienceVoiceModule({
		handleRCCConnectionTimeout = nil,
		forceInitializeStoreOnMount = if fFlagEnableCEVForceInitialize then true else nil
	})
	
	return nil
end