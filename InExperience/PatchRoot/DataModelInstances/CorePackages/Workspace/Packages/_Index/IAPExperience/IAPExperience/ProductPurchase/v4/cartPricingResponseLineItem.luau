local IAPExperience = script:FindFirstAncestor("IAPExperience")
local decodeLuauUnicodeEscapesModule = require(IAPExperience.Utility.decodeLuauUnicodeEscapes)
local fFlagCartPricingSupportGameItemOfferModule = require(IAPExperience.Flags.FFlagCartPricingSupportGameItemOffer)
local discountType = require(script.Parent.Parent.PricingTypes).DiscountType
local t = {
	RobloxPlus = "ROBLOX_PLUS",
	MarketplaceOffer = "MARKETPLACE_OFFER",
	Offer = "OFFER"
}

local function getCartLineSalePriceInRobux(p1)
	if type(p1) ~= "table" then
		return nil
	end
	local priceInRobux = p1.priceInRobux
	
	return if type(priceInRobux) == "number" and priceInRobux >= 0 then priceInRobux else nil
end

local function getCartLineRegularPriceInRobux(p1, p2)
	if type(p1) == "table" then
		local regularPriceInRobux = p1.regularPriceInRobux
		
		return if type(regularPriceInRobux) == "number" and p2 <= regularPriceInRobux then regularPriceInRobux else p2
	end
end

local function extractCartPricingMarketingOffers(p1)
	-- upvalues: decodeLuauUnicodeEscapesModule (ref)
	local t = {}
	
	if type(p1) ~= "table" then
		return t
	end
	local availableOffers = p1.availableOffers
	
	if type(availableOffers) ~= "table" then
		return t
	end
	for i, v in availableOffers do
		if type(v) == "table" then
			local offerId = v.offerId
			local localizedDescription = v.localizedDescription
			
			if type(offerId) == "string" and offerId ~= "" and (type(localizedDescription) == "string" and localizedDescription ~= "") then
				local expirationTimeUtc = v.expirationTimeUtc
				table.insert(t, {
					offerId = offerId,
					localizedDescription = decodeLuauUnicodeEscapesModule(localizedDescription),
					selected = v.selected == true,
					expirationTimeUtc = if type(expirationTimeUtc) == "string" and expirationTimeUtc ~= "" then expirationTimeUtc else nil
				})
			end
		end
	end
	return t
end

local function _(p2)
	-- upvalues: discountType (ref)
	return if p2 == "ROBLOX_PLUS" then discountType.RobloxPlusSubscription else discountType.Uncategorized
end

local _ = function(p2)
	-- upvalues: fFlagCartPricingSupportGameItemOfferModule (ref)
	return p2 == "MARKETPLACE_OFFER" or fFlagCartPricingSupportGameItemOfferModule and p2 == "OFFER"
end

return {
	getCartLineSalePriceInRobux = getCartLineSalePriceInRobux,
	getCartLineRegularPriceInRobux = getCartLineRegularPriceInRobux,
	extractCartPricingMarketingOffers = extractCartPricingMarketingOffers,
	extractDiscountRowsFromLineItems = function(p2)
		-- upvalues: t (ref), discountType (ref), decodeLuauUnicodeEscapesModule (ref)
		local t_1 = {}
		
		if type(p2) ~= "table" then
			return t_1
		end
		for i, v in p2 do
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
	computePriceWithoutOffersDiscounts = function(p3, p4)
		-- upvalues: t (ref), fFlagCartPricingSupportGameItemOfferModule (ref)
		local var1 = p4
		
		if type(p3) ~= "table" then
			return var1
		end
		for i, v in p3 do
			if type(v) == "table" then
				local discountInformation = v.discountInformation
				
				if type(discountInformation) == "table" then
					local discounts = discountInformation.discounts
					
					if type(discounts) == "table" then
						for i_1, v_1 in discounts do
							if type(v_1) == "table" then
								local discountType = v_1.discountType
								
								if discountType == t.MarketplaceOffer or fFlagCartPricingSupportGameItemOfferModule and discountType == t.Offer then
									local robuxDiscountAmount = v_1.robuxDiscountAmount
									
									if type(robuxDiscountAmount) == "number" and robuxDiscountAmount > 0 then
										var1 += robuxDiscountAmount
									end
								end
							end
						end
					end
				end
			end
		end
		return var1
	end,
	extractCartPricingSavingsSummary = function(p5)
		-- upvalues: decodeLuauUnicodeEscapesModule (ref)
		if type(p5) ~= "table" then
			return nil
		end
		local savingsSummary = p5.savingsSummary
		
		return if type(savingsSummary) == "string" and savingsSummary ~= "" then decodeLuauUnicodeEscapesModule(savingsSummary) else nil
	end
}