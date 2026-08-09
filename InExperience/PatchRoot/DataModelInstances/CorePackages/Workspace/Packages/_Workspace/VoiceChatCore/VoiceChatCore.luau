local flags = script.Flags

return {
	CoreVoiceManager = require(script.CoreVoiceManager),
	Constants = require(script.Constants),
	Analytics = require(script.Analytics),
	Flags = {
		GetFFlagUpdateDeviceInputPlayerChanged = require(flags.GetFFlagUpdateDeviceInputPlayerChanged),
		GetFFlagVoiceChatServiceManagerUseAvatarChat = require(flags.GetFFlagVoiceChatServiceManagerUseAvatarChat),
		GetFFlagBatchVoiceParticipantsUpdates = require(flags.GetFFlagBatchVoiceParticipantsUpdates),
		GetFIntThrottleParticipantsUpdateMs = require(flags.GetFIntThrottleParticipantsUpdateMs),
		GetFFlagEnableFtuxExitOnMuteToggle = require(flags.GetFFlagEnableFtuxExitOnMuteToggle),
		GetFFlagEnableExpJoinMicPermAnalytics = require(flags.GetFFlagEnableExpJoinMicPermAnalytics),
		GetFFlagEnableSeamlessVoiceFeature = require(flags.GetFFlagEnableSeamlessVoiceFeature),
		GetFFlagFixGetPlayerByUserIdStringCast = require(flags.GetFFlagFixGetPlayerByUserIdStringCast)
	},
	Requests = {
		GetShowAgeVerificationOverlay = require(script.Requests.GetShowAgeVerificationOverlay)
	},
	["jest.config"] = script["jest.config"]
}