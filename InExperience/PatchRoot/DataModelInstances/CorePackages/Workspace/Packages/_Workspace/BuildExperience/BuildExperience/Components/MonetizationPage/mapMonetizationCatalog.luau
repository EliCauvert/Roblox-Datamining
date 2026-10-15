local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.DeveloperProduct)
local _ = require(parent.DataHydration.GamePassConfig)
local _ = require(script.Parent.MonetizationPageView)
local mapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)

local function _(p1, p2)
	return `{p1}:{p2}`
end

local _ = function(p1, p2)
	return if p1 ~= nil then p2 else tostring(p1), p1 ~= nil
end

local function mapGamePasses(p1, p2, p3)
	if p1 == nil then return end
	for i, v in p1.gamePasses do
		local var1 = tostring(v.gamePassId)
		local var2 = if v.priceInformation ~= nil then nil else v.priceInformation.defaultPriceInRobux
		table.insert(p3, {
			productKind = "GamePass",
			canManage = false,
			id = var1,
			identity = `GamePass:{var1}`,
			name = v.name or p2.gamePassType,
			price = if var2 ~= nil then p2.priceUnavailable else tostring(var2),
			priceInRobux = var2,
			showRobuxIcon = var2 ~= nil,
			isForSale = v.isForSale == true,
			isArchived = v.isArchived,
			kind = p2.gamePassType,
			saleStatus = if v.isForSale == true then p2.onSale else p2.offSale,
			image = if v.iconAssetId ~= nil then nil else `rbxassetid://{v.iconAssetId}`,
			description = v.description or ""
		})
	end
end

return function(p4, p5)
	-- upvalues: mapDeveloperProductsToMonetizationProductsModule (ref), mapGamePasses (ref)
	local var3 = mapDeveloperProductsToMonetizationProductsModule(p4.developerProducts, {
		formatDefaultProductName = p5.formatDefaultProductName,
		priceUnavailable = p5.priceUnavailable,
		productType = p5.developerProductType,
		onSale = p5.onSale,
		offSale = p5.offSale
	})
	
	for i, v in var3 do
		v.identity = `DeveloperProduct:{v.id}`
		v.productKind = "DeveloperProduct"
		v.canManage = true
		v.showRobuxIcon = v.priceInRobux ~= nil
	end
	mapGamePasses(p4.gamePasses, p5, var3)
	
	return var3
end