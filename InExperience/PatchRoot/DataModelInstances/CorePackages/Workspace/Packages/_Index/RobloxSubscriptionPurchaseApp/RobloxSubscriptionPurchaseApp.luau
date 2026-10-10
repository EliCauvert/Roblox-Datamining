local _script = script
local robloxSubscriptionFlowCompleteReasonModule = require(_script.Enums.RobloxSubscriptionFlowCompleteReason)
local surfaceNameModule = require(_script.Enums.SurfaceName)
local surfaceContextModule = require(_script.Enums.SurfaceContext)
local purchaseClientSessionIdTypeModule = require(_script.Enums.PurchaseClientSessionIdType)
local subscriptionGrantTypeModule = require(_script.Enums.SubscriptionGrantType)
local fFlagEnablePlusReferralEntrypointTelemetry = require(_script.Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry
local _ = require(_script.types)

return {
	initiateRobloxSubscriptionPurchase = require(script.Flows.initiateRobloxSubscriptionPurchase),
	startRobloxSubscriptionPurchaseFromUpsell = require(script.Flows.startRobloxSubscriptionPurchaseFromUpsell),
	SurfaceContext = surfaceContextModule,
	SurfaceName = surfaceNameModule,
	Entrypoint = if fFlagEnablePlusReferralEntrypointTelemetry then if fFlagEnablePlusReferralEntrypointTelemetry then require(_script.Enums.Entrypoint) else nil else nil,
	PurchaseClientSessionIdType = purchaseClientSessionIdTypeModule,
	RobloxSubscriptionFlowCompleteReason = robloxSubscriptionFlowCompleteReasonModule,
	SubscriptionGrantType = subscriptionGrantTypeModule,
	Components = {
		BlackbirdUpsellBanner = require(_script.Components.BlackbirdUpsellBanner),
		RobloxPlusUpsellBanner = require(_script.Components.RobloxPlusUpsellBanner)
	},
	Network = {
		getRobloxSubscriptionProducts = require(_script.Network.getRobloxSubscriptionProducts),
		claimTrial = require(_script.Network.claimTrial)
	},
	RobloxSubscriptionSignals = require(_script.Store.RobloxSubscriptionSignals),
	Utils = {
		getSubscriptionPurchaseCloseCallback = require(_script.Utils.getSubscriptionPurchaseCloseCallback)
	},
	["jest.config"] = script["jest.config"]
}