local DecodeLuauUnicodeEscapesModule = require(script:FindFirstAncestor("IAPExperience").Utility.decodeLuauUnicodeEscapes)
local DiscountType = require(script.Parent.Parent.PricingTypes).DiscountType

local function _(p1)
	-- upvalues: DiscountType (copy)
	return if p1 == "ROBLOX_PLUS" then DiscountType.RobloxPlusSubscription else DiscountType.Uncategorized
end

return {
	getCartLineSalePriceInRobux = function(p1)
		if type(p1) == "table" then
			local PriceInRobux: number = p1.priceInRobux
			
			return if type(PriceInRobux) == "number" and PriceInRobux >= 0 then PriceInRobux else nil
		else
			return nil
		end
	end,
	getCartLineRegularPriceInRobux = function(p1, p2)
		if type(p1) == "table" then
			local RegularPriceInRobux = p1.regularPriceInRobux
			
			if type(RegularPriceInRobux) == "number" and p2 <= RegularPriceInRobux then
				return RegularPriceInRobux
			end
		end
		return p2
	end,
	extractCartPricingMarketingOffers = function(p1)
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
					table.insert(List, {
						offerId = OfferId,
						localizedDescription = DecodeLuauUnicodeEscapesModule(LocalizedDescription),
						selected = availableOffer.selected == true
					})
				end
			end
		end
		return List
	end,
	extractDiscountRowsFromLineItems = function(List)
		-- upvalues: DiscountType (copy), DecodeLuauUnicodeEscapesModule (copy)
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
										type = if discount.discountType == "ROBLOX_PLUS" then DiscountType.RobloxPlusSubscription else DiscountType.Uncategorized,
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
	extractCartPricingSavingsSummary = function(p2)
		-- upvalues: DecodeLuauUnicodeEscapesModule (copy)
		if type(p2) == "table" then
			local SavingsSummary = p2.savingsSummary
			
			return if type(SavingsSummary) == "string" and SavingsSummary ~= "" then DecodeLuauUnicodeEscapesModule(SavingsSummary) else nil
		else
			return nil
		end
	end
}