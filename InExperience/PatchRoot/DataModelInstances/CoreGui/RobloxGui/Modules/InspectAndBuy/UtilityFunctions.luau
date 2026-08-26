local parent = script.Parent
local constantsModule = require(parent.Constants)
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local t = {
	getBundleId = function(p1)
		return if p1.parentBundleId == nil then nil else p1.parentBundleId
	end,
	isCollectibles = function(p1)
		-- upvalues: constantsModule (ref)
		return p1 and (p1.productType and p1.productType == constantsModule.ProductType.CollectibleItem)
	end,
	hasLimitedQuantity = function(p1)
		-- upvalues: getFFlagIBEnableCollectiblesSystemSupportModule (ref)
		return if p1 then p1.isLimited or ((if getFFlagIBEnableCollectiblesSystemSupportModule() then p1.isLimitedUnique else nil) or p1.collectibleIsLimited) else nil
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

function t.isUnlimitedCollectibleAsset(value, p1)
	-- upvalues: t (ref), constantsModule (ref)
	return if value and p1 then not t.hasLimitedQuantity(p1) and (p1.productType == constantsModule.ProductType.CollectibleItem and value == constantsModule.ItemType.Asset) else nil
end

function t.isLimitedBundle(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p1 and p2 then p2.collectibleIsLimited and p1 == constantsModule.ItemType.Bundle else nil
end

function t.isUnlimitedCollectibleBundle(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p1 and p2 then not p2.collectibleIsLimited and (p2.productType == constantsModule.ProductType.CollectibleItem and p1 == constantsModule.ItemType.Bundle) else nil
end

function t.isLimitedCollectible(p1)
	-- upvalues: t (ref), constantsModule (ref)
	return if p1 then t.hasLimitedQuantity(p1) and p1.productType == constantsModule.ProductType.CollectibleItem else nil
end

return t