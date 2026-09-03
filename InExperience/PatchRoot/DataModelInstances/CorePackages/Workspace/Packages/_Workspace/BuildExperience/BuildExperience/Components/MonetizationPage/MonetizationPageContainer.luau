local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local developerProductModule = require(parent.DataHydration.DeveloperProduct)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local monetizationPageViewModule = require(script.Parent.MonetizationPageView)
local mapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)
local useMonetizationPageViewModelModule = require(script.Parent.useMonetizationPageViewModel)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local var1 = signalsModule.createSignal(nil)
local ready = signalsModule.createSignal("Ready")

return function(p1)
	-- upvalues: reactModule (ref), localizationModule (ref), localizationStringsModule (ref), developerProductModule (ref), signalsReactModule (ref), var1 (ref), ready (ref), sendBuildExperienceEventModule (ref), mapDeveloperProductsToMonetizationProductsModule (ref), fFlagBuildExperienceManageDevProductModule (ref), useMonetizationPageViewModelModule (ref), monetizationPageViewModule (ref)
	local var2 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local var3 = localizationModule.Hooks.useLocalization({
		priceUnavailable = localizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
		productType = localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		onSale = localizationStringsModule.MONETIZATION_ON_SALE,
		offSale = localizationStringsModule.MONETIZATION_OFF_SALE
	})
	local developerProductStore = developerProductModule.getDeveloperProductStore()
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), developerProductStore (ref)
		return if p1.products == nil and p1.universeId ~= nil then developerProductStore.getAndFetchProducts(p1.universeId) else nil
	end, { developerProductStore, p1.products, p1.universeId })
	local var5 = signalsReactModule.useSignalState(if var4 ~= nil then var1 else var4.data)
	local var6 = signalsReactModule.useSignalState(if var4 ~= nil then ready else var4.status)
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref), var7 (ref), sendBuildExperienceEventModule (copy), p1 (ref)
		if var4 == nil then return end
		if var6 == "NotReady" then
			var7.current = nil
			
			return
		elseif var7.current == var6 then
			return
		end
		var7.current = var6
		sendBuildExperienceEventModule(if var6 == "Ready" then "MONETIZATION_CATALOG_LOAD_SUCCESS" else "MONETIZATION_CATALOG_LOAD_FAILURE", {
			universeId = p1.universeId,
			placeId = p1.placeId,
			conversationId = p1.sessionId
		})
	end, {
		var4,
		var6,
		p1.placeId,
		p1.sessionId,
		p1.universeId
	})
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), mapDeveloperProductsToMonetizationProductsModule (copy), var5 (ref), var2 (ref), localizationStringsModule (copy), var3 (ref)
		return if p1.products == nil then mapDeveloperProductsToMonetizationProductsModule(var5, {
			formatDefaultProductName = function(p2)
				-- upvalues: var2 (copy), localizationStringsModule (copy)
				return var2:Format(localizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, { PRODUCT_ID = p2 })
			end,
			priceUnavailable = var3.priceUnavailable,
			productType = var3.productType,
			onSale = var3.onSale,
			offSale = var3.offSale
		}) else p1.products
	end, { var5, var3, var2, p1.products })
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), developerProductStore (ref)
		if p1.products == nil and p1.universeId ~= nil then
			developerProductStore.fetchProducts(p1.universeId)
		end
	end, { developerProductStore, p1.products, p1.universeId })
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: developerProductStore (ref), p1 (ref)
		return developerProductStore.update(p1.universeId, p2, { isManagedPricingEnabled = p3 })
	end, { developerProductStore, p1.universeId })
	local var11 = reactModule.useCallback(function(p2, p3)
		-- upvalues: developerProductStore (ref), p1 (ref)
		return developerProductStore.update(p1.universeId, p2, { isForSale = p3 })
	end, { developerProductStore, p1.universeId })
	local var12 = reactModule.useCallback(function(p2, p3)
		-- upvalues: developerProductStore (ref), p1 (ref)
		return developerProductStore.update(p1.universeId, p2, p3)
	end, { developerProductStore, p1.universeId })
	local cloned = table.clone(p1)
	cloned.products = var8
	
	if var6 == "Ready" then
		cloned.catalogStatus = "Ready"
	elseif var6 == "Failed" then
		cloned.catalogStatus = "Failed"
	else
		cloned.catalogStatus = "NotReady"
	end
	cloned.onRetryCatalog = var9
	cloned.onUpdateProductManagedPricing = if p1.universeId ~= nil then nil else var10
	
	if fFlagBuildExperienceManageDevProductModule and p1.universeId ~= nil then
		cloned.onUpdateProductSaleStatus = var11
		cloned.onUpdateProduct = var12
	end
	return reactModule.createElement(monetizationPageViewModule, useMonetizationPageViewModelModule(cloned))
end