local getAllUserOffersModule = require(script.Api.getAllUserOffers)
local getOffersStoreModule = require(script.Stores.GetOffersStore)
local _ = require(script.Stores.GetOffersStore.createOffersStore)
local _ = require(script.Types)

return {
	getAllUserOffers = getAllUserOffersModule,
	getOffersStore = getOffersStoreModule,
	FeatureKeys = require(script.Enums.FeatureKey),
	NotificationLocation = require(script.Enums.NotificationLocation),
	OfferStatuses = require(script.Enums.OfferStatus),
	Hooks = {
		useOfferBadgeText = require(script.Hooks.useOfferBadgeText),
		useOffersForKey = require(script.Hooks.useOffersForKey),
		useRemainingTimeText = require(script.Hooks.useRemainingTimeText)
	},
	Utils = {
		createOfferBadgeTextSignal = require(script.Utils.createOfferBadgeTextSignal),
		getOfferBadgeText = require(script.Utils.getOfferBadgeText),
		getOffersForKey = require(script.Utils.getOffersForKey),
		getRemainingTimeText = require(script.Utils.getRemainingTimeText),
		isNotificationEligible = require(script.Utils.isNotificationEligible),
		selectActiveOffer = require(script.Utils.selectActiveOffer)
	},
	["jest.config"] = script["jest.config"]
}