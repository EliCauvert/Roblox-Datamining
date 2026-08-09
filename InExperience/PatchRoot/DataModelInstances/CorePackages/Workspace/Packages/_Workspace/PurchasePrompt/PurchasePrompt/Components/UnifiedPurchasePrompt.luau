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
local initiatePurchaseModule = require(purchasePrompt.Thunks.initiatePurchase)
local initiateBundlePurchaseModule = require(purchasePrompt.Thunks.initiateBundlePurchase)
local dispatchPurchaseForProductPayloadModule = require(purchasePrompt.Utils.dispatchPurchaseForProductPayload)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = sharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagPurchasePromptSubtitleForTimedOptions = sharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local _ = sharedFlagsModule.FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local fFlagRefactorUnifiedPurchasePromptModule = require(purchasePrompt.Flags.FFlagRefactorUnifiedPurchasePrompt)
local fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(purchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local _ = require(purchasePrompt.types)

return function(p0) --[[ line: 42 | named "UnifiedPurchasePrompt" ]]
	-- upvalues: reactModule (ref), setProductPayloadModule (ref), setPurchaseCallbacksModule (ref), setPostPurchaseActionsModule (ref), setPurchaseAnalyticsMetadataModule (ref), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), setPurchaseOptionsModule (ref), fFlagRefactorUnifiedPurchasePromptModule (ref), dispatchPurchaseForProductPayloadModule (ref), productTypeEnum (ref), initiatePurchaseModule (ref), initiateBundlePurchaseModule (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), fFlagAXMISWithBlackbird (ref), purchasePromptAppModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagPurchasePromptSubtitleForTimedOptions (ref)
	local store = p0.store
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: p0 (ref), store (ref), setProductPayloadModule (copy), setPurchaseCallbacksModule (copy), setPostPurchaseActionsModule (copy), setPurchaseAnalyticsMetadataModule (copy), fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), setPurchaseOptionsModule (copy), fFlagRefactorUnifiedPurchasePromptModule (copy), dispatchPurchaseForProductPayloadModule (copy), productTypeEnum (copy), initiatePurchaseModule (copy), initiateBundlePurchaseModule (copy), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (copy), fFlagAXMISWithBlackbird (copy)
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
		if fFlagRefactorUnifiedPurchasePromptModule then
			dispatchPurchaseForProductPayloadModule(function(p1) --[[ line: 69 ]]
				-- upvalues: store (copy)
				store:dispatch(p1)
			end, productPayload, nil, false)
			
			return
		elseif productPayload.kind == productTypeEnum.Asset then
			store:dispatch(initiatePurchaseModule(productPayload.id, Enum.InfoType.Asset, productPayload.equipIfPurchased, productPayload.isRobloxPurchase, productPayload.idempotencyKey, nil, productPayload.collectibleItemId, productPayload.collectibleItemInstanceId, productPayload.collectibleProductId, productPayload.expectedPrice))
			
			return
		elseif productPayload.kind == productTypeEnum.Gamepass then
			store:dispatch(initiatePurchaseModule(productPayload.id, Enum.InfoType.GamePass))
			
			return
		elseif productPayload.kind == productTypeEnum.Product then
			store:dispatch(initiatePurchaseModule(productPayload.id, Enum.InfoType.Product, productPayload.equipIfPurchased))
			
			return
		elseif productPayload.kind == productTypeEnum.Bundle then
			store:dispatch(initiateBundlePurchaseModule(productPayload.id, productPayload.idempotencyKey, nil, productPayload.collectibleItemId, productPayload.collectibleItemInstanceId, productPayload.collectibleProductId, productPayload.expectedPrice))
			
			return
		elseif productPayload.kind == productTypeEnum.Experience then
			store:dispatch(initiatePurchaseModule(productPayload.universeId, productTypeEnum.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
				name = productPayload.experienceName,
				imageUrl = productPayload.experienceIconUrl
			}))
			
			return
		elseif productPayload.kind == productTypeEnum.Look then
			store:dispatch(initiatePurchaseModule(productPayload.id, productTypeEnum.Look, nil, nil, nil, nil, nil, nil, nil, nil, if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then {
				expectedPrice = productPayload.expectedPrice,
				excludedAssetIds = productPayload.excludedAssetIds,
				excludedBundleIds = productPayload.excludedBundleIds,
				timedOptions = productPayload.timedOptions
			} else { expectedPrice = productPayload.expectedPrice }))
			
			return
		elseif fFlagAXMISWithBlackbird and productPayload.kind == productTypeEnum.RobuxUpsell then
			store:dispatch(initiatePurchaseModule(nil, productTypeEnum.RobuxUpsell, nil, nil, nil, nil, nil, nil, nil, nil, nil))
			
			return
		elseif productPayload.kind == productTypeEnum.DeveloperSubscription then
			store:dispatch(initiatePurchaseModule(productPayload.subscriptionId, productTypeEnum.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, productPayload.expectedPrice, {
				expectedPrice = productPayload.expectedPrice,
				name = productPayload.name,
				iconImageAssetId = productPayload.iconImageAssetId,
				displayPrice = productPayload.displayPrice
			}))
		end
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