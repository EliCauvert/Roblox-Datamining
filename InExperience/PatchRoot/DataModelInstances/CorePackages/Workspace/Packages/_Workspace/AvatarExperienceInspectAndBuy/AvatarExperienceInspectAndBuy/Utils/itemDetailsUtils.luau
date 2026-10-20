local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ItemRestrictions = require(Parent.AXCommon).Enums.ItemRestrictions
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local ConstantsModule = require(AvatarExperienceInspectAndBuy.Constants)
local _ = require(AvatarExperienceInspectAndBuy.Types)

return {
	isCollectible = function(p1): boolean
		-- upvalues: ItemRestrictions (copy)
		if not p1 then
			return false
		elseif p1.itemRestrictions then
			local ItemRestriction = p1.itemRestrictions[ItemRestrictions.Limited]
			local ItemRestriction1 = p1.itemRestrictions[ItemRestrictions.LimitedUnique]
			
			return if p1.itemRestrictions[ItemRestrictions.Collectible] or ItemRestriction or ItemRestriction1 then true else false
		else
			return false
		end
	end,
	isInExperienceCreationPlayable = function(p1): boolean
		-- upvalues: ConstantsModule (copy)
		local PlayabilityStatus = if p1 then p1.playabilityStatus else nil
		
		return if PlayabilityStatus and ConstantsModule.ShowPlayableAttributionMapper[PlayabilityStatus] then true else false
	end,
	isTradeable = function(p1)
		-- upvalues: ItemRestrictions (copy)
		return p1 and (p1.itemRestrictions and (p1.itemRestrictions[ItemRestrictions.Limited] or p1.itemRestrictions[ItemRestrictions.LimitedUnique]))
	end,
	getPriceInRobux = function(p1, PurchaseFromResale)
		-- upvalues: PriceStatusModule (copy)
		return if p1 and PurchaseFromResale == PriceStatusModule.PurchaseFromResale and p1.collectibleItemDetails then p1.collectibleItemDetails.lowestResalePrice elseif p1 then p1.priceInRobux else nil
	end,
	getItemWidth = function(p1, p2: number, p3): number
		local Floored = math.floor((p1 - (p2 - 1) * p3) / p2)
		
		return if Floored < 0 then 0 else Floored
	end,
	getCreatorName = function(p1)
		-- upvalues: VerifiedBadgesModule (copy)
		return if p1 and p1.creator and p1.creator.creatorHasVerifiedBadge and p1.creator.creatorName then `{p1.creator.creatorName}{VerifiedBadgesModule.emoji.verified}` elseif p1 and p1.creator and p1.creator.creatorName then p1.creator.creatorName else ""
	end,
	getOriginalPrice = function(p1, p2, Callback)
		return if p1 and p1.isOffSale then p2 elseif p1 and p1.priceInRobux then Callback(p1.priceInRobux) else ""
	end,
	getQuantitySold = function(p1, Callback): string
		return if p1 and p1.collectibleItemDetails and p1.collectibleItemDetails.totalQuantity and p1.collectibleItemDetails.unitsAvailableForConsumption then Callback(p1.collectibleItemDetails.totalQuantity - p1.collectibleItemDetails.unitsAvailableForConsumption) .. "/" .. Callback(p1.collectibleItemDetails.totalQuantity) else ""
	end,
	calculatePurchaseStatusForItem = function(p1, PurchaseFromResale)
		-- upvalues: PriceStatusModule (copy)
		local LowestResalePrice = nil
		local CollectibleLowestAvailableResaleProductId = nil
		local CollectibleLowestAvailableResaleItemInstanceId = nil
		
		if PurchaseFromResale == PriceStatusModule.PurchaseFromResale and p1.collectibleItemDetails then
			LowestResalePrice = p1.collectibleItemDetails.lowestResalePrice
			CollectibleLowestAvailableResaleProductId = p1.collectibleItemDetails.collectibleLowestAvailableResaleProductId
			CollectibleLowestAvailableResaleItemInstanceId = p1.collectibleItemDetails.collectibleLowestAvailableResaleItemInstanceId
		end
		return {
			collectibleItemId = p1.collectibleItemId,
			collectibleLowestResalePrice = LowestResalePrice,
			collectibleLowestAvailableResaleProductId = CollectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = CollectibleLowestAvailableResaleItemInstanceId
		}
	end,
	shouldShowPriceLabel = function(PurchaseFromResale): boolean
		-- upvalues: PriceStatusModule (copy)
		return PurchaseFromResale == nil or (PurchaseFromResale == PriceStatusModule.PurchaseFromResale or PurchaseFromResale == PriceStatusModule.PurchaseFromRoblox)
	end
}