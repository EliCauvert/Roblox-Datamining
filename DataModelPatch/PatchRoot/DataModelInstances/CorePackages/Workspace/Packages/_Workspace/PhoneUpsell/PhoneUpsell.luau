return {
	["jest.config"] = script["jest.config"],
	VoicePhoneVerificationUpsellOverlayWrapper = require(script.Components.VoicePhoneVerificationUpsellOverlayWrapper),
	PhoneVerificationUpsellOverlayWrapper = require(script.Components.PhoneVerificationUpsellOverlayWrapper),
	PhoneVerificationUpsellOverlay = require(script.Components.PhoneVerificationUpsellOverlay),
	PhoneUpsellController = require(script.Components.PhoneUpsellController),
	PhoneLegalDisclaimer = require(script.Components.LegalDisclaimer),
	VoiceTrialUpsell = require(script.Components.VoiceTrialUpsell),
	Http = require(script.Http),
	Constants = require(script.Constants)
}