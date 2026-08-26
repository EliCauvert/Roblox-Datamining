local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local itemRestrictions = require(parent.AXCommon).Enums.ItemRestrictions
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local verifiedBadgesModule = require(parent.VerifiedBadges)
local constantsModule = require(avatarExperienceInspectAndBuy.Constants)
local _ = require(avatarExperienceInspectAndBuy.Types)

return {
	isCollectible = function(p1)
		-- upvalues: itemRestrictions (ref)
		return if p1 then if p1.itemRestrictions then p1.itemRestrictions[itemRestrictions.Collectible] or p1.itemRestrictions[itemRestrictions.Limited] or p1.itemRestrictions[itemRestrictions.LimitedUnique] else false else false
	end,
	isInExperienceCreationPlayable = function(p1)
		-- upvalues: constantsModule (ref)
		local var1 = if p1 then p1.playabilityStatus else nil
		
		return var1 and constantsModule.ShowPlayableAttributionMapper[var1]
	end,
	isTradeable = function(p1)
		-- upvalues: itemRestrictions (ref)
		return p1 and (p1.itemRestrictions and (p1.itemRestrictions[itemRestrictions.Limited] or p1.itemRestrictions[itemRestrictions.LimitedUnique]))
	end,
	getPriceInRobux = function(p1, p2)
		-- upvalues: priceStatusModule (ref)
		return if p1 and p2 == priceStatusModule.PurchaseFromResale and p1.collectibleItemDetails then p1.collectibleItemDetails.lowestResalePrice elseif p1 then p1.priceInRobux else nil
	end,
	getItemWidth = function(p1, p2, p3)
		local floored = math.floor((p1 - (p2 - 1) * p3) / p2)
		
		return if floored < 0 then 0 else floored
	end,
	getCreatorName = function(p1)
		-- upvalues: verifiedBadgesModule (ref)
		return if p1 and p1.creator and (p1.creator.creatorHasVerifiedBadge and p1.creator.creatorName) then `{p1.creator.creatorName}{verifiedBadgesModule.emoji.verified}` elseif p1 and p1.creator and p1.creator.creatorName then p1.creator.creatorName else ""
	end,
	getOriginalPrice = function(p1, p2, p3)
		return if p1 and p1.isOffSale then p2 elseif p1 and p1.priceInRobux then p3(p1.priceInRobux) else ""
	end,
	getQuantitySold = function(p1, p2)
		return if p1 and p1.collectibleItemDetails and (p1.collectibleItemDetails.totalQuantity and p1.collectibleItemDetails.unitsAvailableForConsumption) then p2(p1.collectibleItemDetails.totalQuantity - p1.collectibleItemDetails.unitsAvailableForConsumption) .. "/" .. p13(p1.collectibleItemDetails.totalQuantity) else ""
	end,
	calculatePurchaseStatusForItem = function(p1, p2)
		-- upvalues: priceStatusModule (ref)
		local lowestResalePrice = nil
		local collectibleLowestAvailableResaleProductId = nil
		local collectibleLowestAvailableResaleItemInstanceId = nil
		
		if p2 == priceStatusModule.PurchaseFromResale and p1.collectibleItemDetails then
			lowestResalePrice = p1.collectibleItemDetails.lowestResalePrice
			collectibleLowestAvailableResaleProductId = p1.collectibleItemDetails.collectibleLowestAvailableResaleProductId
			collectibleLowestAvailableResaleItemInstanceId = p1.collectibleItemDetails.collectibleLowestAvailableResaleItemInstanceId
		end
		return {
			collectibleItemId = p1.collectibleItemId,
			collectibleLowestResalePrice = lowestResalePrice,
			collectibleLowestAvailableResaleProductId = collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = collectibleLowestAvailableResaleItemInstanceId
		}
	end,
	shouldShowPriceLabel = function(p1)
		-- upvalues: priceStatusModule (ref)
		return if p1 ~= nil then if p1 ~= priceStatusModule.PurchaseFromResale then p1 == priceStatusModule.PurchaseFromRoblox else true else true
	end
}