local PurchaseErrorsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.PurchaseErrors)

return {
	[PurchaseErrorsModule.NotEnoughRobux] = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobux",
	[PurchaseErrorsModule.PurchaseDisabled] = "CoreScripts.PurchasePrompt.PurchaseFailed.PurchaseDisabled",
	[PurchaseErrorsModule.UnknownFailure] = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
	[PurchaseErrorsModule.NotForSale] = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSale",
	[PurchaseErrorsModule.Under13] = "CoreScripts.PurchasePrompt.PurchaseFailed.Under13",
	[PurchaseErrorsModule.AlreadyOwn] = "CoreScripts.PurchasePrompt.PurchaseFailed.AlreadyOwn",
	[PurchaseErrorsModule.TooManyPurchases] = "Feature.Toast.NetworkingError.TooManyRequests",
	[PurchaseErrorsModule.InvalidRequest] = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
	[PurchaseErrorsModule.Unauthorized] = "Feature.Toast.NetworkingError.Unauthorized"
}