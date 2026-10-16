local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local reactModule = require(parent.React)
local _ = require(parent.IAPExperience)
local purchasePromptAppModule = require(purchasePrompt.Components.PurchasePromptApp)
local setPurchaseCallbacksModule = require(purchasePrompt.Actions.SetPurchaseCallbacks)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)
local setPurchaseAnalyticsMetadataModule = require(purchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local setPurchaseOptionsModule = require(purchasePrompt.Actions.SetPurchaseOptions)
local dispatchPurchaseForProductPayloadModule = require(purchasePrompt.Utils.dispatchPurchaseForProductPayload)
local _ = require(purchasePrompt.types)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = sharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagPurchasePromptSubtitleForTimedOptions = sharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local _ = sharedFlagsModule.FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local _ = require(purchasePrompt.types)

return function(p1)
	-- upvalues: reactModule (ref), setProductPayloadModule (ref), setPurchaseCallbacksModule (ref), setPostPurchaseActionsModule (ref), setPurchaseAnalyticsMetadataModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), setPurchaseOptionsModule (ref), dispatchPurchaseForProductPayloadModule (ref), purchasePromptAppModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref)
	local store = p1.store
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), store (ref), setProductPayloadModule (copy), setPurchaseCallbacksModule (copy), setPostPurchaseActionsModule (copy), setPurchaseAnalyticsMetadataModule (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), setPurchaseOptionsModule (copy), dispatchPurchaseForProductPayloadModule (copy)
		local productPayload = p1.productPayload
		store:dispatch(setProductPayloadModule(productPayload))
		
		if p1.purchaseCallbacks then
			store:dispatch(setPurchaseCallbacksModule(p1.purchaseCallbacks))
		end
		if p1.postPurchaseActions then
			store:dispatch(setPostPurchaseActionsModule(p1.postPurchaseActions))
		end
		if p1.purchaseAnalyticsMetadata then
			store:dispatch(setPurchaseAnalyticsMetadataModule({
				surface = p1.purchaseAnalyticsMetadata.surface,
				productUniverseId = p1.purchaseAnalyticsMetadata.productUniverseId
			}))
		end
		if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p1.purchaseOptions then
			store:dispatch(setPurchaseOptionsModule(p1.purchaseOptions))
		end
		dispatchPurchaseForProductPayloadModule(function(p2)
			-- upvalues: store (copy)
			store:dispatch(p2)
		end, productPayload, nil, false)
	end, {
		p1.productPayload,
		p1.purchaseCallbacks,
		p1.postPurchaseActions
	})
	
	return reactModule.createElement(purchasePromptAppModule, {
		store = store,
		network = if fFlagPurchasePromptCartPricingEnabledModule then p1.network else nil,
		subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then p1.subtitleView else nil
	})
end