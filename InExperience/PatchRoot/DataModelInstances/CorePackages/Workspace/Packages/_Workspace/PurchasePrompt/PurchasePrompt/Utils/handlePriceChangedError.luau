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

return function(p0, p1, p2) --[[ line: 20 | named "handlePriceChangedError" ]]
	-- upvalues: fFlagEnablePriceChangedErrorHandlingModule (ref), purchaseErrorModule (ref), clearProductInfoCachesOnPriceChanged (ref), clearProductInfoCachesModule (ref), enableSignalCheckPlayerHasRobloxSubscriptionEngineFeature (ref), shouldCheckSubscriptionMembershipForProductTypeModule (ref), marketplaceService (ref), enableConvertPriceChangedToUnknownFailure (ref), errorOccurredModule (ref)
	if not fFlagEnablePriceChangedErrorHandlingModule then
		return false
	elseif p1 ~= purchaseErrorModule.PriceChanged then
		return false
	elseif clearProductInfoCachesOnPriceChanged then
		clearProductInfoCachesModule()
	end
	if enableSignalCheckPlayerHasRobloxSubscriptionEngineFeature and shouldCheckSubscriptionMembershipForProductTypeModule(p2) then
		marketplaceService:signalCheckPlayerHasRobloxSubscription()
	end
	p0:dispatch(errorOccurredModule(if enableConvertPriceChangedToUnknownFailure then purchaseErrorModule.UnknownFailure else purchaseErrorModule.PriceChanged))
	
	return true
end