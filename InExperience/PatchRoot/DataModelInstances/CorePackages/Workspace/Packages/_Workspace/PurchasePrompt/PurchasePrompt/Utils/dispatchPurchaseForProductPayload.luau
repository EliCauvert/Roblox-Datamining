local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local sharedFlagsModule = require(purchasePrompt.Parent.SharedFlags)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local initiatePurchaseModule = require(purchasePrompt.Thunks.initiatePurchase)
local initiateBundlePurchaseModule = require(purchasePrompt.Thunks.initiateBundlePurchase)
local fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(purchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird

return function(p1, p2, _, p3)
	-- upvalues: productTypeEnum (ref), initiatePurchaseModule (ref), initiateBundlePurchaseModule (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), fFlagAXMISWithBlackbird (ref)
	if p2.kind == productTypeEnum.Asset then
		p1(initiatePurchaseModule(p2.id, Enum.InfoType.Asset, p2.equipIfPurchased, p2.isRobloxPurchase, p2.idempotencyKey, nil, p2.collectibleItemId, p2.collectibleItemInstanceId, p2.collectibleProductId, p2.expectedPrice, nil, p3))
		
		return
	elseif p2.kind == productTypeEnum.Gamepass then
		p1(initiatePurchaseModule(p2.id, Enum.InfoType.GamePass, nil, nil, nil, nil, nil, nil, nil, nil, nil, p3))
		
		return
	elseif p2.kind == productTypeEnum.Product then
		p1(initiatePurchaseModule(p2.id, Enum.InfoType.Product, p2.equipIfPurchased, nil, nil, nil, nil, nil, nil, nil, nil, p3))
		
		return
	elseif p2.kind == productTypeEnum.Bundle then
		p1(initiateBundlePurchaseModule(p2.id, p2.idempotencyKey, nil, p2.collectibleItemId, p2.collectibleItemInstanceId, p2.collectibleProductId, p2.expectedPrice, p3))
		
		return
	elseif p2.kind == productTypeEnum.Experience then
		p1(initiatePurchaseModule(p2.universeId, productTypeEnum.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
			name = p2.experienceName,
			imageUrl = p2.experienceIconUrl
		}, p3))
		
		return
	elseif p2.kind == productTypeEnum.Look then
		p1(initiatePurchaseModule(p2.id, productTypeEnum.Look, nil, nil, nil, nil, nil, nil, nil, nil, if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then {
			excludedAssetIds = p2.excludedAssetIds,
			excludedBundleIds = p2.excludedBundleIds,
			timedOptions = p2.timedOptions
		} else { expectedPrice = p2.expectedPrice }, p3))
		
		return
	elseif fFlagAXMISWithBlackbird and p2.kind == productTypeEnum.RobuxUpsell then
		p1(initiatePurchaseModule(p2.id, productTypeEnum.RobuxUpsell, nil, nil, nil, nil, nil, nil, nil, nil, nil, false))
		
		return
	elseif p2.kind == productTypeEnum.DeveloperSubscription then
		p1(initiatePurchaseModule(p2.subscriptionId, productTypeEnum.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, p2.expectedPrice, {
			expectedPrice = p2.expectedPrice,
			name = p2.name,
			iconImageAssetId = p2.iconImageAssetId,
			displayPrice = p2.displayPrice
		}, p3))
	end
end