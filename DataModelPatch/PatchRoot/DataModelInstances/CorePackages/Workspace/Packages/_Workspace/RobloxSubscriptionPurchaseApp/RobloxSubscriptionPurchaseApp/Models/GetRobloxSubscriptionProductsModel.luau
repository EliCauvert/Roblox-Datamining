local function parseEligibleOffers(EligibleOffers)
	assert(type(EligibleOffers) == "table", "Expected EligibleOffers to be a table")
	local List = {}
	
	for _, eligibleOffer in ipairs(EligibleOffers) do
		assert(type(eligibleOffer) == "table", "Expected each EligibleOffer to be a table")
		table.insert(List, {
			Duration = tonumber(eligibleOffer.Duration) or 0,
			OfferType = tostring(eligibleOffer.OfferType or ""),
			PeriodType = tostring(eligibleOffer.PeriodType or "")
		})
	end
	return List
end

local function parseRobloxSubscriptionDiscounts(PrivateServerDiscounts)
	if type(PrivateServerDiscounts) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, privateServerDiscount in ipairs(PrivateServerDiscounts) do
		if type(privateServerDiscount) == "table" then
			table.insert(List, {
				DiscountPercent = tonumber(privateServerDiscount.DiscountPercent) or 0,
				PeriodIndex = tonumber(privateServerDiscount.PeriodIndex) or 0,
				TierId = tostring(privateServerDiscount.TierId or "")
			})
		end
	end
	return List
end

local function parseFeatureConfig(FeatureConfig)
	-- upvalues: parseRobloxSubscriptionDiscounts (copy)
	assert(type(FeatureConfig) == "table", "Expected FeatureConfig to be a table")
	
	return {
		IsRobuxTransferEnabled = FeatureConfig.IsRobuxTransferEnabled == true,
		IsTradingEnabled = FeatureConfig.IsTradingEnabled == true,
		IsUgcPublishingEnabled = FeatureConfig.IsUgcPublishingEnabled == true,
		VirtualTransactionDiscounts = parseRobloxSubscriptionDiscounts(FeatureConfig.VirtualTransactionDiscounts),
		PrivateServerDiscounts = parseRobloxSubscriptionDiscounts(FeatureConfig.PrivateServerDiscounts)
	}
end

local function _(p1)
	-- upvalues: parseFeatureConfig (copy)
	assert(type(p1) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
	
	return { FeatureConfig = parseFeatureConfig(p1.FeatureConfig) }
end

local _ = function(p1)
	-- upvalues: parseFeatureConfig (copy)
	assert(type(p1) == "table", "Expected ProductTypeDetails to be a table")
	local t = {}
	local RobloxSubscriptionProductDetails = p1.RobloxSubscriptionProductDetails
	assert(type(RobloxSubscriptionProductDetails) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
	t.RobloxSubscriptionProductDetails = {
		FeatureConfig = parseFeatureConfig(RobloxSubscriptionProductDetails.FeatureConfig)
	}
	
	return t
end

local function parseLocalizedPrice(LocalizedPrice)
	assert(type(LocalizedPrice) == "table", "Expected LocalizedPrice to be a table")
	
	return {
		CurrencyCode = tostring(LocalizedPrice.CurrencyCode or ""),
		Nanos = tonumber(LocalizedPrice.Nanos) or 0,
		Units = tonumber(LocalizedPrice.Units) or 0
	}
end

local function parseProductKey(ProductKey)
	return if type(ProductKey) == "table" then {
		Id = tostring(ProductKey.Id or ""),
		Type = tostring(ProductKey.Type or "")
	} else { Id = "", Type = "" }
end

local GetRobloxSubscriptionProductsModelModule = {
	new = function(p1)
		return p1
	end
}

function GetRobloxSubscriptionProductsModelModule.format(List)
	-- upvalues: parseEligibleOffers (copy), parseLocalizedPrice (copy), parseProductKey (copy), parseFeatureConfig (copy), GetRobloxSubscriptionProductsModelModule (copy)
	assert(type(List) == "table", "Expected products response to be a table")
	local List1 = {}
	
	for _, value in ipairs(List) do
		if type(value) == "table" then
			assert(type(value.PeriodType) == "string" and value.PeriodType ~= "", "Missing or invalid PeriodType")
			local config = {
				EligibleOffers = parseEligibleOffers(value.EligibleOffers),
				LocalizedPrice = parseLocalizedPrice(value.LocalizedPrice),
				LocalizedPriceDisplayString = type(value.LocalizedPriceDisplayString) == "string" and value.LocalizedPriceDisplayString or nil,
				PeriodType = tostring(value.PeriodType),
				ProductKey = parseProductKey(value.ProductKey)
			}
			local ProductTypeDetails = value.ProductTypeDetails
			assert(type(ProductTypeDetails) == "table", "Expected ProductTypeDetails to be a table")
			local ProductTypeDetails1 = {}
			local RobloxSubscriptionProductDetails = ProductTypeDetails.RobloxSubscriptionProductDetails
			assert(type(RobloxSubscriptionProductDetails) == "table", "Expected RobloxSubscriptionProductDetails to be a table")
			ProductTypeDetails1.RobloxSubscriptionProductDetails = {
				FeatureConfig = parseFeatureConfig(RobloxSubscriptionProductDetails.FeatureConfig)
			}
			config.ProductTypeDetails = ProductTypeDetails1
			table.insert(List1, GetRobloxSubscriptionProductsModelModule.new(config))
		else
			error("Expected each product to be a table")
		end
	end
	return List1
end

function GetRobloxSubscriptionProductsModelModule.mock(List)
	-- upvalues: GetRobloxSubscriptionProductsModelModule (copy)
	local config = {
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
	
	if type(List) == "table" then
		for i, value in pairs(List) do
			config[i] = value
		end
	end
	return GetRobloxSubscriptionProductsModelModule.new(config)
end

return GetRobloxSubscriptionProductsModelModule