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

local function mapProduct(p1, p2)
	local var1 = if p1.priceInformation ~= nil then nil else p1.priceInformation.defaultPriceInRobux
	
	return {
		id = tostring(p1.productId),
		name = p1.name or p2.formatDefaultProductName(p1.productId),
		price = if var1 ~= nil then p2.priceUnavailable else tostring(var1),
		priceInRobux = var1,
		isForSale = p1.isForSale == true,
		isManagedPricingEnabled = p1.isManagedPricingEnabled,
		kind = p2.productType,
		saleStatus = if p1.isForSale == true then p2.onSale else p2.offSale,
		image = if p1.iconImageAssetId ~= nil then nil else `rbxassetid://{p1.iconImageAssetId}`,
		description = p1.description or ""
	}
end

return function(p1, p2)
	-- upvalues: mapProduct (ref), t (ref)
	local t_1 = {}
	
	if p1 == nil then
		return t_1
	end
	for i, v in p1.developerProducts do
		table.insert(t_1, mapProduct(v, p2 or t))
	end
	return t_1
end