local Flags = script.Flags

return {
	CoreVoiceManager = require(script.CoreVoiceManager),
	MicInputManager = require(script.MicInputManager),
	Constants = require(script.Constants),
	Analytics = require(script.Analytics),
	VoiceVolumeControlsEligibility = require(script.VoiceVolumeControlsEligibility),
	Flags = {
		GetFFlagVoiceChatServiceManagerUseAvatarChat = require(Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat),
		GetFFlagBatchVoiceParticipantsUpdates = require(Flags.GetFFlagBatchVoiceParticipantsUpdates),
		GetFIntThrottleParticipantsUpdateMs = require(Flags.GetFIntThrottleParticipantsUpdateMs),
		GetFFlagEnableFtuxExitOnMuteToggle = require(Flags.GetFFlagEnableFtuxExitOnMuteToggle),
		GetFFlagEnableSeamlessVoiceFeature = require(Flags.GetFFlagEnableSeamlessVoiceFeature),
		GetFFlagFixGetPlayerByUserIdStringCast = require(Flags.GetFFlagFixGetPlayerByUserIdStringCast),
		GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry),
		GetFFlagMicConsumerRegistry = require(Flags.GetFFlagMicConsumerRegistry),
		GetFFlagCoreMicManagerRefactor = require(Flags.GetFFlagCoreMicManagerRefactor),
		FFlagMicSyncVoiceDeviceAcrossRejoin = require(Flags.FFlagMicSyncVoiceDeviceAcrossRejoin)
	},
	Requests = {
		GetShowAgeVerificationOverlay = require(script.Requests.GetShowAgeVerificationOverlay)
	},
	["jest.config"] = script["jest.config"]
}