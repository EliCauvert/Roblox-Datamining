local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local itemRestrictions = require(parent.AXCommon).Enums.ItemRestrictions
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local verifiedBadgesModule = require(parent.VerifiedBadges)
local constantsModule = require(avatarExperienceInspectAndBuy.Constants)
local _ = require(avatarExperienceInspectAndBuy.Types)

return {
	isCollectible = function(p0)
		-- upvalues: itemRestrictions (ref)
		return if p0 then if p0.itemRestrictions then p0.itemRestrictions[itemRestrictions.Collectible] or p0.itemRestrictions[itemRestrictions.Limited] or p0.itemRestrictions[itemRestrictions.LimitedUnique] else false else false
	end,
	isInExperienceCreationPlayable = function(p1)
		-- upvalues: constantsModule (ref)
		local var4 = if p1 then p1.playabilityStatus else nil
		
		return var4 and constantsModule.ShowPlayableAttributionMapper[var4]
	end,
	isTradeable = function(p2)
		-- upvalues: itemRestrictions (ref)
		return p2 and (p2.itemRestrictions and (p2.itemRestrictions[itemRestrictions.Limited] or p2.itemRestrictions[itemRestrictions.LimitedUnique]))
	end,
	getPriceInRobux = function(p3, p4)
		-- upvalues: priceStatusModule (ref)
		return if p3 and p4 == priceStatusModule.PurchaseFromResale and p3.collectibleItemDetails then p3.collectibleItemDetails.lowestResalePrice elseif p3 then p3.priceInRobux else nil
	end,
	getItemWidth = function(p5, p6, p7)
		local floored = math.floor((p5 - (p6 - 1) * p7) / p6)
		
		return if floored < 0 then 0 else floored
	end,
	getCreatorName = function(p8)
		-- upvalues: verifiedBadgesModule (ref)
		return if p8 and p8.creator and (p8.creator.creatorHasVerifiedBadge and p8.creator.creatorName) then `{p8.creator.creatorName}{verifiedBadgesModule.emoji.verified}` elseif p8 and p8.creator and p8.creator.creatorName then p8.creator.creatorName else ""
	end,
	getOriginalPrice = function(p9, p10, p11)
		return if p9 and p9.isOffSale then p10 elseif p9 and p9.priceInRobux then p11(p9.priceInRobux) else ""
	end,
	getQuantitySold = function(p12, p13)
		return if p12 and p12.collectibleItemDetails and (p12.collectibleItemDetails.totalQuantity and p12.collectibleItemDetails.unitsAvailableForConsumption) then p13(p12.collectibleItemDetails.totalQuantity - p12.collectibleItemDetails.unitsAvailableForConsumption) .. "/" .. p13(p12.collectibleItemDetails.totalQuantity) else ""
	end,
	calculatePurchaseStatusForItem = function(p14, p15)
		-- upvalues: priceStatusModule (ref)
		local lowestResalePrice = nil
		local collectibleLowestAvailableResaleProductId = nil
		local collectibleLowestAvailableResaleItemInstanceId = nil
		
		if p15 == priceStatusModule.PurchaseFromResale and p14.collectibleItemDetails then
			lowestResalePrice = p14.collectibleItemDetails.lowestResalePrice
			collectibleLowestAvailableResaleProductId = p14.collectibleItemDetails.collectibleLowestAvailableResaleProductId
			collectibleLowestAvailableResaleItemInstanceId = p14.collectibleItemDetails.collectibleLowestAvailableResaleItemInstanceId
		end
		return {
			collectibleItemId = p14.collectibleItemId,
			collectibleLowestResalePrice = lowestResalePrice,
			collectibleLowestAvailableResaleProductId = collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = collectibleLowestAvailableResaleItemInstanceId
		}
	end,
	shouldShowPriceLabel = function(p16)
		-- upvalues: priceStatusModule (ref)
		return if p16 ~= nil then if p16 ~= priceStatusModule.PurchaseFromResale then p16 == priceStatusModule.PurchaseFromRoblox else true else true
	end
}