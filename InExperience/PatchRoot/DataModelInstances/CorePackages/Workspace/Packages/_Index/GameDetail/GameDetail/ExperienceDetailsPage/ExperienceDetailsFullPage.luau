local gameDetail = script:FindFirstAncestor("GameDetail")
local parent = gameDetail.Parent
local experienceDetailsPageUtilsModule = require(script.Parent.ExperienceDetailsPageUtils)
local experienceDetailsPageConstantsModule = require(script.Parent.ExperienceDetailsPageConstants)
local experienceDetailsPageScopeFieldsModule = require(script.Parent.ExperienceDetailsPageScopeFields)
local fetchExperienceDetailsPageModule = require(script.Parent.fetchExperienceDetailsPage)
local getExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local removeGameDetailSessionIfDepartedModule = require(script.Parent.removeGameDetailSessionIfDeparted)
local useEdpFunctionallyReadyLoggerModule = require(script.Parent.useEdpFunctionallyReadyLogger)
local experienceDetailsFallbackBannerImageModule = require(script.Parent.Fallback.ExperienceDetailsFallbackBannerImage)
local experienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local sessionType = require(parent.RobloxAppSessionization).SessionType
local detailsPageLayout = require(parent.AppBlox).DetailsPageLayout
local appPage = require(parent.RobloxAppEnums).AppPage
local dataHydrationModule = require(parent.DataHydration)
local responsiveModule = require(parent.Responsive)
local useGetCurrentLegacyRoute = require(parent.DiscoveryRouting).useGetCurrentLegacyRoute
local EDPTTIConstants = require(parent.GameDetailTelemetry).EDPTTIConstants
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local uiStatus = sduiSharedUtilitiesModule.UiStatus
local useUiStatus = sduiSharedUtilitiesModule.useUiStatus
local filterPlayWithReward = experienceDetailsPageScopeFieldsModule.FilterPlayWithReward
local compositionTags = require(parent.AppComposition).CompositionTags
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiPageEntryUseSharedHooks = sharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local fFlagSduiPlayWithRewardGapFix = sharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local fFlagLuaAppSduiEdpRouteAwareSessionRemoval = sharedFlagsModule.FFlagLuaAppSduiEdpRouteAwareSessionRemoval
local edpFullBleedOverlapOffset = game:DefineFastInt("EdpFullBleedOverlapOffset", 180)
local edpBannerBottomVisiblePercent = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20)
local t = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return reactModule.memo(function(p0) --[[ line: 66 | named "ExperienceDetailsFullPage" ]]
	-- upvalues: gameDetail (ref), experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), reactModule (ref), usePageScopeRef (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useTokens (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), fFlagSduiPlayWithRewardGapFix (ref), filterPlayWithReward (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), responsiveModule (ref), detailsPageLayout (ref), t (ref), edpFullBleedOverlapOffset (ref), edpBannerBottomVisiblePercent (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackBannerImageModule (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), fFlagSduiExperienceDetailsSupport (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref)
	local useExperienceDetailsFocusNavigationModule = require(gameDetail.FocusNavigation.useExperienceDetailsFocusNavigation)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p0)
	local var21 = getExperienceDetailsPageKeyModule(universeId)
	local var22 = reactModule.useRef(nil)
	usePageScopeRef(var21)
	local var23 = reactModule.useMemo(function() --[[ line: 74 ]]
		-- upvalues: experienceDetailsPageUtilsModule (copy), p0 (ref), sduiSurfaceLoadTimeTracker (copy), var21 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var34 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var21, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
			}
		})
		getSduiClientPageScope(var21).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var34)
		
		return var34
	end, {})
	useEdpFunctionallyReadyLoggerModule(var23, universeId)
	local var24 = useNavigation()
	local var25 = useRoactService(appSessionService)
	local var26 = useTokens()
	local var27 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then useGetCurrentLegacyRoute() else nil
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "placeIdOverride")
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: getSduiClientPageScope (copy), var21 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref), fFlagSduiPlayWithRewardGapFix (copy), filterPlayWithReward (copy)
		local var35 = getSduiClientPageScope(var21)
		var35.set("referralSource", referralSource)
		var35.set("experienceJoinData", experienceJoinData)
		var35.set("placeId", placeIdOverride)
		var35.set("launchSource", "ExperienceDetailsPage")
		
		if fFlagSduiPlayWithRewardGapFix then
			var35.set(filterPlayWithReward, nil)
		end
	end, {
		var21,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var31 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var27 (write), var24 (ref), removeGameDetailSessionIfDepartedModule (copy), var25 (ref), sessionType (copy)
		local var36 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var27() else nil
		var24.goBack()
		
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
			removeGameDetailSessionIfDepartedModule(var25, var36)
			
			return
		elseif var25 then
			var25:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		var24,
		var25,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var27 else nil
	})
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: universeId (ref), var23 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var23 then
			fetchExperienceDetailsPageModule(universeId, var23)
		end
	end, { universeId, var23 })
	local var32 = useUiStatus(var21)
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: var32 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var32 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p1) --[[ line: 142 ]]
				return if p1 ~= nil then p1.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var32, universeId })
	local var33 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	
	return if universeId == nil then nil else reactModule.createElement(detailsPageLayout.Root, {
		ref = useExperienceDetailsFocusNavigationModule(var31),
		onClose = if var33 then nil else var31,
		selectionGroup = t,
		fullBleedOverlapOffset = edpFullBleedOverlapOffset,
		bannerBottomVisiblePercent = edpBannerBottomVisiblePercent / 100,
		fullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = appPage.ExperienceDetail,
			configKey = var21,
			identifier = experienceDetailsPageConstantsModule.EDP_BANNER_IMAGE_IDENTIFIER,
			loadTimer = var23,
			Size = UDim2.fromScale(1, 1),
			loadingSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Skeleton),
			errorSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Error, { universeId = universeId })
		})
	}, {
		Header = if var33 then nil else reactModule.createElement(detailsPageLayout.Header, {
			fullWidthContent = true,
			closeIconName = foundationModule.Enums.IconName.X,
			backgroundColor = var26.Color.Surface.Surface_300
		}, {
			StickyHeaderContent = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				appPage = appPage.ExperienceDetail,
				configKey = var21,
				identifier = experienceDetailsPageConstantsModule.EDP_STICKY_HEADER_IDENTIFIER,
				loadTimer = var23,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = reactModule.createElement(detailsPageLayout.Content, { scrollingFrameRef = var22 }, {
			Feed = reactModule.createElement(sduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = appPage.ExperienceDetail,
				configKey = var21,
				identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var21, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = var23,
				scrollingFrameRef = var22,
				backgroundStyle = var26.Color.None,
				disableRootPadding = if fFlagSduiExperienceDetailsSupport then true else nil,
				clipsDescendantsOverride = if fFlagSduiExperienceDetailsSupport then false else nil,
				contentTag = compositionTags.ContentRegion.Body,
				loadingSlot = reactModule.createElement(experienceDetailsFallbackFeedModule.Skeleton, {
					launchSource = "ExperienceDetailsPage",
					isSmallScreen = false,
					universeId = universeId,
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				}),
				errorSlot = reactModule.createElement(experienceDetailsFallbackFeedModule.Error, {
					launchSource = "ExperienceDetailsPage",
					isSmallScreen = false,
					universeId = universeId,
					refresh = reactModule.useCallback(function() --[[ line: 149 ]]
						-- upvalues: universeId (ref), var23 (ref), fetchExperienceDetailsPageModule (copy)
						if universeId and var23 then
							fetchExperienceDetailsPageModule(universeId, var23, true)
						end
					end, { universeId, var23 }),
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				})
			})
		})
	})
end)