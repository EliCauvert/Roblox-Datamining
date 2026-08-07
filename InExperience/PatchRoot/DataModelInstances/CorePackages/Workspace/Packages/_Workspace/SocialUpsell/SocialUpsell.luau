local componentsModule = require(script.Components)
local _ = require(script.Types)

return {
	InAppSocialUpsellOverlayWrapper = require(script.Components).InAppSocialUpsellOverlayWrapper,
	UpsellBanner = componentsModule.UpsellBanner,
	UpsellOverlay = componentsModule.UpsellOverlay,
	SocialUpsellEventReceiver = componentsModule.SocialUpsellEventReceiver,
	Analytics = {
		SocialUpsellAnalytics = require(script.Analytics.SocialUpsellAnalytics),
		Enum = require(script.Analytics.Enum)
	},
	Flags = {
		FFlagAddAEGIS2Analytics = require(script.Flag.FFlagAddAEGIS2Analytics)
	},
	Enum = require(script.Enum),
	Utils = {
		createCommonSocialUpsellBannerConfig = require(script.Utils.createCommonSocialUpsellBannerConfig),
		createBannerConfigFromUpsellCardVariation = require(script.Utils.createBannerConfigFromUpsellCardVariation),
		manuallyInvokeAmpUpsell = require(script.Utils.manuallyInvokeAmpUpsell)
	},
	Signals = {
		GetAgeVerifiedChangedSignal = require(script.Signals.GetAgeVerifiedChangedSignal)
	},
	Thunks = require(script.Thunks),
	Enums = require(script.Enum),
	Hooks = require(script.Hooks),
	Constants = require(script.Constants),
	Overlay = {
		initializeInExpOverlay = require(script.Utils.initializeInExpOverlay),
		getOverlayStore = require(script.Store.getOverlayStore),
		OverlayTypes = require(script.Constants).OVERLAY_TYPES
	},
	["jest.config"] = script["jest.config"]
}