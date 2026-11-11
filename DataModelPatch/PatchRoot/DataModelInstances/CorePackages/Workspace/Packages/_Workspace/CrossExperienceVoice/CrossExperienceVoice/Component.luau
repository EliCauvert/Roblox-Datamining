local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local UseCrossExperienceVoiceModule = require(CrossExperienceVoice.Hooks.useCrossExperienceVoice)
local FFlagEnableCEVForceInitialize = require(CrossExperienceVoice.Flags).FFlagEnableCEVForceInitialize

return function()
	-- upvalues: UseCrossExperienceVoiceModule (copy), FFlagEnableCEVForceInitialize (copy)
	UseCrossExperienceVoiceModule({
		handleRCCConnectionTimeout = nil,
		forceInitializeStoreOnMount = if FFlagEnableCEVForceInitialize then true else nil
	})
	
	return nil
end