local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local MarketplaceService = game:GetService("MarketplaceService")
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local ClearProductInfoCachesModule = require(PurchasePrompt.Utils.clearProductInfoCaches)
local ShouldCheckSubscriptionMembershipForProductTypeModule = require(PurchasePrompt.Utils.shouldCheckSubscriptionMembershipForProductType)
local FFlagEnablePriceChangedErrorHandlingModule = require(PurchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)
local ClearProductInfoCachesOnPriceChanged = game:DefineFastFlag("ClearProductInfoCachesOnPriceChanged", false)
local EnableConvertPriceChangedToUnknownFailure = game:DefineFastFlag("EnableConvertPriceChangedToUnknownFailure", false)
local EnableSignalCheckPlayerHasRobloxSubscriptionEngineFeature = game:GetEngineFeature("EnableSignalCheckPlayerHasRobloxSubscription")

return function(p1, PriceChanged, p2): boolean --[[ Line: 20 | Named "handlePriceChangedError" ]]
	-- upvalues: FFlagEnablePriceChangedErrorHandlingModule (copy), PurchaseErrorModule (copy), ClearProductInfoCachesOnPriceChanged (copy), ClearProductInfoCachesModule (copy), EnableSignalCheckPlayerHasRobloxSubscriptionEngineFeature (copy), ShouldCheckSubscriptionMembershipForProductTypeModule (copy), MarketplaceService (copy), EnableConvertPriceChangedToUnknownFailure (copy), ErrorOccurredModule (copy)
	if not FFlagEnablePriceChangedErrorHandlingModule then
		return false
	end
	if PriceChanged ~= PurchaseErrorModule.PriceChanged then
		return false
	end
	if ClearProductInfoCachesOnPriceChanged then
		ClearProductInfoCachesModule()
	end
	if EnableSignalCheckPlayerHasRobloxSubscriptionEngineFeature and ShouldCheckSubscriptionMembershipForProductTypeModule(p2) then
		MarketplaceService:signalCheckPlayerHasRobloxSubscription()
	end
	p1:dispatch(ErrorOccurredModule(if EnableConvertPriceChangedToUnknownFailure then PurchaseErrorModule.UnknownFailure else PurchaseErrorModule.PriceChanged))
	
	return true
end