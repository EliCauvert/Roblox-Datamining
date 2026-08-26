local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local itemPurchaseActionTypeEnumModule = require(avatarExperienceCommon.Enums.ItemPurchaseActionTypeEnum)
local salesLocationTypeModule = require(avatarExperienceCommon.Enums.SalesLocationType)
local itemRestrictionsModule = require(avatarExperienceCommon.Enums.ItemRestrictions)
local fFlagAXDurablesForMIS = require(parent.AvatarExperienceFlags).FFlagAXDurablesForMIS

local function _(p1)
	return #(if p1 then p1.experiences or {} else {})
end

local _ = function(p1)
	-- upvalues: salesLocationTypeModule (ref)
	return p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
end

local _ = function(p1)
	-- upvalues: itemRestrictionsModule (ref)
	local itemRestrictions = p1.itemRestrictions
	
	return itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
end

local _ = function(p1, p2, p3)
	-- upvalues: itemRestrictionsModule (ref)
	local var1
	local itemRestrictions = p1.itemRestrictions
	
	if (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Limited]) and ((not itemRestrictions or not itemRestrictions[itemRestrictionsModule.LimitedUnique]) and (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Collectible])) and p1.isOwned then
		return true
	elseif not p2 or not p2.quantityLimitPerUser then
		return false
	elseif p2 then
		var1 = false
		
		return if p2.quantityLimitPerUser > 0 then p2.quantityLimitPerUser <= p3 else var1
	end
	var1 = false
end

local _ = function(p1)
	-- upvalues: itemRestrictionsModule (ref)
	local itemRestrictions = p1.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited
end

local _ = function(p1, p2)
	-- upvalues: salesLocationTypeModule (ref), itemRestrictionsModule (ref)
	local var1
	if not p2 or not p1.hasResellers then
		return false
	elseif p1.priceInRobux and p1.lowestResalePrice then
		var1 = p1.lowestResalePrice < p1.priceInRobux
		var1 = nil
	else
		var1 = p1.lowestResalePrice ~= nil
	end
	local var2 = p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
	local itemRestrictions = p1.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return var1 or (if limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited then if p1.isOffSale ~= true then var2 else true else not (limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited))
end

local _ = function(p1)
	-- upvalues: salesLocationTypeModule (ref)
	return if p1.isOffSale then false else not (p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly) and p1.priceInRobux == 0
end

local _ = function(p1, p2)
	-- upvalues: salesLocationTypeModule (ref), itemRestrictionsModule (ref)
	if p1.isOffSale then
		return false
	end
	local var1 = p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
	local itemRestrictions = p1.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return var1 and (#(if p2 then p2.experiences or {} else {}) > 0 and (limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited))
end

local _ = function(p1, p2)
	-- upvalues: itemRestrictionsModule (ref)
	local itemRestrictions = p1.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return not (limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited) and not (p2 and p1.hasResellers)
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: fFlagAXDurablesForMIS (ref), itemRestrictionsModule (ref)
	local var1
	local var2 = if fFlagAXDurablesForMIS then p1.isOwned and not p1.expirationTime else p1.isOwned
	local itemRestrictions = p1.itemRestrictions
	
	if (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Limited]) and ((not itemRestrictions or not itemRestrictions[itemRestrictionsModule.LimitedUnique]) and (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Collectible])) and p1.isOwned then
		var1 = true
	elseif not p2 or not p2.quantityLimitPerUser then
		var1 = false
	elseif p2 then
		var1 = false
		
		if p2.quantityLimitPerUser > 0 then
			local _ = p2.quantityLimitPerUser <= p3
		end
	else
		var1 = false
	end
	local hasResellers = p4 and p1.hasResellers
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Collectible])
	
	return var2 and ((not (limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited) or (var1 or p1.isOffSale)) and not hasResellers)
end

local _ = function(p1)
	-- upvalues: salesLocationTypeModule (ref)
	return if p1.isOffSale then false else not (p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly)
end

local _ = function(_, p1, p2)
	return if p1 == nil or p1.quantityLimitPerUser == nil then false else p1.quantityLimitPerUser > 0 and p1.quantityLimitPerUser <= p2
end

return function(p1, p2, p3, p4)
	-- upvalues: itemPurchaseActionTypeEnumModule (ref), fFlagAXDurablesForMIS (ref), itemRestrictionsModule (ref), salesLocationTypeModule (ref)
	if not p1 then
		return itemPurchaseActionTypeEnumModule.Disabled
	elseif if p2 == nil or p2.quantityLimitPerUser == nil then false else p2.quantityLimitPerUser > 0 and p2.quantityLimitPerUser <= p3 then
		return itemPurchaseActionTypeEnumModule.QuantityLimitExceeded
	end
	local var1
	local var2 = if fFlagAXDurablesForMIS then p1.isOwned and not p1.expirationTime else p1.isOwned
	local itemRestrictions = p1.itemRestrictions
	
	if (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Limited]) and ((not itemRestrictions or not itemRestrictions[itemRestrictionsModule.LimitedUnique]) and (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Collectible])) and p1.isOwned then
		var1 = true
	elseif not p2 or not p2.quantityLimitPerUser then
		var1 = false
	elseif p2 then
		var1 = false
		
		if p2.quantityLimitPerUser > 0 then
			local _ = p2.quantityLimitPerUser <= p3
		end
	else
		var1 = false
	end
	local hasResellers = p4 and p1.hasResellers
	local itemRestrictions_1 = p1.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Collectible])
	
	if var2 and ((not (limited and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited) or (var1 or p1.isOffSale)) and not hasResellers) then
		return itemPurchaseActionTypeEnumModule.CustomizeLink
	end
	local var3
	local itemRestrictions_2 = p1.itemRestrictions
	local limited_1 = itemRestrictions_2 and itemRestrictions_2[itemRestrictionsModule.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictionsModule.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictionsModule.Collectible])
	
	if not (limited_1 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited_1) and not (p4 and p1.hasResellers) then
		return itemPurchaseActionTypeEnumModule.SoldOut
	elseif p4 and p1.hasResellers then
		local var4
		if p1.priceInRobux and p1.lowestResalePrice then
			var4 = p1.lowestResalePrice < p1.priceInRobux
			var4 = nil
		else
			var4 = p1.lowestResalePrice ~= nil
		end
		local var5 = p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
		local itemRestrictions_3 = p1.itemRestrictions
		local limited_2 = itemRestrictions_3 and itemRestrictions_3[itemRestrictionsModule.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictionsModule.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictionsModule.Collectible])
		var3 = var4 or (if limited_2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited_2 then if p1.isOffSale ~= true then var5 else true else not (limited_2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited_2))
	else
		var3 = false
	end
	local var6
	if var3 then
		return itemPurchaseActionTypeEnumModule.PurchaseFromResale
	elseif p1.isOffSale then
		var6 = false
	else
		local var7 = p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
		itemRestrictions = p1.itemRestrictions
		local limited_2 = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
		var6 = var7 and (#(if p2 then p2.experiences or {} else {}) > 0 and (limited_2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not limited_2))
	end
	return if var6 then itemPurchaseActionTypeEnumModule.ExperienceLink elseif if p1.isOffSale then false else not (p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly) and p1.priceInRobux == 0 then itemPurchaseActionTypeEnumModule.Free elseif if p1.isOffSale then false else not (p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly) then itemPurchaseActionTypeEnumModule.PurchaseFromRoblox else itemPurchaseActionTypeEnumModule.Disabled
end