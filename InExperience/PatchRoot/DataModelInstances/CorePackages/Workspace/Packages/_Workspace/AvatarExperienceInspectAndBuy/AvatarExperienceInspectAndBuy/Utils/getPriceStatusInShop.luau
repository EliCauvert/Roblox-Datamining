local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AXCommonModule = require(avatarExperienceInspectAndBuy.Parent.AXCommon)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local itemRestrictions = AXCommonModule.Enums.ItemRestrictions
local salesLocationType = AXCommonModule.Enums.SalesLocationType
local noPriceStatus = AXCommonModule.Enums.NoPriceStatus
local _ = require(avatarExperienceInspectAndBuy.Types)

local function _(p0)
	-- upvalues: salesLocationType (ref)
	return p0.saleLocationType == salesLocationType.ExperiencesDevApiOnly
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	return itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
end

local _ = function(p2)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p2.itemRestrictions
	
	return if not ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p2.isOwned) then if p2.collectibleItemDetails and p2.collectibleItemDetails.quantityLimitPerUser then p2.collectibleItemDetails.quantityLimitPerUser > 0 and p2.collectibleItemDetails.quantityLimitPerUser <= p2.collectibleItemDetails.resellableCount else false else true
end

local _ = function(p3)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p3.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return limited and (p3.collectibleItemDetails and (p3.collectibleItemDetails.unitsAvailableForConsumption and p3.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited
end

local _ = function(p4)
	-- upvalues: itemRestrictions (ref)
	local isOwned = p4.isOwned
	local itemRestrictions_1 = p4.itemRestrictions
	local var5 = if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p4.isOwned then if p4.collectibleItemDetails and p4.collectibleItemDetails.quantityLimitPerUser then p4.collectibleItemDetails.quantityLimitPerUser > 0 and p4.collectibleItemDetails.quantityLimitPerUser <= p4.collectibleItemDetails.resellableCount else false else true
	local hasResellers = p4.collectibleItemDetails and p4.collectibleItemDetails.hasResellers
	local itemRestrictions_2 = p4.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	return isOwned and ((not (limited and (p4.collectibleItemDetails and (p4.collectibleItemDetails.unitsAvailableForConsumption and p4.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var5 or p4.isOffSale)) and not hasResellers)
end

local _ = function(p5)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p5.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return not (limited and (p5.collectibleItemDetails and (p5.collectibleItemDetails.unitsAvailableForConsumption and p5.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) and not (p5.collectibleItemDetails and p5.collectibleItemDetails.hasResellers)
end

local function getIsPurchaseFromResale(p6)
	-- upvalues: itemRestrictions (ref)
	local var9
	if not p6.collectibleItemDetails or not p6.collectibleItemDetails.hasResellers then
		return false
	elseif p6.priceInRobux and p6.collectibleItemDetails and (p6.collectibleItemDetails.lowestResalePrice and p6.catalogPriceStatus ~= "Free") then
		var9 = p6.collectibleItemDetails.lowestResalePrice < p6.priceInRobux
		var9 = nil
	else
		var9 = p6.collectibleItemDetails and p6.collectibleItemDetails.lowestResalePrice ~= nil
	end
	local itemRestrictions_1 = p6.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return var9 or (not (limited and (p6.collectibleItemDetails and (p6.collectibleItemDetails.unitsAvailableForConsumption and p6.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or p6.isOffSale == true)
end

local _ = function(p7)
	-- upvalues: salesLocationType (ref), itemRestrictions (ref)
	if p7.isOffSale then
		return false
	end
	local var11 = if p7.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p7.saleLocationType ~= salesLocationType.MyExperiencesOnly then p7.saleLocationType == salesLocationType.ExperiencesById else true else true
	local itemRestrictions_1 = p7.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return var11 and (limited and (p7.collectibleItemDetails and (p7.collectibleItemDetails.unitsAvailableForConsumption and p7.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited)
end

local _ = function(p8)
	-- upvalues: salesLocationType (ref), noPriceStatus (ref)
	return if p8.isOffSale then false elseif p8.noPriceStatus ~= noPriceStatus.Free then not (p8.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p8.catalogPriceStatus == "Free" else true
end

local _ = function(p9)
	-- upvalues: noPriceStatus (ref), salesLocationType (ref)
	return if p9.isOffSale or p9.noPriceStatus == noPriceStatus.OffSale then false else not (p9.saleLocationType == salesLocationType.ExperiencesDevApiOnly)
end

return function(p10)
	-- upvalues: priceStatusModule (ref), itemRestrictions (ref), getIsPurchaseFromResale (ref), salesLocationType (ref), noPriceStatus (ref)
	if not p10 then
		return priceStatusModule.Unavailable
	end
	local isOwned = p10.isOwned
	local itemRestrictions_1 = p10.itemRestrictions
	local var13 = if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p10.isOwned then if p10.collectibleItemDetails and p10.collectibleItemDetails.quantityLimitPerUser then p10.collectibleItemDetails.quantityLimitPerUser > 0 and p10.collectibleItemDetails.quantityLimitPerUser <= p10.collectibleItemDetails.resellableCount else false else true
	local hasResellers = p10.collectibleItemDetails and p10.collectibleItemDetails.hasResellers
	local itemRestrictions_2 = p10.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	if isOwned and ((not (limited and (p10.collectibleItemDetails and (p10.collectibleItemDetails.unitsAvailableForConsumption and p10.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var13 or p10.isOffSale)) and not hasResellers) then
		return priceStatusModule.Owned
	end
	local var17
	local itemRestrictions_3 = p10.itemRestrictions
	local limited_1 = itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictions.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Collectible])
	
	if not (limited_1 and (p10.collectibleItemDetails and (p10.collectibleItemDetails.unitsAvailableForConsumption and p10.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_1) and not (p10.collectibleItemDetails and p10.collectibleItemDetails.hasResellers) then
		return priceStatusModule.SoldOut
	elseif getIsPurchaseFromResale(p10) then
		return priceStatusModule.PurchaseFromResale
	elseif p10.isOffSale then
		var17 = false
	else
		local var18 = if p10.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p10.saleLocationType ~= salesLocationType.MyExperiencesOnly then p10.saleLocationType == salesLocationType.ExperiencesById else true else true
		itemRestrictions_1 = p10.itemRestrictions
		local limited_2 = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		var17 = var18 and (limited_2 and (p10.collectibleItemDetails and (p10.collectibleItemDetails.unitsAvailableForConsumption and p10.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_2)
	end
	return if var17 then priceStatusModule.InExperienceOnly elseif if p10.isOffSale then false elseif p10.noPriceStatus ~= noPriceStatus.Free then not (p10.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p10.catalogPriceStatus == "Free" else true then priceStatusModule.Free elseif if p10.isOffSale or p10.noPriceStatus == noPriceStatus.OffSale then false else not (p10.saleLocationType == salesLocationType.ExperiencesDevApiOnly) then priceStatusModule.PurchaseFromRoblox else priceStatusModule.Unavailable
end