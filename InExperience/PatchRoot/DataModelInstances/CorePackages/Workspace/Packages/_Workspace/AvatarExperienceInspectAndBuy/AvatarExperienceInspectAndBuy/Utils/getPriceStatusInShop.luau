local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AXCommonModule = require(avatarExperienceInspectAndBuy.Parent.AXCommon)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local itemRestrictions = AXCommonModule.Enums.ItemRestrictions
local salesLocationType = AXCommonModule.Enums.SalesLocationType
local noPriceStatus = AXCommonModule.Enums.NoPriceStatus
local _ = require(avatarExperienceInspectAndBuy.Types)

local function _(p1)
	-- upvalues: salesLocationType (ref)
	return p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	return itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	return if not ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p1.isOwned) then if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false else true
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local isOwned = p1.isOwned
	local itemRestrictions_1 = p1.itemRestrictions
	local var1 = if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p1.isOwned then if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false else true
	local hasResellers = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	local itemRestrictions_2 = p1.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	return isOwned and ((not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var1 or p1.isOffSale)) and not hasResellers)
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) and not (p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers)
end

local function getIsPurchaseFromResale(p1)
	-- upvalues: itemRestrictions (ref)
	local var1
	if not p1.collectibleItemDetails or not p1.collectibleItemDetails.hasResellers then
		return false
	elseif p1.priceInRobux and p1.collectibleItemDetails and (p1.collectibleItemDetails.lowestResalePrice and p1.catalogPriceStatus ~= "Free") then
		var1 = p1.collectibleItemDetails.lowestResalePrice < p1.priceInRobux
		var1 = nil
	else
		var1 = p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil
	end
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return var1 or (not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or p1.isOffSale == true)
end

local _ = function(p1)
	-- upvalues: salesLocationType (ref), itemRestrictions (ref)
	if p1.isOffSale then
		return false
	end
	local var1 = if p1.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p1.saleLocationType ~= salesLocationType.MyExperiencesOnly then p1.saleLocationType == salesLocationType.ExperiencesById else true else true
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return var1 and (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited)
end

local _ = function(p1)
	-- upvalues: salesLocationType (ref), noPriceStatus (ref)
	return if p1.isOffSale then false elseif p1.noPriceStatus ~= noPriceStatus.Free then not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p1.catalogPriceStatus == "Free" else true
end

local _ = function(p1)
	-- upvalues: noPriceStatus (ref), salesLocationType (ref)
	return if p1.isOffSale or p1.noPriceStatus == noPriceStatus.OffSale then false else not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly)
end

return function(p1)
	-- upvalues: priceStatusModule (ref), itemRestrictions (ref), getIsPurchaseFromResale (ref), salesLocationType (ref), noPriceStatus (ref)
	if not p1 then
		return priceStatusModule.Unavailable
	end
	local isOwned = p1.isOwned
	local itemRestrictions_1 = p1.itemRestrictions
	local var1 = if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p1.isOwned then if p1.collectibleItemDetails and p1.collectibleItemDetails.quantityLimitPerUser then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false else true
	local hasResellers = p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers
	local itemRestrictions_2 = p1.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	if isOwned and ((not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var1 or p1.isOffSale)) and not hasResellers) then
		return priceStatusModule.Owned
	end
	local var2
	local itemRestrictions_3 = p1.itemRestrictions
	local limited_1 = itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictions.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Collectible])
	
	if not (limited_1 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_1) and not (p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers) then
		return priceStatusModule.SoldOut
	elseif getIsPurchaseFromResale(p1) then
		return priceStatusModule.PurchaseFromResale
	elseif p1.isOffSale then
		var2 = false
	else
		local var3 = if p1.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p1.saleLocationType ~= salesLocationType.MyExperiencesOnly then p1.saleLocationType == salesLocationType.ExperiencesById else true else true
		itemRestrictions_1 = p1.itemRestrictions
		local limited_2 = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		var2 = var3 and (limited_2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_2)
	end
	return if var2 then priceStatusModule.InExperienceOnly elseif if p1.isOffSale then false elseif p1.noPriceStatus ~= noPriceStatus.Free then not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p1.catalogPriceStatus == "Free" else true then priceStatusModule.Free elseif if p1.isOffSale or p1.noPriceStatus == noPriceStatus.OffSale then false else not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly) then priceStatusModule.PurchaseFromRoblox else priceStatusModule.Unavailable
end