local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local TModule = require(CorePackages.Packages.t)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ItemTile = UIBloxModule.Tile.ItemTile
local ItemTileEnums = UIBloxModule.Tile.ItemTileEnums
local OpenCentralOverlayForPurchaseDeveloperProductModule = require(Modules.LuaApp.Thunks.DeveloperProduct.OpenCentralOverlayForPurchaseDeveloperProduct)
local NavigateDownToRobuxUpsellModule = require(Modules.LuaApp.Thunks.Economy.NavigateDownToRobuxUpsell)
local RobuxUpsellTriggerContextModule = require(Modules.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext)
local DeveloperProductFooterModule = require(Modules.LuaApp.Components.DeveloperProduct.DeveloperProductFooter)
local PurchaseDeveloperProductModule = require(Modules.LuaApp.Thunks.DeveloperProduct.PurchaseDeveloperProduct)
local ApiFetchGameDeveloperProductsModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts)
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetIsUserEligibleForUnifiedPurchaseFlowFunction = PurchasePromptLiteModule.getIsUserEligibleForUnifiedPurchaseFlow
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local FetchExperienceStoreProductsModule = require(Modules.LuaApp.Thunks.Economy.FetchExperienceStoreProducts)
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local UniversalEconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = IAPExperienceModule.Counters.EconomicRestrictionsCounter.EconomicRestrictionsSurface
local FFlagEnableUnifiedProductPurchaseFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local SessionService = game:GetService("SessionService")
local FFlagEnableEdpStoreUnifiedLoggingModule = require(Modules.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging)
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local FFlagUnifiedPurchaseAddSkeleton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagUnifiedPurchaseAddSkeleton1 = game:DefineFastFlag("UnifiedPurchaseAddSkeletonLoadingForDeveloperProduct", false) and FFlagUnifiedPurchaseAddSkeleton
local FFlagIntegrateDiscountsWithEDP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP
local FFlagLuaAppFixPassesPageStoreFetch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppFixPassesPageStoreFetch
local ShipUnifiedPurchaseFlowToDeveloperProductEDP = game:DefineFastFlag("ShipUnifiedPurchaseFlowToDeveloperProductEDP", false)
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local GetSubscriptionPurchaseCloseCallbackFunction = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback
local DeveloperProductTile = RoactModule.PureComponent:extend("DeveloperProductTile")
DeveloperProductTile.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	developerProduct = TModule.table,
	developerProductThumbnail = TModule.string,
	pendingReceipts = TModule.optional(TModule.table),
	gridPositionRow = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then TModule.optional(TModule.number) else nil,
	gridPositionColumn = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then TModule.optional(TModule.number) else nil,
	networking = TModule.callback,
	userRobux = TModule.optional(TModule.number),
	rootPlaceId = TModule.optional(TModule.string),
	localUserId = TModule.optional(TModule.string),
	closeCentralOverlay = TModule.callback,
	requestPurchaseDeveloperProduct = TModule.optional(TModule.callback),
	requestPurchaseDeveloperProductWithUnifiedPurchasePrompt = TModule.optional(TModule.callback),
	navigateDownToRobuxUpsell = TModule.callback,
	navigateDown = TModule.callback,
	purchaseDeveloperProduct = TModule.callback,
	fetchGameDeveloperProducts = TModule.callback,
	economicRestrictionErrorHandler = TModule.callback,
	fetchExperienceStoreProducts = TModule.optional(TModule.callback)
})

function DeveloperProductTile.init(p1)
	-- upvalues: FFlagEnableEdpStoreUnifiedLoggingModule (copy), RoactModule (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy), EdpStoreAnalyticsModule (copy), Constants (copy), AppPageModule (copy), UrlBuilderModule (copy), TransitionAnimationModule (copy), ConstantsModule (copy), FFlagIntegrateDiscountsWithEDP (copy), ShipUnifiedPurchaseFlowToDeveloperProductEDP (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (copy)
	if FFlagEnableEdpStoreUnifiedLoggingModule then
		p1.ref = RoactModule.createRef()
	end
	local SubscriptionPurchaseCloseCallback = if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
	
	function p1.viewDeveloperProductDetails(DeveloperProduct)
		-- upvalues: GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), p1 (copy), AppPageModule (upval), UrlBuilderModule (upval), TransitionAnimationModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval), SubscriptionPurchaseCloseCallback (copy)
		return function()
			-- upvalues: GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), p1 (upval), DeveloperProduct (copy), AppPageModule (upval), UrlBuilderModule (upval), TransitionAnimationModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval), SubscriptionPurchaseCloseCallback (upval)
			if GetFFlagEnableEdpStoreClickLoggingModule() then
				EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger.logEvent(Constants.StoreEnums.ActionType.ItemClick, Constants.StoreEnums.ProductType.DeveloperProducts, Constants.StoreEnums.LocationType.Store, tonumber(p1.props.universeId), DeveloperProduct.productId, (tostring(DeveloperProduct.productId)))
			end
			if p1.isMounted then
				p1.props.navigateDown({
					name = AppPageModule.GenericWebPage,
					detail = UrlBuilderModule.economy.info.developerProduct({
						universeId = p1.props.universeId,
						productId = DeveloperProduct.productId
					}),
					extraProps = {
						title = DeveloperProduct.name,
						transitionAnimation = TransitionAnimationModule.SlideInFromRight,
						onClose = if FFlagEnableBlackbirdPageCloseCallback then SubscriptionPurchaseCloseCallback else nil
					}
				})
			end
		end
	end
	
	function p1.customPurchaseErrorHandler(p2)
		-- upvalues: p1 (copy)
		if p2.errorCode == "PendingProductsLimitExceeded" then
			p1.props.openPendingProductsLimitExceededPrompt()
		end
	end
	
	function p1.fetchGameDeveloperProducts(Networking, UniverseId, RootPlaceId, LocalUserId)
		-- upvalues: p1 (copy)
		p1.props.fetchGameDeveloperProducts(Networking, UniverseId, RootPlaceId, LocalUserId)
	end
	
	function p1.promptPurchase(DeveloperProduct, _)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		return function()
			-- upvalues: p1 (upval), ConstantsModule (upval), DeveloperProduct (copy)
			local Networking = p1.props.networking
			local UserRobux = p1.props.userRobux
			local UniverseId = p1.props.universeId
			local RootPlaceId = p1.props.rootPlaceId
			local LocalUserId = p1.props.localUserId
			local config = {
				expectedCurrency = ConstantsModule.Currency.Robux,
				expectedPrice = DeveloperProduct.priceInRobux,
				saleLocationId = UniverseId
			}
			
			if UserRobux < DeveloperProduct.priceInRobux then
				p1.props.navigateDownToRobuxUpsell(DeveloperProduct.priceInRobux, UserRobux, DeveloperProduct.name, nil, function()
					-- upvalues: p1 (upval), Networking (copy), DeveloperProduct (upval), config (copy), UniverseId (copy), RootPlaceId (copy), LocalUserId (copy)
					local PurchaseDeveloperProductResult = p1.props.purchaseDeveloperProduct(Networking, DeveloperProduct.productId, config, p1.customPurchaseErrorHandler, p1.props.economicRestrictionErrorHandler)
					PurchaseDeveloperProductResult:andThen(function(_)
						-- upvalues: p1 (upval), Networking (upval), UniverseId (upval), RootPlaceId (upval), LocalUserId (upval)
						p1.fetchGameDeveloperProducts(Networking, UniverseId, RootPlaceId, LocalUserId)
					end, function(_) end)
					
					return PurchaseDeveloperProductResult
				end, DeveloperProduct.productId)
				
				return
			else
				p1.props.requestPurchaseDeveloperProduct(DeveloperProduct, UniverseId)
			end
		end
	end
	
	function p1.promptPurchaseWithUnifiedPurchasePrompt(DeveloperProduct, UniverseId)
		-- upvalues: p1 (copy), FFlagIntegrateDiscountsWithEDP (upval)
		local Networking = p1.props.networking
		local RootPlaceId = p1.props.rootPlaceId
		local LocalUserId = p1.props.localUserId
		
		local function onFlowComplete()
			-- upvalues: p1 (upval)
			p1.props.closeCentralOverlay()
		end
		
		local function onPurchaseSuccess(p2)
			-- upvalues: p1 (upval), Networking (copy), UniverseId (copy), RootPlaceId (copy), LocalUserId (copy)
			if p2 and p2.purchased then
				p1.props.fetchGameDeveloperProducts(Networking, UniverseId, RootPlaceId, LocalUserId)
			end
		end
		
		local function onRobloxSubscriptionUpsellSuccess()
			-- upvalues: p1 (upval), UniverseId (copy)
			p1.props.fetchExperienceStoreProducts(p1.props.networking, UniverseId)
		end
		
		return function()
			-- upvalues: p1 (upval), DeveloperProduct (copy), UniverseId (copy), onFlowComplete (copy), onPurchaseSuccess (copy), FFlagIntegrateDiscountsWithEDP (upval), onRobloxSubscriptionUpsellSuccess (copy)
			p1.props.requestPurchaseDeveloperProductWithUnifiedPurchasePrompt(DeveloperProduct, UniverseId, onFlowComplete, onPurchaseSuccess, if FFlagIntegrateDiscountsWithEDP then onRobloxSubscriptionUpsellSuccess else nil)
		end
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy), GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), ShipUnifiedPurchaseFlowToDeveloperProductEDP (upval), GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval)
		local DeveloperProduct = p1.props.developerProduct
		local UniverseId = p1.props.universeId
		
		if GetFFlagEnableEdpStoreClickLoggingModule() then
			EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger.logEvent(Constants.StoreEnums.ActionType.PurchaseAttemptClick, Constants.StoreEnums.ProductType.DeveloperProducts, Constants.StoreEnums.LocationType.Store, tonumber(UniverseId), DeveloperProduct.productId, (tostring(DeveloperProduct.productId)))
		end
		return if ShipUnifiedPurchaseFlowToDeveloperProductEDP then p1.promptPurchaseWithUnifiedPurchasePrompt(DeveloperProduct, UniverseId)() else GetIsUserEligibleForUnifiedPurchaseFlowFunction(p1.props.networking):andThen(function(Result)
			-- upvalues: p1 (upval), DeveloperProduct (copy), UniverseId (copy)
			return if Result then p1.promptPurchaseWithUnifiedPurchasePrompt(DeveloperProduct, UniverseId)() else p1.promptPurchase(DeveloperProduct, UniverseId)()
		end):catch(function(_)
			-- upvalues: p1 (upval), DeveloperProduct (copy), UniverseId (copy)
			return p1.promptPurchase(DeveloperProduct, UniverseId)()
		end)
	end
end

function DeveloperProductTile.render(p1)
	-- upvalues: RoactModule (copy), ItemTile (copy), FFlagEnableEdpStoreUnifiedLoggingModule (copy), DeveloperProductFooterModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ItemTileEnums (copy)
	local DeveloperProduct = p1.props.developerProduct
	local PendingReceipts = p1.props.pendingReceipts
	
	return RoactModule.createElement(ItemTile, {
		[RoactModule.Ref] = if FFlagEnableEdpStoreUnifiedLoggingModule then p1.ref else nil,
		name = DeveloperProduct.name,
		titleTextLineCount = 1,
		thumbnail = p1.props.developerProductThumbnail,
		onActivated = p1.viewDeveloperProductDetails(DeveloperProduct),
		footer = RoactModule.createElement(DeveloperProductFooterModule, {
			price = DeveloperProduct.priceInRobux,
			onActivated = if FFlagEnableUnifiedProductPurchaseFlow then p1.onActivated else p1.promptPurchase(DeveloperProduct, p1.props.universeId)
		}),
		statusText = if PendingReceipts == nil then nil else "x" .. tostring(#PendingReceipts),
		statusStyle = ItemTileEnums.StatusStyle.Info
	})
end

function DeveloperProductTile.didMount(p1)
	-- upvalues: FFlagEnableEdpStoreUnifiedLoggingModule (copy), UnifiedEventLogEnums (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), AddUnifiedEventLoggingFunction (copy), SessionService (copy)
	p1.isMounted = true
	
	if FFlagEnableEdpStoreUnifiedLoggingModule then
		task.delay(0, function()
			-- upvalues: p1 (copy), UnifiedEventLogEnums (upval), GetFFlagEnableEdpStoreGridPositionLoggingModule (upval), AddUnifiedEventLoggingFunction (upval), SessionService (upval)
			local config = {
				universeId = tonumber(p1.props.universeId),
				itemId = p1.props.developerProduct.productId,
				targetId = tonumber(p1.props.developerProduct.id),
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.DEVELOPER_PRODUCT
			}
			
			if GetFFlagEnableEdpStoreGridPositionLoggingModule() then
				config.gridPositionRow = p1.props.gridPositionRow
				config.gridPositionColumn = p1.props.gridPositionColumn
			end
			AddUnifiedEventLoggingFunction(p1.ref, config, { sessionTagName = SessionService:GetSessionTag("level2a") })
		end)
	end
end

function DeveloperProductTile.willUnmount(p1)
	p1.isMounted = false
end

return (RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagLuaAppFixPassesPageStoreFetch (copy)
	local ProductId = p2.developerProduct.productId
	local DeveloperProductStatusEntry = nil
	
	if FFlagLuaAppFixPassesPageStoreFetch then
		local DeveloperProductStatus = p1.DeveloperProductStatuses[p2.universeId]
		DeveloperProductStatusEntry = if DeveloperProductStatus then DeveloperProductStatus[tostring(ProductId)] else nil
	else
		DeveloperProductStatusEntry = p1.DeveloperProductStatuses[p2.universeId][tostring(ProductId)]
	end
	return {
		userRobux = p1.UserRobux[p1.LocalUserId],
		pendingReceipts = DeveloperProductStatusEntry,
		rootPlaceId = if p1.GameDetails and p1.GameDetails[p2.universeId] then p1.GameDetails[p2.universeId].rootPlaceId else nil,
		localUserId = p1.LocalUserId
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayFunction (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), FFlagIntegrateDiscountsWithEDP (copy), ProductPurchaseSurface (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), FFlagUnifiedPurchaseAddSkeleton1 (copy), OpenCentralOverlayForPurchaseDeveloperProductModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), NavigateDownToRobuxUpsellModule (copy), RobuxUpsellTriggerContextModule (copy), PurchaseDeveloperProductModule (copy), ApiFetchGameDeveloperProductsModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy), FetchExperienceStoreProductsModule (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			return Callback(CloseCentralOverlayFunction())
		end,
		requestPurchaseDeveloperProductWithUnifiedPurchasePrompt = function(p1, UniverseId, OnFlowComplete, OnPurchaseSuccess, p2)
			-- upvalues: Callback (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), FFlagIntegrateDiscountsWithEDP (upval), ProductPurchaseSurface (upval), FFlagUnifiedPurchaseGamepassAddProductUniverseId (upval), FFlagUnifiedPurchaseAddSkeleton1 (upval)
			return Callback(OpenCentralOverlayForUnifiedPurchasePromptModule({
				productPayload = {
					kind = "Product",
					equipIfPurchased = false,
					id = p1.productId,
					universeId = UniverseId
				},
				purchaseCallbacks = {
					onFlowComplete = OnFlowComplete,
					onPurchaseSuccess = OnPurchaseSuccess,
					onRobloxSubscriptionUpsellSuccess = if FFlagIntegrateDiscountsWithEDP then p2 else nil
				},
				purchaseAnalyticsMetadata = {
					surface = ProductPurchaseSurface.EDP,
					productUniverseId = if FFlagUnifiedPurchaseGamepassAddProductUniverseId then UniverseId else nil
				},
				purchaseOptions = if FFlagUnifiedPurchaseAddSkeleton1 then { enablePreloadedPurchaseUI = true } else nil
			}))
		end,
		requestPurchaseDeveloperProduct = function(p1, p2)
			-- upvalues: Callback (copy), OpenCentralOverlayForPurchaseDeveloperProductModule (upval)
			return Callback(OpenCentralOverlayForPurchaseDeveloperProductModule(p1, p2))
		end,
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownModule(p1))
		end,
		navigateDownToRobuxUpsell = function(p1, p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), NavigateDownToRobuxUpsellModule (upval), RobuxUpsellTriggerContextModule (upval)
			return Callback(NavigateDownToRobuxUpsellModule(RobuxUpsellTriggerContextModule.UADeveloperProduct, p1, p2, p3, p4, p5, p6))
		end,
		purchaseDeveloperProduct = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), PurchaseDeveloperProductModule (upval)
			return Callback(PurchaseDeveloperProductModule.Post(p1, p2, p3, p4, p5))
		end,
		fetchGameDeveloperProducts = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), ApiFetchGameDeveloperProductsModule (upval)
			return Callback(ApiFetchGameDeveloperProductsModule(p1, p2, p3, p4))
		end,
		economicRestrictionErrorHandler = function(p1)
			-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), Callback (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
			local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p1)
			local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p1)
			Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
				surface = EconomicRestrictionsSurface.DeveloperProduct,
				failureReason = ParseEconomicRestrictionsFailureReasonResult
			})
			
			return Callback(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
		end,
		fetchExperienceStoreProducts = function(p1, p2)
			-- upvalues: Callback (copy), FetchExperienceStoreProductsModule (upval)
			return Callback(FetchExperienceStoreProductsModule(p1, p2))
		end
	}
end)(DeveloperProductTile))))