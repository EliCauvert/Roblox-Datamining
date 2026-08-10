local flags = script.Flags

return {
	CoreVoiceManager = require(script.CoreVoiceManager),
	MicInputManager = require(script.MicInputManager),
	Constants = require(script.Constants),
	Analytics = require(script.Analytics),
	VoiceVolumeControlsEligibility = require(script.VoiceVolumeControlsEligibility),
	Flags = {
		GetFFlagUpdateDeviceInputPlayerChanged = require(flags.GetFFlagUpdateDeviceInputPlayerChanged),
		GetFFlagVoiceChatServiceManagerUseAvatarChat = require(flags.GetFFlagVoiceChatServiceManagerUseAvatarChat),
		GetFFlagBatchVoiceParticipantsUpdates = require(flags.GetFFlagBatchVoiceParticipantsUpdates),
		GetFIntThrottleParticipantsUpdateMs = require(flags.GetFIntThrottleParticipantsUpdateMs),
		GetFFlagEnableFtuxExitOnMuteToggle = require(flags.GetFFlagEnableFtuxExitOnMuteToggle),
		GetFFlagEnableExpJoinMicPermAnalytics = require(flags.GetFFlagEnableExpJoinMicPermAnalytics),
		GetFFlagEnableSeamlessVoiceFeature = require(flags.GetFFlagEnableSeamlessVoiceFeature),
		GetFFlagFixGetPlayerByUserIdStringCast = require(flags.GetFFlagFixGetPlayerByUserIdStringCast),
		GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry)
	},
	Requests = {
		GetShowAgeVerificationOverlay = require(script.Requests.GetShowAgeVerificationOverlay)
	},
	["jest.config"] = script["jest.config"]
}