local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local TModule = require(CorePackages.Packages.t)
local ApiFetchGamePassesModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local PromiseModule = require(CorePackages.Packages.Promise)
local ItemTile = require(CorePackages.Packages.UIBlox).Tile.ItemTile
local OpenCentralOverlayForPurchasePassModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPurchasePass)
local FetchExperienceStoreProductsModule = require(Modules.LuaApp.Thunks.Economy.FetchExperienceStoreProducts)
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local SessionService = game:GetService("SessionService")
local FFlagEnableEdpStoreUnifiedLoggingModule = require(Modules.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging)
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetIsUserEligibleForUnifiedPurchaseFlowFunction = PurchasePromptLiteModule.getIsUserEligibleForUnifiedPurchaseFlow
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local PassFooterModule = require(Modules.LuaApp.Components.Passes.PassFooter)
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local FFlagEnableUnifiedPurchasePromptForEDPGamepassModule = require(Modules.LuaApp.Flags.FFlagEnableUnifiedPurchasePromptForEDPGamepass)
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local PassTile = RoactModule.PureComponent:extend("PassTile")
local FFlagAddUnifiedPurchaseFlowTTIToEDP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddUnifiedPurchaseFlowTTIToEDP
local FFlagUnifiedPurchasePassInProductInfoEDP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchasePassInProductInfoEDP
local FFlagUnifiedPurchaseAddSkeleton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagUnifiedPurchaseAddSkeleton1 = game:DefineFastFlag("UnifiedPurchaseAddSkeletonLoadingForEDPGamepass", false) and FFlagUnifiedPurchaseAddSkeleton
local FFlagIntegrateDiscountsWithEDP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP
local ShipUnifiedPurchaseFlowToGamepassEDP = game:DefineFastFlag("ShipUnifiedPurchaseFlowToGamepassEDP", false)
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local GetSubscriptionPurchaseCloseCallbackFunction = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback
PassTile.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	pass = TModule.table,
	passThumbnail = TModule.string,
	locationType = if GetFFlagEnableEdpStoreClickLoggingModule() then TModule.optional(TModule.string) else nil,
	gridPositionRow = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then TModule.optional(TModule.number) else nil,
	gridPositionColumn = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then TModule.optional(TModule.number) else nil,
	networking = if FFlagEnableUnifiedPurchasePromptForEDPGamepassModule then TModule.optional(TModule.callback) else nil,
	userRobux = TModule.optional(TModule.number),
	requestPurchasePass = TModule.optional(TModule.callback),
	requestPurchasePassWithUnifiedPurchasePrompt = TModule.optional(TModule.callback),
	navigateDown = TModule.optional(TModule.callback),
	closeCentralOverlay = TModule.optional(TModule.callback),
	apiFetchGamePasses = TModule.optional(TModule.callback),
	fetchExperienceStoreProducts = TModule.optional(TModule.callback)
})

function PassTile.init(p1)
	-- upvalues: FFlagEnableEdpStoreUnifiedLoggingModule (copy), RoactModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), DataHydrationModule (copy), PromiseModule (copy), FFlagIntegrateDiscountsWithEDP (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy), EdpStoreAnalyticsModule (copy), Constants (copy), FFlagEnableUnifiedPurchasePromptForEDPGamepassModule (copy), ShipUnifiedPurchaseFlowToGamepassEDP (copy), FFlagUnifiedPurchasePassInProductInfoEDP (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy), AppPageModule (copy), UrlBuilderModule (copy), TransitionAnimationModule (copy)
	if FFlagEnableEdpStoreUnifiedLoggingModule then
		p1.ref = RoactModule.createRef()
	end
	function p1.promptPurchase(Pass, UniverseId)
		-- upvalues: p1 (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), DataHydrationModule (upval), PromiseModule (upval), FFlagIntegrateDiscountsWithEDP (upval), GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), FFlagEnableUnifiedPurchasePromptForEDPGamepassModule (upval), ShipUnifiedPurchaseFlowToGamepassEDP (upval), FFlagUnifiedPurchasePassInProductInfoEDP (upval), GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval)
		local function onFlowComplete()
			-- upvalues: p1 (upval)
			p1.props.closeCentralOverlay()
		end
		
		local function onPurchaseSuccess()
			-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (upval), DataHydrationModule (upval), UniverseId (copy), p1 (upval)
			if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
				DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(UniverseId)
				
				return
			else
				p1.props.apiFetchGamePasses(p1.props.networking, UniverseId)
			end
		end
		
		local function onRobloxSubscriptionUpsellSuccess()
			-- upvalues: p1 (upval), UniverseId (copy)
			p1.props.fetchExperienceStoreProducts(p1.props.networking, UniverseId)
		end
		
		local function fetchProductInfo()
			-- upvalues: PromiseModule (upval), Pass (copy), p1 (upval), FFlagIntegrateDiscountsWithEDP (upval)
			return PromiseModule.resolve({
				IsForSale = true,
				TargetId = Pass.id,
				Name = Pass.displayName,
				Description = Pass.displayDescription,
				PriceInRobux = Pass.price,
				ImageUrl = p1.props.passThumbnail,
				ProductId = Pass.productId,
				PriceDiscountDetails = if FFlagIntegrateDiscountsWithEDP then Pass.priceDiscountDetails else nil,
				BasePriceInRobux = if FFlagIntegrateDiscountsWithEDP then Pass.userBasePriceInRobux else nil
			})
		end
		
		return function()
			-- upvalues: GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), p1 (upval), Pass (copy), FFlagEnableUnifiedPurchasePromptForEDPGamepassModule (upval), ShipUnifiedPurchaseFlowToGamepassEDP (upval), UniverseId (copy), onFlowComplete (copy), onPurchaseSuccess (copy), FFlagUnifiedPurchasePassInProductInfoEDP (upval), fetchProductInfo (copy), FFlagIntegrateDiscountsWithEDP (upval), onRobloxSubscriptionUpsellSuccess (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval)
			if GetFFlagEnableEdpStoreClickLoggingModule() then
				EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger.logEvent(Constants.StoreEnums.ActionType.PurchaseAttemptClick, Constants.StoreEnums.ProductType.GamePasses, p1.props.locationType, tonumber(p1.props.universeId), tonumber(Pass.id), (tostring(Pass.id)))
			end
			if not Pass.isOwned then
				if not FFlagEnableUnifiedPurchasePromptForEDPGamepassModule then
					p1.props.requestPurchasePass(Pass, UniverseId)
				elseif ShipUnifiedPurchaseFlowToGamepassEDP then
					p1.props.requestPurchasePassWithUnifiedPurchasePrompt(Pass, UniverseId, onFlowComplete, onPurchaseSuccess, if FFlagUnifiedPurchasePassInProductInfoEDP then fetchProductInfo else nil, if FFlagUnifiedPurchasePassInProductInfoEDP then p1.props.userRobux else nil, if FFlagIntegrateDiscountsWithEDP then onRobloxSubscriptionUpsellSuccess else nil)
					
					return
				else
					GetIsUserEligibleForUnifiedPurchaseFlowFunction(p1.props.networking):andThen(function(Result)
						-- upvalues: p1 (upval), Pass (upval), UniverseId (upval), onFlowComplete (upval), onPurchaseSuccess (upval), FFlagUnifiedPurchasePassInProductInfoEDP (upval), fetchProductInfo (upval), FFlagIntegrateDiscountsWithEDP (upval), onRobloxSubscriptionUpsellSuccess (upval)
						if Result then
							p1.props.requestPurchasePassWithUnifiedPurchasePrompt(Pass, UniverseId, onFlowComplete, onPurchaseSuccess, if FFlagUnifiedPurchasePassInProductInfoEDP then fetchProductInfo else nil, if FFlagUnifiedPurchasePassInProductInfoEDP then p1.props.userRobux else nil, if FFlagIntegrateDiscountsWithEDP then onRobloxSubscriptionUpsellSuccess else nil)
							
							return
						else
							p1.props.requestPurchasePass(Pass, UniverseId)
						end
					end):catch(function()
						-- upvalues: p1 (upval), Pass (upval), UniverseId (upval)
						p1.props.requestPurchasePass(Pass, UniverseId)
					end)
					
					return
				end
			end
		end
	end
	
	local SubscriptionPurchaseCloseCallback = if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
	
	function p1.viewPassDetails(Pass)
		-- upvalues: p1 (copy), GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), AppPageModule (upval), UrlBuilderModule (upval), TransitionAnimationModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval), SubscriptionPurchaseCloseCallback (copy)
		return function()
			-- upvalues: p1 (upval), GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), Pass (copy), AppPageModule (upval), UrlBuilderModule (upval), TransitionAnimationModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval), SubscriptionPurchaseCloseCallback (upval)
			if p1.isMounted then
				if GetFFlagEnableEdpStoreClickLoggingModule() then
					EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger.logEvent(Constants.StoreEnums.ActionType.ItemClick, Constants.StoreEnums.ProductType.GamePasses, p1.props.locationType, tonumber(p1.props.universeId), tonumber(Pass.id), (tostring(Pass.id)))
				end
				p1.props.navigateDown({
					name = AppPageModule.GenericWebPage,
					detail = UrlBuilderModule.game.info.pass({ passId = Pass.id }),
					extraProps = {
						title = Pass.displayName,
						transitionAnimation = TransitionAnimationModule.SlideInFromRight,
						passOwned = Pass.isOwned,
						onClose = if FFlagEnableBlackbirdPageCloseCallback then SubscriptionPurchaseCloseCallback else nil
					}
				})
			end
		end
	end
end

function PassTile.render(p1)
	-- upvalues: RoactModule (copy), ItemTile (copy), FFlagEnableEdpStoreUnifiedLoggingModule (copy), PassFooterModule (copy)
	local Pass = p1.props.pass
	
	return RoactModule.createElement(ItemTile, {
		[RoactModule.Ref] = if FFlagEnableEdpStoreUnifiedLoggingModule then p1.ref else nil,
		name = Pass.displayName,
		titleTextLineCount = 1,
		thumbnail = p1.props.passThumbnail,
		onActivated = p1.viewPassDetails(Pass),
		footer = RoactModule.createElement(PassFooterModule, {
			price = Pass.price,
			userOwnsPass = Pass.isOwned,
			onActivated = p1.promptPurchase(Pass, p1.props.universeId)
		})
	})
end

function PassTile.didMount(p1)
	-- upvalues: FFlagEnableEdpStoreUnifiedLoggingModule (copy), UnifiedEventLogEnums (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), AddUnifiedEventLoggingFunction (copy), SessionService (copy)
	p1.isMounted = true
	
	if FFlagEnableEdpStoreUnifiedLoggingModule then
		task.delay(0, function()
			-- upvalues: p1 (copy), UnifiedEventLogEnums (upval), GetFFlagEnableEdpStoreGridPositionLoggingModule (upval), AddUnifiedEventLoggingFunction (upval), SessionService (upval)
			local config = {
				universeId = tonumber(p1.props.universeId),
				itemId = p1.props.pass.id,
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.GAME_PASS
			}
			
			if GetFFlagEnableEdpStoreGridPositionLoggingModule() then
				config.gridPositionRow = p1.props.gridPositionRow
				config.gridPositionColumn = p1.props.gridPositionColumn
			end
			AddUnifiedEventLoggingFunction(p1.ref, config, { sessionTagName = SessionService:GetSessionTag("level2a") })
		end)
	end
end

function PassTile.willUnmount(p1)
	p1.isMounted = false
end

local v1 = RoactRoduxModule.connect(if FFlagUnifiedPurchasePassInProductInfoEDP then function(p1, _)
	return { userRobux = p1.UserRobux[p1.LocalUserId] }
end else nil, function(Callback)
	-- upvalues: FFlagAddUnifiedPurchaseFlowTTIToEDP (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), OpenCentralOverlayForPurchasePassModule (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), FFlagIntegrateDiscountsWithEDP (copy), FFlagUnifiedPurchasePassInProductInfoEDP (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), FFlagUnifiedPurchaseAddSkeleton1 (copy), CorePackages (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), ApiFetchGamePassesModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), FetchExperienceStoreProductsModule (copy)
	return {
		requestPurchasePass = function(p1, p2)
			-- upvalues: FFlagAddUnifiedPurchaseFlowTTIToEDP (upval), GetTTIEventNameFunction (upval), ProductPurchaseSurface (upval), TimeToInteractiveTracker (upval), Callback (copy), OpenCentralOverlayForPurchasePassModule (upval)
			if FFlagAddUnifiedPurchaseFlowTTIToEDP then
				local TTIEventName = GetTTIEventNameFunction(ProductPurchaseSurface.EDP)
				TimeToInteractiveTracker.trackStart(TTIEventName)
				TimeToInteractiveTracker.updateMetadata(TTIEventName, {
					category = "legacy_purchase_modal",
					page = ProductPurchaseSurface.EDP
				})
			end
			return Callback(OpenCentralOverlayForPurchasePassModule(p1, p2))
		end,
		requestPurchasePassWithUnifiedPurchasePrompt = function(p1, p2, OnFlowComplete, OnPurchaseSuccess, p3, ProvidedRobuxBalance, p4)
			-- upvalues: Callback (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), FFlagIntegrateDiscountsWithEDP (upval), FFlagUnifiedPurchasePassInProductInfoEDP (upval), ProductPurchaseSurface (upval), FFlagUnifiedPurchaseGamepassAddProductUniverseId (upval), FFlagUnifiedPurchaseAddSkeleton1 (upval), FFlagAddUnifiedPurchaseFlowTTIToEDP (upval)
			return Callback(OpenCentralOverlayForUnifiedPurchasePromptModule({
				productPayload = { kind = "Gamepass", id = p1.id },
				purchaseCallbacks = {
					onFlowComplete = OnFlowComplete,
					onPurchaseSuccess = OnPurchaseSuccess,
					onRobloxSubscriptionUpsellSuccess = if FFlagIntegrateDiscountsWithEDP then p4 else nil,
					fetchProductInfo = if FFlagUnifiedPurchasePassInProductInfoEDP then p3 else nil
				},
				purchaseAnalyticsMetadata = {
					surface = ProductPurchaseSurface.EDP,
					productUniverseId = if FFlagUnifiedPurchaseGamepassAddProductUniverseId then p2 else nil
				},
				purchaseOptions = if FFlagUnifiedPurchasePassInProductInfoEDP then {
					shouldSkipOwnershipCheck = not p1.isOwned,
					providedRobuxBalance = ProvidedRobuxBalance,
					enablePreloadedPurchaseUI = if FFlagUnifiedPurchaseAddSkeleton1 then true else nil
				} else nil
			}, if FFlagAddUnifiedPurchaseFlowTTIToEDP then true else nil))
		end,
		closeCentralOverlay = function()
			-- upvalues: CorePackages (upval), Callback (copy)
			return Callback(require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay())
		end,
		apiFetchGamePasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGamePassesModule (upval)
			return Callback(ApiFetchGamePassesModule(p1, p2))
		end,
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownModule(p1))
		end,
		fetchExperienceStoreProducts = if FFlagIntegrateDiscountsWithEDP then function(p1, p2)
			-- upvalues: Callback (copy), FetchExperienceStoreProductsModule (upval)
			return Callback(FetchExperienceStoreProductsModule(p1, p2))
		end else nil
	}
end)(PassTile)

if FFlagEnableUnifiedPurchasePromptForEDPGamepassModule then
	v1 = RoactServices.connect({ networking = RoactNetworkingModule })(v1)
end
return v1