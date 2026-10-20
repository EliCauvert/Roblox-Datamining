local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local AXCommonModule = require(Parent.AXCommon)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local ItemRestrictions = AXCommonModule.Enums.ItemRestrictions
local SalesLocationType = AXCommonModule.Enums.SalesLocationType
local NoPriceStatus = AXCommonModule.Enums.NoPriceStatus
local FFlagAXPurchaseFromQuantityFirst = require(Parent.AvatarExperienceFlags).FFlagAXPurchaseFromQuantityFirst
local _ = require(AvatarExperienceInspectAndBuy.Types)

local function _(p1): boolean
	-- upvalues: SalesLocationType (copy)
	return p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly
end

local _ = function(p1)
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	
	return ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
end

local _ = function(p1)
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	
	return (not ItemRestrictions1 or not ItemRestrictions1[ItemRestrictions.Limited]) and (not ItemRestriction and not ItemRestriction1) and p1.isOwned or (if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false)
end

local _ = function(p1): boolean
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
	
	return ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2
end

local function gethasReachedQuantityLimitOfLimitedItem(p1): boolean
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	
	if (not ItemRestrictions1 or not ItemRestrictions1[ItemRestrictions.Limited]) and (not ItemRestriction and not ItemRestriction1) then
		return false
	elseif p1.collectibleItemDetails then
		local IsQuantityLimitPerUserBelow: boolean = if p1.collectibleItemDetails.quantityLimitPerUser and p1.collectibleItemDetails.resellableCount then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false
		local HasResellers = p1.collectibleItemDetails.hasResellers or false
		local ItemRestrictions2 = p1.itemRestrictions
		local ItemRestriction2 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.LimitedUnique]
		local ItemRestriction21 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Collectible]
		local ItemRestriction3 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Limited] or (ItemRestriction2 or ItemRestriction21)
		local Inverted: boolean = not (ItemRestriction3 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction3) or (IsQuantityLimitPerUserBelow or p1.isOffSale == true)
		
		return p1.isOwned == true and (Inverted and not HasResellers)
	else
		return false
	end
end

local _ = function(p1): boolean
	-- upvalues: SalesLocationType (copy), NoPriceStatus (copy)
	if p1.isOffSale then
		return false
	else
		local Inverted = not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly)
		
		return p1.noPriceStatus == NoPriceStatus.Free or (Inverted and p1.priceInRobux == 0 or p1.catalogPriceStatus == "Free")
	end
end

local _ = function(p1): boolean
	-- upvalues: SalesLocationType (copy), ItemRestrictions (copy), FFlagAXPurchaseFromQuantityFirst (copy), NoPriceStatus (copy)
	if p1.isOffSale then
		return false
	else
		local ItemRestrictions1 = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
		local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		local IsUnitsAvailableForConsumptionAbove: boolean = ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2
		
		return (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p1.saleLocationType == SalesLocationType.MyExperiencesOnly or p1.saleLocationType == SalesLocationType.ExperiencesById)) and IsUnitsAvailableForConsumptionAbove or not FFlagAXPurchaseFromQuantityFirst and p1.noPriceStatus == NoPriceStatus.InExperience
	end
end

local function getIsPurchaseFromResale(p1, p2): boolean
	-- upvalues: FFlagAXPurchaseFromQuantityFirst (copy), ItemRestrictions (copy), SalesLocationType (copy)
	if not p1.collectibleItemDetails or not p1.collectibleItemDetails.hasResellers then
		return false
	end
	if FFlagAXPurchaseFromQuantityFirst and p2 then
		local ItemRestrictions1 = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
		local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		
		return not (ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2)
	end
	local IsSaleLocationTypeMatch: boolean = p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p1.saleLocationType == SalesLocationType.MyExperiencesOnly or p1.saleLocationType == SalesLocationType.ExperiencesById)
	
	if p2 and IsSaleLocationTypeMatch then
		local ItemRestrictions2 = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.LimitedUnique]
		local ItemRestriction3 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Collectible]
		local ItemRestriction4 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction3)
		
		return not (ItemRestriction4 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction4)
	end
	if p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil and p1.saleLocationType == SalesLocationType.ShopOnly then
		return true
	end
	local IsLowestResalePriceBelow: boolean = if p1.priceInRobux and p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice and p1.catalogPriceStatus ~= "Free" then p1.collectibleItemDetails.lowestResalePrice < p1.priceInRobux else p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil
	local ItemRestrictions3 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions3 and ItemRestrictions3[ItemRestrictions.LimitedUnique]
	local ItemRestriction5 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictions.Collectible]
	local ItemRestriction6 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction5)
	local Inverted: boolean = not (ItemRestriction6 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction6) or p1.isOffSale == true
	
	if not p2 then
		return IsLowestResalePriceBelow or Inverted
	end
	local IsLowestResalePriceBelow1: boolean = IsLowestResalePriceBelow
	local Flag = nil
	
	if not IsLowestResalePriceBelow1 then
		Flag = Inverted
		IsLowestResalePriceBelow1 = Flag
	end
	repeat
		if not IsLowestResalePriceBelow1 then break end
		local ItemRestrictions4 = p1.itemRestrictions
		local ItemRestriction7 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictions.LimitedUnique]
		local ItemRestriction71 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictions.Collectible]
		local ItemRestriction8 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictions.Limited] or (ItemRestriction7 or ItemRestriction71)
		
		if ItemRestriction8 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction8 then
			Flag = true
			
			if p1.isOffSale == true then break end
		end
		local ItemRestrictions5 = p1.itemRestrictions
		local ItemRestriction9 = ItemRestrictions5 and ItemRestrictions5[ItemRestrictions.LimitedUnique]
		local ItemRestriction91 = ItemRestrictions5 and ItemRestrictions5[ItemRestrictions.Collectible]
		local ItemRestriction10 = ItemRestrictions5 and ItemRestrictions5[ItemRestrictions.Limited] or (ItemRestriction9 or ItemRestriction91)
		Flag = not (ItemRestriction10 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction10)
	until true
	return Flag
end

local _ = function(p1): boolean
	-- upvalues: ItemRestrictions (copy)
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Collectible]
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
	local IsUnitsAvailableForConsumptionAbove: boolean = ItemRestriction2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not ItemRestriction2
	local HasResellers = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	
	return not IsUnitsAvailableForConsumptionAbove and not HasResellers
end

local _ = function(p1): boolean
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

local _ = function(p1): boolean
	-- upvalues: NoPriceStatus (copy), SalesLocationType (copy)
	return not p1.isOffSale and p1.noPriceStatus ~= NoPriceStatus.OffSale and not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly)
end

local _ = function(p1)
	-- upvalues: NoPriceStatus (copy)
	return p1.isOffSale or p1.noPriceStatus == NoPriceStatus.OffSale
end

local _ = function(p1): boolean
	-- upvalues: SalesLocationType (copy)
	return p1.saleLocationType == SalesLocationType.ShopOnly
end

return function(p1, p2)
	-- upvalues: PriceStatusModule (copy), gethasReachedQuantityLimitOfLimitedItem (copy), ItemRestrictions (copy), getIsPurchaseFromResale (copy), SalesLocationType (copy), FFlagAXPurchaseFromQuantityFirst (copy), NoPriceStatus (copy)
	if not p1 then
		return PriceStatusModule.Unavailable
	end
	if gethasReachedQuantityLimitOfLimitedItem(p1) then
		return PriceStatusModule.QuantityLimitReached
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
	if getIsPurchaseFromResale(p1, p2) then
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
		v1 = (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p1.saleLocationType == SalesLocationType.MyExperiencesOnly or p1.saleLocationType == SalesLocationType.ExperiencesById)) and IsUnitsAvailableForConsumptionAbove1 or not FFlagAXPurchaseFromQuantityFirst and p1.noPriceStatus == NoPriceStatus.InExperience
	end
	if v1 then
		return PriceStatusModule.InExperienceOnly
	end
	if p1.saleLocationType == SalesLocationType.ShopOnly then
		return PriceStatusModule.Unavailable
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
	elseif not p1.isOffSale and p1.noPriceStatus ~= NoPriceStatus.OffSale and not (p1.saleLocationType == SalesLocationType.ExperiencesDevApiOnly) then
		return PriceStatusModule.PurchaseFromRoblox
	else
		local IsOffSale = p1.isOffSale or p1.noPriceStatus == NoPriceStatus.OffSale
		
		return if IsOffSale then PriceStatusModule.OffSale else PriceStatusModule.Unavailable
	end
end