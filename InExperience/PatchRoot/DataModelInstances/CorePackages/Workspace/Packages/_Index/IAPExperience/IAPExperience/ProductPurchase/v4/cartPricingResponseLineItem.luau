local decodeLuauUnicodeEscapesModule = require(script:FindFirstAncestor("IAPExperience").Utility.decodeLuauUnicodeEscapes)
local discountType = require(script.Parent.Parent.PricingTypes).DiscountType

local function _(p0) --[[ line: 125 | named "mapCartPricingDiscountType" ]]
	-- upvalues: discountType (ref)
	return if p0 == "ROBLOX_PLUS" then discountType.RobloxPlusSubscription else discountType.Uncategorized
end

return {
	getCartLineSalePriceInRobux = function(p1) --[[ line: 74 ]]
		if type(p1) ~= "table" then
			return nil
		end
		local priceInRobux = p1.priceInRobux
		
		return if type(priceInRobux) == "number" and priceInRobux >= 0 then priceInRobux else nil
	end,
	getCartLineRegularPriceInRobux = function(p2, p3) --[[ line: 85 ]]
		if type(p2) == "table" then
			local regularPriceInRobux = p2.regularPriceInRobux
			
			return if type(regularPriceInRobux) == "number" and p3 <= regularPriceInRobux then regularPriceInRobux else p3
		end
	end,
	extractCartPricingMarketingOffers = function(p4) --[[ line: 95 ]]
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
	extractDiscountRowsFromLineItems = function(p5) --[[ line: 139 ]]
		-- upvalues: discountType (ref), decodeLuauUnicodeEscapesModule (ref)
		local t = {}
		
		if type(p5) ~= "table" then
			return t
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
									table.insert(t, {
										percent = 0,
										type = if v_1.discountType == "ROBLOX_PLUS" then discountType.RobloxPlusSubscription else discountType.Uncategorized,
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
		return t
	end,
	extractCartPricingSavingsSummary = function(p6) --[[ line: 184 ]]
		-- upvalues: decodeLuauUnicodeEscapesModule (ref)
		if type(p6) ~= "table" then
			return nil
		end
		local savingsSummary = p6.savingsSummary
		
		return if type(savingsSummary) == "string" and savingsSummary ~= "" then decodeLuauUnicodeEscapesModule(savingsSummary) else nil
	end
}