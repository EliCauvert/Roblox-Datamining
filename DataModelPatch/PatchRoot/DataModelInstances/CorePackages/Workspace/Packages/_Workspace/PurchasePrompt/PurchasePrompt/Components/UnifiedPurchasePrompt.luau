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
local InitiatePurchaseModule = require(PurchasePrompt.Thunks.initiatePurchase)
local InitiateBundlePurchaseModule = require(PurchasePrompt.Thunks.initiateBundlePurchase)
local DispatchPurchaseForProductPayloadModule = require(PurchasePrompt.Utils.dispatchPurchaseForProductPayload)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXMISWithBlackbird = SharedFlagsModule.FFlagAXMISWithBlackbird
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = SharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagPurchasePromptSubtitleForTimedOptions = SharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local _ = SharedFlagsModule.FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local FFlagRefactorUnifiedPurchasePromptModule = require(PurchasePrompt.Flags.FFlagRefactorUnifiedPurchasePrompt)
local FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(PurchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local _ = require(PurchasePrompt.types)

return function(p1)
	-- upvalues: ReactModule (copy), SetProductPayloadModule (copy), SetPurchaseCallbacksModule (copy), SetPostPurchaseActionsModule (copy), SetPurchaseAnalyticsMetadataModule (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), SetPurchaseOptionsModule (copy), FFlagRefactorUnifiedPurchasePromptModule (copy), DispatchPurchaseForProductPayloadModule (copy), ProductTypeEnum (copy), InitiatePurchaseModule (copy), InitiateBundlePurchaseModule (copy), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (copy), FFlagAXMISWithBlackbird (copy), PurchasePromptAppModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy)
	local Store = p1.store
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Store (copy), SetProductPayloadModule (upval), SetPurchaseCallbacksModule (upval), SetPostPurchaseActionsModule (upval), SetPurchaseAnalyticsMetadataModule (upval), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (upval), SetPurchaseOptionsModule (upval), FFlagRefactorUnifiedPurchasePromptModule (upval), DispatchPurchaseForProductPayloadModule (upval), ProductTypeEnum (upval), InitiatePurchaseModule (upval), InitiateBundlePurchaseModule (upval), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (upval), FFlagAXMISWithBlackbird (upval)
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
		if FFlagRefactorUnifiedPurchasePromptModule then
			DispatchPurchaseForProductPayloadModule(function(p2)
				-- upvalues: Store (upval)
				Store:dispatch(p2)
			end, ProductPayload, nil, false)
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.Asset then
			Store:dispatch(InitiatePurchaseModule(ProductPayload.id, Enum.InfoType.Asset, ProductPayload.equipIfPurchased, ProductPayload.isRobloxPurchase, ProductPayload.idempotencyKey, nil, ProductPayload.collectibleItemId, ProductPayload.collectibleItemInstanceId, ProductPayload.collectibleProductId, ProductPayload.expectedPrice))
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.Gamepass then
			Store:dispatch(InitiatePurchaseModule(ProductPayload.id, Enum.InfoType.GamePass))
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.Product then
			Store:dispatch(InitiatePurchaseModule(ProductPayload.id, Enum.InfoType.Product, ProductPayload.equipIfPurchased))
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.Bundle then
			Store:dispatch(InitiateBundlePurchaseModule(ProductPayload.id, ProductPayload.idempotencyKey, nil, ProductPayload.collectibleItemId, ProductPayload.collectibleItemInstanceId, ProductPayload.collectibleProductId, ProductPayload.expectedPrice))
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.Experience then
			Store:dispatch(InitiatePurchaseModule(ProductPayload.universeId, ProductTypeEnum.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
				name = ProductPayload.experienceName,
				imageUrl = ProductPayload.experienceIconUrl
			}))
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.Look then
			Store:dispatch(InitiatePurchaseModule(ProductPayload.id, ProductTypeEnum.Look, nil, nil, nil, nil, nil, nil, nil, nil, if FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then {
				expectedPrice = ProductPayload.expectedPrice,
				excludedAssetIds = ProductPayload.excludedAssetIds,
				excludedBundleIds = ProductPayload.excludedBundleIds,
				timedOptions = ProductPayload.timedOptions
			} else { expectedPrice = ProductPayload.expectedPrice }))
			
			return
		end
		if FFlagAXMISWithBlackbird and ProductPayload.kind == ProductTypeEnum.RobuxUpsell then
			Store:dispatch(InitiatePurchaseModule(nil, ProductTypeEnum.RobuxUpsell, nil, nil, nil, nil, nil, nil, nil, nil, nil))
			
			return
		end
		if ProductPayload.kind == ProductTypeEnum.DeveloperSubscription then
			Store:dispatch(InitiatePurchaseModule(ProductPayload.subscriptionId, ProductTypeEnum.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, ProductPayload.expectedPrice, {
				expectedPrice = ProductPayload.expectedPrice,
				name = ProductPayload.name,
				iconImageAssetId = ProductPayload.iconImageAssetId,
				displayPrice = ProductPayload.displayPrice
			}))
		end
	end, {
		p1.productPayload,
		p1.purchaseCallbacks,
		p1.postPurchaseActions
	})
	
	return ReactModule.createElement(PurchasePromptAppModule, {
		store = Store,
		network = if FFlagPurchasePromptCartPricingEnabledModule then p1.network else nil,
		subtitleView = if FFlagPurchasePromptSubtitleForTimedOptions then p1.subtitleView else nil
	})
end