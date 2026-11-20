local v1 = script
local Parent = v1.Parent
local FFlagEnablePlusReferralEntrypointTelemetry = require(Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry
local EntrypointModule = if FFlagEnablePlusReferralEntrypointTelemetry then require(v1.Enums.Entrypoint) else nil
local _ = require(v1.types)

return {
	initiateRobloxSubscriptionPurchase = require(script.Flows.initiateRobloxSubscriptionPurchase),
	resetRobloxSubscriptionPurchaseConfiguration = function()
		require(script.Flows.resetRobloxSubscriptionPurchaseConfiguration)()
	end,
	openTTSheet = if require(v1.Flags.FFlagTTOnboardingSheet) then require(script.Flows.openTTSheet) else nil,
	startRobloxSubscriptionPurchaseFromUpsell = require(script.Flows.startRobloxSubscriptionPurchaseFromUpsell),
	SurfaceContext = require(v1.Enums.SurfaceContext),
	SurfaceName = require(v1.Enums.SurfaceName),
	Entrypoint = if FFlagEnablePlusReferralEntrypointTelemetry then EntrypointModule else nil,
	PurchaseClientSessionIdType = require(v1.Enums.PurchaseClientSessionIdType),
	RobloxSubscriptionFlowCompleteReason = require(v1.Enums.RobloxSubscriptionFlowCompleteReason),
	SubscriptionGrantType = require(v1.Enums.SubscriptionGrantType),
	RobloxPlusSheetKind = require(v1.Enums.RobloxPlusSheetKind),
	CampaignStringsLoadingStatus = require(v1.Enums.CampaignStringsLoadingStatus),
	Flags = {
		FFlagTTOnboardingSheet = require(v1.Flags.FFlagTTOnboardingSheet),
		FFlagClaimSheetWaitForCampaignStrings = require(v1.Flags.FFlagClaimSheetWaitForCampaignStrings),
		FFlagSubscriptionSheetCampaignLocalizations = require(Parent.SharedFlags).FFlagSubscriptionSheetCampaignLocalizations
	},
	Components = {
		BlackbirdUpsellBanner = require(v1.Components.BlackbirdUpsellBanner),
		RobloxPlusUpsellBanner = require(v1.Components.RobloxPlusUpsellBanner)
	},
	Network = {
		getRobloxSubscriptionProducts = require(v1.Network.getRobloxSubscriptionProducts),
		claimTrial = require(v1.Network.claimTrial)
	},
	RobloxSubscriptionSignals = require(v1.Store.RobloxSubscriptionSignals),
	CampaignLocalizations = require(v1.Store.CampaignLocalizations),
	Utils = {
		getSubscriptionPurchaseCloseCallback = require(v1.Utils.getSubscriptionPurchaseCloseCallback)
	},
	["jest.config"] = script["jest.config"]
}