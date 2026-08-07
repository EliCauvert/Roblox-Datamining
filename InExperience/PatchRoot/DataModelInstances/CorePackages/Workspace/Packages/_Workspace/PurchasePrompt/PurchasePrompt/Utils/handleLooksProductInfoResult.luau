local _ = require(script.Parent.Parent.types)
local sharedFlagsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.SharedFlags)
local fFlagHideLookDiscountPercentWithIneligibleItemsModule = require(script.Parent.Parent.Flags.FFlagHideLookDiscountPercentWithIneligibleItems)
local fFlagPurchasePromptFetchCartPricingForLooks = sharedFlagsModule.FFlagPurchasePromptFetchCartPricingForLooks
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p0, p1) --[[ line: 37 | named "handleLooksProductInfoResult" ]]
	-- upvalues: fFlagPurchasePromptFetchCartPricingForLooks (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), fFlagHideLookDiscountPercentWithIneligibleItemsModule (ref)
	if not p0 or not p0.look or not p0.look.items then
		return nil
	end
	local look = p0.look
	p1 = p1 or {}
	local t = {}
	
	for i, v in ipairs(p1.excludedAssetIds or {}) do
		t[tostring(v)] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in ipairs(p1.excludedBundleIds or {}) do
		t_1[tostring(v_1)] = true
	end
	local t_2 = {}
	
	for i_2, v_2 in ipairs(p1.timedOptions or {}) do
		t_2[v_2.itemType .. ":" .. tostring(v_2.itemId)] = v_2.days
	end
	local i_4, priceInRobux, t_7, var21
	local var6 = 0
	local var7 = 0
	local t_3 = {}
	local t_4 = {}
	local var10 = false
	local var11 = false
	local t_5 = {}
	local t_6 = {}
	
	for i_3, v_3 in ipairs(look.items) do
		i_4 = tostring(v_3.id)
		
		if (v_3.itemType ~= "Asset" or not t[i_4]) and (v_3.itemType ~= "Bundle" or not t_1[i_4]) then
			local var17 = t_2[v_3.itemType .. ":" .. i_4]
			
			if fFlagPurchasePromptFetchCartPricingForLooks then
				local collectibleItemId = v_3.collectibleItemId or (v_3.CollectibleItemId or v_3.collectible_item_id)
				
				if type(collectibleItemId) == "string" and collectibleItemId ~= "" then
					table.insert(t_5, collectibleItemId)
					t_7 = { collectibleItemId = collectibleItemId }
					
					if type(var17) == "number" and var17 > 0 then
						t_7.rentalDays = var17
					else
						t_7.isPermanent = true
					end
					table.insert(t_6, t_7)
				end
			end
			priceInRobux = nil
			t_7 = nil
			
			if var17 and v_3.timedOptions then
				var21 = false
				
				for i_5, v_4 in ipairs(v_3.timedOptions) do
					if v_4.days == var17 then
						priceInRobux = v_4.price or 0
						t_7 = v_4.discountInformation
						var21 = true
						break
					end
				end
				if not var21 then
					priceInRobux = v_3.priceInRobux or 0
					t_7 = v_3.discountInformation
				end
			else
				priceInRobux = v_3.priceInRobux or 0
				t_7 = v_3.discountInformation
			end
			var6 += priceInRobux
			local var22 = if t_7 then t_7.originalPrice or priceInRobux else priceInRobux
			local var23 = fIntBlackbirdUpsellMaxPriceForDiscountInclusive
			
			if t_7 and not (if var22 > fIntBlackbirdUpsellMinPriceForDiscountInclusive then var23 ~= 0 and var23 <= var22 else true) then
				var10 = true
			else
				var11 = true
			end
			if t_7 then
				var7 += t_7.originalPrice or priceInRobux
				
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
				var7 += priceInRobux
			end
		end
	end
	local var11_1 = fFlagHideLookDiscountPercentWithIneligibleItemsModule and (var10 and var11)
	local t_7 = {}
	
	if var7 > 0 then
		for i_4, v_4 in pairs(t_3) do
			if v_4 > 0 then
				table.insert(t_7, {
					Type = i_4,
					AmountInRobux = v_4,
					Percent = if var11_1 then 0 else math.round(v_4 / var7 * 100),
					LocalizedDiscountAttribution = if fFlagPurchasePromptFetchCartPricingForLooks then t_4[i_4] else nil
				})
			end
		end
	end
	local t_8 = {
		IsForSale = true,
		Name = "Looks",
		PriceInRobux = var6,
		UserBasePriceInRobux = var7,
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