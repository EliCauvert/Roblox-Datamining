local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(script:FindFirstAncestor("BulkPurchaseApp").Flags.FFlagAXAddPlusUpsellToBulkPurchase)

return game:DefineFastFlag("AXAddOffersToBulkPurchase", false) and (FFlagAXAddPlusUpsellToBulkPurchaseModule and (game:GetEngineFeature("PromptBulkPurchaseRequestedV3EventEnabled") and game:GetEngineFeature("BulkPurchaseOffersEnabled")))