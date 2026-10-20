local Flags = script.Flags

return {
	CoreVoiceManager = require(script.CoreVoiceManager),
	Constants = require(script.Constants),
	Analytics = require(script.Analytics),
	VoiceVolumeControlsEligibility = require(script.VoiceVolumeControlsEligibility),
	Flags = {
		GetFFlagUpdateDeviceInputPlayerChanged = require(Flags.GetFFlagUpdateDeviceInputPlayerChanged),
		GetFFlagVoiceChatServiceManagerUseAvatarChat = require(Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat),
		GetFFlagBatchVoiceParticipantsUpdates = require(Flags.GetFFlagBatchVoiceParticipantsUpdates),
		GetFIntThrottleParticipantsUpdateMs = require(Flags.GetFIntThrottleParticipantsUpdateMs),
		GetFFlagEnableFtuxExitOnMuteToggle = require(Flags.GetFFlagEnableFtuxExitOnMuteToggle),
		GetFFlagEnableExpJoinMicPermAnalytics = require(Flags.GetFFlagEnableExpJoinMicPermAnalytics),
		GetFFlagEnableSeamlessVoiceFeature = require(Flags.GetFFlagEnableSeamlessVoiceFeature),
		GetFFlagFixGetPlayerByUserIdStringCast = require(Flags.GetFFlagFixGetPlayerByUserIdStringCast),
		GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry = require(Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry)
	},
	Requests = {
		GetShowAgeVerificationOverlay = require(script.Requests.GetShowAgeVerificationOverlay)
	},
	["jest.config"] = script["jest.config"]
}