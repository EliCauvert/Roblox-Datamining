return {
	Enums = {
		ProductKind = require(script.Enums.ProductKind),
		ProductPurchaseSurface = require(script.Enums.ProductPurchaseSurface),
		PurchaseLookItemStatusEnum = require(script.Enums.PurchaseLookItemStatusEnum),
		PurchaseLookStatusEnum = require(script.Enums.PurchaseLookStatusEnum)
	},
	Events = require(script.Events.PurchaseEvents),
	Thunks = {
		OpenCentralOverlayForUnifiedPurchasePrompt = require(script.State.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
	},
	getIsUserEligibleForUnifiedPurchaseFlow = require(script.Utils.getIsUserEligibleForUnifiedPurchaseFlow),
	getTTIEventName = require(script.Utils.getTTIEventName),
	["jest.config"] = script["jest.config"]
}