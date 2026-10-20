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

local function parseEligibleOffersFromRest(EligibleOffers)
	if type(EligibleOffers) ~= "table" then
		return {}
	end
	local List = {}
	
	for _, eligibleOffer in ipairs(EligibleOffers) do
		if type(eligibleOffer) == "table" then
			local FreeTrialOffer = if type(eligibleOffer.freeTrialOffer) == "table" then eligibleOffer.freeTrialOffer else nil
			table.insert(List, {
				Duration = tonumber(FreeTrialOffer and FreeTrialOffer.duration) or 0,
				OfferType = tostring(eligibleOffer.offerType or ""),
				PeriodType = tostring(FreeTrialOffer and FreeTrialOffer.periodType or "")
			})
		end
	end
	return List
end

local function parseDiscountsFromRest(PrivateServerDiscounts)
	if type(PrivateServerDiscounts) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, privateServerDiscount in ipairs(PrivateServerDiscounts) do
		if type(privateServerDiscount) == "table" then
			table.insert(List, {
				DiscountPercent = tonumber(privateServerDiscount.discountPercent) or 0,
				PeriodIndex = tonumber(privateServerDiscount.periodIndex) or 0,
				TierId = tostring(privateServerDiscount.tierId or "")
			})
		end
	end
	return List
end

local function parseFeatureConfigFromRest(FeatureConfig)
	-- upvalues: parseDiscountsFromRest (copy)
	local FeatureConfig1 = if type(FeatureConfig) == "table" then FeatureConfig else {}
	
	return {
		IsRobuxTransferEnabled = FeatureConfig1.isRobuxTransferEnabled == true,
		IsTradingEnabled = FeatureConfig1.isTradingEnabled == true,
		IsUgcPublishingEnabled = FeatureConfig1.isUgcPublishingEnabled == true,
		VirtualTransactionDiscounts = parseDiscountsFromRest(FeatureConfig1.virtualTransactionDiscounts),
		PrivateServerDiscounts = parseDiscountsFromRest(FeatureConfig1.privateServerDiscounts)
	}
end

local function parseLocalizedPriceFromRest(LocalizedPrice)
	local LocalizedPrice1 = if type(LocalizedPrice) == "table" then LocalizedPrice else {}
	
	return {
		CurrencyCode = tostring(LocalizedPrice1.currencyCode or ""),
		Nanos = tonumber(LocalizedPrice1.nanos) or 0,
		Units = tonumber(LocalizedPrice1.units) or 0
	}
end

local function parseProductKeyFromRest(ProductKey)
	return if type(ProductKey) == "table" then {
		Id = tostring(ProductKey.id or ""),
		Type = tostring(ProductKey.type or "")
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

function GetRobloxSubscriptionProductsModelModule.formatFromRest(p1)
	-- upvalues: parseEligibleOffersFromRest (copy), parseLocalizedPriceFromRest (copy), parseProductKeyFromRest (copy), parseFeatureConfigFromRest (copy), GetRobloxSubscriptionProductsModelModule (copy)
	assert(type(p1) == "table", "Expected products response to be a table")
	local Products = p1.products
	
	if type(Products) ~= "table" then
		return {}
	end
	local List = {}
	
	for _, product in ipairs(Products) do
		if type(product) == "table" and type(product.periodType) == "string" and product.periodType ~= "" then
			table.insert(List, GetRobloxSubscriptionProductsModelModule.new({
				EligibleOffers = parseEligibleOffersFromRest(product.eligibleOffers),
				LocalizedPrice = parseLocalizedPriceFromRest(product.localizedPrice),
				LocalizedPriceDisplayString = type(product.localizedPriceDisplayString) == "string" and product.localizedPriceDisplayString or nil,
				PeriodType = tostring(product.periodType),
				ProductKey = parseProductKeyFromRest(product.productKey),
				ProductTypeDetails = {
					RobloxSubscriptionProductDetails = {
						FeatureConfig = parseFeatureConfigFromRest(product.productTypeDetails and (product.productTypeDetails.robloxSubscriptionProductDetails and product.productTypeDetails.robloxSubscriptionProductDetails.featureConfig))
					}
				}
			}))
		end
	end
	return List
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