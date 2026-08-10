local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local AXCommonModule = require(parent.AXCommon)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local itemRestrictions = AXCommonModule.Enums.ItemRestrictions
local salesLocationType = AXCommonModule.Enums.SalesLocationType
local noPriceStatus = AXCommonModule.Enums.NoPriceStatus
local fFlagAXPurchaseFromQuantityFirst = require(parent.AvatarExperienceFlags).FFlagAXPurchaseFromQuantityFirst
local _ = require(avatarExperienceInspectAndBuy.Types)

local function _(p0) --[[ line: 21 | named "getAvailableInExperienceOnly" ]]
	-- upvalues: salesLocationType (ref)
	return p0.saleLocationType == salesLocationType.ExperiencesDevApiOnly
end

local _ = function(p1) --[[ line: 28 | named "getHasLimitedAmount" ]]
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p1.itemRestrictions
	
	return itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
end

local _ = function(p2) --[[ line: 40 | named "getUserHasReachedQuantityLimit" ]]
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p2.itemRestrictions
	
	return if not ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p2.isOwned) then if p2.collectibleItemDetails and p2.collectibleItemDetails.quantityLimitPerUser then p2.collectibleItemDetails.quantityLimitPerUser > 0 and p2.collectibleItemDetails.quantityLimitPerUser <= p2.collectibleItemDetails.resellableCount else false else true
end

local _ = function(p3) --[[ line: 56 | named "getOriginalStockAvailable" ]]
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p3.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return limited and (p3.collectibleItemDetails and (p3.collectibleItemDetails.unitsAvailableForConsumption and p3.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited
end

local function gethasReachedQuantityLimitOfLimitedItem(p4) --[[ line: 72 ]]
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p4.itemRestrictions
	
	if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) then
		return false
	elseif not p4.collectibleItemDetails then
		return false
	end
	local var6 = p4.isOwned == true
	local var7 = if p4.collectibleItemDetails.quantityLimitPerUser and p4.collectibleItemDetails.resellableCount then p4.collectibleItemDetails.quantityLimitPerUser > 0 and p4.collectibleItemDetails.quantityLimitPerUser <= p4.collectibleItemDetails.resellableCount else false
	local hasResellers = p4.collectibleItemDetails.hasResellers or false
	local itemRestrictions_2 = p4.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	return var6 and ((not (limited and (p4.collectibleItemDetails and (p4.collectibleItemDetails.unitsAvailableForConsumption and p4.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var7 or p4.isOffSale == true)) and not hasResellers)
end

local _ = function(p5) --[[ line: 103 | named "getIsFree" ]]
	-- upvalues: salesLocationType (ref), noPriceStatus (ref)
	return if p5.isOffSale then false elseif p5.noPriceStatus ~= noPriceStatus.Free then not (p5.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p5.catalogPriceStatus == "Free" else true
end

local _ = function(p6) --[[ line: 116 | named "getIsExperienceOnly" ]]
	-- upvalues: salesLocationType (ref), itemRestrictions (ref), fFlagAXPurchaseFromQuantityFirst (ref), noPriceStatus (ref)
	if p6.isOffSale then
		return false
	end
	local var10 = if p6.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p6.saleLocationType ~= salesLocationType.MyExperiencesOnly then p6.saleLocationType == salesLocationType.ExperiencesById else true else true
	local itemRestrictions_1 = p6.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return if var10 then limited and (p6.collectibleItemDetails and (p6.collectibleItemDetails.unitsAvailableForConsumption and p6.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited else not fFlagAXPurchaseFromQuantityFirst and p6.noPriceStatus == noPriceStatus.InExperience
end

local function getIsPurchaseFromResale(p7, p8) --[[ line: 144 ]]
	-- upvalues: fFlagAXPurchaseFromQuantityFirst (ref), itemRestrictions (ref), salesLocationType (ref)
	local var14
	if not p7.collectibleItemDetails or not p7.collectibleItemDetails.hasResellers then
		return false
	elseif fFlagAXPurchaseFromQuantityFirst and p8 then
		local itemRestrictions_1 = p7.itemRestrictions
		local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		
		return not (limited and (p7.collectibleItemDetails and (p7.collectibleItemDetails.unitsAvailableForConsumption and p7.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited)
	elseif p8 and (if p7.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p7.saleLocationType ~= salesLocationType.MyExperiencesOnly then p7.saleLocationType == salesLocationType.ExperiencesById else true else true) then
		local itemRestrictions_1 = p7.itemRestrictions
		local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		
		return not (limited and (p7.collectibleItemDetails and (p7.collectibleItemDetails.unitsAvailableForConsumption and p7.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited)
	elseif p7.collectibleItemDetails and p7.collectibleItemDetails.lowestResalePrice ~= nil and p7.saleLocationType == salesLocationType.ShopOnly then
		return true
	elseif p7.priceInRobux and p7.collectibleItemDetails and (p7.collectibleItemDetails.lowestResalePrice and p7.catalogPriceStatus ~= "Free") then
		var14 = p7.collectibleItemDetails.lowestResalePrice < p7.priceInRobux
		var14 = nil
	else
		var14 = p7.collectibleItemDetails and p7.collectibleItemDetails.lowestResalePrice ~= nil
	end
	local var17
	local itemRestrictions_1 = p7.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	local var16 = not (limited and (p7.collectibleItemDetails and (p7.collectibleItemDetails.unitsAvailableForConsumption and p7.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or p7.isOffSale == true
	
	if not p8 then
		return var14 or var16
	elseif not var14 then
		var17 = var16
		
		if var17 then
			local itemRestrictions_2 = p7.itemRestrictions
			local limited_1 = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
			
			if limited_1 and (p7.collectibleItemDetails and (p7.collectibleItemDetails.unitsAvailableForConsumption and p7.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_1 then
				var17 = true
				
				if p7.isOffSale ~= true then
					local itemRestrictions_3 = p7.itemRestrictions
					local limited_2 = itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictions.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Collectible])
					var17 = not (limited_2 and (p7.collectibleItemDetails and (p7.collectibleItemDetails.unitsAvailableForConsumption and p7.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_2)
				end
			end
		end
		return var17
	end
end

local _ = function(p9) --[[ line: 204 | named "getIsSoldOut" ]]
	-- upvalues: itemRestrictions (ref)
	local itemRestrictions_1 = p9.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
	
	return not (limited and (p9.collectibleItemDetails and (p9.collectibleItemDetails.unitsAvailableForConsumption and p9.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) and not (p9.collectibleItemDetails and p9.collectibleItemDetails.hasResellers)
end

local _ = function(p10) --[[ line: 214 | named "getIsOwned" ]]
	-- upvalues: itemRestrictions (ref)
	local isOwned = p10.isOwned
	local itemRestrictions_1 = p10.itemRestrictions
	local var21 = if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p10.isOwned then if p10.collectibleItemDetails and p10.collectibleItemDetails.quantityLimitPerUser then p10.collectibleItemDetails.quantityLimitPerUser > 0 and p10.collectibleItemDetails.quantityLimitPerUser <= p10.collectibleItemDetails.resellableCount else false else true
	local hasResellers = p10.collectibleItemDetails and p10.collectibleItemDetails.hasResellers
	local itemRestrictions_2 = p10.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	return isOwned and ((not (limited and (p10.collectibleItemDetails and (p10.collectibleItemDetails.unitsAvailableForConsumption and p10.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var21 or p10.isOffSale)) and not hasResellers)
end

local _ = function(p11) --[[ line: 228 | named "getIsPurchasableFromRoblox" ]]
	-- upvalues: noPriceStatus (ref), salesLocationType (ref)
	return if p11.isOffSale or p11.noPriceStatus == noPriceStatus.OffSale then false else not (p11.saleLocationType == salesLocationType.ExperiencesDevApiOnly)
end

local _ = function(p12) --[[ line: 238 | named "getIsOffSale" ]]
	-- upvalues: noPriceStatus (ref)
	return p12.isOffSale or p12.noPriceStatus == noPriceStatus.OffSale
end

local _ = function(p13) --[[ line: 246 | named "getIsShopOnly" ]]
	-- upvalues: salesLocationType (ref)
	return p13.saleLocationType == salesLocationType.ShopOnly
end

return function(p14, p15) --[[ line: 254 | named "getPriceStatus" ]]
	-- upvalues: priceStatusModule (ref), gethasReachedQuantityLimitOfLimitedItem (ref), itemRestrictions (ref), getIsPurchaseFromResale (ref), salesLocationType (ref), fFlagAXPurchaseFromQuantityFirst (ref), noPriceStatus (ref)
	if not p14 then
		return priceStatusModule.Unavailable
	elseif gethasReachedQuantityLimitOfLimitedItem(p14) then
		return priceStatusModule.QuantityLimitReached
	end
	local isOwned = p14.isOwned
	local itemRestrictions_1 = p14.itemRestrictions
	local var24 = if (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Limited]) and ((not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.LimitedUnique]) and (not itemRestrictions_1 or not itemRestrictions_1[itemRestrictions.Collectible])) and p14.isOwned then if p14.collectibleItemDetails and p14.collectibleItemDetails.quantityLimitPerUser then p14.collectibleItemDetails.quantityLimitPerUser > 0 and p14.collectibleItemDetails.quantityLimitPerUser <= p14.collectibleItemDetails.resellableCount else false else true
	local hasResellers = p14.collectibleItemDetails and p14.collectibleItemDetails.hasResellers
	local itemRestrictions_2 = p14.itemRestrictions
	local limited = itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictions.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictions.Collectible])
	
	if isOwned and ((not (limited and (p14.collectibleItemDetails and (p14.collectibleItemDetails.unitsAvailableForConsumption and p14.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited) or (var24 or p14.isOffSale)) and not hasResellers) then
		return priceStatusModule.Owned
	end
	local var28
	local itemRestrictions_3 = p14.itemRestrictions
	local limited_1 = itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictions.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictions.Collectible])
	
	if not (limited_1 and (p14.collectibleItemDetails and (p14.collectibleItemDetails.unitsAvailableForConsumption and p14.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not limited_1) and not (p14.collectibleItemDetails and p14.collectibleItemDetails.hasResellers) then
		return priceStatusModule.SoldOut
	elseif getIsPurchaseFromResale(p14, p15) then
		return priceStatusModule.PurchaseFromResale
	elseif p14.isOffSale then
		var28 = false
	else
		local var29 = if p14.saleLocationType ~= salesLocationType.ExperiencesDevApiOnly then if p14.saleLocationType ~= salesLocationType.MyExperiencesOnly then p14.saleLocationType == salesLocationType.ExperiencesById else true else true
		itemRestrictions_1 = p14.itemRestrictions
		local limited_2 = itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictions.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictions.Collectible])
		itemRestrictions_1 = limited_2 and (p14.collectibleItemDetails and (p14.collectibleItemDetails.unitsAvailableForConsumption and p14.collectibleItemDetails.unitsAvailableForConsumption > 0))
		var28 = if var29 then itemRestrictions_1 or not limited_2 else not fFlagAXPurchaseFromQuantityFirst and p14.noPriceStatus == noPriceStatus.InExperience
	end
	return if var28 then priceStatusModule.InExperienceOnly elseif p14.saleLocationType == salesLocationType.ShopOnly then priceStatusModule.Unavailable elseif if p14.isOffSale then false elseif p14.noPriceStatus ~= noPriceStatus.Free then not (p14.saleLocationType == salesLocationType.ExperiencesDevApiOnly) or p14.catalogPriceStatus == "Free" else true then priceStatusModule.Free elseif if p14.isOffSale or p14.noPriceStatus == noPriceStatus.OffSale then false else not (p14.saleLocationType == salesLocationType.ExperiencesDevApiOnly) then priceStatusModule.PurchaseFromRoblox elseif p14.isOffSale or p14.noPriceStatus == noPriceStatus.OffSale then priceStatusModule.OffSale else priceStatusModule.Unavailable
end