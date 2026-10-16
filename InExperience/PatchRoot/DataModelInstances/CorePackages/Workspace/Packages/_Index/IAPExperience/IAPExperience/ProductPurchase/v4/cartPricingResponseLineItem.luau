local IAPExperience = script:FindFirstAncestor("IAPExperience")
local DecodeLuauUnicodeEscapesModule = require(IAPExperience.Utility.decodeLuauUnicodeEscapes)
local FFlagCartPricingSupportGameItemOfferModule = require(IAPExperience.Flags.FFlagCartPricingSupportGameItemOffer)
local DiscountType = require(script.Parent.Parent.PricingTypes).DiscountType
local config = {
	RobloxPlus = "ROBLOX_PLUS",
	MarketplaceOffer = "MARKETPLACE_OFFER",
	Offer = "OFFER"
}

local function _(p1) --[[ Line: 141 | Named "mapCartPricingDiscountType" ]]
	-- upvalues: DiscountType (copy)
	return if p1 == "ROBLOX_PLUS" then DiscountType.RobloxPlusSubscription else DiscountType.Uncategorized
end

local _ = function(p1): boolean --[[ Line: 197 | Named "isOfferDiscountType" ]]
	-- upvalues: FFlagCartPricingSupportGameItemOfferModule (copy)
	return p1 == "MARKETPLACE_OFFER" or FFlagCartPricingSupportGameItemOfferModule and p1 == "OFFER"
end

local function consolidateRobloxPlusDiscounts(List) --[[ Line: 211 ]]
	-- upvalues: DiscountType (copy)
	local List1 = {}
	local Count: number? = nil
	
	for _, value in List do
		if value.type ~= DiscountType.RobloxPlusSubscription then
			table.insert(List1, value)
			continue
		end
		if Count == nil then
			table.insert(List1, {
				type = value.type,
				amountInRobux = value.amountInRobux,
				percent = value.percent,
				localizedDiscountAttribution = value.localizedDiscountAttribution
			})
			Count = #List1
		else
			local Entry = List1[Count]
			Entry.amountInRobux += value.amountInRobux
		end
	end
	return List1
end

return {
	getCartLineSalePriceInRobux = function(p1) --[[ Line: 87 ]]
		if type(p1) == "table" then
			local PriceInRobux: number = p1.priceInRobux
			
			return if type(PriceInRobux) == "number" and PriceInRobux >= 0 then PriceInRobux else nil
		else
			return nil
		end
	end,
	getCartLineRegularPriceInRobux = function(p1, p2) --[[ Line: 98 ]]
		if type(p1) == "table" then
			local RegularPriceInRobux = p1.regularPriceInRobux
			
			if type(RegularPriceInRobux) == "number" and p2 <= RegularPriceInRobux then
				return RegularPriceInRobux
			end
		end
		return p2
	end,
	extractCartPricingMarketingOffers = function(p1) --[[ Line: 108 ]]
		-- upvalues: DecodeLuauUnicodeEscapesModule (copy)
		local List = {}
		
		if type(p1) ~= "table" then
			return List
		end
		local AvailableOffers = p1.availableOffers
		
		if type(AvailableOffers) ~= "table" then
			return List
		end
		for _, availableOffer in AvailableOffers do
			if type(availableOffer) == "table" then
				local OfferId = availableOffer.offerId
				local LocalizedDescription = availableOffer.localizedDescription
				
				if type(OfferId) == "string" and OfferId ~= "" and type(LocalizedDescription) == "string" and LocalizedDescription ~= "" then
					local ExpirationTimeUtc = availableOffer.expirationTimeUtc
					table.insert(List, {
						offerId = OfferId,
						localizedDescription = DecodeLuauUnicodeEscapesModule(LocalizedDescription),
						selected = availableOffer.selected == true,
						expirationTimeUtc = if type(ExpirationTimeUtc) == "string" and ExpirationTimeUtc ~= "" then ExpirationTimeUtc else nil
					})
				end
			end
		end
		return List
	end,
	extractDiscountRowsFromLineItems = function(List) --[[ Line: 155 ]]
		-- upvalues: config (copy), DiscountType (copy), DecodeLuauUnicodeEscapesModule (copy)
		local List1 = {}
		
		if type(List) ~= "table" then
			return List1
		end
		for _, value in List do
			if type(value) == "table" then
				local DiscountInformation = value.discountInformation
				
				if type(DiscountInformation) == "table" then
					local Discounts = DiscountInformation.discounts
					
					if type(Discounts) == "table" then
						for _, discount in Discounts do
							if type(discount) == "table" then
								local RobuxDiscountAmount: number = discount.robuxDiscountAmount
								local LocalizedDiscountAttribution = discount.localizedDiscountAttribution
								
								if type(RobuxDiscountAmount) == "number" and RobuxDiscountAmount > 0 and type(LocalizedDiscountAttribution) == "string" and LocalizedDiscountAttribution ~= "" then
									table.insert(List1, {
										percent = 0,
										type = if discount.discountType == config.RobloxPlus then DiscountType.RobloxPlusSubscription else DiscountType.Uncategorized,
										amountInRobux = RobuxDiscountAmount,
										localizedDiscountAttribution = DecodeLuauUnicodeEscapesModule(LocalizedDiscountAttribution)
									})
								end
							end
						end
					end
				end
			end
		end
		return List1
	end,
	consolidateRobloxPlusDiscounts = if require(IAPExperience.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks then consolidateRobloxPlusDiscounts else nil,
	computePriceWithoutOffersDiscounts = function(List, Total): number --[[ Line: 241 ]]
		-- upvalues: config (copy), FFlagCartPricingSupportGameItemOfferModule (copy)
		local Total1: number = Total
		
		if type(List) ~= "table" then
			return Total1
		end
		for _, value in List do
			if type(value) == "table" then
				local DiscountInformation = value.discountInformation
				
				if type(DiscountInformation) == "table" then
					local Discounts = DiscountInformation.discounts
					
					if type(Discounts) == "table" then
						for _, discount in Discounts do
							if type(discount) == "table" then
								local DiscountType = discount.discountType
								
								if DiscountType == config.MarketplaceOffer or FFlagCartPricingSupportGameItemOfferModule and DiscountType == config.Offer then
									local RobuxDiscountAmount: number = discount.robuxDiscountAmount
									
									if type(RobuxDiscountAmount) == "number" and RobuxDiscountAmount > 0 then
										Total1 += RobuxDiscountAmount
									end
								end
							end
						end
					end
				end
			end
		end
		return Total1
	end,
	extractCartPricingSavingsSummary = function(p2) --[[ Line: 274 ]]
		-- upvalues: DecodeLuauUnicodeEscapesModule (copy)
		if type(p2) == "table" then
			local SavingsSummary = p2.savingsSummary
			
			return if type(SavingsSummary) == "string" and SavingsSummary ~= "" then DecodeLuauUnicodeEscapesModule(SavingsSummary) else nil
		else
			return nil
		end
	end
}