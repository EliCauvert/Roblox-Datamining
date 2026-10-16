local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration.DeveloperProduct)
local GamePassConfigModule = require(Parent.DataHydration.GamePassConfig)
local _ = require(Parent.DataHydration.MonetizationOptions)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local LocalizationModule = require(Parent.Localization)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateManageDevProductStoreModule = require(BuildExperience.Chat.createManageDevProductStore)
local CreateManageMonetizationOptionsStoreModule = require(BuildExperience.Chat.createManageMonetizationOptionsStore)
local MonetizationPageViewModule = require(script.Parent.MonetizationPageView)
local MapDeveloperProductsToMonetizationProductsModule = require(script.Parent.mapDeveloperProductsToMonetizationProducts)
local MapMonetizationCatalogModule = require(script.Parent.mapMonetizationCatalog)
local UseMonetizationPageViewModelModule = require(script.Parent.useMonetizationPageViewModel)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceMonetizationMultiKindModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationMultiKind)
local FFlagBuildExperienceMonetizationProductEditingModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationProductEditing)
local FFlagBuildExperienceDevProductModerationReadbackModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductModerationReadback)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct) or FFlagBuildExperienceMonetizationNativeUIModule

local function _(p1, p2): string --[[ Line: 70 | Named "normalizeSourceStatus" ]]
	return if p2 or p1 == "Failed" then "Failed" elseif p1 == "Ready" then "Ready" else "NotReady"
end

local Signal = SignalsModule.createSignal(nil)
local Signal1 = SignalsModule.createSignal(nil)
local Signal2 = SignalsModule.createSignal(nil)
local Signal3 = SignalsModule.createSignal(nil)
local Signal4 = SignalsModule.createSignal(nil)
local Signal5 = SignalsModule.createSignal(nil)
local Ready = SignalsModule.createSignal("Ready")
local NotReady = SignalsModule.createSignal("NotReady")
local Computed = SignalsModule.createComputed(function() --[[ Line: 87 ]]
	-- upvalues: CreateManageDevProductStoreModule (copy)
	return CreateManageDevProductStoreModule()
end)
local Computed1 = SignalsModule.createComputed(function() --[[ Line: 90 ]]
	-- upvalues: CreateManageMonetizationOptionsStoreModule (copy)
	return CreateManageMonetizationOptionsStoreModule()
end)

local _ = function(p1, p2): string --[[ Line: 94 | Named "combineCatalogStatus" ]]
	return if p1 == "Failed" or p2 == "Failed" then "Failed" elseif p1 == "Ready" and p2 == "Ready" then "Ready" else "NotReady"
end

local function useMixedCatalog(p1, p2, UseSignalStateResult, UseSignalStateResult1, p3) --[[ Line: 103 ]]
	-- upvalues: SignalsReactModule (copy), GamePassConfigModule (copy), ReactModule (copy), Signal1 (copy), Ready (copy), SendBuildExperienceEventModule (copy)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(GamePassConfigModule.getGamePassConfigStore)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 113 ]]
		-- upvalues: p1 (copy), UseSignalStateResult2 (copy)
		return if p1.products == nil and p1.universeId ~= nil then UseSignalStateResult2.fetchGamePasses(p1.universeId) else nil
	end, {
		SignalsReactModule.useSignalState(UseSignalStateResult2.getAccountResetGeneration),
		UseSignalStateResult2,
		p1.products ~= nil,
		p1.universeId or 0
	})
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal1 else UseMemoResult.data)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Ready else UseMemoResult.status)
	local HasNextPageToken: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.nextPageToken ~= nil
	local IsIsIncomplete: boolean = UseSignalStateResult3 ~= nil and UseSignalStateResult3.isIncomplete == true
	local Failed: string = if HasNextPageToken or UseSignalStateResult1 == "Failed" then "Failed" elseif UseSignalStateResult1 == "Ready" then "Ready" else "NotReady"
	local Failed1: string = if IsIsIncomplete or UseSignalStateResult4 == "Failed" then "Failed" elseif UseSignalStateResult4 == "Ready" then "Ready" else "NotReady"
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 136 ]]
		-- upvalues: p1 (copy), p3 (copy), Failed (copy), UseSignalStateResult (copy), HasNextPageToken (copy), Failed1 (copy), UseSignalStateResult3 (copy), IsIsIncomplete (copy)
		return if p1.products == nil then {
			{
				kind = "DeveloperProduct",
				label = p3.productType,
				status = Failed,
				hasCachedProducts = UseSignalStateResult ~= nil and #UseSignalStateResult.developerProducts > 0,
				isIncomplete = HasNextPageToken
			},
			{
				kind = "GamePass",
				label = p3.gamePassType,
				status = Failed1,
				hasCachedProducts = UseSignalStateResult3 ~= nil and #UseSignalStateResult3.gamePasses > 0,
				isIncomplete = IsIsIncomplete
			}
		} else {}
	end, {
		Failed, Failed1,
		if UseSignalStateResult == nil then 0 else #UseSignalStateResult.developerProducts,
		if UseSignalStateResult3 == nil then 0 else #UseSignalStateResult3.gamePasses,
		HasNextPageToken, IsIsIncomplete, p3.gamePassType, p3.productType,
		p1.products ~= nil
	})
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 172 ]]
		-- upvalues: UseRefResult1 (copy), p1 (copy), UseRefResult (copy), UseMemoResult1 (copy), SendBuildExperienceEventModule (upval)
		if UseRefResult1.current ~= p1.universeId then
			UseRefResult1.current = p1.universeId
			table.clear(UseRefResult.current)
		end
		for _, value in UseMemoResult1 do
			if value.status == "NotReady" then
				UseRefResult.current[value.kind] = nil
			elseif UseRefResult.current[value.kind] ~= value.status then
				UseRefResult.current[value.kind] = value.status
				SendBuildExperienceEventModule(if value.status == "Ready" then "MONETIZATION_CATALOG_LOAD_SUCCESS" else "MONETIZATION_CATALOG_LOAD_FAILURE", {
					universeId = p1.universeId,
					placeId = p1.placeId,
					conversationId = p1.sessionId
				}, {
					catalogKind = tostring(value.kind),
					hasCachedProducts = tostring(value.hasCachedProducts),
					isIncomplete = tostring(value.isIncomplete)
				})
			end
		end
	end, { UseMemoResult1, p1.placeId, p1.sessionId, p1.universeId })
	
	return {
		gamePassCatalog = UseSignalStateResult3,
		catalogSources = UseMemoResult1,
		status = if Failed == "Failed" or Failed1 == "Failed" then "Failed" elseif Failed == "Ready" and Failed1 == "Ready" then "Ready" else "NotReady",
		onRetryAll = ReactModule.useCallback(function() --[[ Line: 201 ]]
			-- upvalues: p1 (copy), p2 (copy), UseSignalStateResult2 (copy)
			if p1.products == nil and p1.universeId ~= nil then
				p2.fetchProducts(p1.universeId)
				UseSignalStateResult2.fetchGamePasses(p1.universeId)
			end
		end, { p2, UseSignalStateResult2, p1.products, p1.universeId }),
		onRetrySource = ReactModule.useCallback(function(p4) --[[ Line: 215 ]]
			-- upvalues: p1 (copy), p2 (copy), UseSignalStateResult2 (copy)
			if p1.products ~= nil or p1.universeId == nil then return end
			if p4 == "DeveloperProduct" then
				p2.fetchProducts(p1.universeId)
				
				return
			end
			if p4 == "GamePass" then
				UseSignalStateResult2.fetchGamePasses(p1.universeId)
			end
		end, { p2, UseSignalStateResult2, p1.products, p1.universeId })
	}
end

return function(Tbl) --[[ Line: 241 | Named "MonetizationPageContainer" ]]
	-- upvalues: ReactModule (copy), LocalizationModule (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), Computed (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), Computed1 (copy), SignalsReactModule (copy), UniverseConfigurationModule (copy), Signal2 (copy), NotReady (copy), Signal3 (copy), Signal4 (copy), Signal5 (copy), SendBuildExperienceEventModule (copy), FFlagBuildExperienceManageDevProductModule (copy), Signal (copy), Ready (copy), useMixedCatalog (copy), MapMonetizationCatalogModule (copy), MapDeveloperProductsToMonetizationProductsModule (copy), FFlagBuildExperienceDevProductModerationReadbackModule (copy), PromiseModule (copy), FFlagBuildExperienceMonetizationProductEditingModule (copy), UseMonetizationPageViewModelModule (copy), MonetizationPageViewModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
		priceUnavailable = LocalizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
		productType = LocalizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		gamePassType = if FFlagBuildExperienceMonetizationMultiKindModule then LocalizationStringsModule.MONETIZATION_GAME_PASS else nil,
		onSale = LocalizationStringsModule.MONETIZATION_ON_SALE,
		offSale = LocalizationStringsModule.MONETIZATION_OFF_SALE
	})
	local ComputedResult = Computed()
	local v1 = nil
	local UseSignalStateResult = nil
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		v1 = Computed1()
		UseSignalStateResult = SignalsReactModule.useSignalState(UniverseConfigurationModule.getUniverseConfigurationStore)
	end
	local UseMemoResult = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function() --[[ Line: 264 ]]
		-- upvalues: UseSignalStateResult (ref), Tbl (copy)
		return if UseSignalStateResult == nil or Tbl.universeId == nil then nil else UseSignalStateResult.getAndFetchSummary(Tbl.universeId)
	end, { Tbl.universeId, UseSignalStateResult }) else nil
	local UseSignalStateResult1 = nil
	local UseSignalStateResult2 = "NotReady"
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal2 else UseMemoResult.data)
		UseSignalStateResult2 = SignalsReactModule.useSignalState(if UseMemoResult == nil then NotReady else UseMemoResult.status)
	end
	local UseMemoResult1 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function() --[[ Line: 283 ]]
		-- upvalues: v1 (ref), Tbl (copy), UseSignalStateResult1 (ref)
		return if v1 == nil or Tbl.universeId == nil or UseSignalStateResult1 == nil then nil else v1.getAndFetchPermission(Tbl.universeId, UseSignalStateResult1.creatorType, UseSignalStateResult1.creatorTargetId)
	end, { v1, Tbl.universeId, UseSignalStateResult1 }) else nil
	local UseSignalStateResult3 = nil
	local Failed = "NotReady"
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseSignalStateResult3 = SignalsReactModule.useSignalState(if UseMemoResult1 == nil then Signal3 else UseMemoResult1.data)
		Failed = if UseSignalStateResult2 == "Failed" then "Failed" else SignalsReactModule.useSignalState(if UseMemoResult1 == nil then NotReady else UseMemoResult1.status)
	end
	local UseMemoResult2 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function() --[[ Line: 310 ]]
		-- upvalues: v1 (ref), Tbl (copy)
		return if v1 == nil or Tbl.universeId == nil then nil else v1.getAndFetchManagedPricing(Tbl.universeId)
	end, { v1, Tbl.universeId }) else nil
	local UseMemoResult11 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function() --[[ Line: 319 ]]
		-- upvalues: v1 (ref), Tbl (copy)
		return if v1 == nil or Tbl.universeId == nil then nil else v1.getAndFetchShops(Tbl.universeId)
	end, { v1, Tbl.universeId }) else nil
	local UseSignalStateResult4 = nil
	local UseSignalStateResult5 = nil
	local UseSignalStateResult6 = "NotReady"
	local UseSignalStateResult7 = "NotReady"
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseMemoResult2 == nil then Signal4 else UseMemoResult2.data)
		UseSignalStateResult6 = SignalsReactModule.useSignalState(if UseMemoResult2 == nil then NotReady else UseMemoResult2.status)
		UseSignalStateResult5 = SignalsReactModule.useSignalState(if UseMemoResult11 == nil then Signal5 else UseMemoResult11.data)
		UseSignalStateResult7 = SignalsReactModule.useSignalState(if UseMemoResult11 == nil then NotReady else UseMemoResult11.status)
	end
	if FFlagBuildExperienceMonetizationNativeUIModule then
		local UseRefResult = ReactModule.useRef({})
		local UseRefResult1 = ReactModule.useRef(nil)
		ReactModule.useEffect(function() --[[ Line: 352 ]]
			-- upvalues: Tbl (copy), UseRefResult1 (copy), UseRefResult (copy), SendBuildExperienceEventModule (upval), Failed (ref), UseSignalStateResult6 (ref), UseSignalStateResult7 (ref)
			if Tbl.universeId == nil then return end
			if UseRefResult1.current ~= Tbl.universeId then
				UseRefResult1.current = Tbl.universeId
				table.clear(UseRefResult.current)
			end
			local function reportStatus(Resource, UseSignalStateResult) --[[ Line: 360 ]]
				-- upvalues: UseRefResult (upval), SendBuildExperienceEventModule (upval), Tbl (upval)
				if UseSignalStateResult ~= "NotReady" and UseRefResult.current[Resource] ~= UseSignalStateResult then
					UseRefResult.current[Resource] = UseSignalStateResult
					SendBuildExperienceEventModule(if UseSignalStateResult == "Ready" then "MONETIZATION_OPTIONS_LOAD_SUCCESS" else "MONETIZATION_OPTIONS_LOAD_FAILURE", {
						universeId = Tbl.universeId,
						placeId = Tbl.placeId,
						conversationId = Tbl.sessionId
					}, { resource = Resource })
				end
			end
			
			reportStatus("permission", Failed)
			reportStatus("managed_pricing", UseSignalStateResult6)
			reportStatus("shops", UseSignalStateResult7)
		end, {
			UseSignalStateResult6, Failed, Tbl.placeId, Tbl.sessionId, Tbl.universeId,
			UseSignalStateResult7
		})
	end
	local IsCanMonetize: boolean = if FFlagBuildExperienceMonetizationMultiKindModule then Failed == "Ready" and (UseSignalStateResult3 ~= nil and UseSignalStateResult3.canMonetize == true) else not FFlagBuildExperienceMonetizationNativeUIModule or (Failed ~= "Ready" or (UseSignalStateResult3 == nil or UseSignalStateResult3.canMonetize == true))
	local UseSignalStateResult8 = if FFlagBuildExperienceMonetizationMultiKindModule then SignalsReactModule.useSignalState(ComputedResult.getAccountResetGeneration) else 0
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 412 ]]
		-- upvalues: Tbl (copy), FFlagBuildExperienceManageDevProductModule (upval), ComputedResult (copy)
		return if Tbl.products == nil and Tbl.universeId ~= nil then if FFlagBuildExperienceManageDevProductModule then ComputedResult.fetchProducts(Tbl.universeId) else ComputedResult.getAndFetchProducts(Tbl.universeId) else nil
	end, if FFlagBuildExperienceMonetizationMultiKindModule then {
		UseSignalStateResult8,
		ComputedResult,
		Tbl.products ~= nil,
		Tbl.universeId or 0
	} else { ComputedResult, Tbl.products ~= nil, Tbl.universeId or 0 })
	local UseSignalStateResult9 = SignalsReactModule.useSignalState(if UseMemoResult3 == nil then Signal else UseMemoResult3.data)
	local UseSignalStateResult10 = SignalsReactModule.useSignalState(if UseMemoResult3 == nil then Ready else UseMemoResult3.status)
	local UseMixedCatalogResult = if FFlagBuildExperienceMonetizationMultiKindModule then useMixedCatalog(Tbl, ComputedResult, UseSignalStateResult9, UseSignalStateResult10, {
		productType = UseLocalizationResult.productType,
		gamePassType = UseLocalizationResult.gamePassType
	}) else nil
	local GamePassCatalog = if UseMixedCatalogResult == nil then nil else UseMixedCatalogResult.gamePassCatalog
	local UseMemoResult21 = ReactModule.useMemo(function() --[[ Line: 435 ]]
		-- upvalues: Tbl (copy), UseContextResult (copy), LocalizationStringsModule (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), MapMonetizationCatalogModule (upval), UseSignalStateResult9 (copy), GamePassCatalog (copy), UseLocalizationResult (copy), MapDeveloperProductsToMonetizationProductsModule (upval)
		if Tbl.products == nil then
			local function FormatDefaultProductName(p4) --[[ Line: 439 ]]
				-- upvalues: UseContextResult (upval), LocalizationStringsModule (upval)
				return UseContextResult:Format(LocalizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, { PRODUCT_ID = p4 })
			end
			
			return if FFlagBuildExperienceMonetizationMultiKindModule then MapMonetizationCatalogModule({
				developerProducts = UseSignalStateResult9,
				gamePasses = GamePassCatalog
			}, {
				formatDefaultProductName = FormatDefaultProductName,
				priceUnavailable = UseLocalizationResult.priceUnavailable,
				developerProductType = UseLocalizationResult.productType,
				gamePassType = UseLocalizationResult.gamePassType,
				onSale = UseLocalizationResult.onSale,
				offSale = UseLocalizationResult.offSale
			}) else MapDeveloperProductsToMonetizationProductsModule(UseSignalStateResult9, {
				formatDefaultProductName = FormatDefaultProductName,
				priceUnavailable = UseLocalizationResult.priceUnavailable,
				productType = UseLocalizationResult.productType,
				onSale = UseLocalizationResult.onSale,
				offSale = UseLocalizationResult.offSale
			})
		else
			return Tbl.products
		end
	end, {
		UseSignalStateResult9,
		UseLocalizationResult,
		UseContextResult,
		Tbl.products,
		GamePassCatalog
	})
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 475 ]]
		-- upvalues: FFlagBuildExperienceMonetizationMultiKindModule (upval), UseMemoResult3 (copy), UseSignalStateResult10 (copy), UseRefResult2 (copy), SendBuildExperienceEventModule (upval), Tbl (copy)
		if FFlagBuildExperienceMonetizationMultiKindModule or UseMemoResult3 == nil then return end
		if UseSignalStateResult10 == "NotReady" then
			UseRefResult2.current = nil
			
			return
		end
		if UseRefResult2.current ~= UseSignalStateResult10 then
			UseRefResult2.current = UseSignalStateResult10
			SendBuildExperienceEventModule(if UseSignalStateResult10 == "Ready" then "MONETIZATION_CATALOG_LOAD_SUCCESS" else "MONETIZATION_CATALOG_LOAD_FAILURE", {
				universeId = Tbl.universeId,
				placeId = Tbl.placeId,
				conversationId = Tbl.sessionId
			})
			
			return
		end
	end, {
		UseMemoResult3,
		UseSignalStateResult10,
		Tbl.placeId,
		Tbl.sessionId,
		Tbl.universeId
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 506 ]]
		-- upvalues: Tbl (copy), ComputedResult (copy)
		if Tbl.products == nil and Tbl.universeId ~= nil then
			ComputedResult.fetchProducts(Tbl.universeId)
		end
	end, { ComputedResult, Tbl.products, Tbl.universeId })
	local UseResult1 = if UseMixedCatalogResult == nil then UseResult else UseMixedCatalogResult.onRetryAll
	local OnRetrySource = if UseMixedCatalogResult == nil then nil else UseMixedCatalogResult.onRetrySource
	local UseResult2 = ReactModule.useCallback(function(p4, IsManagedPricingEnabled) --[[ Line: 513 ]]
		-- upvalues: ComputedResult (copy), Tbl (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), v1 (ref)
		local function v89() --[[ Line: 514 ]]
			-- upvalues: ComputedResult (upval), Tbl (upval), p4 (copy), IsManagedPricingEnabled (copy)
			return ComputedResult.update(Tbl.universeId, p4, { isManagedPricingEnabled = IsManagedPricingEnabled })
		end
		
		return if FFlagBuildExperienceMonetizationNativeUIModule and IsManagedPricingEnabled then v1.ensureManagedPricingAccepted(Tbl.universeId):andThen(v89) else v89()
	end, { ComputedResult, v1, Tbl.universeId })
	local UseResult21 = ReactModule.useCallback(function(p4, IsForSale) --[[ Line: 526 ]]
		-- upvalues: ComputedResult (copy), Tbl (copy)
		return ComputedResult.update(Tbl.universeId, p4, { isForSale = IsForSale })
	end, { ComputedResult, Tbl.universeId })
	local UseResult3 = ReactModule.useCallback(function(p4, p5) --[[ Line: 532 ]]
		-- upvalues: ComputedResult (copy), Tbl (copy), FFlagBuildExperienceDevProductModerationReadbackModule (upval)
		return ComputedResult.update(Tbl.universeId, p4, p5, FFlagBuildExperienceDevProductModerationReadbackModule)
	end, { ComputedResult, Tbl.universeId })
	local UseResult4 = nil
	local UseResult5 = nil
	local UseResult6 = nil
	local UseResult7 = nil
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseResult4 = ReactModule.useCallback(function() --[[ Line: 548 ]]
			-- upvalues: v1 (ref), Tbl (copy)
			return v1.acceptManagedPricing(Tbl.universeId)
		end, { v1, Tbl.universeId })
		UseResult5 = ReactModule.useCallback(function(p4, p5) --[[ Line: 554 ]]
			-- upvalues: ComputedResult (copy), Tbl (copy), v1 (ref), PromiseModule (upval)
			local function _() --[[ Line: 555 | Named "refreshProducts" ]]
				-- upvalues: ComputedResult (upval), Tbl (upval)
				return ComputedResult.list(Tbl.universeId):catch(function() --[[ Line: 556 ]]
					return nil
				end)
			end
			
			return v1.updateDeveloperProductsManagedPricing(Tbl.universeId, p4, p5):andThen(function(Result) --[[ Line: 562 ]]
				-- upvalues: ComputedResult (upval), Tbl (upval)
				return ComputedResult.list(Tbl.universeId):catch(function() --[[ Line: 556 ]]
					return nil
				end):andThen(function() --[[ Line: 563 ]]
					-- upvalues: Result (copy)
					return Result
				end)
			end, function(p6) --[[ Line: 566 ]]
				-- upvalues: ComputedResult (upval), Tbl (upval), PromiseModule (upval)
				return ComputedResult.list(Tbl.universeId):catch(function() --[[ Line: 556 ]]
					return nil
				end):andThen(function() --[[ Line: 567 ]]
					-- upvalues: PromiseModule (upval), p6 (copy)
					return PromiseModule.reject(p6)
				end)
			end)
		end, { ComputedResult, v1, Tbl.universeId })
		UseResult6 = ReactModule.useCallback(function(p4) --[[ Line: 573 ]]
			-- upvalues: v1 (ref), Tbl (copy)
			return v1.setShopGlobalIcon(Tbl.universeId, p4)
		end, { v1, Tbl.universeId })
		UseResult7 = ReactModule.useCallback(function() --[[ Line: 581 ]]
			-- upvalues: v1 (ref), Tbl (copy), UseSignalStateResult1 (ref), UseSignalStateResult2 (ref), UseSignalStateResult (ref)
			local v2 = v1
			v2.fetchManagedPricing(Tbl.universeId)
			v2.fetchShops(Tbl.universeId)
			
			if UseSignalStateResult1 == nil or UseSignalStateResult2 == "Failed" then
				UseSignalStateResult.fetchSummary(Tbl.universeId)
				
				return
			else
				v2.fetchPermission(Tbl.universeId, UseSignalStateResult1.creatorType, UseSignalStateResult1.creatorTargetId)
			end
		end, {
			v1,
			Tbl.universeId,
			UseSignalStateResult1,
			UseSignalStateResult2,
			UseSignalStateResult
		})
	end
	local Copy = table.clone(Tbl)
	Copy.products = UseMemoResult21
	Copy.showOptions = FFlagBuildExperienceMonetizationNativeUIModule and (Tbl.showOptions == true or Tbl.universeId ~= nil)
	
	if FFlagBuildExperienceMonetizationNativeUIModule and Tbl.universeId ~= nil then
		Copy.managedPricingStatus = if UseSignalStateResult4 == nil then nil else UseSignalStateResult4.status
		Copy.shops = if UseSignalStateResult5 == nil then nil else UseSignalStateResult5.shops
		Copy.permissionCanMonetize = if UseSignalStateResult3 == nil then nil else UseSignalStateResult3.canMonetize
		Copy.managedPricingLoadStatus = UseSignalStateResult6
		Copy.shopsLoadStatus = UseSignalStateResult7
		Copy.permissionLoadStatus = Failed
		Copy.onAcceptManagedPricing = UseResult4
		Copy.onUpdateManagedPricing = UseResult5
		Copy.onSetShopButton = UseResult6
		Copy.onRetryOptions = UseResult7
	end
	if FFlagBuildExperienceMonetizationMultiKindModule then
		Copy.catalogSources = if Tbl.products == nil then UseMixedCatalogResult.catalogSources else nil
		Copy.onRetryCatalogSource = OnRetrySource
		Copy.catalogStatus = UseMixedCatalogResult.status
	elseif UseSignalStateResult10 == "Ready" then
		Copy.catalogStatus = "Ready"
	elseif UseSignalStateResult10 == "Failed" then
		Copy.catalogStatus = "Failed"
	else
		Copy.catalogStatus = "NotReady"
	end
	Copy.onRetryCatalog = UseResult1
	Copy.onUpdateProductManagedPricing = if Tbl.universeId == nil or not IsCanMonetize then nil else UseResult2
	
	if FFlagBuildExperienceMonetizationProductEditingModule and Tbl.universeId ~= nil and IsCanMonetize then
		Copy.onUpdateProductSaleStatus = UseResult21
		Copy.onUpdateProduct = UseResult3
	end
	return ReactModule.createElement(MonetizationPageViewModule, (UseMonetizationPageViewModelModule(Copy)))
end