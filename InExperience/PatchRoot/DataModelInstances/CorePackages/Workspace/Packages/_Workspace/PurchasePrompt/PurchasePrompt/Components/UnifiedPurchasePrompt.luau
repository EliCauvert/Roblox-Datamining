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

return function(p0)
	-- upvalues: reactModule (ref), setProductPayloadModule (ref), setPurchaseCallbacksModule (ref), setPostPurchaseActionsModule (ref), setPurchaseAnalyticsMetadataModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), setPurchaseOptionsModule (ref), dispatchPurchaseForProductPayloadModule (ref), purchasePromptAppModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref)
	local store = p0.store
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), store (ref), setProductPayloadModule (copy), setPurchaseCallbacksModule (copy), setPostPurchaseActionsModule (copy), setPurchaseAnalyticsMetadataModule (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), setPurchaseOptionsModule (copy), dispatchPurchaseForProductPayloadModule (copy)
		local productPayload = p0.productPayload
		store:dispatch(setProductPayloadModule(productPayload))
		
		if p0.purchaseCallbacks then
			store:dispatch(setPurchaseCallbacksModule(p0.purchaseCallbacks))
		end
		if p0.postPurchaseActions then
			store:dispatch(setPostPurchaseActionsModule(p0.postPurchaseActions))
		end
		if p0.purchaseAnalyticsMetadata then
			store:dispatch(setPurchaseAnalyticsMetadataModule({
				surface = p0.purchaseAnalyticsMetadata.surface,
				productUniverseId = p0.purchaseAnalyticsMetadata.productUniverseId
			}))
		end
		if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p0.purchaseOptions then
			store:dispatch(setPurchaseOptionsModule(p0.purchaseOptions))
		end
		dispatchPurchaseForProductPayloadModule(function(p1)
			-- upvalues: store (copy)
			store:dispatch(p1)
		end, productPayload, nil, false)
	end, {
		p0.productPayload,
		p0.purchaseCallbacks,
		p0.postPurchaseActions
	})
	
	return reactModule.createElement(purchasePromptAppModule, {
		store = store,
		network = if fFlagPurchasePromptCartPricingEnabledModule then p0.network else nil,
		subtitleView = if fFlagPurchasePromptSubtitleForTimedOptions then p0.subtitleView else nil
	})
end