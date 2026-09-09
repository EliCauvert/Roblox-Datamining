local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local PYMKCarouselModule = require(parent.PYMKCarousel)
local friendRecommendations = require(parent.HomeStore).FriendRecommendations
local appPage = require(parent.RobloxAppEnums).AppPage
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local pymkNavigationBridgeModule = require(socialServerDrivenUi.System.PymkNavigationBridge)
local normalizeDirectRecommendationsModule = require(socialServerDrivenUi.Common.normalizeDirectRecommendations)
local fFlagCreateConnectionsHub = sharedFlagsModule.FFlagCreateConnectionsHub
local t = {}

local function readRecommendationHydration(p1, p2, p3)
	local t = {}
	
	for i, v in p1 do
		local var1 = p2.getFriendRecommendation(v.id).data(p3)
		
		if var1 then
			t[v.id] = var1
		end
	end
	return t
end

return function(p4)
	-- upvalues: t (ref), sduiCoreSystemModule (ref), friendRecommendations (ref), reactModule (ref), signalsModule (ref), normalizeDirectRecommendationsModule (ref), readRecommendationHydration (ref), signalsReactModule (ref), pymkNavigationBridgeModule (ref), setCurrentToastMessage (ref), fFlagCreateConnectionsHub (ref), appPage (ref), PYMKCarouselModule (ref)
	local items = p4.items or t
	local dependencies = p4.sduiContext.dependencies
	local collectionPosition = tonumber(sduiCoreSystemModule.findAnalyticsField("collectionPosition", p4.analyticsContext.analyticsData or {}, -1)) or -1
	local startRow = p4.startRow or -1
	local store = friendRecommendations.getStore()
	
	return reactModule.createElement(PYMKCarouselModule.PYMKCarouselEntryPoint, {
		key = p4.recommendationRequestId,
		carouselTitle = p4.title or "",
		recommendations = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), normalizeDirectRecommendationsModule (copy), items (ref), readRecommendationHydration (copy), store (ref)
			return signalsModule.createComputed(function(p5)
				-- upvalues: normalizeDirectRecommendationsModule (copy), items (copy), readRecommendationHydration (copy), store (copy)
				return normalizeDirectRecommendationsModule(items, readRecommendationHydration(items, store, p5))
			end)
		end, { items, store })),
		recommendationSessionId = p4.recommendationRequestId,
		openProfilePeekView = reactModule.useCallback(function(p5, p6)
			-- upvalues: pymkNavigationBridgeModule (copy)
			pymkNavigationBridgeModule.requestOpenProfile(p5, p6)
		end, {}),
		showToast = reactModule.useCallback(function(p5)
			-- upvalues: dependencies (ref), setCurrentToastMessage (copy)
			dependencies.dispatch(setCurrentToastMessage({ toastMessage = p5 }))
		end, { dependencies.dispatch }),
		goToAddFriendsPage = reactModule.useCallback(function(_)
			-- upvalues: fFlagCreateConnectionsHub (copy), dependencies (ref), appPage (copy), pymkNavigationBridgeModule (copy)
			if fFlagCreateConnectionsHub then
				dependencies.getNavigation().navigate(appPage.CoHubAddConnections)
				
				return
			end
			pymkNavigationBridgeModule.requestOpenAddFriends()
		end, { dependencies.getNavigation }),
		pageContext = p4.sduiContext.appPage,
		scrollViewPositionChangedSignal = p4.scrollViewPositionChangedSignal,
		sortAnalyticsData = reactModule.useMemo(function()
			-- upvalues: collectionPosition (ref), p4 (ref), startRow (ref)
			return {
				sortIndex = collectionPosition,
				appPage = p4.sduiContext.appPage,
				sortId = p4.sortId,
				startRow = startRow
			}
		end, {
			collectionPosition,
			p4.sduiContext.appPage,
			p4.sortId,
			startRow
		}),
		diagService = dependencies.appAnalytics.Diag,
		eventIngestService = dependencies.eventIngest,
		appCompositionEnabled = p4.sduiContext.appCompositionEnabled
	})
end