return {
	AccountSettingsUpsell = require(script.Components.Upsells.AccountSettingsUpsell),
	VPCUpsellContainer = require(script.Components.Upsells.ParentalRequest.VPCUpsellContainer),
	WizardContainer = require(script.Components.WizardContainer),
	FAEUpsellContainer = require(script.Components.Upsells.FacialAgeEstimation.FAEUpsellContainer),
	OpenAmpWizardContainer = require(script.Common.OpenAmpWizardContainer),
	AmpEnums = require(script.Common.Enums),
	AmpApiProvider = require(script.Common.AmpApiProvider),
	IDVUpsellContainer = require(script.Components.Upsells.IdentityVerification.IDVUpsellContainer),
	GetFFlagEnableAmpEmailUpsellSupport = require(script.Flags.GetFFlagEnableAmpEmailUpsellSupport),
	GetFFlagEnableAmpIDVUpsellSupport = require(script.Flags.GetFFlagEnableAmpIDVUpsellSupport),
	GetFFlagEnableAmpSubscriptionUpsell = require(script.Flags.GetFFlagEnableAmpSubscriptionUpsell),
	InExpAmpWizardController = require(script.Components.InExpAmpWizardController),
	GetFFlagEnableAmpWizardVPCNavigationFix = require(script.Flags.GetFFlagEnableAmpWizardVPCNavigationFix),
	AmpWizardUserMismatchModal = require(script.Components.AmpWizardUserMismatchModal),
	["jest.config"] = script["jest.config"]
}