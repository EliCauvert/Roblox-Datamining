local Parent = script.Parent
local ConstantsModule = require(Parent.Constants)
local GetFFlagIBEnableCollectiblesSystemSupportModule = require(Parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local UtilityFunctionsModule = {
	getBundleId = function(p1)
		return if p1.parentBundleId == nil then nil else p1.parentBundleId
	end,
	isCollectibles = function(p1): boolean
		-- upvalues: ConstantsModule (copy)
		return p1 and (p1.productType and p1.productType == ConstantsModule.ProductType.CollectibleItem)
	end,
	hasLimitedQuantity = function(p1)
		-- upvalues: GetFFlagIBEnableCollectiblesSystemSupportModule (copy)
		if p1 then
			local IsLimitedUnique = if GetFFlagIBEnableCollectiblesSystemSupportModule() then p1.isLimitedUnique else nil
			local CollectibleIsLimited = p1.collectibleIsLimited
			
			return p1.isLimited or (IsLimitedUnique or CollectibleIsLimited)
		else
			return nil
		end
	end,
	isLimited1Point0 = function(p1)
		return if p1 then p1.isLimited or p1.isLimitedUnique else nil
	end,
	isLimited1Point0_LimitedUnique = function(p1)
		return if p1 then p1.isLimitedUnique else nil
	end,
	isLimited2Point0_Or_LimitedCollectible = function(p1)
		return if p1 then p1.collectibleIsLimited else nil
	end
}

function UtilityFunctionsModule.isUnlimitedCollectibleAsset(Asset, p1): boolean?
	-- upvalues: UtilityFunctionsModule (copy), ConstantsModule (copy)
	if Asset and p1 then
		local IsProductTypeMatch = p1.productType == ConstantsModule.ProductType.CollectibleItem
		local IsAssetMatch = Asset == ConstantsModule.ItemType.Asset
		
		return not UtilityFunctionsModule.hasLimitedQuantity(p1) and (IsProductTypeMatch and IsAssetMatch)
	else
		return nil
	end
end

function UtilityFunctionsModule.isLimitedBundle(Bundle, p1): boolean?
	-- upvalues: ConstantsModule (copy)
	if Bundle and p1 then
		local IsBundleMatch = Bundle == ConstantsModule.ItemType.Bundle
		
		return p1.collectibleIsLimited and IsBundleMatch
	else
		return nil
	end
end

function UtilityFunctionsModule.isUnlimitedCollectibleBundle(Bundle, p1): boolean?
	-- upvalues: ConstantsModule (copy)
	if Bundle and p1 then
		local IsProductTypeMatch = p1.productType == ConstantsModule.ProductType.CollectibleItem
		local IsBundleMatch = Bundle == ConstantsModule.ItemType.Bundle
		
		return not p1.collectibleIsLimited and (IsProductTypeMatch and IsBundleMatch)
	else
		return nil
	end
end

function UtilityFunctionsModule.isLimitedCollectible(p1): boolean?
	-- upvalues: UtilityFunctionsModule (copy), ConstantsModule (copy)
	if p1 then
		local IsProductTypeMatch = p1.productType == ConstantsModule.ProductType.CollectibleItem
		
		return UtilityFunctionsModule.hasLimitedQuantity(p1) and IsProductTypeMatch
	else
		return nil
	end
end

return UtilityFunctionsModule