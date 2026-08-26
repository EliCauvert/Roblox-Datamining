local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local marketplaceService = game:GetService("MarketplaceService")
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local clearProductInfoCachesModule = require(purchasePrompt.Utils.clearProductInfoCaches)
local shouldCheckSubscriptionMembershipForProductTypeModule = require(purchasePrompt.Utils.shouldCheckSubscriptionMembershipForProductType)
local fFlagEnablePriceChangedErrorHandlingModule = require(purchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)
local clearProductInfoCachesOnPriceChanged = game:DefineFastFlag("ClearProductInfoCachesOnPriceChanged", false)
local enableConvertPriceChangedToUnknownFailure = game:DefineFastFlag("EnableConvertPriceChangedToUnknownFailure", false)
local enableSignalCheckPlayerHasRobloxSubscriptionEngineFeature = game:GetEngineFeature("EnableSignalCheckPlayerHasRobloxSubscription")

return function(p1, p2, p3)
	-- upvalues: fFlagEnablePriceChangedErrorHandlingModule (ref), purchaseErrorModule (ref), clearProductInfoCachesOnPriceChanged (ref), clearProductInfoCachesModule (ref), enableSignalCheckPlayerHasRobloxSubscriptionEngineFeature (ref), shouldCheckSubscriptionMembershipForProductTypeModule (ref), marketplaceService (ref), enableConvertPriceChangedToUnknownFailure (ref), errorOccurredModule (ref)
	if not fFlagEnablePriceChangedErrorHandlingModule then
		return false
	elseif p2 ~= purchaseErrorModule.PriceChanged then
		return false
	elseif clearProductInfoCachesOnPriceChanged then
		clearProductInfoCachesModule()
	end
	if enableSignalCheckPlayerHasRobloxSubscriptionEngineFeature and shouldCheckSubscriptionMembershipForProductTypeModule(p3) then
		marketplaceService:signalCheckPlayerHasRobloxSubscription()
	end
	p1:dispatch(errorOccurredModule(if enableConvertPriceChangedToUnknownFailure then purchaseErrorModule.UnknownFailure else purchaseErrorModule.PriceChanged))
	
	return true
end