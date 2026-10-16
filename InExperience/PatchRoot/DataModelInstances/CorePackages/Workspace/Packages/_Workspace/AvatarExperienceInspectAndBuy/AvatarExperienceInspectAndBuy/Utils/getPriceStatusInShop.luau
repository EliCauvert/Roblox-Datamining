local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AXCommonModule = require(AvatarExperienceInspectAndBuy.Parent.AXCommon)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local ItemRestrictions = AXCommonModule.Enums.ItemRestrictions
local SalesLocationType = AXCommonModule.Enums.SalesLocationType
local NoPriceStatus = AXCommonModule.Enums.NoPriceStatus
local _ = require(AvatarExperienceInspectAndBuy.Types)

local function _(p1): boolean --[[ Line: 32 | Named "getAvailableInExperienceOnly" ]]
	-- upvalues: SalesLocationType (copy)
	return p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly
end

local _ = function(p1) --[[ Line: 36 | Named "getHasLimitedAmount" ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	
	return ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
end

local _ = function(p1) --[[ Line: 44 | Named "getUserHasReachedQuantityLimit" ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	
	return (not ItemRestrictions1 or not ItemRestrictions1[ItemRestrictions.Limited]) and (not ItemRestriction and not ItemRestriction1) and p1.isOwned or (if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false)
end

local _ = function(p1): boolean --[[ Line: 56 | Named "getOriginalStockAvailable" ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
	
	return ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2
end

local _ = function(p1): boolean --[[ Line: 65 | Named "getIsOwned" ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	local IsOwned = not (ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)) and p1.isOwned or (if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser and p1.collectibleItemDetails.quantityLimitPerUser > 0 then p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false)
	local HasResellers = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	local ItemRestrictions2 = p1.itemRestrictions
	local ItemRestriction2 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.LimitedUnique]
	local ItemRestriction21 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Collectible]
	local ItemRestriction3 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Limited] or (ItemRestriction2 or ItemRestriction21)
	local Inverted = not (ItemRestriction3 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction3) or (IsOwned or p1.isOffSale)
	
	return p1.isOwned and (Inverted and not HasResellers)
end

local _ = function(p1): boolean --[[ Line: 75 | Named "getIsSoldOut" ]]
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
	local IsUnitsAvailableForConsumptionAbove: boolean = ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2
	local HasResellers = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	
	return not IsUnitsAvailableForConsumptionAbove and not HasResellers
end

local function getIsPurchaseFromResale(p1): boolean --[[ Line: 81 ]]
	-- upvalues: ItemRestrictions (copy)
	if p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers then
		local ItemRestrictions1 = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
		local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		local Inverted: boolean = not (ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2) or p1.isOffSale == true
		
		return (if p1.priceInRobux and p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice and p1.catalogPriceStatus ~= "Free" then p1.collectibleItemDetails.lowestResalePrice < p1.priceInRobux else p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil) or Inverted
	else
		return false
	end
end

local _ = function(p1): boolean --[[ Line: 96 | Named "getIsExperienceOnly" ]]
	-- upvalues: SalesLocationType (copy), ItemRestrictions (copy)
	if p1.isOffSale then
		return false
	else
		local ItemRestrictions1 = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
		local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		local IsUnitsAvailableForConsumptionAbove: boolean = ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2
		
		return (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p1.saleLocationType == SalesLocationType.MyExperiencesOnly or p1.saleLocationType == SalesLocationType.ExperiencesById)) and IsUnitsAvailableForConsumptionAbove
	end
end

local _ = function(p1): boolean --[[ Line: 107 | Named "getIsFree" ]]
	-- upvalues: SalesLocationType (copy), NoPriceStatus (copy)
	if p1.isOffSale then
		return false
	else
		local Inverted = not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly)
		
		return p1.noPriceStatus == NoPriceStatus.Free or (Inverted and p1.priceInRobux == 0 or p1.catalogPriceStatus == "Free")
	end
end

local _ = function(p1): boolean --[[ Line: 117 | Named "getIsPurchasableFromRoblox" ]]
	-- upvalues: NoPriceStatus (copy), SalesLocationType (copy)
	return not p1.isOffSale and p1.noPriceStatus ~= NoPriceStatus.OffSale and not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly)
end

return function(p1) --[[ Line: 124 | Named "getPriceStatusInShop" ]]
	-- upvalues: PriceStatusModule (copy), ItemRestrictions (copy), getIsPurchaseFromResale (copy), SalesLocationType (copy), NoPriceStatus (copy)
	if not p1 then
		return PriceStatusModule.Unavailable
	end
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	local IsOwned = not (ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)) and p1.isOwned or (if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser and p1.collectibleItemDetails.quantityLimitPerUser > 0 then p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false)
	local HasResellers = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	local ItemRestrictions2 = p1.itemRestrictions
	local ItemRestriction2 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.LimitedUnique]
	local ItemRestriction21 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Collectible]
	local ItemRestriction3 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Limited] or (ItemRestriction2 or ItemRestriction21)
	local Inverted = not (ItemRestriction3 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction3) or (IsOwned or p1.isOffSale)
	
	if p1.isOwned and (Inverted and not HasResellers) then
		return PriceStatusModule.Owned
	end
	local ItemRestrictions3 = p1.itemRestrictions
	local ItemRestriction4 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictions.LimitedUnique]
	local ItemRestriction41 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictions.Collectible]
	local ItemRestriction5 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictions.Limited] or (ItemRestriction4 or ItemRestriction41)
	local IsUnitsAvailableForConsumptionAbove: boolean = ItemRestriction5 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction5
	local HasResellers1 = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	
	if not IsUnitsAvailableForConsumptionAbove and not HasResellers1 then
		return PriceStatusModule.SoldOut
	end
	if getIsPurchaseFromResale(p1) then
		return PriceStatusModule.PurchaseFromResale
	end
	local v1 = nil
	if p1.isOffSale then
		v1 = false
	else
		local ItemRestrictions4 = p1.itemRestrictions
		local ItemRestriction6 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictions.LimitedUnique]
		local ItemRestriction61 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictions.Collectible]
		local ItemRestriction7 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictions.Limited] or (ItemRestriction6 or ItemRestriction61)
		local IsUnitsAvailableForConsumptionAbove1: boolean = ItemRestriction7 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction7
		v1 = (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p1.saleLocationType == SalesLocationType.MyExperiencesOnly or p1.saleLocationType == SalesLocationType.ExperiencesById)) and IsUnitsAvailableForConsumptionAbove1
	end
	if v1 then
		return PriceStatusModule.InExperienceOnly
	end
	local IsNoPriceStatusMatch = nil
	if p1.isOffSale then
		IsNoPriceStatusMatch = false
	else
		local Inverted1 = not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly)
		IsNoPriceStatusMatch = p1.noPriceStatus == NoPriceStatus.Free or (Inverted1 and p1.priceInRobux == 0 or p1.catalogPriceStatus == "Free")
	end
	if IsNoPriceStatusMatch then
		return PriceStatusModule.Free
	else
		local Inverted2: boolean = not p1.isOffSale and p1.noPriceStatus ~= NoPriceStatus.OffSale and not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly)
		
		return if Inverted2 then PriceStatusModule.PurchaseFromRoblox else PriceStatusModule.Unavailable
	end
end