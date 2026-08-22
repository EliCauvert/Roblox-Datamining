local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local itemPurchaseActionTypeEnumModule = require(avatarExperienceCommon.Enums.ItemPurchaseActionTypeEnum)
local salesLocationTypeModule = require(avatarExperienceCommon.Enums.SalesLocationType)
local itemRestrictionsModule = require(avatarExperienceCommon.Enums.ItemRestrictions)
local fFlagAXDurablesForMIS = require(parent.AvatarExperienceFlags).FFlagAXDurablesForMIS

local function _(p0) --[[ line: 30 | named "getExperienceCount" ]]
	return #(if p0 then p0.experiences or {} else {})
end

local _ = function(p1) --[[ line: 35 | named "getAvailableInExperienceOnly" ]]
	-- upvalues: salesLocationTypeModule (ref)
	return p1.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
end

local _ = function(p2) --[[ line: 39 | named "getHasLimitedAmount" ]]
	-- upvalues: itemRestrictionsModule (ref)
	local itemRestrictions = p2.itemRestrictions
	
	return itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
end

local _ = function(p3, p4, p5) --[[ line: 47 | named "getUserHasReachedQuantityLimit" ]]
	-- upvalues: itemRestrictionsModule (ref)
	local var4
	local itemRestrictions = p3.itemRestrictions
	
	if (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Limited]) and ((not itemRestrictions or not itemRestrictions[itemRestrictionsModule.LimitedUnique]) and (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Collectible])) and p3.isOwned then
		return true
	elseif not p4 or not p4.quantityLimitPerUser then
		return false
	elseif p4 then
		var4 = false
		
		return if p4.quantityLimitPerUser > 0 then p4.quantityLimitPerUser <= p5 else var4
	end
	var4 = false
end

local _ = function(p6) --[[ line: 65 | named "getOriginalStockAvailable" ]]
	-- upvalues: itemRestrictionsModule (ref)
	local itemRestrictions = p6.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return limited and (p6.numberRobloxHasAvailable and p6.numberRobloxHasAvailable > 0) or not limited
end

local _ = function(p7, p8) --[[ line: 73 | named "getButtonTypeIsPurchaseFromResale" ]]
	-- upvalues: salesLocationTypeModule (ref), itemRestrictionsModule (ref)
	local var6
	if not p8 or not p7.hasResellers then
		return false
	elseif p7.priceInRobux and p7.lowestResalePrice then
		var6 = p7.lowestResalePrice < p7.priceInRobux
		var6 = nil
	else
		var6 = p7.lowestResalePrice ~= nil
	end
	local var7 = p7.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
	local itemRestrictions = p7.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return var6 or (if limited and (p7.numberRobloxHasAvailable and p7.numberRobloxHasAvailable > 0) or not limited then if p7.isOffSale ~= true then var7 else true else not (limited and (p7.numberRobloxHasAvailable and p7.numberRobloxHasAvailable > 0) or not limited))
end

local _ = function(p9) --[[ line: 87 | named "getButtonTypeIsFree" ]]
	-- upvalues: salesLocationTypeModule (ref)
	return if p9.isOffSale then false else not (p9.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly) and p9.priceInRobux == 0
end

local _ = function(p10, p11) --[[ line: 95 | named "getButtonTypeIsExperienceLink" ]]
	-- upvalues: salesLocationTypeModule (ref), itemRestrictionsModule (ref)
	if p10.isOffSale then
		return false
	end
	local var9 = p10.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
	local itemRestrictions = p10.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return var9 and (#(if p11 then p11.experiences or {} else {}) > 0 and (limited and (p10.numberRobloxHasAvailable and p10.numberRobloxHasAvailable > 0) or not limited))
end

local _ = function(p12, p13) --[[ line: 105 | named "getButtonTypeIsSoldOut" ]]
	-- upvalues: itemRestrictionsModule (ref)
	local itemRestrictions = p12.itemRestrictions
	local limited = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
	
	return not (limited and (p12.numberRobloxHasAvailable and p12.numberRobloxHasAvailable > 0) or not limited) and not (p13 and p12.hasResellers)
end

local _ = function(p14, p15, p16, p17) --[[ line: 111 | named "getButtonTypeIsCustomizeLink" ]]
	-- upvalues: fFlagAXDurablesForMIS (ref), itemRestrictionsModule (ref)
	local var13
	local var12 = if fFlagAXDurablesForMIS then p14.isOwned and not p14.expirationTime else p14.isOwned
	local itemRestrictions = p14.itemRestrictions
	
	if (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Limited]) and ((not itemRestrictions or not itemRestrictions[itemRestrictionsModule.LimitedUnique]) and (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Collectible])) and p14.isOwned then
		var13 = true
	elseif not p15 or not p15.quantityLimitPerUser then
		var13 = false
	elseif p15 then
		var13 = false
		
		if p15.quantityLimitPerUser > 0 then
			local _ = p15.quantityLimitPerUser <= p16
		end
	else
		var13 = false
	end
	local hasResellers = p17 and p14.hasResellers
	local itemRestrictions_1 = p14.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Collectible])
	
	return var12 and ((not (limited and (p14.numberRobloxHasAvailable and p14.numberRobloxHasAvailable > 0) or not limited) or (var13 or p14.isOffSale)) and not hasResellers)
end

local _ = function(p18) --[[ line: 127 | named "getButtonTypeIsPurchasableFromRoblox" ]]
	-- upvalues: salesLocationTypeModule (ref)
	return if p18.isOffSale then false else not (p18.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly)
end

local _ = function(_, p19, p20) --[[ line: 134 | named "getButtonTypeIsQuantityLimitExceeded" ]]
	return if p19 == nil or p19.quantityLimitPerUser == nil then false else p19.quantityLimitPerUser > 0 and p19.quantityLimitPerUser <= p20
end

return function(p21, p22, p23, p24) --[[ line: 145 | named "getItemPurchaseActionType" ]]
	-- upvalues: itemPurchaseActionTypeEnumModule (ref), fFlagAXDurablesForMIS (ref), itemRestrictionsModule (ref), salesLocationTypeModule (ref)
	if not p21 then
		return itemPurchaseActionTypeEnumModule.Disabled
	elseif if p22 == nil or p22.quantityLimitPerUser == nil then false else p22.quantityLimitPerUser > 0 and p22.quantityLimitPerUser <= p23 then
		return itemPurchaseActionTypeEnumModule.QuantityLimitExceeded
	end
	local var17
	local var16 = if fFlagAXDurablesForMIS then p21.isOwned and not p21.expirationTime else p21.isOwned
	local itemRestrictions = p21.itemRestrictions
	
	if (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Limited]) and ((not itemRestrictions or not itemRestrictions[itemRestrictionsModule.LimitedUnique]) and (not itemRestrictions or not itemRestrictions[itemRestrictionsModule.Collectible])) and p21.isOwned then
		var17 = true
	elseif not p22 or not p22.quantityLimitPerUser then
		var17 = false
	elseif p22 then
		var17 = false
		
		if p22.quantityLimitPerUser > 0 then
			local _ = p22.quantityLimitPerUser <= p23
		end
	else
		var17 = false
	end
	local hasResellers = p24 and p21.hasResellers
	local itemRestrictions_1 = p21.itemRestrictions
	local limited = itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Limited] or (itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.LimitedUnique] or itemRestrictions_1 and itemRestrictions_1[itemRestrictionsModule.Collectible])
	
	if var16 and ((not (limited and (p21.numberRobloxHasAvailable and p21.numberRobloxHasAvailable > 0) or not limited) or (var17 or p21.isOffSale)) and not hasResellers) then
		return itemPurchaseActionTypeEnumModule.CustomizeLink
	end
	local var21
	local itemRestrictions_2 = p21.itemRestrictions
	local limited_1 = itemRestrictions_2 and itemRestrictions_2[itemRestrictionsModule.Limited] or (itemRestrictions_2 and itemRestrictions_2[itemRestrictionsModule.LimitedUnique] or itemRestrictions_2 and itemRestrictions_2[itemRestrictionsModule.Collectible])
	
	if not (limited_1 and (p21.numberRobloxHasAvailable and p21.numberRobloxHasAvailable > 0) or not limited_1) and not (p24 and p21.hasResellers) then
		return itemPurchaseActionTypeEnumModule.SoldOut
	elseif p24 and p21.hasResellers then
		local var22
		if p21.priceInRobux and p21.lowestResalePrice then
			var22 = p21.lowestResalePrice < p21.priceInRobux
			var22 = nil
		else
			var22 = p21.lowestResalePrice ~= nil
		end
		local var23 = p21.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
		local itemRestrictions_3 = p21.itemRestrictions
		local limited_2 = itemRestrictions_3 and itemRestrictions_3[itemRestrictionsModule.Limited] or (itemRestrictions_3 and itemRestrictions_3[itemRestrictionsModule.LimitedUnique] or itemRestrictions_3 and itemRestrictions_3[itemRestrictionsModule.Collectible])
		var21 = var22 or (if limited_2 and (p21.numberRobloxHasAvailable and p21.numberRobloxHasAvailable > 0) or not limited_2 then if p21.isOffSale ~= true then var23 else true else not (limited_2 and (p21.numberRobloxHasAvailable and p21.numberRobloxHasAvailable > 0) or not limited_2))
	else
		var21 = false
	end
	local var25
	if var21 then
		return itemPurchaseActionTypeEnumModule.PurchaseFromResale
	elseif p21.isOffSale then
		var25 = false
	else
		local var26 = p21.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly
		itemRestrictions = p21.itemRestrictions
		local limited_2 = itemRestrictions and itemRestrictions[itemRestrictionsModule.Limited] or (itemRestrictions and itemRestrictions[itemRestrictionsModule.LimitedUnique] or itemRestrictions and itemRestrictions[itemRestrictionsModule.Collectible])
		var25 = var26 and (#(if p22 then p22.experiences or {} else {}) > 0 and (limited_2 and (p21.numberRobloxHasAvailable and p21.numberRobloxHasAvailable > 0) or not limited_2))
	end
	return if var25 then itemPurchaseActionTypeEnumModule.ExperienceLink elseif if p21.isOffSale then false else not (p21.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly) and p21.priceInRobux == 0 then itemPurchaseActionTypeEnumModule.Free elseif if p21.isOffSale then false else not (p21.saleLocationType == salesLocationTypeModule.ExperiencesDevApiOnly) then itemPurchaseActionTypeEnumModule.PurchaseFromRoblox else itemPurchaseActionTypeEnumModule.Disabled
end