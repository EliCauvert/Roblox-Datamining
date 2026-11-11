local _ = require(script.Parent.Parent.types)
local SharedFlagsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.SharedFlags)
local FFlagHideLookDiscountPercentWithIneligibleItemsModule = require(script.Parent.Parent.Flags.FFlagHideLookDiscountPercentWithIneligibleItems)
local FFlagPurchasePromptFetchCartPricingForLooks = SharedFlagsModule.FFlagPurchasePromptFetchCartPricingForLooks
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p1, p2)
	-- upvalues: FFlagPurchasePromptFetchCartPricingForLooks (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), FFlagHideLookDiscountPercentWithIneligibleItemsModule (copy)
	if not p1 or not p1.look or not p1.look.items then
		return nil
	end
	local Look = p1.look
	local P1 = p2 or {}
	local t = {}
	local Iterator = ipairs
	local ExcludedAssetIds = P1.excludedAssetIds or {}
	for _, value in Iterator(ExcludedAssetIds) do
		t[tostring(value)] = true
	end
	local t1 = {}
	local Iterator1 = ipairs
	local ExcludedBundleIds = P1.excludedBundleIds or {}
	for _, value1 in Iterator1(ExcludedBundleIds) do
		t1[tostring(value1)] = true
	end
	local t2 = {}
	local Iterator2 = ipairs
	local TimedOptions = P1.timedOptions or {}
	for _, value2 in Iterator2(TimedOptions) do
		t2[value2.itemType .. ":" .. tostring(value2.itemId)] = value2.days
	end
	local PriceInRobux = 0
	local Total = 0
	local AmountInRobuxes = {}
	local LocalizedDiscountAttributions = {}
	local Flag = false
	local Flag1 = false
	local CollectibleItemIds = {}
	local CartPricingRequestedItems = {}
	local PriceInRobux1 = nil
	local DiscountInformation = nil
	local Flag2 = nil
	
	for _, item in ipairs(Look.items) do
		local Text = tostring(item.id)
		
		if (item.itemType ~= "Asset" or not t[Text]) and (item.itemType ~= "Bundle" or not t1[Text]) then
			local Entry: number = t2[item.itemType .. ":" .. Text]
			
			if FFlagPurchasePromptFetchCartPricingForLooks then
				local CollectibleItemId = item.collectibleItemId or (item.CollectibleItemId or item.collectible_item_id)
				
				if type(CollectibleItemId) == "string" and CollectibleItemId ~= "" then
					table.insert(CollectibleItemIds, CollectibleItemId)
					local config = { collectibleItemId = CollectibleItemId }
					
					if type(Entry) == "number" and Entry > 0 then
						config.rentalDays = Entry
					else
						config.isPermanent = true
					end
					table.insert(CartPricingRequestedItems, config)
				end
			end
			PriceInRobux1 = nil
			DiscountInformation = nil
			
			if Entry and item.timedOptions then
				Flag2 = false
				
				for _, timedOption in ipairs(item.timedOptions) do
					if timedOption.days == Entry then
						PriceInRobux1 = timedOption.price or 0
						DiscountInformation = timedOption.discountInformation
						Flag2 = true
						break
					end
				end
				if not Flag2 then
					PriceInRobux1 = item.priceInRobux or 0
					DiscountInformation = item.discountInformation
				end
			else
				PriceInRobux1 = item.priceInRobux or 0
				DiscountInformation = item.discountInformation
			end
			PriceInRobux += PriceInRobux1
			local OriginalPrice = DiscountInformation and DiscountInformation.originalPrice or PriceInRobux1
			
			if DiscountInformation and not (OriginalPrice <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or FIntBlackbirdUpsellMaxPriceForDiscountInclusive ~= 0 and OriginalPrice >= FIntBlackbirdUpsellMaxPriceForDiscountInclusive) then
				Flag = true
			else
				Flag1 = true
			end
			if DiscountInformation then
				Total += DiscountInformation.originalPrice or PriceInRobux1
				local Iterator3 = ipairs
				local Discounts = DiscountInformation.discounts or {}
				for _, value3 in Iterator3(Discounts) do
					local DiscountCampaign = value3.discountCampaign
					
					if DiscountCampaign then
						AmountInRobuxes[DiscountCampaign] = (AmountInRobuxes[DiscountCampaign] or 0) + (value3.robuxDiscountAmount or 0)
						
						if FFlagPurchasePromptFetchCartPricingForLooks and LocalizedDiscountAttributions[DiscountCampaign] == nil then
							local LocalizedDiscountAttribution = value3.localizedDiscountAttribution
							
							if LocalizedDiscountAttribution ~= "" then
								LocalizedDiscountAttributions[DiscountCampaign] = LocalizedDiscountAttribution
							end
						end
					end
				end
			else
				Total += PriceInRobux1
			end
		end
	end
	local Flag1_1: boolean = FFlagHideLookDiscountPercentWithIneligibleItemsModule and (Flag and Flag1)
	local PriceDiscountDetails = {}
	
	if Total > 0 then
		for Type, amountInRobux in pairs(AmountInRobuxes) do
			if amountInRobux > 0 then
				table.insert(PriceDiscountDetails, {
					Type = Type,
					AmountInRobux = amountInRobux,
					Percent = if Flag1_1 then 0 else math.round(amountInRobux / Total * 100),
					LocalizedDiscountAttribution = if FFlagPurchasePromptFetchCartPricingForLooks then LocalizedDiscountAttributions[Type] else nil
				})
			end
		end
	end
	local config = {
		IsForSale = true,
		Name = "Looks",
		PriceInRobux = PriceInRobux,
		UserBasePriceInRobux = Total,
		PriceDiscountDetails = PriceDiscountDetails
	}
	
	if FFlagPurchasePromptFetchCartPricingForLooks then
		if #CollectibleItemIds > 0 then
			config.CollectibleItemIds = CollectibleItemIds
			config.CollectibleItemId = CollectibleItemIds[1]
		end
		if #CartPricingRequestedItems > 0 then
			config.CartPricingRequestedItems = CartPricingRequestedItems
		end
	end
	return config
end