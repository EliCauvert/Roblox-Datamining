local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration.DeveloperProduct)
local _ = require(parent.DataHydration.MonetizationOptions)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local localizationModule = require(parent.Localization)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local createManageDevProductStoreModule = require(buildExperience.Chat.createManageDevProductStore)
local createManageMonetizationOptionsStoreModule = require(buildExperience.Chat.createManageMonetizationOptionsStore)
local monetizationPageViewModule = require(script.Parent.MonetizationPageView)
local mapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)
local useMonetizationPageViewModelModule = require(script.Parent.useMonetizationPageViewModel)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceManageDevProduct = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct) or fFlagBuildExperienceMonetizationNativeUIModule
local var1 = signalsModule.createSignal(nil)
local var2 = signalsModule.createSignal(nil)
local var3 = signalsModule.createSignal(nil)
local var4 = signalsModule.createSignal(nil)
local var5 = signalsModule.createSignal(nil)
local ready = signalsModule.createSignal("Ready")
local notReady = signalsModule.createSignal("NotReady")
local var6 = signalsModule.createComputed(function()
	-- upvalues: createManageDevProductStoreModule (ref)
	return createManageDevProductStoreModule()
end)
local var7 = signalsModule.createComputed(function()
	-- upvalues: createManageMonetizationOptionsStoreModule (ref)
	return createManageMonetizationOptionsStoreModule()
end)

return function(p1)
	-- upvalues: reactModule (ref), localizationModule (ref), localizationStringsModule (ref), var6 (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var7 (ref), signalsReactModule (ref), universeConfigurationModule (ref), var2 (ref), notReady (ref), var3 (ref), var4 (ref), var5 (ref), sendBuildExperienceEventModule (ref), fFlagBuildExperienceManageDevProduct (ref), var1 (ref), ready (ref), mapDeveloperProductsToMonetizationProductsModule (ref), promiseModule (ref), useMonetizationPageViewModelModule (ref), monetizationPageViewModule (ref)
	local var8 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local var9 = localizationModule.Hooks.useLocalization({
		priceUnavailable = localizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
		productType = localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		onSale = localizationStringsModule.MONETIZATION_ON_SALE,
		offSale = localizationStringsModule.MONETIZATION_OFF_SALE
	})
	local var10 = var6()
	local var11 = nil
	local var12 = nil
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var11 = var7()
		var12 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	end
	local var13 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var12 (write), p1 (ref)
		return if var12 == nil or p1.universeId == nil then nil else var12.getAndFetchSummary(p1.universeId)
	end, { p1.universeId, var12 }) else nil
	local var14 = nil
	local var15 = "NotReady"
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var14 = signalsReactModule.useSignalState(if var13 ~= nil then var2 else var13.data)
		var15 = signalsReactModule.useSignalState(if var13 ~= nil then notReady else var13.status)
	end
	local var16 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var11 (write), p1 (ref), var14 (write)
		return if var11 == nil or p1.universeId == nil or var14 == nil then nil else var11.getAndFetchPermission(p1.universeId, var14.creatorType, var14.creatorTargetId)
	end, { var11, p1.universeId, var14 }) else nil
	local var17 = nil
	local var18 = "NotReady"
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var17 = signalsReactModule.useSignalState(if var16 ~= nil then var3 else var16.data)
		var18 = if var15 == "Failed" then "Failed" else signalsReactModule.useSignalState(if var16 ~= nil then notReady else var16.status)
	end
	local var19 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var11 (write), p1 (ref)
		return if var11 == nil or p1.universeId == nil then nil else var11.getAndFetchManagedPricing(p1.universeId)
	end, { var11, p1.universeId }) else nil
	local var20 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var11 (write), p1 (ref)
		return if var11 == nil or p1.universeId == nil then nil else var11.getAndFetchShops(p1.universeId)
	end, { var11, p1.universeId }) else nil
	local var21 = nil
	local var22 = nil
	local var23 = "NotReady"
	local var24 = "NotReady"
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var21 = signalsReactModule.useSignalState(if var19 ~= nil then var4 else var19.data)
		var23 = signalsReactModule.useSignalState(if var19 ~= nil then notReady else var19.status)
		var22 = signalsReactModule.useSignalState(if var20 ~= nil then var5 else var20.data)
		var24 = signalsReactModule.useSignalState(if var20 ~= nil then notReady else var20.status)
	end
	if fFlagBuildExperienceMonetizationNativeUIModule then
		local var25 = reactModule.useRef({})
		local var26 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var26 (ref), var25 (ref), sendBuildExperienceEventModule (copy), var18 (write), var23 (write), var24 (write)
			if p1.universeId == nil then return end
			if var26.current ~= p1.universeId then
				var26.current = p1.universeId
				table.clear(var25.current)
			end
			local function reportStatus(p2, p3)
				-- upvalues: var25 (copy), sendBuildExperienceEventModule (copy), p1 (copy)
				if p3 ~= "NotReady" and var25.current[p2] ~= p3 then
					var25.current[p2] = p3
					sendBuildExperienceEventModule(if p3 == "Ready" then "MONETIZATION_OPTIONS_LOAD_SUCCESS" else "MONETIZATION_OPTIONS_LOAD_FAILURE", {
						universeId = p1.universeId,
						placeId = p1.placeId,
						conversationId = p1.sessionId
					}, { resource = p2 })
				end
			end
			
			reportStatus("permission", var18)
			reportStatus("managed_pricing", var23)
			reportStatus("shops", var24)
		end, {
			var23, var18, p1.placeId, p1.sessionId, p1.universeId, var24
		})
	end
	local var27 = if fFlagBuildExperienceMonetizationNativeUIModule then if var18 == "Ready" then if var17 ~= nil then var17.canMonetize == true else true else true else not fFlagBuildExperienceMonetizationNativeUIModule
	local var28 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagBuildExperienceManageDevProduct (copy), var10 (ref)
		return if not (p1.products ~= nil or p1.universeId == nil) then if fFlagBuildExperienceManageDevProduct then var10.fetchProducts(p1.universeId) else var10.getAndFetchProducts(p1.universeId) else nil
	end, { var10, p1.products ~= nil, p1.universeId or 0 })
	local var29 = signalsReactModule.useSignalState(if var28 ~= nil then var1 else var28.data)
	local var30 = signalsReactModule.useSignalState(if var28 ~= nil then ready else var28.status)
	local var31 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var30 (ref), var31 (ref), sendBuildExperienceEventModule (copy), p1 (ref)
		if var28 == nil then return end
		if var30 == "NotReady" then
			var31.current = nil
			
			return
		elseif var31.current == var30 then
			return
		end
		var31.current = var30
		sendBuildExperienceEventModule(if var30 == "Ready" then "MONETIZATION_CATALOG_LOAD_SUCCESS" else "MONETIZATION_CATALOG_LOAD_FAILURE", {
			universeId = p1.universeId,
			placeId = p1.placeId,
			conversationId = p1.sessionId
		})
	end, {
		var28,
		var30,
		p1.placeId,
		p1.sessionId,
		p1.universeId
	})
	local var32 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), mapDeveloperProductsToMonetizationProductsModule (copy), var29 (ref), var8 (ref), localizationStringsModule (copy), var9 (ref)
		return if p1.products == nil then mapDeveloperProductsToMonetizationProductsModule(var29, {
			formatDefaultProductName = function(p2)
				-- upvalues: var8 (copy), localizationStringsModule (copy)
				return var8:Format(localizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, { PRODUCT_ID = p2 })
			end,
			priceUnavailable = var9.priceUnavailable,
			productType = var9.productType,
			onSale = var9.onSale,
			offSale = var9.offSale
		}) else p1.products
	end, { var29, var9, var8, p1.products })
	local var33 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var10 (ref)
		if p1.products == nil and p1.universeId ~= nil then
			var10.fetchProducts(p1.universeId)
		end
	end, { var10, p1.products, p1.universeId })
	local var34 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var10 (ref), p1 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var11 (write)
		local var35 = function()
			-- upvalues: var10 (copy), p1 (copy), p2 (ref), p3 (ref)
			return var10.update(p1.universeId, p2, { isManagedPricingEnabled = p3 })
		end
		
		return if fFlagBuildExperienceMonetizationNativeUIModule and p3 then var11.ensureManagedPricingAccepted(p1.universeId):andThen(var35) else var35()
	end, { var10, var11, p1.universeId })
	local var35 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var10 (ref), p1 (ref)
		return var10.update(p1.universeId, p2, { isForSale = p3 })
	end, { var10, p1.universeId })
	local var36 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var10 (ref), p1 (ref)
		return var10.update(p1.universeId, p2, p3)
	end, { var10, p1.universeId })
	local var37 = nil
	local var38 = nil
	local var39 = nil
	local var40 = nil
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var37 = reactModule.useCallback(function()
			-- upvalues: var11 (write), p1 (ref)
			return var11.acceptManagedPricing(p1.universeId)
		end, { var11, p1.universeId })
		var38 = reactModule.useCallback(function(p2, p3)
			-- upvalues: var10 (ref), p1 (ref), var11 (write), promiseModule (copy)
			local function _()
				-- upvalues: var10 (copy), p1 (copy)
				return var10.list(p1.universeId):catch(function()
					return nil
				end)
			end
			
			return var11.updateDeveloperProductsManagedPricing(p1.universeId, p2, p3):andThen(function(p4)
				-- upvalues: var10 (copy), p1 (copy)
				return var10.list(p1.universeId):catch(function()
					return nil
				end):andThen(function()
					-- upvalues: p4 (ref)
					return p4
				end)
			end, function(p4)
				-- upvalues: var10 (copy), p1 (copy), promiseModule (copy)
				return var10.list(p1.universeId):catch(function()
					return nil
				end):andThen(function()
					-- upvalues: promiseModule (copy), p4 (ref)
					return promiseModule.reject(p4)
				end)
			end)
		end, { var10, var11, p1.universeId })
		var39 = reactModule.useCallback(function(p2)
			-- upvalues: var11 (write), p1 (ref)
			return var11.setShopGlobalIcon(p1.universeId, p2)
		end, { var11, p1.universeId })
		var40 = reactModule.useCallback(function()
			-- upvalues: var11 (write), p1 (ref), var14 (write), var15 (write), var12 (write)
			var11.fetchManagedPricing(p1.universeId)
			var11.fetchShops(p1.universeId)
			
			if var14 == nil or var15 == "Failed" then
				var12.fetchSummary(p1.universeId)
				
				return
			end
			var11.fetchPermission(p1.universeId, var14.creatorType, var14.creatorTargetId)
		end, {
			var11,
			p1.universeId,
			var14,
			var15,
			var12
		})
	end
	local cloned = table.clone(p1)
	cloned.products = var32
	cloned.showOptions = fFlagBuildExperienceMonetizationNativeUIModule and (if p1.showOptions ~= true then p1.universeId ~= nil else true)
	
	if fFlagBuildExperienceMonetizationNativeUIModule and p1.universeId ~= nil then
		cloned.managedPricingStatus = if var21 ~= nil then nil else var21.status
		cloned.shops = if var22 ~= nil then nil else var22.shops
		cloned.permissionCanMonetize = if var17 ~= nil then nil else var17.canMonetize
		cloned.managedPricingLoadStatus = var23
		cloned.shopsLoadStatus = var24
		cloned.permissionLoadStatus = var18
		cloned.onAcceptManagedPricing = var37
		cloned.onUpdateManagedPricing = var38
		cloned.onSetShopButton = var39
		cloned.onRetryOptions = var40
	end
	if var30 == "Ready" then
		cloned.catalogStatus = "Ready"
	elseif var30 == "Failed" then
		cloned.catalogStatus = "Failed"
	else
		cloned.catalogStatus = "NotReady"
	end
	cloned.onRetryCatalog = var33
	cloned.onUpdateProductManagedPricing = if p1.universeId == nil or not var27 then nil else var34
	
	if fFlagBuildExperienceManageDevProduct and p1.universeId ~= nil and var27 then
		cloned.onUpdateProductSaleStatus = var35
		cloned.onUpdateProduct = var36
	end
	return reactModule.createElement(monetizationPageViewModule, useMonetizationPageViewModelModule(cloned))
end