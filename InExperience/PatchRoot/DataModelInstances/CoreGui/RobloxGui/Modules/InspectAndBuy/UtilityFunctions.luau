local parent = script.Parent
local constantsModule = require(parent.Constants)
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local t = {
	getBundleId = function(p0)
		return if p0.parentBundleId == nil then nil else p0.parentBundleId
	end,
	isCollectibles = function(p1)
		-- upvalues: constantsModule (ref)
		return p1 and (p1.productType and p1.productType == constantsModule.ProductType.CollectibleItem)
	end,
	hasLimitedQuantity = function(p2)
		-- upvalues: getFFlagIBEnableCollectiblesSystemSupportModule (ref)
		return if p2 then p2.isLimited or ((if getFFlagIBEnableCollectiblesSystemSupportModule() then p2.isLimitedUnique else nil) or p2.collectibleIsLimited) else nil
	end,
	isLimited1Point0 = function(p3)
		return if p3 then p3.isLimited or p3.isLimitedUnique else nil
	end,
	isLimited1Point0_LimitedUnique = function(p4)
		return if p4 then p4.isLimitedUnique else nil
	end,
	isLimited2Point0_Or_LimitedCollectible = function(p5)
		return if p5 then p5.collectibleIsLimited else nil
	end
}

function t.isUnlimitedCollectibleAsset(value, p6)
	-- upvalues: t (ref), constantsModule (ref)
	return if value and p6 then not t.hasLimitedQuantity(p6) and (p6.productType == constantsModule.ProductType.CollectibleItem and value == constantsModule.ItemType.Asset) else nil
end

function t.isLimitedBundle(p7, p8)
	-- upvalues: constantsModule (ref)
	return if p7 and p8 then p8.collectibleIsLimited and p7 == constantsModule.ItemType.Bundle else nil
end

function t.isUnlimitedCollectibleBundle(p9, p10)
	-- upvalues: constantsModule (ref)
	return if p9 and p10 then not p10.collectibleIsLimited and (p10.productType == constantsModule.ProductType.CollectibleItem and p9 == constantsModule.ItemType.Bundle) else nil
end

function t.isLimitedCollectible(p11)
	-- upvalues: t (ref), constantsModule (ref)
	return if p11 then t.hasLimitedQuantity(p11) and p11.productType == constantsModule.ProductType.CollectibleItem else nil
end

return t