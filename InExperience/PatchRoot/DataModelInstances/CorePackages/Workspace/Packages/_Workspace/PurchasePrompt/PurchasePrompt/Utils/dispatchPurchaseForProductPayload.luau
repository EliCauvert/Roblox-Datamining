local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local SharedFlagsModule = require(PurchasePrompt.Parent.SharedFlags)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local InitiatePurchaseModule = require(PurchasePrompt.Thunks.initiatePurchase)
local InitiateBundlePurchaseModule = require(PurchasePrompt.Thunks.initiateBundlePurchase)
local FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule = require(PurchasePrompt.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local FFlagAXMISWithBlackbird = SharedFlagsModule.FFlagAXMISWithBlackbird
local FFlagLuaAppsEnablePromptVIPServerPurchase = SharedFlagsModule.FFlagLuaAppsEnablePromptVIPServerPurchase

return function(Callback: (any) -> (), p1, _, p2)
	-- upvalues: ProductTypeEnum (copy), InitiatePurchaseModule (copy), InitiateBundlePurchaseModule (copy), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule (copy), FFlagAXMISWithBlackbird (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy)
	if p1.kind == ProductTypeEnum.Asset then
		Callback(InitiatePurchaseModule(p1.id, Enum.InfoType.Asset, p1.equipIfPurchased, p1.isRobloxPurchase, p1.idempotencyKey, nil, p1.collectibleItemId, p1.collectibleItemInstanceId, p1.collectibleProductId, p1.expectedPrice, nil, p2))
		
		return
	end
	if p1.kind == ProductTypeEnum.Gamepass then
		Callback(InitiatePurchaseModule(p1.id, Enum.InfoType.GamePass, nil, nil, nil, nil, nil, nil, nil, nil, nil, p2))
		
		return
	end
	if p1.kind == ProductTypeEnum.Product then
		Callback(InitiatePurchaseModule(p1.id, Enum.InfoType.Product, p1.equipIfPurchased, nil, nil, nil, nil, nil, nil, nil, nil, p2))
		
		return
	end
	if p1.kind == ProductTypeEnum.Bundle then
		Callback(InitiateBundlePurchaseModule(p1.id, p1.idempotencyKey, nil, p1.collectibleItemId, p1.collectibleItemInstanceId, p1.collectibleProductId, p1.expectedPrice, p2))
		
		return
	end
	if p1.kind == ProductTypeEnum.Experience then
		Callback(InitiatePurchaseModule(p1.universeId, ProductTypeEnum.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
			name = p1.experienceName,
			imageUrl = p1.experienceIconUrl
		}, p2))
		
		return
	end
	if p1.kind == ProductTypeEnum.Look then
		Callback(InitiatePurchaseModule(p1.id, ProductTypeEnum.Look, nil, nil, nil, nil, nil, nil, nil, nil, if FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsellModule then {
			excludedAssetIds = p1.excludedAssetIds,
			excludedBundleIds = p1.excludedBundleIds,
			timedOptions = p1.timedOptions
		} else { expectedPrice = p1.expectedPrice }, p2))
		
		return
	end
	if FFlagAXMISWithBlackbird and p1.kind == ProductTypeEnum.RobuxUpsell then
		Callback(InitiatePurchaseModule(p1.id, ProductTypeEnum.RobuxUpsell, nil, nil, nil, nil, nil, nil, nil, nil, nil, false))
		
		return
	end
	if p1.kind == ProductTypeEnum.DeveloperSubscription then
		Callback(InitiatePurchaseModule(p1.subscriptionId, ProductTypeEnum.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, p1.expectedPrice, {
			expectedPrice = p1.expectedPrice,
			name = p1.name,
			iconImageAssetId = p1.iconImageAssetId,
			displayPrice = p1.displayPrice
		}, p2))
		
		return
	end
	if FFlagLuaAppsEnablePromptVIPServerPurchase and p1.kind == ProductTypeEnum.VIPServer then
		Callback(InitiatePurchaseModule(p1.universeId, ProductTypeEnum.VIPServer, nil, nil, nil, nil, nil, nil, nil, nil, nil, p2))
	end
end