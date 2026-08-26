local getAllUserOffersModule = require(script.Api.getAllUserOffers)
local getOffersStoreModule = require(script.Stores.GetOffersStore)
local _ = require(script.Stores.GetOffersStore.createOffersStore)
local _ = require(script.Types)

return {
	getAllUserOffers = getAllUserOffersModule,
	getOffersStore = getOffersStoreModule,
	FeatureKeys = require(script.Enums.FeatureKey),
	Hooks = {
		useOffersForKey = require(script.Hooks.useOffersForKey),
		useRemainingTimeText = require(script.Hooks.useRemainingTimeText)
	},
	Utils = {
		getOffersForKey = require(script.Utils.getOffersForKey),
		getRemainingTimeText = require(script.Utils.getRemainingTimeText),
		selectActiveOffer = require(script.Utils.selectActiveOffer)
	},
	["jest.config"] = script["jest.config"]
}