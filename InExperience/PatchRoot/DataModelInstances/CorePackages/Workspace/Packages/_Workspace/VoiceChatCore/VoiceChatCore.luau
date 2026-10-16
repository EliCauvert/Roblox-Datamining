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
		GetFFlagEnableExpJoinMicPermAnalytics = require(Flags.GetFFlagEnableExpJoinMicPermAnalytics),
		GetFFlagEnableSeamlessVoiceFeature = require(Flags.GetFFlagEnableSeamlessVoiceFeature),
		GetFFlagFixGetPlayerByUserIdStringCast = require(Flags.GetFFlagFixGetPlayerByUserIdStringCast),
		GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry),
		GetFFlagMicConsumerRegistry = require(Flags.GetFFlagMicConsumerRegistry)
	},
	Requests = {
		GetShowAgeVerificationOverlay = require(script.Requests.GetShowAgeVerificationOverlay)
	},
	["jest.config"] = script["jest.config"]
}