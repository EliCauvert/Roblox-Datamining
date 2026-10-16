local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local ProductPurchasePromptCounter = require(Parent.IAPExperience).Counters.ProductPurchasePromptCounter.ProductPurchasePromptCounter
local Default = require(Parent.LoggingProtocol).default
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local FFlagFixPurchasingErrorCounterModule = require(PurchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local FFlagAddSurfaceAndProductTypeToPromptCounterModule = require(PurchasePrompt.Flags.FFlagAddSurfaceAndProductTypeToPromptCounter)

return function(Error, p1, p2, p3) --[[ Line: 12 | Named "logProductPurchasePromptCounter" ]]
	-- upvalues: FFlagFixPurchasingErrorCounterModule (copy), Default (copy), ProductPurchasePromptCounter (copy), PurchaseErrorModule (copy), FFlagAddSurfaceAndProductTypeToPromptCounterModule (copy), PromptStateModule (copy)
	if FFlagFixPurchasingErrorCounterModule then
		Default:logRobloxTelemetryCounter(ProductPurchasePromptCounter, 1, {
			promptState = tostring(Error),
			purchaseError = if PurchaseErrorModule.isMember(p1) then tostring(p1) else tostring(PurchaseErrorModule.UnknownFailure),
			surface = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p2 or "Unknown" else nil,
			productType = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p3 or "Unknown" else nil
		})
		
		return
	else
		Default:logRobloxTelemetryCounter(ProductPurchasePromptCounter, 1, {
			promptState = tostring(Error),
			purchaseError = if Error == PromptStateModule.Error then tostring(p1) else "",
			surface = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p2 or "Unknown" else nil,
			productType = if FFlagAddSurfaceAndProductTypeToPromptCounterModule then p3 or "Unknown" else nil
		})
	end
end