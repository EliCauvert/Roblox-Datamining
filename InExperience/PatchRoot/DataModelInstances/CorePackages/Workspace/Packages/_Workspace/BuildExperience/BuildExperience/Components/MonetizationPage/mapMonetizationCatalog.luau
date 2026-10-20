local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.DeveloperProduct)
local _ = require(Parent.DataHydration.GamePassConfig)
local _ = require(script.Parent.MonetizationPageView)
local MapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)

local function _(p1, p2): string
	return `{p1}:{p2}`
end

local _ = function(p1, p2)
	return if p1 == nil then p2 else tostring(p1), p1 ~= nil
end

local function mapGamePasses(GamePasses, p1, List)
	if GamePasses == nil then return end
	for _, gamePass in GamePasses.gamePasses do
		local Text = tostring(gamePass.gamePassId)
		local DefaultPriceInRobux = if gamePass.priceInformation == nil then nil else gamePass.priceInformation.defaultPriceInRobux
		local PriceUnavailable = p1.priceUnavailable
		table.insert(List, {
			productKind = "GamePass",
			canManage = false,
			id = Text,
			identity = `GamePass:{Text}`,
			name = gamePass.name or p1.gamePassType,
			price = if DefaultPriceInRobux == nil then PriceUnavailable else tostring(DefaultPriceInRobux),
			priceInRobux = DefaultPriceInRobux,
			showRobuxIcon = DefaultPriceInRobux ~= nil,
			isForSale = gamePass.isForSale == true,
			isArchived = gamePass.isArchived,
			kind = p1.gamePassType,
			saleStatus = if gamePass.isForSale == true then p1.onSale else p1.offSale,
			image = if gamePass.iconAssetId == nil then nil else `rbxassetid://{gamePass.iconAssetId}`,
			description = gamePass.description or ""
		})
	end
end

return function(p2, p3)
	-- upvalues: MapDeveloperProductsToMonetizationProductsModule (copy), mapGamePasses (copy)
	local MapDeveloperProductsToMonetizationProductsModuleResult = MapDeveloperProductsToMonetizationProductsModule(p2.developerProducts, {
		formatDefaultProductName = p3.formatDefaultProductName,
		priceUnavailable = p3.priceUnavailable,
		productType = p3.developerProductType,
		onSale = p3.onSale,
		offSale = p3.offSale
	})
	
	for _, value in MapDeveloperProductsToMonetizationProductsModuleResult do
		value.identity = `DeveloperProduct:{value.id}`
		value.productKind = "DeveloperProduct"
		value.canManage = true
		value.showRobuxIcon = value.priceInRobux ~= nil
	end
	mapGamePasses(p2.gamePasses, p3, MapDeveloperProductsToMonetizationProductsModuleResult)
	
	return MapDeveloperProductsToMonetizationProductsModuleResult
end