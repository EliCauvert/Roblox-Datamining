local decodeLuauUnicodeEscapesModule = require(script:FindFirstAncestor("IAPExperience").Utility.decodeLuauUnicodeEscapes)
local discountType = require(script.Parent.Parent.PricingTypes).DiscountType
local t = {
	RobloxPlus = "ROBLOX_PLUS",
	MarketplaceOffer = "MARKETPLACE_OFFER"
}

local function _(p0)
	-- upvalues: discountType (ref)
	return if p0 == "ROBLOX_PLUS" then discountType.RobloxPlusSubscription else discountType.Uncategorized
end

return {
	getCartLineSalePriceInRobux = function(p1)
		if type(p1) ~= "table" then
			return nil
		end
		local priceInRobux = p1.priceInRobux
		
		return if type(priceInRobux) == "number" and priceInRobux >= 0 then priceInRobux else nil
	end,
	getCartLineRegularPriceInRobux = function(p2, p3)
		if type(p2) == "table" then
			local regularPriceInRobux = p2.regularPriceInRobux
			
			return if type(regularPriceInRobux) == "number" and p3 <= regularPriceInRobux then regularPriceInRobux else p3
		end
	end,
	extractCartPricingMarketingOffers = function(p4)
		-- upvalues: decodeLuauUnicodeEscapesModule (ref)
		local t = {}
		
		if type(p4) ~= "table" then
			return t
		end
		local availableOffers = p4.availableOffers
		
		if type(availableOffers) ~= "table" then
			return t
		end
		for i, v in availableOffers do
			if type(v) == "table" then
				local offerId = v.offerId
				local localizedDescription = v.localizedDescription
				
				if type(offerId) == "string" and offerId ~= "" and (type(localizedDescription) == "string" and localizedDescription ~= "") then
					table.insert(t, {
						offerId = offerId,
						localizedDescription = decodeLuauUnicodeEscapesModule(localizedDescription),
						selected = v.selected == true
					})
				end
			end
		end
		return t
	end,
	extractDiscountRowsFromLineItems = function(p5)
		-- upvalues: t (ref), discountType (ref), decodeLuauUnicodeEscapesModule (ref)
		local t_1 = {}
		
		if type(p5) ~= "table" then
			return t_1
		end
		for i, v in p5 do
			if type(v) == "table" then
				local discountInformation = v.discountInformation
				
				if type(discountInformation) == "table" then
					local discounts = discountInformation.discounts
					
					if type(discounts) == "table" then
						for i_1, v_1 in discounts do
							if type(v_1) == "table" then
								local robuxDiscountAmount = v_1.robuxDiscountAmount
								local localizedDiscountAttribution = v_1.localizedDiscountAttribution
								
								if type(robuxDiscountAmount) == "number" and robuxDiscountAmount > 0 and (type(localizedDiscountAttribution) == "string" and localizedDiscountAttribution ~= "") then
									table.insert(t_1, {
										percent = 0,
										type = if v_1.discountType == t.RobloxPlus then discountType.RobloxPlusSubscription else discountType.Uncategorized,
										amountInRobux = robuxDiscountAmount,
										localizedDiscountAttribution = decodeLuauUnicodeEscapesModule(localizedDiscountAttribution)
									})
								end
							end
						end
					end
				end
			end
		end
		return t_1
	end,
	computePriceWithoutOffersDiscounts = function(p6, p7)
		local var4 = p7
		
		if type(p6) ~= "table" then
			return var4
		end
		for i, v in p6 do
			if type(v) == "table" then
				local discountInformation = v.discountInformation
				
				if type(discountInformation) == "table" then
					local discounts = discountInformation.discounts
					
					if type(discounts) == "table" then
						for i_1, v_1 in discounts do
							if type(v_1) == "table" and v_1.discountType == "MARKETPLACE_OFFER" then
								local robuxDiscountAmount = v_1.robuxDiscountAmount
								
								if type(robuxDiscountAmount) == "number" and robuxDiscountAmount > 0 then
									var4 += robuxDiscountAmount
								end
							end
						end
					end
				end
			end
		end
		return var4
	end,
	extractCartPricingSavingsSummary = function(p8)
		-- upvalues: decodeLuauUnicodeEscapesModule (ref)
		if type(p8) ~= "table" then
			return nil
		end
		local savingsSummary = p8.savingsSummary
		
		return if type(savingsSummary) == "string" and savingsSummary ~= "" then decodeLuauUnicodeEscapesModule(savingsSummary) else nil
	end
}