local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration.DeveloperProduct)
local gamePassConfigModule = require(parent.DataHydration.GamePassConfig)
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
local mapMonetizationCatalogModule = require(script.Parent.mapMonetizationCatalog)
local useMonetizationPageViewModelModule = require(script.Parent.useMonetizationPageViewModel)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildExperienceManageDevProductModule = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local fFlagBuildExperienceMonetizationMultiKindModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationMultiKind)
local fFlagBuildExperienceMonetizationProductEditingModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationProductEditing)
local fFlagBuildExperienceDevProductModerationReadbackModule = require(buildExperience.Flags.FFlagBuildExperienceDevProductModerationReadback)
local fFlagBuildExperienceManageDevProductModule_1 = fFlagBuildExperienceManageDevProductModule or fFlagBuildExperienceMonetizationNativeUIModule

local function _(p1, p2)
	return if p2 or p1 == "Failed" then "Failed" elseif p1 == "Ready" then "Ready" else "NotReady"
end

local var1 = signalsModule.createSignal(nil)
local var2 = signalsModule.createSignal(nil)
local var3 = signalsModule.createSignal(nil)
local var4 = signalsModule.createSignal(nil)
local var5 = signalsModule.createSignal(nil)
local var6 = signalsModule.createSignal(nil)
local ready = signalsModule.createSignal("Ready")
local notReady = signalsModule.createSignal("NotReady")
local var7 = signalsModule.createComputed(function()
	-- upvalues: createManageDevProductStoreModule (ref)
	return createManageDevProductStoreModule()
end)
local var8 = signalsModule.createComputed(function()
	-- upvalues: createManageMonetizationOptionsStoreModule (ref)
	return createManageMonetizationOptionsStoreModule()
end)

local _ = function(p1, p2)
	return if p1 == "Failed" or p2 == "Failed" then "Failed" elseif p1 == "Ready" and p2 == "Ready" then "Ready" else "NotReady"
end

local function useMixedCatalog(p1, p2, p3, p4, p5)
	-- upvalues: signalsReactModule (ref), gamePassConfigModule (ref), reactModule (ref), var2 (ref), ready (ref), sendBuildExperienceEventModule (ref)
	local var9 = signalsReactModule.useSignalState(gamePassConfigModule.getGamePassConfigStore)
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var9 (ref)
		return if p1.products == nil and p1.universeId ~= nil then var9.fetchGamePasses(p1.universeId) else nil
	end, {
		signalsReactModule.useSignalState(var9.getAccountResetGeneration),
		var9,
		p1.products ~= nil,
		p1.universeId or 0
	})
	local var11 = signalsReactModule.useSignalState(if var10 ~= nil then var2 else var10.data)
	local var12 = signalsReactModule.useSignalState(if var10 ~= nil then ready else var10.status)
	local var13 = p3 ~= nil and p3.nextPageToken ~= nil
	local var14 = var11 ~= nil and var11.isIncomplete == true
	local var15 = if var13 or p4 == "Failed" then "Failed" elseif p4 == "Ready" then "Ready" else "NotReady"
	local var16 = if var14 or var12 == "Failed" then "Failed" elseif var12 == "Ready" then "Ready" else "NotReady"
	local var17 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p5 (ref), var15 (ref), p3 (ref), var13 (ref), var16 (ref), var11 (ref), var14 (ref)
		return if p1.products == nil then {
			{
				kind = "DeveloperProduct",
				label = p5.productType,
				status = var15,
				hasCachedProducts = p3 ~= nil and #p3.developerProducts > 0,
				isIncomplete = var13
			},
			{
				kind = "GamePass",
				label = p5.gamePassType,
				status = var16,
				hasCachedProducts = var11 ~= nil and #var11.gamePasses > 0,
				isIncomplete = var14
			}
		} else {}
	end, {
		var15, var16, if p3 ~= nil then 0 else #p3.developerProducts,
		if var11 ~= nil then 0 else #var11.gamePasses, var13, var14, p5.gamePassType,
		p5.productType, p1.products ~= nil
	})
	local var18 = reactModule.useRef({})
	local var19 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), p1 (ref), var18 (ref), var17 (ref), sendBuildExperienceEventModule (copy)
		if var19.current ~= p1.universeId then
			var19.current = p1.universeId
			table.clear(var18.current)
		end
		for i, v in var17 do
			if v.status == "NotReady" then
				var18.current[v.kind] = nil
			elseif var18.current[v.kind] ~= v.status then
				var18.current[v.kind] = v.status
				sendBuildExperienceEventModule(if v.status == "Ready" then "MONETIZATION_CATALOG_LOAD_SUCCESS" else "MONETIZATION_CATALOG_LOAD_FAILURE", {
					universeId = p1.universeId,
					placeId = p1.placeId,
					conversationId = p1.sessionId
				}, {
					catalogKind = tostring(v.kind),
					hasCachedProducts = tostring(v.hasCachedProducts),
					isIncomplete = tostring(v.isIncomplete)
				})
			end
		end
	end, { var17, p1.placeId, p1.sessionId, p1.universeId })
	
	return {
		gamePassCatalog = var11,
		catalogSources = var17,
		status = if var15 == "Failed" or var16 == "Failed" then "Failed" elseif var15 == "Ready" and var16 == "Ready" then "Ready" else "NotReady",
		onRetryAll = reactModule.useCallback(function()
			-- upvalues: p1 (ref), p2 (ref), var9 (ref)
			if p1.products == nil and p1.universeId ~= nil then
				p2.fetchProducts(p1.universeId)
				var9.fetchGamePasses(p1.universeId)
			end
		end, { p2, var9, p1.products, p1.universeId }),
		onRetrySource = reactModule.useCallback(function(p6)
			-- upvalues: p1 (ref), p2 (ref), var9 (ref)
			if p1.products ~= nil or p1.universeId == nil then return end
			if p6 == "DeveloperProduct" then
				p2.fetchProducts(p1.universeId)
				
				return
			elseif p6 == "GamePass" then
				var9.fetchGamePasses(p1.universeId)
			end
		end, { p2, var9, p1.products, p1.universeId })
	}
end

return function(p6)
	-- upvalues: reactModule (ref), localizationModule (ref), localizationStringsModule (ref), fFlagBuildExperienceMonetizationMultiKindModule (ref), var7 (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var8 (ref), signalsReactModule (ref), universeConfigurationModule (ref), var3 (ref), notReady (ref), var4 (ref), var5 (ref), var6 (ref), sendBuildExperienceEventModule (ref), fFlagBuildExperienceManageDevProductModule_1 (ref), var1 (ref), ready (ref), useMixedCatalog (ref), mapMonetizationCatalogModule (ref), mapDeveloperProductsToMonetizationProductsModule (ref), fFlagBuildExperienceDevProductModerationReadbackModule (ref), promiseModule (ref), fFlagBuildExperienceMonetizationProductEditingModule (ref), useMonetizationPageViewModelModule (ref), monetizationPageViewModule (ref)
	local var20 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local var21 = localizationModule.Hooks.useLocalization({
		priceUnavailable = localizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
		productType = localizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		gamePassType = if fFlagBuildExperienceMonetizationMultiKindModule then localizationStringsModule.MONETIZATION_GAME_PASS else nil,
		onSale = localizationStringsModule.MONETIZATION_ON_SALE,
		offSale = localizationStringsModule.MONETIZATION_OFF_SALE
	})
	local var22 = var7()
	local var23 = nil
	local var24 = nil
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var23 = var8()
		var24 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	end
	local var25 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var24 (write), p6 (ref)
		return if var24 == nil or p6.universeId == nil then nil else var24.getAndFetchSummary(p6.universeId)
	end, { p6.universeId, var24 }) else nil
	local var26 = nil
	local var27 = "NotReady"
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var26 = signalsReactModule.useSignalState(if var25 ~= nil then var3 else var25.data)
		var27 = signalsReactModule.useSignalState(if var25 ~= nil then notReady else var25.status)
	end
	local var28 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var23 (write), p6 (ref), var26 (write)
		return if var23 == nil or p6.universeId == nil or var26 == nil then nil else var23.getAndFetchPermission(p6.universeId, var26.creatorType, var26.creatorTargetId)
	end, { var23, p6.universeId, var26 }) else nil
	local var29 = nil
	local var30 = "NotReady"
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var29 = signalsReactModule.useSignalState(if var28 ~= nil then var4 else var28.data)
		var30 = if var27 == "Failed" then "Failed" else signalsReactModule.useSignalState(if var28 ~= nil then notReady else var28.status)
	end
	local var31
	local var32 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var23 (write), p6 (ref)
		return if var23 == nil or p6.universeId == nil then nil else var23.getAndFetchManagedPricing(p6.universeId)
	end, { var23, p6.universeId }) else nil
	local var33 = if fFlagBuildExperienceMonetizationNativeUIModule then reactModule.useMemo(function()
		-- upvalues: var23 (write), p6 (ref)
		return if var23 == nil or p6.universeId == nil then nil else var23.getAndFetchShops(p6.universeId)
	end, { var23, p6.universeId }) else nil
	local var34 = nil
	local var35 = nil
	local var36 = "NotReady"
	local var37 = "NotReady"
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var34 = signalsReactModule.useSignalState(if var32 ~= nil then var5 else var32.data)
		var36 = signalsReactModule.useSignalState(if var32 ~= nil then notReady else var32.status)
		var35 = signalsReactModule.useSignalState(if var33 ~= nil then var6 else var33.data)
		var37 = signalsReactModule.useSignalState(if var33 ~= nil then notReady else var33.status)
	end
	if fFlagBuildExperienceMonetizationNativeUIModule then
		local var38 = reactModule.useRef({})
		local var39 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: p6 (ref), var39 (ref), var38 (ref), sendBuildExperienceEventModule (copy), var30 (write), var36 (write), var37 (write)
			if p6.universeId == nil then return end
			if var39.current ~= p6.universeId then
				var39.current = p6.universeId
				table.clear(var38.current)
			end
			local function reportStatus(p7, p8)
				-- upvalues: var38 (copy), sendBuildExperienceEventModule (copy), p6 (copy)
				if p8 ~= "NotReady" and var38.current[p7] ~= p8 then
					var38.current[p7] = p8
					sendBuildExperienceEventModule(if p8 == "Ready" then "MONETIZATION_OPTIONS_LOAD_SUCCESS" else "MONETIZATION_OPTIONS_LOAD_FAILURE", {
						universeId = p6.universeId,
						placeId = p6.placeId,
						conversationId = p6.sessionId
					}, { resource = p7 })
				end
			end
			
			reportStatus("permission", var30)
			reportStatus("managed_pricing", var36)
			reportStatus("shops", var37)
		end, {
			var36, var30, p6.placeId, p6.sessionId, p6.universeId, var37
		})
	end
	if fFlagBuildExperienceMonetizationMultiKindModule then
		var31 = false
		
		if var30 == "Ready" then
			var31 = false
			
			if var29 ~= nil then
				local _ = var29.canMonetize == true
			end
		end
	else
		var31 = if fFlagBuildExperienceMonetizationNativeUIModule then if var30 == "Ready" then if var29 ~= nil then var29.canMonetize == true else true else true else not fFlagBuildExperienceMonetizationNativeUIModule
	end
	local var40 = reactModule.useMemo(function()
		-- upvalues: p6 (ref), fFlagBuildExperienceManageDevProductModule_1 (copy), var22 (ref)
		return if not (p6.products ~= nil or p6.universeId == nil) then if fFlagBuildExperienceManageDevProductModule_1 then var22.fetchProducts(p6.universeId) else var22.getAndFetchProducts(p6.universeId) else nil
	end, if fFlagBuildExperienceMonetizationMultiKindModule then {
		if fFlagBuildExperienceMonetizationMultiKindModule then signalsReactModule.useSignalState(var22.getAccountResetGeneration) else 0,
		var22,
		p6.products ~= nil,
		p6.universeId or 0
	} else { var22, p6.products ~= nil, p6.universeId or 0 })
	local var41 = signalsReactModule.useSignalState(if var40 ~= nil then var1 else var40.data)
	local var42 = signalsReactModule.useSignalState(if var40 ~= nil then ready else var40.status)
	local var43 = if fFlagBuildExperienceMonetizationMultiKindModule then useMixedCatalog(p6, var22, var41, var42, {
		productType = var21.productType,
		gamePassType = var21.gamePassType
	}) else nil
	local var44 = if var43 ~= nil then nil else var43.gamePassCatalog
	local var45 = reactModule.useMemo(function()
		-- upvalues: p6 (ref), var20 (ref), localizationStringsModule (copy), fFlagBuildExperienceMonetizationMultiKindModule (copy), mapMonetizationCatalogModule (copy), var41 (ref), var44 (ref), var21 (ref), mapDeveloperProductsToMonetizationProductsModule (copy)
		if p6.products ~= nil then
			return p6.products
		end
		local var46 = function(p7)
			-- upvalues: var20 (copy), localizationStringsModule (copy)
			return var20:Format(localizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, { PRODUCT_ID = p7 })
		end
		
		return if fFlagBuildExperienceMonetizationMultiKindModule then mapMonetizationCatalogModule({ developerProducts = var41, gamePasses = var44 }, {
			formatDefaultProductName = var46,
			priceUnavailable = var21.priceUnavailable,
			developerProductType = var21.productType,
			gamePassType = var21.gamePassType,
			onSale = var21.onSale,
			offSale = var21.offSale
		}) else mapDeveloperProductsToMonetizationProductsModule(var41, {
			formatDefaultProductName = var46,
			priceUnavailable = var21.priceUnavailable,
			productType = var21.productType,
			onSale = var21.onSale,
			offSale = var21.offSale
		})
	end, {
		var41,
		var21,
		var20,
		p6.products,
		var44
	})
	local var46 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceMonetizationMultiKindModule (copy), var40 (ref), var42 (ref), var46 (ref), sendBuildExperienceEventModule (copy), p6 (ref)
		if fFlagBuildExperienceMonetizationMultiKindModule or var40 == nil then return end
		if var42 == "NotReady" then
			var46.current = nil
			
			return
		elseif var46.current == var42 then
			return
		end
		var46.current = var42
		sendBuildExperienceEventModule(if var42 == "Ready" then "MONETIZATION_CATALOG_LOAD_SUCCESS" else "MONETIZATION_CATALOG_LOAD_FAILURE", {
			universeId = p6.universeId,
			placeId = p6.placeId,
			conversationId = p6.sessionId
		})
	end, {
		var40,
		var42,
		p6.placeId,
		p6.sessionId,
		p6.universeId
	})
	local var47 = if var43 ~= nil then reactModule.useCallback(function()
		-- upvalues: p6 (ref), var22 (ref)
		if p6.products == nil and p6.universeId ~= nil then
			var22.fetchProducts(p6.universeId)
		end
	end, { var22, p6.products, p6.universeId }) else var43.onRetryAll
	local var48 = if var43 ~= nil then nil else var43.onRetrySource
	local var49 = reactModule.useCallback(function(p7, p8)
		-- upvalues: var22 (ref), p6 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var23 (write)
		local var50 = function()
			-- upvalues: var22 (copy), p6 (copy), p7 (ref), p8 (ref)
			return var22.update(p6.universeId, p7, { isManagedPricingEnabled = p8 })
		end
		
		return if fFlagBuildExperienceMonetizationNativeUIModule and p8 then var23.ensureManagedPricingAccepted(p6.universeId):andThen(var50) else var50()
	end, { var22, var23, p6.universeId })
	local var50 = reactModule.useCallback(function(p7, p8)
		-- upvalues: var22 (ref), p6 (ref)
		return var22.update(p6.universeId, p7, { isForSale = p8 })
	end, { var22, p6.universeId })
	local var51 = reactModule.useCallback(function(p7, p8)
		-- upvalues: var22 (ref), p6 (ref), fFlagBuildExperienceDevProductModerationReadbackModule (copy)
		return var22.update(p6.universeId, p7, p8, fFlagBuildExperienceDevProductModerationReadbackModule)
	end, { var22, p6.universeId })
	local var52 = nil
	local var53 = nil
	local var54 = nil
	local var55 = nil
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		var52 = reactModule.useCallback(function()
			-- upvalues: var23 (write), p6 (ref)
			return var23.acceptManagedPricing(p6.universeId)
		end, { var23, p6.universeId })
		var53 = reactModule.useCallback(function(p7, p8)
			-- upvalues: var22 (ref), p6 (ref), var23 (write), promiseModule (copy)
			local function _()
				-- upvalues: var22 (copy), p6 (copy)
				return var22.list(p6.universeId):catch(function()
					return nil
				end)
			end
			
			return var23.updateDeveloperProductsManagedPricing(p6.universeId, p7, p8):andThen(function(p9)
				-- upvalues: var22 (copy), p6 (copy)
				return var22.list(p6.universeId):catch(function()
					return nil
				end):andThen(function()
					-- upvalues: p9 (ref)
					return p9
				end)
			end, function(p9)
				-- upvalues: var22 (copy), p6 (copy), promiseModule (copy)
				return var22.list(p6.universeId):catch(function()
					return nil
				end):andThen(function()
					-- upvalues: promiseModule (copy), p9 (ref)
					return promiseModule.reject(p9)
				end)
			end)
		end, { var22, var23, p6.universeId })
		var54 = reactModule.useCallback(function(p7)
			-- upvalues: var23 (write), p6 (ref)
			return var23.setShopGlobalIcon(p6.universeId, p7)
		end, { var23, p6.universeId })
		var55 = reactModule.useCallback(function()
			-- upvalues: var23 (write), p6 (ref), var26 (write), var27 (write), var24 (write)
			var23.fetchManagedPricing(p6.universeId)
			var23.fetchShops(p6.universeId)
			
			if var26 == nil or var27 == "Failed" then
				var24.fetchSummary(p6.universeId)
				
				return
			end
			var23.fetchPermission(p6.universeId, var26.creatorType, var26.creatorTargetId)
		end, {
			var23,
			p6.universeId,
			var26,
			var27,
			var24
		})
	end
	local cloned = table.clone(p6)
	cloned.products = var45
	cloned.showOptions = fFlagBuildExperienceMonetizationNativeUIModule and (if p6.showOptions ~= true then p6.universeId ~= nil else true)
	
	if fFlagBuildExperienceMonetizationNativeUIModule and p6.universeId ~= nil then
		cloned.managedPricingStatus = if var34 ~= nil then nil else var34.status
		cloned.shops = if var35 ~= nil then nil else var35.shops
		cloned.permissionCanMonetize = if var29 ~= nil then nil else var29.canMonetize
		cloned.managedPricingLoadStatus = var36
		cloned.shopsLoadStatus = var37
		cloned.permissionLoadStatus = var30
		cloned.onAcceptManagedPricing = var52
		cloned.onUpdateManagedPricing = var53
		cloned.onSetShopButton = var54
		cloned.onRetryOptions = var55
	end
	if fFlagBuildExperienceMonetizationMultiKindModule then
		local var56 = var43
		cloned.catalogSources = if p6.products == nil then var56.catalogSources else nil
		cloned.onRetryCatalogSource = var48
		cloned.catalogStatus = var56.status
	elseif var42 == "Ready" then
		cloned.catalogStatus = "Ready"
	elseif var42 == "Failed" then
		cloned.catalogStatus = "Failed"
	else
		cloned.catalogStatus = "NotReady"
	end
	cloned.onRetryCatalog = var47
	cloned.onUpdateProductManagedPricing = if p6.universeId == nil or not var31 then nil else var49
	
	if fFlagBuildExperienceMonetizationProductEditingModule and p6.universeId ~= nil and var31 then
		cloned.onUpdateProductSaleStatus = var50
		cloned.onUpdateProduct = var51
	end
	return reactModule.createElement(monetizationPageViewModule, useMonetizationPageViewModelModule(cloned))
end