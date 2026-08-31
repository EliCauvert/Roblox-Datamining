local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local developerProductModule = require(parent.DataHydration.DeveloperProduct)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local monetizationPageViewModule = require(script.Parent.MonetizationPageView)
local mapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)
local useMonetizationPageViewModelModule = require(script.Parent.useMonetizationPageViewModel)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local var1 = signalsModule.createSignal(nil)
local ready = signalsModule.createSignal("Ready")
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), reactModule (ref), localizationModule (ref), localizationStringsModule (ref), developerProductModule (ref), signalsReactModule (ref), var1 (ref), ready (ref), mapDeveloperProductsToMonetizationProductsModule (ref), useMonetizationPageViewModelModule (ref), monetizationPageViewModule (ref)
	local var2 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local var3 = if fFlagBuildLocalization then localizationModule.Hooks.useLocalization({
		priceUnavailable = localizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
		onSale = localizationStringsModule.MONETIZATION_ON_SALE,
		offSale = localizationStringsModule.MONETIZATION_OFF_SALE
	}) else nil
	local developerProductStore = developerProductModule.getDeveloperProductStore()
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), developerProductStore (ref)
		return if p1.products == nil and p1.universeId ~= nil then developerProductStore.getAndFetchProducts(p1.universeId) else nil
	end, { developerProductStore, p1.products, p1.universeId })
	local var5 = signalsReactModule.useSignalState(if var4 ~= nil then var1 else var4.data)
	local var6 = signalsReactModule.useSignalState(if var4 ~= nil then ready else var4.status)
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), mapDeveloperProductsToMonetizationProductsModule (copy), var5 (ref), fFlagBuildLocalization (copy), var2 (ref), localizationStringsModule (copy), var3 (ref)
		return if p1.products == nil then mapDeveloperProductsToMonetizationProductsModule(var5, if fFlagBuildLocalization then {
			formatDefaultProductName = function(p2)
				-- upvalues: var2 (copy), localizationStringsModule (copy)
				return var2:Format(localizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, { PRODUCT_ID = p2 })
			end,
			priceUnavailable = var3.priceUnavailable,
			onSale = var3.onSale,
			offSale = var3.offSale
		} else nil) else p1.products
	end, { var5, var3, var2, p1.products })
	local var8 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), developerProductStore (ref)
		if p1.products == nil and p1.universeId ~= nil then
			developerProductStore.fetchProducts(p1.universeId)
		end
	end, { developerProductStore, p1.products, p1.universeId })
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: developerProductStore (ref), p1 (ref)
		return developerProductStore.update(p1.universeId, p2, { isManagedPricingEnabled = p3 })
	end, { developerProductStore, p1.universeId })
	local cloned = table.clone(p1)
	cloned.products = var7
	cloned.catalogStatus = var6
	cloned.onRetryCatalog = var8
	cloned.onUpdateProductManagedPricing = if p1.universeId ~= nil then nil else var9
	
	return reactModule.createElement(monetizationPageViewModule, useMonetizationPageViewModelModule(cloned))
end