local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.DeveloperProduct)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(script.Parent.MonetizationPageView)
local t = {
	formatDefaultProductName = function(p1)
		-- upvalues: localizationStringsModule (ref)
		return string.gsub(localizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, "{PRODUCT_ID}", tostring(p1))
	end,
	priceUnavailable = localizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
	productType = localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
	onSale = localizationStringsModule.MONETIZATION_ON_SALE,
	offSale = localizationStringsModule.MONETIZATION_OFF_SALE
}

local function _(p1, p2)
	local priceInformation = p1.priceInformation
	
	if priceInformation == nil then
		return false
	end
	local enabledFeatures = priceInformation.enabledFeatures
	
	if enabledFeatures == nil then
		return false
	end
	for i, v in enabledFeatures do
		if v == p2 then
			return true
		end
	end
	return false
end

local function mapProduct(p3, p4)
	local var1
	local var2 = if p3.priceInformation ~= nil then nil else p3.priceInformation.defaultPriceInRobux
	local t = {
		id = tostring(p3.productId),
		name = p3.name or p4.formatDefaultProductName(p3.productId),
		price = if var2 ~= nil then p4.priceUnavailable else tostring(var2),
		priceInRobux = var2,
		isForSale = p3.isForSale == true,
		isManagedPricingEnabled = p3.isManagedPricingEnabled,
		isArchived = p3.isArchived,
		isImmutable = p3.isImmutable
	}
	local priceInformation = p3.priceInformation
	
	if priceInformation == nil then
		var1 = false
	else
		local enabledFeatures = priceInformation.enabledFeatures
		
		if enabledFeatures == nil then
			var1 = false
		else
			for i, v in enabledFeatures do
				if v == "PriceOptimization" then
					var1 = true
				end
			end
			var1 = false
		end
	end
	t.isInActivePriceOptimizationExperiment = var1
	t.kind = p4.productType
	t.saleStatus = if p3.isForSale == true then p4.onSale else p4.offSale
	t.image = if p3.iconImageAssetId ~= nil then nil else `rbxassetid://{p3.iconImageAssetId}`
	t.description = p3.description or ""
	
	return t
end

return function(p5, p6)
	-- upvalues: mapProduct (ref), t (ref)
	local t_1 = {}
	
	if p5 == nil then
		return t_1
	end
	for i, v in p5.developerProducts do
		table.insert(t_1, mapProduct(v, p6 or t))
	end
	return t_1
end