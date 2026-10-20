local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Parent.DataHydration.DeveloperProduct)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.MonetizationPageView)
local config = {
	formatDefaultProductName = function(ProductId): string
		-- upvalues: LocalizationStringsModule (copy)
		return (string.gsub(LocalizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, "{PRODUCT_ID}", (tostring(ProductId))))
	end,
	priceUnavailable = LocalizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
	productType = LocalizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
	onSale = LocalizationStringsModule.MONETIZATION_ON_SALE,
	offSale = LocalizationStringsModule.MONETIZATION_OFF_SALE
}

local function _(p1, p2): boolean
	local PriceInformation = p1.priceInformation
	
	if PriceInformation == nil then
		return false
	end
	local EnabledFeatures = PriceInformation.enabledFeatures
	
	if EnabledFeatures == nil then
		return false
	end
	for _, enabledFeature in EnabledFeatures do
		if enabledFeature == p2 then
			return true
		end
	end
	return false
end

local function mapProduct(p3, p4)
	local DefaultPriceInRobux = if p3.priceInformation == nil then nil else p3.priceInformation.defaultPriceInRobux
	local config = {
		id = tostring(p3.productId),
		name = p3.name or p4.formatDefaultProductName(p3.productId),
		price = if DefaultPriceInRobux == nil then p4.priceUnavailable else tostring(DefaultPriceInRobux),
		priceInRobux = DefaultPriceInRobux,
		isForSale = p3.isForSale == true,
		isManagedPricingEnabled = p3.isManagedPricingEnabled,
		isArchived = p3.isArchived,
		isImmutable = p3.isImmutable
	}
	local PriceInformation = p3.priceInformation
	local Flag = nil
	
	if PriceInformation == nil then
		Flag = false
	else
		local EnabledFeatures = PriceInformation.enabledFeatures
		
		if EnabledFeatures == nil then
			Flag = false
		else
			Flag = false
			
			for _, enabledFeature in EnabledFeatures do
				if enabledFeature == "PriceOptimization" then
					Flag = true
					break
				end
			end
		end
	end
	config.isInActivePriceOptimizationExperiment = Flag
	config.kind = p4.productType
	config.saleStatus = if p3.isForSale == true then p4.onSale else p4.offSale
	config.image = if p3.iconImageAssetId == nil then nil else `rbxassetid://{p3.iconImageAssetId}`
	config.description = p3.description or ""
	
	return config
end

return function(p5, p6)
	-- upvalues: mapProduct (copy), config (copy)
	local List = {}
	
	if p5 == nil then
		return List
	end
	for _, developerProduct in p5.developerProducts do
		table.insert(List, (mapProduct(developerProduct, p6 or config)))
	end
	return List
end