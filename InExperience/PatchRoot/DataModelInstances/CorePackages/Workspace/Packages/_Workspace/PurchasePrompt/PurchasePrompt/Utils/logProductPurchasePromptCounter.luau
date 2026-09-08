local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local productPurchasePromptCounter = require(parent.IAPExperience).Counters.ProductPurchasePromptCounter.ProductPurchasePromptCounter
local default = require(parent.LoggingProtocol).default
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local fFlagFixPurchasingErrorCounterModule = require(purchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local fFlagAddSurfaceAndProductTypeToPromptCounterModule = require(purchasePrompt.Flags.FFlagAddSurfaceAndProductTypeToPromptCounter)

return function(p1, p2, p3, p4)
	-- upvalues: fFlagFixPurchasingErrorCounterModule (ref), default (ref), productPurchasePromptCounter (ref), purchaseErrorModule (ref), fFlagAddSurfaceAndProductTypeToPromptCounterModule (ref), promptStateModule (ref)
	if fFlagFixPurchasingErrorCounterModule then
		default:logRobloxTelemetryCounter(productPurchasePromptCounter, 1, {
			promptState = tostring(p1),
			purchaseError = if purchaseErrorModule.isMember(p2) then tostring(p2) else tostring(purchaseErrorModule.UnknownFailure),
			surface = if fFlagAddSurfaceAndProductTypeToPromptCounterModule then p3 or "Unknown" else nil,
			productType = if fFlagAddSurfaceAndProductTypeToPromptCounterModule then p4 or "Unknown" else nil
		})
		
		return
	end
	default:logRobloxTelemetryCounter(productPurchasePromptCounter, 1, {
		promptState = tostring(p1),
		purchaseError = if p1 == promptStateModule.Error then tostring(p2) else "",
		surface = if fFlagAddSurfaceAndProductTypeToPromptCounterModule then p3 or "Unknown" else nil,
		productType = if fFlagAddSurfaceAndProductTypeToPromptCounterModule then p4 or "Unknown" else nil
	})
end