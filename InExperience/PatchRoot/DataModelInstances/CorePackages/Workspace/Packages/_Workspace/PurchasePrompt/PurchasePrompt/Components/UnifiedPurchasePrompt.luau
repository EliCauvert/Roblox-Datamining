local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.IAPExperience)
local PurchasePromptAppModule = require(PurchasePrompt.Components.PurchasePromptApp)
local SetPurchaseCallbacksModule = require(PurchasePrompt.Actions.SetPurchaseCallbacks)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local SetProductPayloadModule = require(PurchasePrompt.Actions.SetProductPayload)
local SetPurchaseAnalyticsMetadataModule = require(PurchasePrompt.Actions.SetPurchaseAnalyticsMetadata)
local SetPurchaseOptionsModule = require(PurchasePrompt.Actions.SetPurchaseOptions)
local DispatchPurchaseForProductPayloadModule = require(PurchasePrompt.Utils.dispatchPurchaseForProductPayload)
local _ = require(PurchasePrompt.types)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = SharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagPurchasePromptSubtitleForTimedOptions = SharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local _ = require(PurchasePrompt.types)

return function(p1) --[[ Line: 32 | Named "UnifiedPurchasePrompt" ]]
	-- upvalues: ReactModule (copy), SetProductPayloadModule (copy), SetPurchaseCallbacksModule (copy), SetPostPurchaseActionsModule (copy), SetPurchaseAnalyticsMetadataModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), SetPurchaseOptionsModule (copy), DispatchPurchaseForProductPayloadModule (copy), PurchasePromptAppModule (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy)
	local Store = p1.store
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: p1 (copy), Store (copy), SetProductPayloadModule (upval), SetPurchaseCallbacksModule (upval), SetPostPurchaseActionsModule (upval), SetPurchaseAnalyticsMetadataModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), SetPurchaseOptionsModule (upval), DispatchPurchaseForProductPayloadModule (upval)
		local ProductPayload = p1.productPayload
		Store:dispatch(SetProductPayloadModule(ProductPayload))
		
		if p1.purchaseCallbacks then
			Store:dispatch(SetPurchaseCallbacksModule(p1.purchaseCallbacks))
		end
		if p1.postPurchaseActions then
			Store:dispatch(SetPostPurchaseActionsModule(p1.postPurchaseActions))
		end
		if p1.purchaseAnalyticsMetadata then
			Store:dispatch(SetPurchaseAnalyticsMetadataModule({
				surface = p1.purchaseAnalyticsMetadata.surface,
				productUniverseId = p1.purchaseAnalyticsMetadata.productUniverseId
			}))
		end
		if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow and p1.purchaseOptions then
			Store:dispatch(SetPurchaseOptionsModule(p1.purchaseOptions))
		end
		DispatchPurchaseForProductPayloadModule(function(p2) --[[ Line: 58 ]]
			-- upvalues: Store (upval)
			Store:dispatch(p2)
		end, ProductPayload, nil, false)
	end, {
		p1.productPayload,
		p1.purchaseCallbacks,
		p1.postPurchaseActions
	})
	
	return ReactModule.createElement(PurchasePromptAppModule, {
		store = Store,
		network = p1.network,
		subtitleView = if FFlagPurchasePromptSubtitleForTimedOptions then p1.subtitleView else nil
	})
end