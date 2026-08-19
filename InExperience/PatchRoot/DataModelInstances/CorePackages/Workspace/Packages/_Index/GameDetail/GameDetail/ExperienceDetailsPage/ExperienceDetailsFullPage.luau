local gameDetail = script:FindFirstAncestor("GameDetail")
local parent = gameDetail.Parent
local guiService = game:GetService("GuiService")
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
local isTenFoot = experienceDetailsPageScopeFieldsModule.IsTenFoot
local compositionTags = require(parent.AppComposition).CompositionTags
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiPageEntryUseSharedHooks = sharedFlagsModule.FFlagSduiPageEntryUseSharedHooks
local fFlagSduiPlayWithRewardGapFix = sharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local fFlagLuaAppSduiEdpRouteAwareSessionRemoval = sharedFlagsModule.FFlagLuaAppSduiEdpRouteAwareSessionRemoval
local sduiEdpPageScopeIsTenFoot = game:DefineFastFlag("SduiEdpPageScopeIsTenFoot", false)
local edpFullBleedOverlapOffset = game:DefineFastInt("EdpFullBleedOverlapOffset", 180)
local edpBannerBottomVisiblePercent = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20)
local t = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return reactModule.memo(function(p0) --[[ line: 70 | named "ExperienceDetailsFullPage" ]]
	-- upvalues: gameDetail (ref), experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), reactModule (ref), usePageScopeRef (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useTokens (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), fFlagSduiPlayWithRewardGapFix (ref), filterPlayWithReward (ref), sduiEdpPageScopeIsTenFoot (ref), isTenFoot (ref), guiService (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), responsiveModule (ref), detailsPageLayout (ref), t (ref), edpFullBleedOverlapOffset (ref), edpBannerBottomVisiblePercent (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackBannerImageModule (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), fFlagSduiExperienceDetailsSupport (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref)
	local useExperienceDetailsFocusNavigationModule = require(gameDetail.FocusNavigation.useExperienceDetailsFocusNavigation)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p0)
	local var23 = getExperienceDetailsPageKeyModule(universeId)
	local var24 = reactModule.useRef(nil)
	usePageScopeRef(var23)
	local var25 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: experienceDetailsPageUtilsModule (copy), p0 (ref), sduiSurfaceLoadTimeTracker (copy), var23 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var36 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var23, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
			}
		})
		getSduiClientPageScope(var23).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var36)
		
		return var36
	end, {})
	useEdpFunctionallyReadyLoggerModule(var25, universeId)
	local var26 = useNavigation()
	local var27 = useRoactService(appSessionService)
	local var28 = useTokens()
	local var29 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then useGetCurrentLegacyRoute() else nil
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p0, "placeIdOverride")
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: getSduiClientPageScope (copy), var23 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref), fFlagSduiPlayWithRewardGapFix (copy), filterPlayWithReward (copy), sduiEdpPageScopeIsTenFoot (copy), isTenFoot (copy), guiService (copy)
		local var37 = getSduiClientPageScope(var23)
		var37.set("referralSource", referralSource)
		var37.set("experienceJoinData", experienceJoinData)
		var37.set("placeId", placeIdOverride)
		var37.set("launchSource", "ExperienceDetailsPage")
		
		if fFlagSduiPlayWithRewardGapFix then
			var37.set(filterPlayWithReward, nil)
		end
		if sduiEdpPageScopeIsTenFoot then
			var37.set(isTenFoot, guiService:IsTenFootInterface())
		end
	end, {
		var23,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var33 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var29 (write), var26 (ref), removeGameDetailSessionIfDepartedModule (copy), var27 (ref), sessionType (copy)
		local var38 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var29() else nil
		var26.goBack()
		
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
			removeGameDetailSessionIfDepartedModule(var27, var38)
			
			return
		elseif var27 then
			var27:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		var26,
		var27,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var29 else nil
	})
	reactModule.useEffect(function() --[[ line: 138 ]]
		-- upvalues: universeId (ref), var25 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var25 then
			fetchExperienceDetailsPageModule(universeId, var25)
		end
	end, { universeId, var25 })
	local var34 = useUiStatus(var23)
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var34 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var34 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p1) --[[ line: 149 ]]
				return if p1 ~= nil then p1.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var34, universeId })
	local var35 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	
	return if universeId == nil then nil else reactModule.createElement(detailsPageLayout.Root, {
		ref = useExperienceDetailsFocusNavigationModule(var33),
		onClose = if var35 then nil else var33,
		selectionGroup = t,
		fullBleedOverlapOffset = edpFullBleedOverlapOffset,
		bannerBottomVisiblePercent = edpBannerBottomVisiblePercent / 100,
		fullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = appPage.ExperienceDetail,
			configKey = var23,
			identifier = experienceDetailsPageConstantsModule.EDP_BANNER_IMAGE_IDENTIFIER,
			loadTimer = var25,
			Size = UDim2.fromScale(1, 1),
			loadingSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Skeleton),
			errorSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Error, { universeId = universeId })
		})
	}, {
		Header = if var35 then nil else reactModule.createElement(detailsPageLayout.Header, {
			fullWidthContent = true,
			closeIconName = foundationModule.Enums.IconName.X,
			backgroundColor = var28.Color.Surface.Surface_300
		}, {
			StickyHeaderContent = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				appPage = appPage.ExperienceDetail,
				configKey = var23,
				identifier = experienceDetailsPageConstantsModule.EDP_STICKY_HEADER_IDENTIFIER,
				loadTimer = var25,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = reactModule.createElement(detailsPageLayout.Content, { scrollingFrameRef = var24 }, {
			Feed = reactModule.createElement(sduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = appPage.ExperienceDetail,
				configKey = var23,
				identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var23, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = var25,
				scrollingFrameRef = var24,
				backgroundStyle = var28.Color.None,
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
					refresh = reactModule.useCallback(function() --[[ line: 156 ]]
						-- upvalues: universeId (ref), var25 (ref), fetchExperienceDetailsPageModule (copy)
						if universeId and var25 then
							fetchExperienceDetailsPageModule(universeId, var25, true)
						end
					end, { universeId, var25 }),
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				})
			})
		})
	})
end)