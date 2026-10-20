local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.DeveloperProduct)
local DeveloperSubscriptionModule = require(Parent.DataHydration.DeveloperSubscription)
local _ = require(Parent.DataHydration.GamePassConfig)
local _ = require(script.Parent.MonetizationPageView)
local MapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)
local CurrencyType = DeveloperSubscriptionModule.CurrencyType
local ProductStatusType = DeveloperSubscriptionModule.ProductStatusType

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

local function mapSubscriptions(Subscriptions, p2, List)
	-- upvalues: CurrencyType (copy), ProductStatusType (copy)
	if Subscriptions == nil then return end
	for _, developerSubscription in Subscriptions.developerSubscriptions do
		local PriceInRobux = if developerSubscription.currencyType == CurrencyType.Robux then developerSubscription.priceInRobux else nil
		local PriceUnavailable = p2.priceUnavailable
		local PriceUnavailable1 = if PriceInRobux == nil then PriceUnavailable else tostring(PriceInRobux)
		local IsProductStatusTypeMatch = if developerSubscription.productStatusType == nil then nil else developerSubscription.productStatusType == ProductStatusType.Active
		table.insert(List, {
			productKind = "Subscription",
			canManage = false,
			id = developerSubscription.id,
			identity = `Subscription:{developerSubscription.id}`,
			name = developerSubscription.name or p2.subscriptionType,
			price = PriceUnavailable1,
			priceInRobux = PriceInRobux,
			showRobuxIcon = PriceInRobux ~= nil,
			isForSale = IsProductStatusTypeMatch,
			kind = p2.subscriptionType,
			saleStatus = if IsProductStatusTypeMatch == nil then nil elseif IsProductStatusTypeMatch then p2.onSale else p2.offSale,
			image = if developerSubscription.imageAssetId == nil then nil else `rbxassetid://{developerSubscription.imageAssetId}`,
			description = developerSubscription.description or ""
		})
	end
end

return function(p3, p4)
	-- upvalues: MapDeveloperProductsToMonetizationProductsModule (copy), mapGamePasses (copy), mapSubscriptions (copy)
	local MapDeveloperProductsToMonetizationProductsModuleResult = MapDeveloperProductsToMonetizationProductsModule(p3.developerProducts, {
		formatDefaultProductName = p4.formatDefaultProductName,
		priceUnavailable = p4.priceUnavailable,
		productType = p4.developerProductType,
		onSale = p4.onSale,
		offSale = p4.offSale
	})
	
	for _, value in MapDeveloperProductsToMonetizationProductsModuleResult do
		value.identity = `DeveloperProduct:{value.id}`
		value.productKind = "DeveloperProduct"
		value.canManage = true
		value.showRobuxIcon = value.priceInRobux ~= nil
	end
	mapGamePasses(p3.gamePasses, p4, MapDeveloperProductsToMonetizationProductsModuleResult)
	mapSubscriptions(p3.subscriptions, p4, MapDeveloperProductsToMonetizationProductsModuleResult)
	
	return MapDeveloperProductsToMonetizationProductsModuleResult
end