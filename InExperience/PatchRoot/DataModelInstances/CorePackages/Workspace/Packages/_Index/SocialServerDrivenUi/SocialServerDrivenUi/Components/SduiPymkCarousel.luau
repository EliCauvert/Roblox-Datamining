local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local PYMKCarouselModule = require(Parent.PYMKCarousel)
local FriendRecommendations = require(Parent.HomeStore).FriendRecommendations
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local PymkNavigationBridgeModule = require(SocialServerDrivenUi.System.PymkNavigationBridge)
local NormalizeDirectRecommendationsModule = require(SocialServerDrivenUi.Common.normalizeDirectRecommendations)
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local t = {}

local function readRecommendationHydration(Items, Store, p1)
	local DataResults = {}
	
	for _, item in Items do
		local DataResult = Store.getFriendRecommendation(item.id).data(p1)
		
		if DataResult then
			DataResults[item.id] = DataResult
		end
	end
	return DataResults
end

return function(p2)
	-- upvalues: t (copy), SduiCoreSystemModule (copy), FriendRecommendations (copy), ReactModule (copy), SignalsModule (copy), NormalizeDirectRecommendationsModule (copy), readRecommendationHydration (copy), SignalsReactModule (copy), PymkNavigationBridgeModule (copy), SetCurrentToastMessageFunction (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), PYMKCarouselModule (copy)
	local Items = p2.items or t
	local Dependencies = p2.sduiContext.dependencies
	local Number: number = tonumber(SduiCoreSystemModule.findAnalyticsField("collectionPosition", p2.analyticsContext.analyticsData or {}, -1)) or -1
	local StartRow = p2.startRow or -1
	local Store = FriendRecommendations.getStore()
	
	return ReactModule.createElement(PYMKCarouselModule.PYMKCarouselEntryPoint, {
		key = p2.recommendationRequestId,
		carouselTitle = p2.title or "",
		recommendations = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), NormalizeDirectRecommendationsModule (upval), Items (copy), readRecommendationHydration (upval), Store (copy)
			return SignalsModule.createComputed(function(p3)
				-- upvalues: NormalizeDirectRecommendationsModule (upval), Items (upval), readRecommendationHydration (upval), Store (upval)
				return NormalizeDirectRecommendationsModule(Items, (readRecommendationHydration(Items, Store, p3)))
			end)
		end, { Items, Store }))),
		recommendationSessionId = p2.recommendationRequestId,
		openProfilePeekView = ReactModule.useCallback(function(p3, p4)
			-- upvalues: PymkNavigationBridgeModule (upval)
			PymkNavigationBridgeModule.requestOpenProfile(p3, p4)
		end, {}),
		showToast = ReactModule.useCallback(function(ToastMessage)
			-- upvalues: Dependencies (copy), SetCurrentToastMessageFunction (upval)
			Dependencies.dispatch(SetCurrentToastMessageFunction({ toastMessage = ToastMessage }))
		end, { Dependencies.dispatch }),
		goToAddFriendsPage = ReactModule.useCallback(function(_)
			-- upvalues: FFlagCreateConnectionsHub (upval), Dependencies (copy), AppPage (upval), PymkNavigationBridgeModule (upval)
			if FFlagCreateConnectionsHub then
				Dependencies.getNavigation().navigate(AppPage.CoHubAddConnections)
				
				return
			else
				PymkNavigationBridgeModule.requestOpenAddFriends()
			end
		end, { Dependencies.getNavigation }),
		pageContext = p2.sduiContext.appPage,
		scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
		sortAnalyticsData = ReactModule.useMemo(function()
			-- upvalues: Number (copy), p2 (copy), StartRow (copy)
			return {
				sortIndex = Number,
				appPage = p2.sduiContext.appPage,
				sortId = p2.sortId,
				startRow = StartRow
			}
		end, { Number, p2.sduiContext.appPage, p2.sortId, StartRow }),
		diagService = Dependencies.appAnalytics.Diag,
		eventIngestService = Dependencies.eventIngest,
		appCompositionEnabled = p2.sduiContext.appCompositionEnabled
	})
end