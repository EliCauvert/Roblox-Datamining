local CatalogConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.CatalogConstants)
local BuyActionButtonTypeEnumModule = require(script.Parent.BuyActionButtonTypeEnum)
local GetExperienceCountModule = require(script.Parent.getExperienceCount)
local FFlagAXShowFaeUpsell = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXShowFaeUpsell

local function _(p1): boolean
	-- upvalues: CatalogConstantsModule (copy)
	return p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly
end

local _ = function(p1)
	-- upvalues: CatalogConstantsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
	
	return ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
end

local _ = function(p1, p2, p3)
	-- upvalues: CatalogConstantsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
	
	return (not ItemRestrictions or not ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited]) and (not ItemRestriction and not ItemRestriction1) and p1.isOwned or (if p2 and p2.quantityLimitPerUser then p2.quantityLimitPerUser > 0 and p2.quantityLimitPerUser <= p3 else false)
end

local _ = function(p1): boolean
	-- upvalues: CatalogConstantsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
	local ItemRestriction2 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
	
	return ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2
end

local _ = function(p1, p2): boolean
	-- upvalues: CatalogConstantsModule (copy)
	if p2 and p1.hasResellers then
		local ItemRestrictions = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
		local ItemRestriction2 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		local Inverted: boolean = not (ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2) or p1.isOffSale == true
		
		return (if p1.priceInRobux and p1.lowestResalePrice then p1.lowestResalePrice < p1.priceInRobux else p1.lowestResalePrice ~= nil) or Inverted
	else
		return false
	end
end

local _ = function(p1): boolean
	-- upvalues: CatalogConstantsModule (copy)
	return not p1.isOffSale and (not (p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly) and p1.priceInRobux == 0)
end

local _ = function(p1, p2): boolean
	-- upvalues: CatalogConstantsModule (copy), GetExperienceCountModule (copy)
	if p1.isOffSale then
		return false
	else
		local IsSaleLocationTypeMatch = p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly
		local ItemRestrictions = p1.itemRestrictions
		local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
		local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
		local ItemRestriction2 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
		local IsNumberRobloxHasAvailableAbove: boolean = ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2
		local IsExperienceCountModuleAbove = GetExperienceCountModule(p2) > 0
		
		return IsSaleLocationTypeMatch and (IsExperienceCountModuleAbove and IsNumberRobloxHasAvailableAbove)
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: CatalogConstantsModule (copy)
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
	local ItemRestriction2 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)
	local IsNumberRobloxHasAvailableAbove: boolean = ItemRestriction2 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction2
	local HasResellers = p2 and p1.hasResellers
	
	return not IsNumberRobloxHasAvailableAbove and not HasResellers
end

local _ = function(p1, p2, p3, p4): boolean
	-- upvalues: CatalogConstantsModule (copy)
	local IsPurchasable = p1.timedOptions and p1.isPurchasable
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
	local IsOwned = not (ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)) and p1.isOwned or (if p2 and p2.quantityLimitPerUser and p2.quantityLimitPerUser > 0 then p2.quantityLimitPerUser <= p3 else false)
	local HasResellers = p4 and p1.hasResellers
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction21 = ItemRestrictions1 and ItemRestrictions1[CatalogConstantsModule.ItemRestrictions.Collectible]
	local ItemRestriction3 = ItemRestrictions1 and ItemRestrictions1[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction2 or ItemRestriction21)
	local Inverted = not (ItemRestriction3 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction3) or (IsOwned or p1.isOffSale)
	
	return p1.isOwned and (Inverted and (not HasResellers and not IsPurchasable))
end

local _ = function(p1): boolean
	-- upvalues: CatalogConstantsModule (copy)
	return not p1.isOffSale and not (p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly)
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuyActionButtonTypeEnumModule (copy), CatalogConstantsModule (copy), FFlagAXShowFaeUpsell (copy), GetExperienceCountModule (copy)
	if p4 then
		return BuyActionButtonTypeEnumModule.Loading
	end
	if not p1 then
		return BuyActionButtonTypeEnumModule.Disabled
	end
	local IsPurchasable = p1.timedOptions and p1.isPurchasable
	local ItemRestrictions = p1.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction1 = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Collectible]
	local IsOwned = not (ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction or ItemRestriction1)) and p1.isOwned or (if p2 and p2.quantityLimitPerUser and p2.quantityLimitPerUser > 0 then p2.quantityLimitPerUser <= p3 else false)
	local HasResellers = p5 and p1.hasResellers
	local ItemRestrictions1 = p1.itemRestrictions
	local ItemRestriction2 = ItemRestrictions1 and ItemRestrictions1[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction21 = ItemRestrictions1 and ItemRestrictions1[CatalogConstantsModule.ItemRestrictions.Collectible]
	local ItemRestriction3 = ItemRestrictions1 and ItemRestrictions1[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction2 or ItemRestriction21)
	local Inverted = not (ItemRestriction3 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction3) or (IsOwned or p1.isOffSale)
	
	if p1.isOwned and (Inverted and (not HasResellers and not IsPurchasable)) then
		return BuyActionButtonTypeEnumModule.CustomizeLink
	end
	if FFlagAXShowFaeUpsell and p6 and (p6.showFaeUpsell or p6.canClaimFaeItem) then
		return BuyActionButtonTypeEnumModule.UnlockableItem
	end
	local ItemRestrictions2 = p1.itemRestrictions
	local ItemRestriction4 = ItemRestrictions2 and ItemRestrictions2[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local ItemRestriction41 = ItemRestrictions2 and ItemRestrictions2[CatalogConstantsModule.ItemRestrictions.Collectible]
	local ItemRestriction5 = ItemRestrictions2 and ItemRestrictions2[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction4 or ItemRestriction41)
	local IsNumberRobloxHasAvailableAbove: boolean = ItemRestriction5 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction5
	local HasResellers1 = p5 and p1.hasResellers
	
	if not IsNumberRobloxHasAvailableAbove and not HasResellers1 then
		return BuyActionButtonTypeEnumModule.SoldOut
	end
	local IsLowestResalePriceBelow = nil
	if p5 and p1.hasResellers then
		local ItemRestrictions3 = p1.itemRestrictions
		local ItemRestriction6 = ItemRestrictions3 and ItemRestrictions3[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
		local ItemRestriction8 = ItemRestrictions3 and ItemRestrictions3[CatalogConstantsModule.ItemRestrictions.Collectible]
		local ItemRestriction9 = ItemRestrictions3 and ItemRestrictions3[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction6 or ItemRestriction8)
		local Inverted1: boolean = not (ItemRestriction9 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction9) or p1.isOffSale == true
		IsLowestResalePriceBelow = (if p1.priceInRobux and p1.lowestResalePrice then p1.lowestResalePrice < p1.priceInRobux else p1.lowestResalePrice ~= nil) or Inverted1
	else
		IsLowestResalePriceBelow = false
	end
	if IsLowestResalePriceBelow then
		return BuyActionButtonTypeEnumModule.PurchaseFromResale
	end
	local v1 = nil
	if p1.isOffSale then
		v1 = false
	else
		local IsSaleLocationTypeMatch = p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly
		local ItemRestrictions4 = p1.itemRestrictions
		local ItemRestriction7 = ItemRestrictions4 and ItemRestrictions4[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
		local ItemRestriction6 = ItemRestrictions4 and ItemRestrictions4[CatalogConstantsModule.ItemRestrictions.Collectible]
		local ItemRestriction71 = ItemRestrictions4 and ItemRestrictions4[CatalogConstantsModule.ItemRestrictions.Limited] or (ItemRestriction7 or ItemRestriction6)
		local IsNumberRobloxHasAvailableAbove1: boolean = ItemRestriction71 and (p1.numberRobloxHasAvailable and p1.numberRobloxHasAvailable > 0) or not ItemRestriction71
		local IsExperienceCountModuleAbove = GetExperienceCountModule(p2) > 0
		v1 = IsSaleLocationTypeMatch and (IsExperienceCountModuleAbove and IsNumberRobloxHasAvailableAbove1)
	end
	if v1 then
		return BuyActionButtonTypeEnumModule.ExperienceLink
	elseif not p1.isOffSale and (not (p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly) and p1.priceInRobux == 0) then
		return BuyActionButtonTypeEnumModule.Free
	else
		local Inverted2: boolean = not p1.isOffSale and not (p1.saleLocationType == CatalogConstantsModule.SaleLocationType.ExperiencesDevApiOnly)
		
		return if Inverted2 then BuyActionButtonTypeEnumModule.PurchaseFromRoblox else BuyActionButtonTypeEnumModule.Disabled
	end
end