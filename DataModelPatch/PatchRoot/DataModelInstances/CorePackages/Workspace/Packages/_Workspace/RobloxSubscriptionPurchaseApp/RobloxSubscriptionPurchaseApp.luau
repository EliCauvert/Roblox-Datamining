local v1 = script
local _ = require(v1.types)

return {
	FFlagRobloxPlusFAEFreeTrial = require(v1.Flags.FFlagRobloxPlusFAEFreeTrial),
	initiateRobloxSubscriptionPurchase = require(script.Flows.initiateRobloxSubscriptionPurchase),
	startRobloxSubscriptionPurchaseFromUpsell = require(script.Flows.startRobloxSubscriptionPurchaseFromUpsell),
	SurfaceContext = require(v1.Enums.SurfaceContext),
	SurfaceName = require(v1.Enums.SurfaceName),
	PurchaseClientSessionIdType = require(v1.Enums.PurchaseClientSessionIdType),
	RobloxSubscriptionFlowCompleteReason = require(v1.Enums.RobloxSubscriptionFlowCompleteReason),
	SubscriptionGrantType = require(v1.Enums.SubscriptionGrantType),
	Components = {
		BlackbirdUpsellBanner = require(v1.Components.BlackbirdUpsellBanner)
	},
	Network = {
		getRobloxSubscriptionProducts = require(v1.Network.getRobloxSubscriptionProducts),
		claimTrial = require(v1.Network.claimTrial)
	},
	RobloxSubscriptionSignals = require(v1.Store.RobloxSubscriptionSignals),
	Utils = {
		getSubscriptionPurchaseCloseCallback = require(v1.Utils.getSubscriptionPurchaseCloseCallback)
	},
	["jest.config"] = script["jest.config"]
}