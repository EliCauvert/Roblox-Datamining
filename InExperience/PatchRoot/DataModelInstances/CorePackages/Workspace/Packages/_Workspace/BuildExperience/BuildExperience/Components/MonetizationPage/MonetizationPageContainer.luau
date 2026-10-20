local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration.DeveloperProduct)
local DeveloperSubscriptionModule = require(Parent.DataHydration.DeveloperSubscription)
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

local function _(p1, p2): string
	return if p2 or p1 == "Failed" then "Failed" elseif p1 == "Ready" then "Ready" else "NotReady"
end

local Signal = SignalsModule.createSignal(nil)
local Signal1 = SignalsModule.createSignal(nil)
local Signal2 = SignalsModule.createSignal(nil)
local Signal3 = SignalsModule.createSignal(nil)
local Signal4 = SignalsModule.createSignal(nil)
local Signal5 = SignalsModule.createSignal(nil)
local Signal6 = SignalsModule.createSignal(nil)
local Ready = SignalsModule.createSignal("Ready")
local NotReady = SignalsModule.createSignal("NotReady")
local Computed = SignalsModule.createComputed(function()
	-- upvalues: CreateManageDevProductStoreModule (copy)
	return CreateManageDevProductStoreModule()
end)
local Computed1 = SignalsModule.createComputed(function()
	-- upvalues: CreateManageMonetizationOptionsStoreModule (copy)
	return CreateManageMonetizationOptionsStoreModule()
end)

local _ = function(List): string
	local v1 = "Ready"
	
	for _, value in List do
		if value.status == "Failed" then
			return "Failed"
		elseif value.status ~= "Ready" then
			v1 = "NotReady"
		end
	end
	return v1
end

local function useMixedCatalog(p1, p2, UseSignalStateResult, UseSignalStateResult1, ProductLocalizationKeys)
	-- upvalues: SignalsReactModule (copy), GamePassConfigModule (copy), DeveloperSubscriptionModule (copy), ReactModule (copy), Signal1 (copy), Ready (copy), Signal2 (copy), SendBuildExperienceEventModule (copy)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(GamePassConfigModule.getGamePassConfigStore)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(DeveloperSubscriptionModule.getDeveloperSubscriptionStore)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseSignalStateResult2 (copy)
		return if p1.products == nil and p1.universeId ~= nil then UseSignalStateResult2.fetchGamePasses(p1.universeId) else nil
	end, {
		SignalsReactModule.useSignalState(UseSignalStateResult2.getAccountResetGeneration),
		UseSignalStateResult2,
		p1.products ~= nil,
		p1.universeId or 0
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseSignalStateResult3 (copy)
		return if p1.products == nil and p1.universeId ~= nil then UseSignalStateResult3.fetchSubscriptions(p1.universeId) else nil
	end, {
		p1.products ~= nil,
		p1.universeId or 0,
		SignalsReactModule.useSignalState(UseSignalStateResult3.getAccountResetGeneration),
		UseSignalStateResult3
	})
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal1 else UseMemoResult.data)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Ready else UseMemoResult.status)
	local UseSignalStateResult6 = SignalsReactModule.useSignalState(if UseMemoResult1 == nil then Signal2 else UseMemoResult1.data)
	local UseSignalStateResult7 = SignalsReactModule.useSignalState(if UseMemoResult1 == nil then Ready else UseMemoResult1.status)
	local HasNextPageToken: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.nextPageToken ~= nil
	local IsIsIncomplete: boolean = UseSignalStateResult4 ~= nil and UseSignalStateResult4.isIncomplete == true
	local IsIsIncomplete1: boolean = UseSignalStateResult6 ~= nil and UseSignalStateResult6.isIncomplete == true
	local Failed: string = if HasNextPageToken or UseSignalStateResult1 == "Failed" then "Failed" elseif UseSignalStateResult1 == "Ready" then "Ready" else "NotReady"
	local Failed1: string = if IsIsIncomplete or UseSignalStateResult5 == "Failed" then "Failed" elseif UseSignalStateResult5 == "Ready" then "Ready" else "NotReady"
	local Failed2: string = if IsIsIncomplete1 or UseSignalStateResult7 == "Failed" then "Failed" elseif UseSignalStateResult7 == "Ready" then "Ready" else "NotReady"
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ProductLocalizationKeys (copy), Failed1 (copy), UseSignalStateResult4 (copy), IsIsIncomplete (copy), Failed (copy), UseSignalStateResult (copy), HasNextPageToken (copy), Failed2 (copy), UseSignalStateResult6 (copy), IsIsIncomplete1 (copy)
		return if p1.products == nil then {
			{
				kind = "GamePass",
				label = ProductLocalizationKeys.gamePassSection,
				status = Failed1,
				hasCachedProducts = UseSignalStateResult4 ~= nil and #UseSignalStateResult4.gamePasses > 0,
				isIncomplete = IsIsIncomplete
			},
			{
				kind = "DeveloperProduct",
				label = ProductLocalizationKeys.productSection,
				status = Failed,
				hasCachedProducts = UseSignalStateResult ~= nil and #UseSignalStateResult.developerProducts > 0,
				isIncomplete = HasNextPageToken
			},
			{
				kind = "Subscription",
				label = ProductLocalizationKeys.subscriptionSection,
				status = Failed2,
				hasCachedProducts = UseSignalStateResult6 ~= nil and #UseSignalStateResult6.developerSubscriptions > 0,
				isIncomplete = IsIsIncomplete1
			}
		} else {}
	end, {
		Failed, Failed1,
		if UseSignalStateResult == nil then 0 else #UseSignalStateResult.developerProducts,
		if UseSignalStateResult4 == nil then 0 else #UseSignalStateResult4.gamePasses,
		if UseSignalStateResult6 == nil then 0 else #UseSignalStateResult6.developerSubscriptions,
		HasNextPageToken, IsIsIncomplete, IsIsIncomplete1,
		ProductLocalizationKeys.gamePassSection,
		ProductLocalizationKeys.productSection,
		ProductLocalizationKeys.subscriptionSection, p1.products ~= nil, Failed2
	})
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), p1 (copy), UseRefResult (copy), UseMemoResult2 (copy), SendBuildExperienceEventModule (upval)
		if UseRefResult1.current ~= p1.universeId then
			UseRefResult1.current = p1.universeId
			table.clear(UseRefResult.current)
		end
		for _, value in UseMemoResult2 do
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
	end, { UseMemoResult2, p1.placeId, p1.sessionId, p1.universeId })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), p2 (copy), UseSignalStateResult2 (copy), UseSignalStateResult3 (copy)
		if p1.products == nil and p1.universeId ~= nil then
			p2.fetchProducts(p1.universeId)
			UseSignalStateResult2.fetchGamePasses(p1.universeId)
			UseSignalStateResult3.fetchSubscriptions(p1.universeId)
		end
	end, {
		p2,
		UseSignalStateResult2,
		p1.products,
		p1.universeId,
		UseSignalStateResult3
	})
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: p1 (copy), p2 (copy), UseSignalStateResult2 (copy), UseSignalStateResult3 (copy)
		if p1.products ~= nil or p1.universeId == nil then return end
		if p3 == "DeveloperProduct" then
			p2.fetchProducts(p1.universeId)
			
			return
		end
		if p3 == "GamePass" then
			UseSignalStateResult2.fetchGamePasses(p1.universeId)
			
			return
		end
		if p3 == "Subscription" then
			UseSignalStateResult3.fetchSubscriptions(p1.universeId)
		end
	end, {
		p2,
		UseSignalStateResult2,
		p1.products,
		p1.universeId,
		UseSignalStateResult3
	})
	local config = {
		gamePassCatalog = UseSignalStateResult4,
		subscriptionCatalog = UseSignalStateResult6,
		catalogSources = UseMemoResult2
	}
	local v2 = "Ready"
	local Status = nil
	
	for _, value in UseMemoResult2 do
		if value.status == "Failed" then
			Status = "Failed"
		else
			if value.status ~= "Ready" then
				v2 = "NotReady"
				continue
			end
			continue
		end
		config.status = Status
		config.onRetryAll = UseResult
		config.onRetrySource = UseResult1
		
		return config
	end
	Status = v2
end

local function getProductLocalizationKeys()
	-- upvalues: LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy)
	return {
		priceUnavailable = LocalizationStringsModule.MONETIZATION_PRICE_UNAVAILABLE,
		productType = LocalizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
		productSection = if FFlagBuildExperienceMonetizationMultiKindModule then LocalizationStringsModule.MONETIZATION_PRODUCTS else nil,
		gamePassType = if FFlagBuildExperienceMonetizationMultiKindModule then LocalizationStringsModule.MONETIZATION_GAME_PASS else nil,
		gamePassSection = if FFlagBuildExperienceMonetizationMultiKindModule then LocalizationStringsModule.MONETIZATION_PASSES else nil,
		subscriptionType = if FFlagBuildExperienceMonetizationMultiKindModule then LocalizationStringsModule.AGENT_SUBSCRIPTION_TITLE else nil,
		subscriptionSection = if FFlagBuildExperienceMonetizationMultiKindModule then LocalizationStringsModule.MONETIZATION_SUBSCRIPTIONS else nil,
		onSale = LocalizationStringsModule.MONETIZATION_ON_SALE,
		offSale = LocalizationStringsModule.MONETIZATION_OFF_SALE
	}
end

return function(Tbl)
	-- upvalues: ReactModule (copy), LocalizationModule (copy), getProductLocalizationKeys (copy), Computed (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), Computed1 (copy), SignalsReactModule (copy), UniverseConfigurationModule (copy), Signal3 (copy), NotReady (copy), Signal4 (copy), Signal5 (copy), Signal6 (copy), SendBuildExperienceEventModule (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), FFlagBuildExperienceManageDevProductModule (copy), Signal (copy), Ready (copy), useMixedCatalog (copy), LocalizationStringsModule (copy), MapMonetizationCatalogModule (copy), MapDeveloperProductsToMonetizationProductsModule (copy), FFlagBuildExperienceDevProductModerationReadbackModule (copy), PromiseModule (copy), FFlagBuildExperienceMonetizationProductEditingModule (copy), UseMonetizationPageViewModelModule (copy), MonetizationPageViewModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization((getProductLocalizationKeys()))
	local ComputedResult = Computed()
	local v3 = nil
	local UseSignalStateResult = nil
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		v3 = Computed1()
		UseSignalStateResult = SignalsReactModule.useSignalState(UniverseConfigurationModule.getUniverseConfigurationStore)
	end
	local UseMemoResult = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (ref), Tbl (copy)
		return if UseSignalStateResult == nil or Tbl.universeId == nil then nil else UseSignalStateResult.getAndFetchSummary(Tbl.universeId)
	end, { Tbl.universeId, UseSignalStateResult }) else nil
	local UseSignalStateResult1 = nil
	local UseSignalStateResult2 = "NotReady"
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal3 else UseMemoResult.data)
		UseSignalStateResult2 = SignalsReactModule.useSignalState(if UseMemoResult == nil then NotReady else UseMemoResult.status)
	end
	local UseMemoResult1 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function()
		-- upvalues: v3 (ref), Tbl (copy), UseSignalStateResult1 (ref)
		return if v3 == nil or Tbl.universeId == nil or UseSignalStateResult1 == nil then nil else v3.getAndFetchPermission(Tbl.universeId, UseSignalStateResult1.creatorType, UseSignalStateResult1.creatorTargetId)
	end, { v3, Tbl.universeId, UseSignalStateResult1 }) else nil
	local UseSignalStateResult3 = nil
	local Failed = "NotReady"
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseSignalStateResult3 = SignalsReactModule.useSignalState(if UseMemoResult1 == nil then Signal4 else UseMemoResult1.data)
		Failed = if UseSignalStateResult2 == "Failed" then "Failed" else SignalsReactModule.useSignalState(if UseMemoResult1 == nil then NotReady else UseMemoResult1.status)
	end
	local UseMemoResult2 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function()
		-- upvalues: v3 (ref), Tbl (copy)
		return if v3 == nil or Tbl.universeId == nil then nil else v3.getAndFetchManagedPricing(Tbl.universeId)
	end, { v3, Tbl.universeId }) else nil
	local UseMemoResult11 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useMemo(function()
		-- upvalues: v3 (ref), Tbl (copy)
		return if v3 == nil or Tbl.universeId == nil then nil else v3.getAndFetchShops(Tbl.universeId)
	end, { v3, Tbl.universeId }) else nil
	local UseSignalStateResult4 = nil
	local UseSignalStateResult5 = nil
	local UseSignalStateResult6 = "NotReady"
	local UseSignalStateResult7 = "NotReady"
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseMemoResult2 == nil then Signal5 else UseMemoResult2.data)
		UseSignalStateResult6 = SignalsReactModule.useSignalState(if UseMemoResult2 == nil then NotReady else UseMemoResult2.status)
		UseSignalStateResult5 = SignalsReactModule.useSignalState(if UseMemoResult11 == nil then Signal6 else UseMemoResult11.data)
		UseSignalStateResult7 = SignalsReactModule.useSignalState(if UseMemoResult11 == nil then NotReady else UseMemoResult11.status)
	end
	if FFlagBuildExperienceMonetizationNativeUIModule then
		local UseRefResult = ReactModule.useRef({})
		local UseRefResult1 = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: Tbl (copy), UseRefResult1 (copy), UseRefResult (copy), SendBuildExperienceEventModule (upval), Failed (ref), UseSignalStateResult6 (ref), UseSignalStateResult7 (ref)
			if Tbl.universeId == nil then return end
			if UseRefResult1.current ~= Tbl.universeId then
				UseRefResult1.current = Tbl.universeId
				table.clear(UseRefResult.current)
			end
			local function reportStatus(Resource, UseSignalStateResult)
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
	local UseMemoResult3 = ReactModule.useMemo(function()
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
		productSection = UseLocalizationResult.productSection,
		gamePassSection = UseLocalizationResult.gamePassSection,
		subscriptionSection = UseLocalizationResult.subscriptionSection
	}) else nil
	local GamePassCatalog = if UseMixedCatalogResult == nil then nil else UseMixedCatalogResult.gamePassCatalog
	local SubscriptionCatalog = if UseMixedCatalogResult == nil then nil else UseMixedCatalogResult.subscriptionCatalog
	local UseMemoResult21 = ReactModule.useMemo(function()
		-- upvalues: Tbl (copy), UseContextResult (copy), LocalizationStringsModule (upval), FFlagBuildExperienceMonetizationMultiKindModule (upval), MapMonetizationCatalogModule (upval), UseSignalStateResult9 (copy), GamePassCatalog (copy), SubscriptionCatalog (copy), UseLocalizationResult (copy), MapDeveloperProductsToMonetizationProductsModule (upval)
		if Tbl.products == nil then
			local function FormatDefaultProductName(p3)
				-- upvalues: UseContextResult (upval), LocalizationStringsModule (upval)
				return UseContextResult:Format(LocalizationStringsModule.MONETIZATION_DEFAULT_PRODUCT_NAME, { PRODUCT_ID = p3 })
			end
			
			return if FFlagBuildExperienceMonetizationMultiKindModule then MapMonetizationCatalogModule({
				developerProducts = UseSignalStateResult9,
				gamePasses = GamePassCatalog,
				subscriptions = SubscriptionCatalog
			}, {
				formatDefaultProductName = FormatDefaultProductName,
				priceUnavailable = UseLocalizationResult.priceUnavailable,
				developerProductType = UseLocalizationResult.productType,
				gamePassType = UseLocalizationResult.gamePassType,
				subscriptionType = UseLocalizationResult.subscriptionType,
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
		UseSignalStateResult9, UseLocalizationResult, UseContextResult, Tbl.products,
		GamePassCatalog, SubscriptionCatalog
	})
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
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
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Tbl (copy), ComputedResult (copy)
		if Tbl.products == nil and Tbl.universeId ~= nil then
			ComputedResult.fetchProducts(Tbl.universeId)
		end
	end, { ComputedResult, Tbl.products, Tbl.universeId })
	local UseResult1 = if UseMixedCatalogResult == nil then UseResult else UseMixedCatalogResult.onRetryAll
	local OnRetrySource = if UseMixedCatalogResult == nil then nil else UseMixedCatalogResult.onRetrySource
	local UseResult2 = ReactModule.useCallback(function(p3, IsManagedPricingEnabled)
		-- upvalues: ComputedResult (copy), Tbl (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), v3 (ref)
		local function v105()
			-- upvalues: ComputedResult (upval), Tbl (upval), p3 (copy), IsManagedPricingEnabled (copy)
			return ComputedResult.update(Tbl.universeId, p3, { isManagedPricingEnabled = IsManagedPricingEnabled })
		end
		
		return if FFlagBuildExperienceMonetizationNativeUIModule and IsManagedPricingEnabled then v3.ensureManagedPricingAccepted(Tbl.universeId):andThen(v105) else v105()
	end, { ComputedResult, v3, Tbl.universeId })
	local UseResult21 = ReactModule.useCallback(function(p3, IsForSale)
		-- upvalues: ComputedResult (copy), Tbl (copy)
		return ComputedResult.update(Tbl.universeId, p3, { isForSale = IsForSale })
	end, { ComputedResult, Tbl.universeId })
	local UseResult3 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: ComputedResult (copy), Tbl (copy), FFlagBuildExperienceDevProductModerationReadbackModule (upval)
		return ComputedResult.update(Tbl.universeId, p3, p4, FFlagBuildExperienceDevProductModerationReadbackModule)
	end, { ComputedResult, Tbl.universeId })
	local UseResult4 = nil
	local UseResult5 = nil
	local UseResult6 = nil
	local UseResult7 = nil
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseResult4 = ReactModule.useCallback(function()
			-- upvalues: v3 (ref), Tbl (copy)
			return v3.acceptManagedPricing(Tbl.universeId)
		end, { v3, Tbl.universeId })
		UseResult5 = ReactModule.useCallback(function(p3, p4)
			-- upvalues: ComputedResult (copy), Tbl (copy), v3 (ref), PromiseModule (upval)
			local function _()
				-- upvalues: ComputedResult (upval), Tbl (upval)
				return ComputedResult.list(Tbl.universeId):catch(function()
					return nil
				end)
			end
			
			return v3.updateDeveloperProductsManagedPricing(Tbl.universeId, p3, p4):andThen(function(Result)
				-- upvalues: ComputedResult (upval), Tbl (upval)
				return ComputedResult.list(Tbl.universeId):catch(function()
					return nil
				end):andThen(function()
					-- upvalues: Result (copy)
					return Result
				end)
			end, function(p5)
				-- upvalues: ComputedResult (upval), Tbl (upval), PromiseModule (upval)
				return ComputedResult.list(Tbl.universeId):catch(function()
					return nil
				end):andThen(function()
					-- upvalues: PromiseModule (upval), p5 (copy)
					return PromiseModule.reject(p5)
				end)
			end)
		end, { ComputedResult, v3, Tbl.universeId })
		UseResult6 = ReactModule.useCallback(function(p3)
			-- upvalues: v3 (ref), Tbl (copy)
			return v3.setShopGlobalIcon(Tbl.universeId, p3)
		end, { v3, Tbl.universeId })
		UseResult7 = ReactModule.useCallback(function()
			-- upvalues: v3 (ref), Tbl (copy), UseSignalStateResult1 (ref), UseSignalStateResult2 (ref), UseSignalStateResult (ref)
			local v4 = v3
			v4.fetchManagedPricing(Tbl.universeId)
			v4.fetchShops(Tbl.universeId)
			
			if UseSignalStateResult1 == nil or UseSignalStateResult2 == "Failed" then
				UseSignalStateResult.fetchSummary(Tbl.universeId)
				
				return
			else
				v4.fetchPermission(Tbl.universeId, UseSignalStateResult1.creatorType, UseSignalStateResult1.creatorTargetId)
			end
		end, {
			v3,
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