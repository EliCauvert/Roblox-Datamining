local function parseEligibleOffers(p0) --[[ line: 51 ]]
	assert(type(p0) == "table", "Expected EligibleOffers to be a table")
	local t = {}
	
	for i, v in ipairs(p0) do
		assert(type(v) == "table", "Expected each EligibleOffer to be a table")
		table.insert(t, {
			Duration = tonumber(v.Duration) or 0,
			OfferType = tostring(v.OfferType or ""),
			PeriodType = tostring(v.PeriodType or "")
		})
	end
	return t
end

local function parseRobloxSubscriptionDiscounts(p1) --[[ line: 65 ]]
	if type(p1) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p1) do
		if type(v) == "table" then
			table.insert(t, {
				DiscountPercent = tonumber(v.DiscountPercent) or 0,
				PeriodIndex = tonumber(v.PeriodIndex) or 0,
				TierId = tostring(v.TierId or "")
			})
		end
	end
	return t
end

local function parseFeatureConfig(p2) --[[ line: 82 ]]
	-- upvalues: parseRobloxSubscriptionDiscounts (ref)
	assert(type(p2) == "table", "Expected FeatureConfig to be a table")
	
	return {
		IsRobuxTransferEnabled = p2.IsRobuxTransferEnabled == true,
		IsTradingEnabled = p2.IsTradingEnabled == true,
		IsUgcPublishingEnabled = p2.IsUgcPublishingEnabled == true,
		VirtualTransactionDiscounts = parseRobloxSubscriptionDiscounts(p2.VirtualTransactionDiscounts),
		PrivateServerDiscounts = parseRobloxSubscriptionDiscounts(p2.PrivateServerDiscounts)
	}
end

local function _(p3) --[[ line: 94 | named "parseRobloxSubscriptionProductDetails" ]]
	-- upvalues: parseFeatureConfig (ref)
	assert(type(p3) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
	
	return { FeatureConfig = parseFeatureConfig(p3.FeatureConfig) }
end

local _ = function(p4) --[[ line: 101 | named "parseProductTypeDetails" ]]
	-- upvalues: parseFeatureConfig (ref)
	assert(type(p4) == "table", "Expected ProductTypeDetails to be a table")
	local t = {}
	local robloxSubscriptionProductDetails = p4.RobloxSubscriptionProductDetails
	assert(type(robloxSubscriptionProductDetails) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
	t.RobloxSubscriptionProductDetails = {
		FeatureConfig = parseFeatureConfig(robloxSubscriptionProductDetails.FeatureConfig)
	}
	
	return t
end

local function parseLocalizedPrice(p5) --[[ line: 108 ]]
	assert(type(p5) == "table", "Expected LocalizedPrice to be a table")
	
	return {
		CurrencyCode = tostring(p5.CurrencyCode or ""),
		Nanos = tonumber(p5.Nanos) or 0,
		Units = tonumber(p5.Units) or 0
	}
end

local function parseProductKey(p6) --[[ line: 117 ]]
	return if type(p6) == "table" then {
		Id = tostring(p6.Id or ""),
		Type = tostring(p6.Type or "")
	} else { Id = "", Type = "" }
end

local t = {
	new = function(p7) --[[ line: 129 ]]
		return p7
	end
}

function t.format(p8) --[[ line: 134 ]]
	-- upvalues: parseEligibleOffers (ref), parseLocalizedPrice (ref), parseProductKey (ref), parseFeatureConfig (ref), t (ref)
	assert(type(p8) == "table", "Expected products response to be a table")
	local t_1 = {}
	
	for i, v in ipairs(p8) do
		if type(v) == "table" then
			assert(type(v.PeriodType) == "string" and v.PeriodType ~= "", "Missing or invalid PeriodType")
			local t_2 = {
				EligibleOffers = parseEligibleOffers(v.EligibleOffers),
				LocalizedPrice = parseLocalizedPrice(v.LocalizedPrice),
				LocalizedPriceDisplayString = if type(v.LocalizedPriceDisplayString) == "string" then v.LocalizedPriceDisplayString else nil,
				PeriodType = tostring(v.PeriodType),
				ProductKey = parseProductKey(v.ProductKey)
			}
			local productTypeDetails = v.ProductTypeDetails
			assert(type(productTypeDetails) == "table", "Expected ProductTypeDetails to be a table")
			local t_3 = {}
			local robloxSubscriptionProductDetails = productTypeDetails.RobloxSubscriptionProductDetails
			assert(type(robloxSubscriptionProductDetails) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
			t_3.RobloxSubscriptionProductDetails = {
				FeatureConfig = parseFeatureConfig(robloxSubscriptionProductDetails.FeatureConfig)
			}
			t_2.ProductTypeDetails = t_3
			table.insert(t_1, t.new(t_2))
		else
			error("Expected each product to be a table")
		end
	end
	return t_1
end

function t.mock(p9) --[[ line: 158 ]]
	-- upvalues: t (ref)
	local t_1 = {
		LocalizedPriceDisplayString = "$12.99",
		PeriodType = "Month",
		EligibleOffers = {
			{
				Duration = 1,
				OfferType = "FreeTrial",
				PeriodType = "Month"
			}
		},
		LocalizedPrice = { CurrencyCode = "USD", Nanos = 990000000, Units = 12 },
		ProductKey = { Id = "8429606799668938154", Type = "Blackbird" },
		ProductTypeDetails = {
			RobloxSubscriptionProductDetails = {
				FeatureConfig = {
					IsRobuxTransferEnabled = true,
					IsTradingEnabled = true,
					IsUgcPublishingEnabled = true,
					VirtualTransactionDiscounts = {
						{
							DiscountPercent = 1,
							PeriodIndex = 0,
							TierId = "percent_1"
						},
						{
							DiscountPercent = 50,
							PeriodIndex = 2,
							TierId = "percent_50"
						}
					},
					PrivateServerDiscounts = {
						{ DiscountPercent = 100, PeriodIndex = 0, TierId = "free" }
					}
				}
			}
		}
	}
	
	if type(p9) == "table" then
		for i, v in pairs(p9) do
			t_1[i] = v
		end
	end
	return t.new(t_1)
end

return t