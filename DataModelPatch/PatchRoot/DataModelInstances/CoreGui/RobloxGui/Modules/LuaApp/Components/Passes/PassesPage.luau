local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ApiFetchGamePassesModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local CryoModule = require(CorePackages.Packages.Cryo)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local EdpStoreImpressionsDetector = EdpStoreAnalyticsModule.EdpStoreImpressionsDetector
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local AppCommonLibModule = require(CorePackages.Workspace.Packages.AppCommonLib)
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local FFlagLuaAppPassesPageFallbackViewWidthModule = require(Modules.LuaApp.Flags.FFlagLuaAppPassesPageFallbackViewWidth)
local GetFallbackViewWidthModule = require(Modules.LuaApp.Components.Passes.getFallbackViewWidth)
local ApiFetchPassesThumbnailsModule = require(Modules.LuaApp.Thunks.ApiFetchPassesThumbnails)
local ApiFetchGameDeveloperProductsModule = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts)
local ApiFetchGameSubscriptionProductsModule = require(Modules.LuaApp.Thunks.Subscription.ApiFetchGameSubscriptionProducts)
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local DataStatus = DataHydrationModule.DataStatus
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local PassesGridModule = require(Modules.LuaApp.Components.Passes.PassesGrid)
local SubscriptionsGridModule = require(Modules.LuaApp.Components.Subscription.SubscriptionsGrid)
local DeveloperProductsGridModule = require(Modules.LuaApp.Components.DeveloperProduct.DeveloperProductsGrid)
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local GetFFlagEnableDevSubsInRobuxModule = require(Modules.LuaApp.Flags.GetFFlagEnableDevSubsInRobux)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppGamePassesDataHydrationMigrationEnabled = SharedFlagsModule.FFlagLuaAppGamePassesDataHydrationMigrationEnabled
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local FFlagLuaAppFixPassesPageStoreFetch = SharedFlagsModule.FFlagLuaAppFixPassesPageStoreFetch
local UseGamePassesModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useGamePasses)
local PassesPage = RoactModule.PureComponent:extend("PassesPage")
PassesPage.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	viewWidth = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then TModule.optional(TModule.number) else nil,
	networking = TModule.callback,
	passes = TModule.optional(TModule.table),
	showSubscriptionProducts = TModule.optional(TModule.boolean),
	subscriptionProducts = if FFlagLuaAppFixPassesPageStoreFetch then TModule.optional(TModule.table) else nil,
	developerProducts = TModule.optional(TModule.table),
	rootPlaceId = TModule.optional(TModule.string),
	localUserId = TModule.optional(TModule.string),
	creatorName = TModule.optional(TModule.string),
	creatorVerified = TModule.optional(TModule.boolean),
	topBarHeight = if FFlagAppIaScrollAway then TModule.number else nil,
	requestPassesThumbnails = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else TModule.callback,
	fetchGamePasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else TModule.callback,
	fetchGameSubscriptionProducts = if FFlagLuaAppFixPassesPageStoreFetch then TModule.callback else nil,
	fetchGameDeveloperProducts = TModule.callback,
	textSizeOffset = TModule.number
})

function PassesPage.init(p1)
	-- upvalues: RoactModule (copy), AppCommonLibModule (copy)
	p1.gamePassRef = RoactModule.createRef()
	p1.developerProductsRef = RoactModule.createRef()
	p1.subscriptionsRef = RoactModule.createRef()
	p1.storeContainerRef = RoactModule.createRef()
	p1.scrollViewPositionChangedSignal = RoactModule.createRef()
	p1.scrollViewPositionChangedSignal.current = AppCommonLibModule.Signal.new()
	
	function p1:scrollViewPositionChangedSignalCallback()
		-- upvalues: p1 (copy)
		p1.scrollViewPositionChangedSignal.current:fire()
	end
	
	function p1.fetchPassesThumbnails(Passes, Networking)
		-- upvalues: p1 (copy)
		if Passes then
			local Ids = {}
			
			for _, pass in ipairs(Passes) do
				table.insert(Ids, pass.id)
			end
			p1.props.requestPassesThumbnails(Networking, Ids)
		end
	end
	
	function p1.fetchGameDeveloperProducts(p2, p3, p4, p5)
		-- upvalues: p1 (copy)
		p1.props.fetchGameDeveloperProducts(p2, p3, p4, p5)
	end
end

function PassesPage.render(p2)
	-- upvalues: ImpressionsTagUtility (copy), Constants (copy), RoactModule (copy), EdpStoreImpressionsDetector (copy), WithStyleFunction (copy), TopBarModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), WithLocalizationModule (copy), SubscriptionsGridModule (copy), GetFFlagEnableDevSubsInRobuxModule (copy), PassesGridModule (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), DeveloperProductsGridModule (copy)
	local UniverseId = p2.props.universeId
	local Passes = p2.props.passes
	local v1: boolean = Passes and #Passes > 0
	local ShowSubscriptionProducts = p2.props.showSubscriptionProducts
	local DeveloperProducts = p2.props.developerProducts
	local v2: boolean = DeveloperProducts and #DeveloperProducts > 0
	local Element = nil
	local Element1 = nil
	local Element2 = nil
	local v3 = nil
	local v4 = nil
	local v5 = nil
	local v6 = nil
	
	v3 = function(Current)
		-- upvalues: p2 (copy)
		p2.storeContainerRef.current = Current
	end
	
	v4 = function(Current)
		-- upvalues: p2 (copy), ImpressionsTagUtility (upval), Constants (upval)
		p2.gamePassRef.current = Current
		ImpressionsTagUtility.AddTag(p2.gamePassRef, Constants.ImpressionsTags.GamePasses, 1)
	end
	
	v5 = function(Current)
		-- upvalues: p2 (copy), ImpressionsTagUtility (upval), Constants (upval)
		p2.developerProductsRef.current = Current
		ImpressionsTagUtility.AddTag(p2.developerProductsRef, Constants.ImpressionsTags.DeveloperProducts, 1)
	end
	
	v6 = function(Current)
		-- upvalues: p2 (copy), ImpressionsTagUtility (upval), Constants (upval)
		p2.subscriptionsRef.current = Current
		ImpressionsTagUtility.AddTag(p2.subscriptionsRef, Constants.ImpressionsTags.Subscriptions, 1)
	end
	
	Element = RoactModule.createElement(EdpStoreImpressionsDetector, {
		parentRef = p2.storeContainerRef,
		scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
		impressionsTag = Constants.ImpressionsTags.GamePasses,
		parameters = {
			universeId = p2.props.universeId,
			productType = Constants.StoreEnums.ProductType.GamePasses,
			locationType = Constants.StoreEnums.LocationType.Store
		}
	})
	Element1 = RoactModule.createElement(EdpStoreImpressionsDetector, {
		parentRef = p2.storeContainerRef,
		scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
		impressionsTag = Constants.ImpressionsTags.DeveloperProducts,
		parameters = {
			universeId = p2.props.universeId,
			productType = Constants.StoreEnums.ProductType.DeveloperProducts,
			locationType = Constants.StoreEnums.LocationType.Store
		}
	})
	Element2 = RoactModule.createElement(EdpStoreImpressionsDetector, {
		parentRef = p2.storeContainerRef,
		scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
		impressionsTag = Constants.ImpressionsTags.Subscriptions,
		parameters = {
			universeId = p2.props.universeId,
			productType = Constants.StoreEnums.ProductType.Subscriptions,
			locationType = Constants.StoreEnums.LocationType.Store
		}
	})
	
	return WithStyleFunction(function(p3)
		-- upvalues: RoactModule (upval), TopBarModule (upval), FFlagAppIaScrollAway (upval), AppNavBarModule (upval), p2 (copy), v3 (ref), WithLocalizationModule (upval), Element (ref), Element1 (ref), Element2 (ref), ShowSubscriptionProducts (copy), v6 (ref), SubscriptionsGridModule (upval), UniverseId (copy), GetFFlagEnableDevSubsInRobuxModule (upval), v1 (copy), v4 (ref), PassesGridModule (upval), Passes (copy), GetFFlagEnableEdpStoreClickLoggingModule (upval), Constants (upval), GetFFlagEnableEdpStoreGridPositionLoggingModule (upval), v2 (copy), v5 (ref), DeveloperProductsGridModule (upval), DeveloperProducts (copy)
		return RoactModule.createElement("Frame", {
			Name = "PassesContent",
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p3.Theme.BackgroundDefault.Transparency
		}, {
			TopBar = RoactModule.createElement(TopBarModule.Container, {
				leftItem = TopBarModule.BackButton,
				rightItems = { TopBarModule.BuyRobuxButton }
			}),
			PageContent = RoactModule.createElement(TopBarModule.PageContent, {}, {
				MainPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then 24 + p2.props.topBarHeight else 24),
					PaddingBottom = UDim.new(0, 24),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				PassesArea = RoactModule.createElement("ScrollingFrame", {
					Name = "PassesArea",
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					ClipsDescendants = false,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollBarThickness = 0,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ElasticBehavior = Enum.ElasticBehavior.Always,
					[RoactModule.Ref] = v3
				}, {
					GridLayoutContainer = WithLocalizationModule({
						subscriptions = "Feature.Subscription.Heading.Subscriptions",
						passes = "Feature.GamePass.Heading.PassesForThisGame",
						developerProducts = "Feature.DeveloperProducts.Heading.Products"
					})(function(p4)
						-- upvalues: RoactModule (upval), p2 (upval), Element (upval), Element1 (upval), Element2 (upval), ShowSubscriptionProducts (upval), p3 (copy), v6 (upval), SubscriptionsGridModule (upval), UniverseId (upval), GetFFlagEnableDevSubsInRobuxModule (upval), v1 (upval), v4 (upval), PassesGridModule (upval), Passes (upval), GetFFlagEnableEdpStoreClickLoggingModule (upval), Constants (upval), GetFFlagEnableEdpStoreGridPositionLoggingModule (upval), v2 (upval), v5 (upval), DeveloperProductsGridModule (upval), DeveloperProducts (upval)
						return RoactModule.createElement("Frame", {
							Size = UDim2.new(1, 0, 0, 0),
							BackgroundTransparency = 1,
							[RoactModule.Change.AbsolutePosition] = p2.scrollViewPositionChangedSignalCallback
						}, {
							GamePassesImpressionDetector = Element,
							DeveloperProductsImpressionDetector = Element1,
							SubscriptionsImpressionDetector = Element2,
							UIListLayout = RoactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								FillDirection = Enum.FillDirection.Vertical,
								Padding = UDim.new(0, 24)
							}),
							SubscriptionHeader = if ShowSubscriptionProducts then RoactModule.createElement("TextLabel", {
								Text = p4.subscriptions,
								BackgroundTransparency = 1,
								TextColor3 = p3.Theme.TextDefault.Color,
								TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								Font = p3.Font.Header2.Font,
								LayoutOrder = 0,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Left,
								[RoactModule.Ref] = v6
							}) else nil,
							SubscriptionsGrid = if ShowSubscriptionProducts then RoactModule.createElement(SubscriptionsGridModule, {
								layoutOrder = 1,
								universeId = UniverseId,
								creatorName = if GetFFlagEnableDevSubsInRobuxModule() then p2.props.creatorName else nil,
								creatorVerified = if GetFFlagEnableDevSubsInRobuxModule() then p2.props.creatorVerified else nil
							}) else nil,
							Passes = if v1 then RoactModule.createElement("TextLabel", {
								Text = p4.passes,
								BackgroundTransparency = 1,
								TextColor3 = p3.Theme.TextDefault.Color,
								TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								Font = p3.Font.Header2.Font,
								LayoutOrder = 2,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Left,
								[RoactModule.Ref] = v4
							}) else nil,
							PassesGrid = if v1 then RoactModule.createElement(PassesGridModule, {
								layoutOrder = 3,
								universeId = UniverseId,
								passes = Passes,
								textSizeOffset = p2.props.textSizeOffset,
								locationType = if GetFFlagEnableEdpStoreClickLoggingModule() then Constants.StoreEnums.LocationType.Store else nil,
								viewWidth = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then p2.props.viewWidth else nil
							}) else nil,
							DeveloperProductHeader = if v2 then RoactModule.createElement("TextLabel", {
								Text = p4.developerProducts,
								BackgroundTransparency = 1,
								TextColor3 = p3.Theme.TextDefault.Color,
								TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								Font = p3.Font.Header2.Font,
								LayoutOrder = 4,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Left,
								[RoactModule.Ref] = v5
							}) else nil,
							DeveloperProductsGrid = if v2 then RoactModule.createElement(DeveloperProductsGridModule, {
								layoutOrder = 5,
								universeId = UniverseId,
								developerProducts = DeveloperProducts,
								locationType = Constants.StoreEnums.LocationType.Store
							}) else nil
						})
					end)
				})
			})
		})
	end)
end

function PassesPage.didMount(p2)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), FFlagLuaAppFixPassesPageStoreFetch (copy), FFlagLuaAppSduiEdpEnabled (copy), DataHydrationModule (copy), DataStatus (copy)
	local Passes = p2.props.passes
	local Networking = p2.props.networking
	local DeveloperProducts = p2.props.developerProducts
	local UniverseId = p2.props.universeId
	local RootPlaceId = p2.props.rootPlaceId
	local LocalUserId = p2.props.localUserId
	
	if not FFlagLuaAppGamePassesDataHydrationMigrationEnabled and Passes ~= nil then
		p2.fetchPassesThumbnails(Passes, Networking)
	end
	if DeveloperProducts ~= nil then
		p2.fetchGameDeveloperProducts(Networking, UniverseId, RootPlaceId, LocalUserId)
	end
	if FFlagLuaAppFixPassesPageStoreFetch and FFlagLuaAppSduiEdpEnabled then
		if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then
			local GamePassStore = DataHydrationModule.Game.getGamePassStore(false)
			local StatusResult = GamePassStore.getPassesForUniverse(UniverseId).status(false)
			
			if StatusResult == DataStatus.NotReady or StatusResult == DataStatus.Failed then
				GamePassStore.fetchPassesForUniverse(UniverseId)
			end
		elseif Passes == nil then
			p2.props.fetchGamePasses(Networking, UniverseId)
		end
		if p2.props.subscriptionProducts == nil then
			p2.props.fetchGameSubscriptionProducts(Networking, UniverseId)
		end
		if DeveloperProducts == nil and RootPlaceId ~= nil and LocalUserId ~= nil then
			p2.fetchGameDeveloperProducts(Networking, UniverseId, RootPlaceId, LocalUserId)
		end
	end
end

function PassesPage.didUpdate(p2, p3, _)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy)
	if not FFlagLuaAppGamePassesDataHydrationMigrationEnabled and p3.passes ~= p2.props.passes then
		p2.fetchPassesThumbnails(p2.props.passes, p2.props.networking)
	end
end

local v1 = RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p2, p3)
	-- upvalues: GetFFlagEnableDevSubsInRobuxModule (copy), VerifiedBadgesModule (copy), FFlagLuaAppPassesPageFallbackViewWidthModule (copy), GetFallbackViewWidthModule (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), FFlagLuaAppFixPassesPageStoreFetch (copy), FFlagAppIaScrollAway (copy)
	local IsCreatorOfGameVerified = GetFFlagEnableDevSubsInRobuxModule() and VerifiedBadgesModule.isCreatorOfGameVerified(p2, {
		shouldUseV2GameDetails = true,
		universeId = p3.universeId
	})
	local FallbackViewWidthModule = if FFlagLuaAppPassesPageFallbackViewWidthModule and (not p3.viewWidth and (p2.ScreenSize and p2.GlobalGuiInset)) then GetFallbackViewWidthModule(p2.ScreenSize, p2.GlobalGuiInset) else nil
	
	return {
		passes = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else p2.GamePasses[tostring(p3.universeId)],
		showSubscriptionProducts = p2.GameSubscriptionProducts[p3.universeId] and #p2.GameSubscriptionProducts[p3.universeId] > 0,
		subscriptionProducts = if FFlagLuaAppFixPassesPageStoreFetch then p2.GameSubscriptionProducts[p3.universeId] else nil,
		developerProducts = p2.GameDeveloperProducts[tostring(p3.universeId)],
		rootPlaceId = if p2.GameDetails and p2.GameDetails[p3.universeId] then p2.GameDetails[p3.universeId].rootPlaceId else nil,
		localUserId = p2.LocalUserId,
		creatorName = if GetFFlagEnableDevSubsInRobuxModule() and p2.GameDetails and p2.GameDetails[p3.universeId] then p2.GameDetails[p3.universeId].creator.name else nil,
		creatorVerified = if GetFFlagEnableDevSubsInRobuxModule() then IsCreatorOfGameVerified else nil,
		topBarHeight = if FFlagAppIaScrollAway then p2.TopBar.topBarHeight else nil,
		viewWidth = if FFlagLuaAppPassesPageFallbackViewWidthModule then p3.viewWidth or FallbackViewWidthModule else nil
	}
end, function(Callback)
	-- upvalues: FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), ApiFetchPassesThumbnailsModule (copy), ApiFetchGamePassesModule (copy), FFlagLuaAppFixPassesPageStoreFetch (copy), ApiFetchGameSubscriptionProductsModule (copy), ApiFetchGameDeveloperProductsModule (copy)
	return {
		requestPassesThumbnails = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else function(p2, p3)
			-- upvalues: Callback (copy), ApiFetchPassesThumbnailsModule (upval)
			return Callback(ApiFetchPassesThumbnailsModule(p2, p3))
		end,
		fetchGamePasses = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then nil else function(p2, p3)
			-- upvalues: Callback (copy), ApiFetchGamePassesModule (upval)
			return Callback(ApiFetchGamePassesModule(p2, p3))
		end,
		fetchGameSubscriptionProducts = if FFlagLuaAppFixPassesPageStoreFetch then function(p2, p3)
			-- upvalues: Callback (copy), ApiFetchGameSubscriptionProductsModule (upval)
			return Callback(ApiFetchGameSubscriptionProductsModule(p2, p3))
		end else nil,
		fetchGameDeveloperProducts = function(p2, p3, p4, p5)
			-- upvalues: Callback (copy), ApiFetchGameDeveloperProductsModule (upval)
			return Callback(ApiFetchGameDeveloperProductsModule(p2, p3, p4, p5))
		end
	}
end)(PassesPage)))

return function(p2)
	-- upvalues: UseTextSizeOffsetFunction (copy), FFlagLuaAppGamePassesDataHydrationMigrationEnabled (copy), UseGamePassesModule (copy), CryoModule (copy), RoactModule (copy), v1 (ref)
	local UseGamePassesModuleResult = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then UseGamePassesModule(p2.universeId) else nil
	
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p2, {
		textSizeOffset = UseTextSizeOffsetFunction(),
		passes = if FFlagLuaAppGamePassesDataHydrationMigrationEnabled then UseGamePassesModuleResult else nil
	})))
end