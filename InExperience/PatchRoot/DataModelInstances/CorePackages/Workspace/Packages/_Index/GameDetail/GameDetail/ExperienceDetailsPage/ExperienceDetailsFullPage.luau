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

return reactModule.memo(function(p1)
	-- upvalues: gameDetail (ref), experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), reactModule (ref), usePageScopeRef (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useTokens (ref), fFlagLuaAppSduiEdpRouteAwareSessionRemoval (ref), useGetCurrentLegacyRoute (ref), fFlagSduiPlayWithRewardGapFix (ref), filterPlayWithReward (ref), sduiEdpPageScopeIsTenFoot (ref), isTenFoot (ref), guiService (ref), removeGameDetailSessionIfDepartedModule (ref), sessionType (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), responsiveModule (ref), detailsPageLayout (ref), t (ref), edpFullBleedOverlapOffset (ref), edpBannerBottomVisiblePercent (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackBannerImageModule (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), fFlagSduiExperienceDetailsSupport (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref)
	local useExperienceDetailsFocusNavigationModule = require(gameDetail.FocusNavigation.useExperienceDetailsFocusNavigation)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p1)
	local var1 = getExperienceDetailsPageKeyModule(universeId)
	local var2 = reactModule.useRef(nil)
	usePageScopeRef(var1)
	local var3 = reactModule.useMemo(function()
		-- upvalues: experienceDetailsPageUtilsModule (copy), p1 (ref), sduiSurfaceLoadTimeTracker (copy), var1 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var4 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var1, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
			}
		})
		getSduiClientPageScope(var1).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var4)
		
		return var4
	end, {})
	useEdpFunctionallyReadyLoggerModule(var3, universeId)
	local var4 = useNavigation()
	local var5 = useRoactService(appSessionService)
	local var6 = useTokens()
	local var7 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then useGetCurrentLegacyRoute() else nil
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	reactModule.useEffect(function()
		-- upvalues: getSduiClientPageScope (copy), var1 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref), fFlagSduiPlayWithRewardGapFix (copy), filterPlayWithReward (copy), sduiEdpPageScopeIsTenFoot (copy), isTenFoot (copy), guiService (copy)
		local var8 = getSduiClientPageScope(var1)
		var8.set("referralSource", referralSource)
		var8.set("experienceJoinData", experienceJoinData)
		var8.set("placeId", placeIdOverride)
		var8.set("launchSource", "ExperienceDetailsPage")
		
		if fFlagSduiPlayWithRewardGapFix then
			var8.set(filterPlayWithReward, nil)
		end
		if sduiEdpPageScopeIsTenFoot then
			var8.set(isTenFoot, guiService:IsTenFootInterface())
		end
	end, {
		var1,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: fFlagLuaAppSduiEdpRouteAwareSessionRemoval (copy), var7 (write), var4 (ref), removeGameDetailSessionIfDepartedModule (copy), var5 (ref), sessionType (copy)
		local var9 = if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var7() else nil
		var4.goBack()
		
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then
			removeGameDetailSessionIfDepartedModule(var5, var9)
			
			return
		elseif var5 then
			var5:RemoveSession(sessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		var4,
		var5,
		if fFlagLuaAppSduiEdpRouteAwareSessionRemoval then var7 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), var3 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var3 then
			fetchExperienceDetailsPageModule(universeId, var3)
		end
	end, { universeId, var3 })
	local var9 = useUiStatus(var1)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var9 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p2)
				return if p2 ~= nil then p2.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var9, universeId })
	local var10 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	
	return if universeId == nil then nil else reactModule.createElement(detailsPageLayout.Root, {
		ref = useExperienceDetailsFocusNavigationModule(var8),
		onClose = if var10 then nil else var8,
		selectionGroup = t,
		fullBleedOverlapOffset = edpFullBleedOverlapOffset,
		bannerBottomVisiblePercent = edpBannerBottomVisiblePercent / 100,
		fullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = appPage.ExperienceDetail,
			configKey = var1,
			identifier = experienceDetailsPageConstantsModule.EDP_BANNER_IMAGE_IDENTIFIER,
			loadTimer = var3,
			Size = UDim2.fromScale(1, 1),
			loadingSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Skeleton),
			errorSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Error, { universeId = universeId })
		})
	}, {
		Header = if var10 then nil else reactModule.createElement(detailsPageLayout.Header, {
			fullWidthContent = true,
			closeIconName = foundationModule.Enums.IconName.X,
			backgroundColor = var6.Color.Surface.Surface_300
		}, {
			StickyHeaderContent = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				appPage = appPage.ExperienceDetail,
				configKey = var1,
				identifier = experienceDetailsPageConstantsModule.EDP_STICKY_HEADER_IDENTIFIER,
				loadTimer = var3,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = reactModule.createElement(detailsPageLayout.Content, { scrollingFrameRef = var2 }, {
			Feed = reactModule.createElement(sduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = appPage.ExperienceDetail,
				configKey = var1,
				identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var1, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = var3,
				scrollingFrameRef = var2,
				backgroundStyle = var6.Color.None,
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
					refresh = reactModule.useCallback(function()
						-- upvalues: universeId (ref), var3 (ref), fetchExperienceDetailsPageModule (copy)
						if universeId and var3 then
							fetchExperienceDetailsPageModule(universeId, var3, true)
						end
					end, { universeId, var3 }),
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				})
			})
		})
	})
end)