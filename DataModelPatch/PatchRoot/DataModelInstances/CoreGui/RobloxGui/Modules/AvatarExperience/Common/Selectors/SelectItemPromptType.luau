local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1, p2, p3, p4, p5, p6)
	-- upvalues: CatalogUtilsModule (copy), CatalogConstantsModule (copy), ConstantsModule (copy)
	assert(p1, "silence type checker")
	local IsOwned = p1.isOwned
	local IsPurchasable = p1.isPurchasable
	local IsResellable = CatalogUtilsModule.IsResellable(p1)
	local IsForRent = p1.isForRent
	local CollectibleItemId = p1.collectibleItemId
	local IsPurchasable1 = p1.timedOptions and p1.isPurchasable
	local v1: boolean = IsResellable and p2 == nil
	local None = CatalogConstantsModule.ResaleRestriction.None
	local IsCollectibleSellableInShop = true
	local IsUnitsAvailableForConsumptionAbove = true
	local NoIsPurchasable = (if IsOwned then v1 else not IsPurchasable or v1) or (IsForRent or p3 == nil)
	local ReachQuantityLimitResult = nil
	
	if CollectibleItemId then
		local v2 = p4[CollectibleItemId]
		
		if IsResellable then
			if p6 and v2 then
				v2.resaleRestriction = CatalogConstantsModule.ResaleRestriction.Disabled
			end
			None = if v2 then v2.resaleRestriction else CatalogConstantsModule.ResaleRestriction.None
			IsUnitsAvailableForConsumptionAbove = v2 and (v2.unitsAvailableForConsumption and v2.unitsAvailableForConsumption > 0)
			IsCollectibleSellableInShop = CatalogUtilsModule.isCollectibleSellableInShop(v2)
			ReachQuantityLimitResult = not (v2 and v2.hasResellers) and CatalogUtilsModule.reachQuantityLimit(v2, p5)
			NoIsPurchasable = not IsCollectibleSellableInShop or (IsForRent or (p3 == nil or ReachQuantityLimitResult))
		elseif v2 then
			NoIsPurchasable = NoIsPurchasable or not CatalogUtilsModule.isOriginalStockSellableInShop(v2)
		end
	end
	local NoIsPurchasable1: boolean = IsOwned and (if IsResellable and IsCollectibleSellableInShop then ReachQuantityLimitResult and not IsPurchasable1 else not IsPurchasable1)
	local AssetType = p1.assetType
	
	if AssetType and (ConstantsModule.AssetTypeIdStringToName[AssetType] == nil and NoIsPurchasable1) then
		NoIsPurchasable = true
		NoIsPurchasable1 = false
	end
	return if NoIsPurchasable1 then ConstantsModule.ItemPromptType.OpenGoToAvatarEditorPrompt elseif CollectibleItemId and None == CatalogConstantsModule.ResaleRestriction.Disabled and not IsUnitsAvailableForConsumptionAbove then ConstantsModule.ItemPromptType.SoldOut elseif NoIsPurchasable then ConstantsModule.ItemPromptType.Disabled else ConstantsModule.ItemPromptType.OpenPurchasePrompt
end)

return function(p1, p2, p3, p4)
	-- upvalues: ItemDataModule (copy), ConstantsModule (copy), GetAppFeaturePoliciesFunction (copy), MemoizeResult (copy)
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2, p3)
	
	if ItemDataModuleResult then
		assert(ItemDataModuleResult, "silence type checker")
		local ResellerUserAssetIds = ItemDataModuleResult.resellerUserAssetIds
		local CollectibleItemId = ItemDataModuleResult.collectibleItemId
		
		return MemoizeResult(ItemDataModuleResult, p1.AvatarExperience.Catalog.UserAssets[ResellerUserAssetIds and ResellerUserAssetIds[1]], p1.UserRobux[p1.LocalUserId], p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo, if CollectibleItemId then p1.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleItemId] else nil, if p4 and p4.DisableResellingCollectiblesForCompliance then p4.DisableResellingCollectiblesForCompliance else GetAppFeaturePoliciesFunction().getDisableResellingCollectiblesForCompliance())
	else
		return ConstantsModule.ItemPromptType.Disabled
	end
end