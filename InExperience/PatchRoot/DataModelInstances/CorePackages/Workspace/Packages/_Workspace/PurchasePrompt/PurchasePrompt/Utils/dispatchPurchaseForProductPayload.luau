local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local sharedFlagsModule = require(purchasePrompt.Parent.SharedFlags)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local initiatePurchaseModule = require(purchasePrompt.Thunks.initiatePurchase)
local initiateBundlePurchaseModule = require(purchasePrompt.Thunks.initiateBundlePurchase)
local fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(purchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird

return function(p0, p1, _, p2) --[[ line: 18 | named "dispatchPurchaseForProductPayload" ]]
	-- upvalues: productTypeEnum (ref), initiatePurchaseModule (ref), initiateBundlePurchaseModule (ref), fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (ref), fFlagAXMISWithBlackbird (ref)
	if p1.kind == productTypeEnum.Asset then
		p0(initiatePurchaseModule(p1.id, Enum.InfoType.Asset, p1.equipIfPurchased, p1.isRobloxPurchase, p1.idempotencyKey, nil, p1.collectibleItemId, p1.collectibleItemInstanceId, p1.collectibleProductId, p1.expectedPrice, nil, p2))
		
		return
	elseif p1.kind == productTypeEnum.Gamepass then
		p0(initiatePurchaseModule(p1.id, Enum.InfoType.GamePass, nil, nil, nil, nil, nil, nil, nil, nil, nil, p2))
		
		return
	elseif p1.kind == productTypeEnum.Product then
		p0(initiatePurchaseModule(p1.id, Enum.InfoType.Product, p1.equipIfPurchased, nil, nil, nil, nil, nil, nil, nil, nil, p2))
		
		return
	elseif p1.kind == productTypeEnum.Bundle then
		p0(initiateBundlePurchaseModule(p1.id, p1.idempotencyKey, nil, p1.collectibleItemId, p1.collectibleItemInstanceId, p1.collectibleProductId, p1.expectedPrice, p2))
		
		return
	elseif p1.kind == productTypeEnum.Experience then
		p0(initiatePurchaseModule(p1.universeId, productTypeEnum.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
			name = p1.experienceName,
			imageUrl = p1.experienceIconUrl
		}, p2))
		
		return
	elseif p1.kind == productTypeEnum.Look then
		p0(initiatePurchaseModule(p1.id, productTypeEnum.Look, nil, nil, nil, nil, nil, nil, nil, nil, if fFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then {
			excludedAssetIds = p1.excludedAssetIds,
			excludedBundleIds = p1.excludedBundleIds,
			timedOptions = p1.timedOptions
		} else { expectedPrice = p1.expectedPrice }, p2))
		
		return
	elseif fFlagAXMISWithBlackbird and p1.kind == productTypeEnum.RobuxUpsell then
		p0(initiatePurchaseModule(p1.id, productTypeEnum.RobuxUpsell, nil, nil, nil, nil, nil, nil, nil, nil, nil, false))
		
		return
	elseif p1.kind == productTypeEnum.DeveloperSubscription then
		p0(initiatePurchaseModule(p1.subscriptionId, productTypeEnum.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, p1.expectedPrice, {
			expectedPrice = p1.expectedPrice,
			name = p1.name,
			iconImageAssetId = p1.iconImageAssetId,
			displayPrice = p1.displayPrice
		}, p2))
	end
end