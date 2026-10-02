local function parseEligibleOffers(p1)
	assert(type(p1) == "table", "Expected EligibleOffers to be a table")
	local t = {}
	
	for i, v in ipairs(p1) do
		assert(type(v) == "table", "Expected each EligibleOffer to be a table")
		table.insert(t, {
			Duration = tonumber(v.Duration) or 0,
			OfferType = tostring(v.OfferType or ""),
			PeriodType = tostring(v.PeriodType or "")
		})
	end
	return t
end

local function parseRobloxSubscriptionDiscounts(p2)
	if type(p2) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p2) do
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

local function parseFeatureConfig(p3)
	-- upvalues: parseRobloxSubscriptionDiscounts (ref)
	assert(type(p3) == "table", "Expected FeatureConfig to be a table")
	
	return {
		IsRobuxTransferEnabled = p3.IsRobuxTransferEnabled == true,
		IsTradingEnabled = p3.IsTradingEnabled == true,
		IsUgcPublishingEnabled = p3.IsUgcPublishingEnabled == true,
		VirtualTransactionDiscounts = parseRobloxSubscriptionDiscounts(p3.VirtualTransactionDiscounts),
		PrivateServerDiscounts = parseRobloxSubscriptionDiscounts(p3.PrivateServerDiscounts)
	}
end

local function _(p3)
	-- upvalues: parseFeatureConfig (ref)
	assert(type(p3) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
	
	return { FeatureConfig = parseFeatureConfig(p3.FeatureConfig) }
end

local _ = function(p3)
	-- upvalues: parseFeatureConfig (ref)
	assert(type(p3) == "table", "Expected ProductTypeDetails to be a table")
	local t = {}
	local robloxSubscriptionProductDetails = p3.RobloxSubscriptionProductDetails
	assert(type(robloxSubscriptionProductDetails) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
	t.RobloxSubscriptionProductDetails = {
		FeatureConfig = parseFeatureConfig(robloxSubscriptionProductDetails.FeatureConfig)
	}
	
	return t
end

local function parseLocalizedPrice(p3)
	assert(type(p3) == "table", "Expected LocalizedPrice to be a table")
	
	return {
		CurrencyCode = tostring(p3.CurrencyCode or ""),
		Nanos = tonumber(p3.Nanos) or 0,
		Units = tonumber(p3.Units) or 0
	}
end

local function parseProductKey(p3)
	return if type(p3) == "table" then {
		Id = tostring(p3.Id or ""),
		Type = tostring(p3.Type or "")
	} else { Id = "", Type = "" }
end

local function parseEligibleOffersFromRest(p3)
	if type(p3) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, v in ipairs(p3) do
		if type(v) == "table" then
			local var1 = if type(v.freeTrialOffer) == "table" then v.freeTrialOffer else nil
			table.insert(t, {
				Duration = tonumber(var1 and var1.duration) or 0,
				OfferType = tostring(v.offerType or ""),
				PeriodType = tostring(if var1 then var1.periodType else "")
			})
		end
	end
	return t
end

local function parseDiscountsFromRest(p4)
	if type(p4) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p4) do
		if type(v) == "table" then
			table.insert(t, {
				DiscountPercent = tonumber(v.discountPercent) or 0,
				PeriodIndex = tonumber(v.periodIndex) or 0,
				TierId = tostring(v.tierId or "")
			})
		end
	end
	return t
end

local function parseFeatureConfigFromRest(p5)
	-- upvalues: parseDiscountsFromRest (ref)
	local var2 = if type(p5) == "table" then p5 else {}
	
	return {
		IsRobuxTransferEnabled = var2.isRobuxTransferEnabled == true,
		IsTradingEnabled = var2.isTradingEnabled == true,
		IsUgcPublishingEnabled = var2.isUgcPublishingEnabled == true,
		VirtualTransactionDiscounts = parseDiscountsFromRest(var2.virtualTransactionDiscounts),
		PrivateServerDiscounts = parseDiscountsFromRest(var2.privateServerDiscounts)
	}
end

local function parseLocalizedPriceFromRest(p5)
	local var2 = if type(p5) == "table" then p5 else {}
	
	return {
		CurrencyCode = tostring(var2.currencyCode or ""),
		Nanos = tonumber(var2.nanos) or 0,
		Units = tonumber(var2.units) or 0
	}
end

local function parseProductKeyFromRest(p5)
	return if type(p5) == "table" then {
		Id = tostring(p5.id or ""),
		Type = tostring(p5.type or "")
	} else { Id = "", Type = "" }
end

local t = {
	new = function(p5)
		return p5
	end
}

function t.format(p5)
	-- upvalues: parseEligibleOffers (ref), parseLocalizedPrice (ref), parseProductKey (ref), parseFeatureConfig (ref), t (ref)
	assert(type(p5) == "table", "Expected products response to be a table")
	local t_1 = {}
	
	for i, v in ipairs(p5) do
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

function t.formatFromRest(p6)
	-- upvalues: parseEligibleOffersFromRest (ref), parseLocalizedPriceFromRest (ref), parseProductKeyFromRest (ref), parseFeatureConfigFromRest (ref), t (ref)
	assert(type(p6) == "table", "Expected products response to be a table")
	local products = p6.products
	
	if type(products) ~= "table" then
		return {}
	end
	local t_1 = {}
	
	for i, v in ipairs(products) do
		if type(v) == "table" and type(v.periodType) == "string" and v.periodType ~= "" then
			table.insert(t_1, t.new({
				EligibleOffers = parseEligibleOffersFromRest(v.eligibleOffers),
				LocalizedPrice = parseLocalizedPriceFromRest(v.localizedPrice),
				LocalizedPriceDisplayString = if type(v.localizedPriceDisplayString) == "string" then v.localizedPriceDisplayString else nil,
				PeriodType = tostring(v.periodType),
				ProductKey = parseProductKeyFromRest(v.productKey),
				ProductTypeDetails = {
					RobloxSubscriptionProductDetails = {
						FeatureConfig = parseFeatureConfigFromRest(v.productTypeDetails and (v.productTypeDetails.robloxSubscriptionProductDetails and v.productTypeDetails.robloxSubscriptionProductDetails.featureConfig))
					}
				}
			}))
		end
	end
	return t_1
end

function t.mock(p7)
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
	
	if type(p7) == "table" then
		for i, v in pairs(p7) do
			t_1[i] = v
		end
	end
	return t.new(t_1)
end

return t