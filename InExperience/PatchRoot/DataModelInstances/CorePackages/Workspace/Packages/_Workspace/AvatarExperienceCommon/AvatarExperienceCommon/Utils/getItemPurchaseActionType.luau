local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ItemPurchaseActionTypeEnumModule = require(AvatarExperienceCommon.Enums.ItemPurchaseActionTypeEnum)
local SalesLocationTypeModule = require(AvatarExperienceCommon.Enums.SalesLocationType)
local ItemRestrictionsModule = require(AvatarExperienceCommon.Enums.ItemRestrictions)
local FFlagAXDurablesForMIS = require(AvatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXDurablesForMIS

local function _(p1): number
	return #(if p1 then p1.experiences or {} else {})
end

local _ = function(p1): boolean
	-- upvalues: SalesLocationTypeModule (copy)
	return p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly
end

local _ = function(p1)
	-- upvalues: ItemRestrictionsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
	
	return ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)
end

local _ = function(p1, p2, p3): boolean
	-- upvalues: ItemRestrictionsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
	
	if (not ItemRestrictions or not ItemRestrictions[ItemRestrictionsModule.Limited]) and (not ItemRestriction and not ItemRestriction1) and p1.isOwned then
		return true
	end
	if not p2 or not p2.quantityLimitPerUser then
		return false
	end
	local Flag = nil
	if p2 then
		Flag = false
		
		if p2.quantityLimitPerUser > 0 then
			return p2.quantityLimitPerUser <= p3
		end
	else
		Flag = false
	end
	return Flag
end

local _ = function(p1): boolean
	-- upvalues: ItemRestrictionsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
	local ItemRestriction2 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)
	
	return ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2
end

local _ = function(p1, p2): boolean
	-- upvalues: SalesLocationTypeModule (copy), ItemRestrictionsModule (copy)
	if p2 and p1.hasResellers then
		local IsSaleLocationTypeMatch = p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly
		local ItemRestrictions = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
		local ItemRestriction2 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)
		local Inverted: boolean = not (ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2) or (p1.isOffSale == true or IsSaleLocationTypeMatch)
		
		return (if p1.priceInRobux and p1.lowestResalePrice then p1.lowestResalePrice < p1.priceInRobux else p1.lowestResalePrice ~= nil) or Inverted
	else
		return false
	end
end

local _ = function(p1): boolean
	-- upvalues: SalesLocationTypeModule (copy)
	return not p1.isOffSale and (not (p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly) and p1.priceInRobux == 0)
end

local _ = function(p1, p2): boolean
	-- upvalues: SalesLocationTypeModule (copy), ItemRestrictionsModule (copy)
	if p1.isOffSale then
		return false
	else
		local ItemRestrictions = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
		local ItemRestriction2 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)
		local IsNumberRobloxHasAvailableAbove: boolean = ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2
		local v1 = #(if p2 then p2.experiences or {} else {}) > 0
		
		return p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly and (v1 and IsNumberRobloxHasAvailableAbove)
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: ItemRestrictionsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
	local ItemRestriction2 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)
	local IsNumberRobloxHasAvailableAbove: boolean = ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2
	local HasResellers = p2 and p1.hasResellers
	
	return not IsNumberRobloxHasAvailableAbove and not HasResellers
end

local _ = function(p1, p2, p3, p4): boolean
	-- upvalues: FFlagAXDurablesForMIS (copy), ItemRestrictionsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
	local IsOwned = not (ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)) and p1.isOwned or (if p2 and p2.quantityLimitPerUser and (p2 and p2.quantityLimitPerUser > 0) then p2.quantityLimitPerUser <= p3 else false)
	local HasResellers = p4 and p1.hasResellers
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction21 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictionsModule.Collectible]
	local ItemRestriction3 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictionsModule.Limited] or (ItemRestriction2 or ItemRestriction21)
	local Inverted = not (ItemRestriction3 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction3) or (IsOwned or p1.isOffSale)
	
	return (if FFlagAXDurablesForMIS then p1.isOwned and not p1.expirationTime else p1.isOwned) and (Inverted and not HasResellers)
end

local _ = function(p1): boolean
	-- upvalues: SalesLocationTypeModule (copy)
	return not p1.isOffSale and not (p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly)
end

local _ = function(_, p1, p2): boolean
	return p1 ~= nil and p1.quantityLimitPerUser ~= nil and (p1.quantityLimitPerUser > 0 and p1.quantityLimitPerUser <= p2)
end

return function(p1, p2, p3, p4)
	-- upvalues: ItemPurchaseActionTypeEnumModule (copy), FFlagAXDurablesForMIS (copy), ItemRestrictionsModule (copy), SalesLocationTypeModule (copy)
	if not p1 then
		return ItemPurchaseActionTypeEnumModule.Disabled
	end
	if p2 ~= nil and p2.quantityLimitPerUser ~= nil and (p2.quantityLimitPerUser > 0 and p3 >= p2.quantityLimitPerUser) then
		return ItemPurchaseActionTypeEnumModule.QuantityLimitExceeded
	end
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Collectible]
	local IsOwned = not (ItemRestrictions and ItemRestrictions[ItemRestrictionsModule.Limited] or (ItemRestriction or ItemRestriction1)) and p1.isOwned or (if p2 and p2.quantityLimitPerUser and (p2 and p2.quantityLimitPerUser > 0) then p2.quantityLimitPerUser <= p3 else false)
	local HasResellers = p4 and p1.hasResellers
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction21 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictionsModule.Collectible]
	local ItemRestriction3 = ItemRestrictions1 and ItemRestrictions1[ItemRestrictionsModule.Limited] or (ItemRestriction2 or ItemRestriction21)
	local Inverted = not (ItemRestriction3 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction3) or (IsOwned or p1.isOffSale)
	
	if (if FFlagAXDurablesForMIS then p1.isOwned and not p1.expirationTime else p1.isOwned) and (Inverted and not HasResellers) then
		return ItemPurchaseActionTypeEnumModule.CustomizeLink
	end
	local ItemRestrictions2 = p1.itemRestrictions
	local ItemRestriction4 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictionsModule.LimitedUnique]
	local ItemRestriction41 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictionsModule.Collectible]
	local ItemRestriction5 = ItemRestrictions2 and ItemRestrictions2[ItemRestrictionsModule.Limited] or (ItemRestriction4 or ItemRestriction41)
	local IsNumberRobloxHasAvailableAbove: boolean = ItemRestriction5 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction5
	local HasResellers1 = p4 and p1.hasResellers
	
	if not IsNumberRobloxHasAvailableAbove and not HasResellers1 then
		return ItemPurchaseActionTypeEnumModule.SoldOut
	end
	local IsLowestResalePriceBelow = nil
	if p4 and p1.hasResellers then
		local IsSaleLocationTypeMatch = p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly
		local ItemRestrictions3 = p1.itemRestrictions
		local ItemRestriction6 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictionsModule.LimitedUnique]
		local ItemRestriction61 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictionsModule.Collectible]
		local ItemRestriction7 = ItemRestrictions3 and ItemRestrictions3[ItemRestrictionsModule.Limited] or (ItemRestriction6 or ItemRestriction61)
		local Inverted1: boolean = not (ItemRestriction7 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction7) or (p1.isOffSale == true or IsSaleLocationTypeMatch)
		IsLowestResalePriceBelow = (if p1.priceInRobux and p1.lowestResalePrice then p1.lowestResalePrice < p1.priceInRobux else p1.lowestResalePrice ~= nil) or Inverted1
	else
		IsLowestResalePriceBelow = false
	end
	if IsLowestResalePriceBelow then
		return ItemPurchaseActionTypeEnumModule.PurchaseFromResale
	end
	local v1 = nil
	if p1.isOffSale then
		v1 = false
	else
		local ItemRestrictions4 = p1.itemRestrictions
		local ItemRestriction8 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictionsModule.LimitedUnique]
		local ItemRestriction81 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictionsModule.Collectible]
		local ItemRestriction9 = ItemRestrictions4 and ItemRestrictions4[ItemRestrictionsModule.Limited] or (ItemRestriction8 or ItemRestriction81)
		local IsNumberRobloxHasAvailableAbove1: boolean = ItemRestriction9 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction9
		local v2 = #(if p2 then p2.experiences or {} else {}) > 0
		v1 = p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly and (v2 and IsNumberRobloxHasAvailableAbove1)
	end
	if v1 then
		return ItemPurchaseActionTypeEnumModule.ExperienceLink
	elseif not p1.isOffSale and (not (p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly) and p1.priceInRobux == 0) then
		return ItemPurchaseActionTypeEnumModule.Free
	else
		local Inverted2: boolean = not p1.isOffSale and not (p1.saleLocationType == SalesLocationTypeModule.ExperiencesDevApiOnly)
		
		return if Inverted2 then ItemPurchaseActionTypeEnumModule.PurchaseFromRoblox else ItemPurchaseActionTypeEnumModule.Disabled
	end
end