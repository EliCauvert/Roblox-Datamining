local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local AXCommonModule = require(parent.AXCommon)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local itemRestrictions = AXCommonModule.Enums.ItemRestrictions
local salesLocationType = AXCommonModule.Enums.SalesLocationType
local noPriceStatus = AXCommonModule.Enums.NoPriceStatus
local fFlagAXPurchaseFromQuantityFirst = require(parent.AvatarExperienceFlags).FFlagAXPurchaseFromQuantityFirst
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

local function gethasReachedQuantityLimitOfLimitedItem(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) then
		return false
	elseif not p1.collectibleItemDetails then
		return false
	end
	local var1 = p1.isOwned == true
	local var2 = if p1.collectibleItemDetails.quantityLimitPerUser and p1.collectibleItemDetails.resellableCount then p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.quantityLimitPerUser <= p1.collectibleItemDetails.resellableCount else false
	local hasResellers = p1.collectibleItemDetails.hasResellers or false
	local itemRestrictions_2 = p1.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	return var1 and ((not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var2 or p1.isOffSale == true)) and not hasResellers)
end

local _ = function(p1)
	-- upvalues: salesLocationType (ref), noPriceStatus (ref)
	return if p1.isOffSale then false elseif p1.noPriceStatus ~= noPriceStatus.Free then not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p1.catalogPriceStatus == "Free" else true
end

local _ = function(p1)
	-- upvalues: salesLocationType (ref), itemRestrictions (ref), fFlagAXPurchaseFromQuantityFirst (ref), noPriceStatus (ref)
	if p1.isOffSale then
		return false
	end
	local var1 = if p1.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p1.saleLocationType ~= salesLocationType.MyExperiencesOnly then p1.saleLocationType == salesLocationType.ExperiencesById else true else true
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return if var1 then limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited else not fFlagAXPurchaseFromQuantityFirst and p1.noPriceStatus == noPriceStatus.InExperience
end

local function getIsPurchaseFromResale(p1, p2)
	-- upvalues: fFlagAXPurchaseFromQuantityFirst (ref), itemRestrictions (ref), salesLocationType (ref)
	local var1
	if not p1.collectibleItemDetails or not p1.collectibleItemDetails.hasResellers then
		return false
	elseif fFlagAXPurchaseFromQuantityFirst and p2 then
		local itemRestrictions_1 = p1.itemRestrictions
		local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		
		return not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited)
	elseif p2 and (if p1.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p1.saleLocationType ~= salesLocationType.MyExperiencesOnly then p1.saleLocationType == salesLocationType.ExperiencesById else true else true) then
		local itemRestrictions_1 = p1.itemRestrictions
		local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		
		return not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited)
	elseif p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil and p1.saleLocationType == salesLocationType.ShopOnly then
		return true
	elseif p1.priceInRobux and p1.collectibleItemDetails and (p1.collectibleItemDetails.lowestResalePrice and p1.catalogPriceStatus ~= "Free") then
		var1 = p1.collectibleItemDetails.lowestResalePrice < p1.priceInRobux
		var1 = nil
	else
		var1 = p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil
	end
	local var2
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	local var3 = not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or p1.isOffSale == true
	
	if not p2 then
		return var1 or var3
	elseif not var1 then
		var2 = var3
		
		if var2 then
			local itemRestrictions_2 = p1.itemRestrictions
			local limited_1 = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
			
			if limited_1 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_1 then
				var2 = true
				
				if p1.isOffSale ~= true then
					local itemRestrictions_3 = p1.itemRestrictions
					local limited_2 = itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictions.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Collectible])
					var2 = not (limited_2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_2)
				end
			end
		end
		return var2
	end
end

local _ = function(p1)
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return not (limited and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) and not (p1.collectibleItemDetails and p1.collectibleItemDetails.hasResellers)
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
	-- upvalues: noPriceStatus (ref), salesLocationType (ref)
	return if p1.isOffSale or p1.noPriceStatus == noPriceStatus.OffSale then false else not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly)
end

local _ = function(p1)
	-- upvalues: noPriceStatus (ref)
	return p1.isOffSale or p1.noPriceStatus == noPriceStatus.OffSale
end

local _ = function(p1)
	-- upvalues: salesLocationType (ref)
	return p1.saleLocationType == salesLocationType.ShopOnly
end

return function(p1, p2)
	-- upvalues: priceStatusModule (ref), gethasReachedQuantityLimitOfLimitedItem (ref), itemRestrictions (ref), getIsPurchaseFromResale (ref), salesLocationType (ref), fFlagAXPurchaseFromQuantityFirst (ref), noPriceStatus (ref)
	if not p1 then
		return priceStatusModule.Unavailable
	elseif gethasReachedQuantityLimitOfLimitedItem(p1) then
		return priceStatusModule.QuantityLimitReached
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
	elseif getIsPurchaseFromResale(p1, p2) then
		return priceStatusModule.PurchaseFromResale
	elseif p1.isOffSale then
		var2 = false
	else
		local var3 = if p1.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p1.saleLocationType ~= salesLocationType.MyExperiencesOnly then p1.saleLocationType == salesLocationType.ExperiencesById else true else true
		itemRestrictions_1 = p1.itemRestrictions
		local limited_2 = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		itemRestrictions_1 = limited_2 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0))
		var2 = if var3 then itemRestrictions_1 or not limited_2 else not fFlagAXPurchaseFromQuantityFirst and p1.noPriceStatus == noPriceStatus.InExperience
	end
	return if var2 then priceStatusModule.InExperienceOnly elseif p1.saleLocationType == salesLocationType.ShopOnly then priceStatusModule.Unavailable elseif if p1.isOffSale then false elseif p1.noPriceStatus ~= noPriceStatus.Free then not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p1.catalogPriceStatus == "Free" else true then priceStatusModule.Free elseif if p1.isOffSale or p1.noPriceStatus == noPriceStatus.OffSale then false else not (p1.saleLocationType == salesLocationType.ExperiencesDevApiOnly) then priceStatusModule.PurchaseFromRoblox elseif p1.isOffSale or p1.noPriceStatus == noPriceStatus.OffSale then priceStatusModule.OffSale else priceStatusModule.Unavailable
end