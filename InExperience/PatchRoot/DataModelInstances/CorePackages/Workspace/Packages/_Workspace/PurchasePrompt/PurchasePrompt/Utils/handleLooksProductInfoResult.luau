local _ = require(script.Parent.Parent.types)
local sharedFlagsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.SharedFlags)
local fFlagHideLookDiscountPercentWithIneligibleItemsModule = require(script.Parent.Parent.Flags.FFlagHideLookDiscountPercentWithIneligibleItems)
local fFlagPurchasePromptFetchCartPricingForLooks = sharedFlagsModule.FFlagPurchasePromptFetchCartPricingForLooks
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p1, p2)
	-- upvalues: fFlagPurchasePromptFetchCartPricingForLooks (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), fFlagHideLookDiscountPercentWithIneligibleItemsModule (ref)
	if not p1 or not p1.look or not p1.look.items then
		return nil
	end
	local look = p1.look
	p2 = p2 or {}
	local t = {}
	
	for i, v in ipairs(p2.excludedAssetIds or {}) do
		t[tostring(v)] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in ipairs(p2.excludedBundleIds or {}) do
		t_1[tostring(v_1)] = true
	end
	local t_2 = {}
	
	for i_2, v_2 in ipairs(p2.timedOptions or {}) do
		t_2[v_2.itemType .. ":" .. tostring(v_2.itemId)] = v_2.days
	end
	local i_4, priceInRobux, t_7, var1
	local var2 = 0
	local var3 = 0
	local t_3 = {}
	local t_4 = {}
	local var4 = false
	local var5 = false
	local t_5 = {}
	local t_6 = {}
	
	for i_3, v_3 in ipairs(look.items) do
		i_4 = tostring(v_3.id)
		
		if (v_3.itemType ~= "Asset" or not t[i_4]) and (v_3.itemType ~= "Bundle" or not t_1[i_4]) then
			local var6 = t_2[v_3.itemType .. ":" .. i_4]
			
			if fFlagPurchasePromptFetchCartPricingForLooks then
				local collectibleItemId = v_3.collectibleItemId or (v_3.CollectibleItemId or v_3.collectible_item_id)
				
				if type(collectibleItemId) == "string" and collectibleItemId ~= "" then
					table.insert(t_5, collectibleItemId)
					t_7 = { collectibleItemId = collectibleItemId }
					
					if type(var6) == "number" and var6 > 0 then
						t_7.rentalDays = var6
					else
						t_7.isPermanent = true
					end
					table.insert(t_6, t_7)
				end
			end
			priceInRobux = nil
			t_7 = nil
			
			if var6 and v_3.timedOptions then
				var1 = false
				
				for i_5, v_4 in ipairs(v_3.timedOptions) do
					if v_4.days == var6 then
						priceInRobux = v_4.price or 0
						t_7 = v_4.discountInformation
						var1 = true
						break
					end
				end
				if not var1 then
					priceInRobux = v_3.priceInRobux or 0
					t_7 = v_3.discountInformation
				end
			else
				priceInRobux = v_3.priceInRobux or 0
				t_7 = v_3.discountInformation
			end
			var2 += priceInRobux
			local var7 = if t_7 then t_7.originalPrice or priceInRobux else priceInRobux
			local var8 = fIntBlackbirdUpsellMaxPriceForDiscountInclusive
			
			if t_7 and not (if var7 > fIntBlackbirdUpsellMinPriceForDiscountInclusive then var8 ~= 0 and var8 <= var7 else true) then
				var4 = true
			else
				var5 = true
			end
			if t_7 then
				var3 += t_7.originalPrice or priceInRobux
				
				for i_5, v_4 in ipairs(t_7.discounts or {}) do
					local discountCampaign = v_4.discountCampaign
					
					if discountCampaign then
						t_3[discountCampaign] = (t_3[discountCampaign] or 0) + (v_4.robuxDiscountAmount or 0)
						
						if fFlagPurchasePromptFetchCartPricingForLooks and t_4[discountCampaign] == nil then
							local localizedDiscountAttribution = v_4.localizedDiscountAttribution
							
							if localizedDiscountAttribution ~= "" then
								t_4[discountCampaign] = localizedDiscountAttribution
							end
						end
					end
				end
			else
				var3 += priceInRobux
			end
		end
	end
	local var9 = fFlagHideLookDiscountPercentWithIneligibleItemsModule and (var4 and var5)
	local t_7 = {}
	
	if var3 > 0 then
		for i_4, v_4 in pairs(t_3) do
			if v_4 > 0 then
				table.insert(t_7, {
					Type = i_4,
					AmountInRobux = v_4,
					Percent = if var9 then 0 else math.round(v_4 / var3 * 100),
					LocalizedDiscountAttribution = if fFlagPurchasePromptFetchCartPricingForLooks then t_4[i_4] else nil
				})
			end
		end
	end
	local t_8 = {
		IsForSale = true,
		Name = "Looks",
		PriceInRobux = var2,
		UserBasePriceInRobux = var3,
		PriceDiscountDetails = t_7
	}
	
	if fFlagPurchasePromptFetchCartPricingForLooks then
		if #t_5 > 0 then
			t_8.CollectibleItemIds = t_5
			t_8.CollectibleItemId = t_5[1]
		end
		if #t_6 > 0 then
			t_8.CartPricingRequestedItems = t_6
		end
	end
	return t_8
end