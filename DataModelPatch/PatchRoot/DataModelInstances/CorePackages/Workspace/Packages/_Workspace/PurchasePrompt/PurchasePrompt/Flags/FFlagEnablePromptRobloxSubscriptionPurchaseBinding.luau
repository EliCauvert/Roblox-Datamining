local FFlagBlackbirdUpsellVersion = require(script:FindFirstAncestor("PurchasePrompt").Parent.SharedFlags).FFlagBlackbirdUpsellVersion

return game:DefineFastFlag("EnablePromptRobloxSubscriptionPurchaseBinding2", false) and (FFlagBlackbirdUpsellVersion and game:GetEngineFeature("EnablePromptRobloxSubscriptionPurchase"))