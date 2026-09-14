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
local usePublishContainerWidthModule = require(script.Parent.usePublishContainerWidth)
local experienceDetailsFallbackBannerImageModule = require(script.Parent.Fallback.ExperienceDetailsFallbackBannerImage)
local experienceDetailsFallbackFeedModule = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed)
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
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
local fFlagSduiContainerQueries = sharedFlagsModule.FFlagSduiContainerQueries
local fFlagSduiPlayWithRewardGapFix = sharedFlagsModule.FFlagSduiPlayWithRewardGapFix
local sduiEdpPageScopeIsTenFoot = game:DefineFastFlag("SduiEdpPageScopeIsTenFoot", false)
local fFlagLuaAppMediaGalleryGamepadSupport = sharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local fFlagLuaAppEdpDirectionalGradientMidTransparency = sharedFlagsModule.FFlagLuaAppEdpDirectionalGradientMidTransparency
local edpBannerAspectRatioTenths = game:DefineFastInt("EdpBannerAspectRatioTenths", 0)
local edpFullBleedOverlapOffset = game:DefineFastInt("EdpFullBleedOverlapOffset", 180)
local edpGradientTopBleedOffset = game:DefineFastInt("EdpGradientTopBleedOffset", 120)
local edpBannerBottomVisiblePercent = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20)
local edpDirectionalFullBleedOverlapOffset = game:DefineFastInt("EdpDirectionalFullBleedOverlapOffset", 195)
local edpDirectionalBannerBottomVisiblePercent = game:DefineFastInt("EdpDirectionalBannerBottomVisiblePercent", 50)
local edpDirectionalGradientMidTransparencyHundredths = game:DefineFastInt("EdpDirectionalGradientMidTransparencyHundredths", 12)
local t = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

return reactModule.memo(function(p1)
	-- upvalues: gameDetail (ref), experienceDetailsPageUtilsModule (ref), getExperienceDetailsPageKeyModule (ref), reactModule (ref), usePageScopeRef (ref), sduiSurfaceLoadTimeTracker (ref), EDPTTIConstants (ref), getSduiClientPageScope (ref), useEdpFunctionallyReadyLoggerModule (ref), useNavigation (ref), useRoactService (ref), appSessionService (ref), useTokens (ref), useGetCurrentLegacyRoute (ref), fFlagSduiPlayWithRewardGapFix (ref), filterPlayWithReward (ref), sduiEdpPageScopeIsTenFoot (ref), isTenFoot (ref), guiService (ref), removeGameDetailSessionIfDepartedModule (ref), fetchExperienceDetailsPageModule (ref), useUiStatus (ref), uiStatus (ref), dataHydrationModule (ref), fFlagSduiContainerQueries (ref), usePublishContainerWidthModule (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), responsiveModule (ref), detailsPageLayout (ref), t (ref), edpBannerAspectRatioTenths (ref), edpDirectionalFullBleedOverlapOffset (ref), edpFullBleedOverlapOffset (ref), edpGradientTopBleedOffset (ref), fFlagLuaAppEdpDirectionalGradientMidTransparency (ref), edpDirectionalGradientMidTransparencyHundredths (ref), edpDirectionalBannerBottomVisiblePercent (ref), edpBannerBottomVisiblePercent (ref), sduiFeatureEntryPoint (ref), appPage (ref), experienceDetailsPageConstantsModule (ref), experienceDetailsFallbackBannerImageModule (ref), foundationModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), fFlagSduiExperienceDetailsSupport (ref), compositionTags (ref), experienceDetailsFallbackFeedModule (ref)
	local var1
	local useExperienceDetailsFocusNavigationModule = require(gameDetail.FocusNavigation.useExperienceDetailsFocusNavigation)
	local universeId = experienceDetailsPageUtilsModule.getUniverseId(p1)
	local var2 = getExperienceDetailsPageKeyModule(universeId)
	local var3 = reactModule.useRef(nil)
	usePageScopeRef(var2)
	local var4 = reactModule.useMemo(function()
		-- upvalues: experienceDetailsPageUtilsModule (copy), p1 (ref), sduiSurfaceLoadTimeTracker (copy), var2 (ref), EDPTTIConstants (copy), getSduiClientPageScope (copy)
		local var5 = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "pageTimer") or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var2, {
			manualSurfaceReady = true,
			eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
			metadata = {
				page = "Untracked",
				category = EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
			}
		})
		getSduiClientPageScope(var2).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var5)
		
		return var5
	end, {})
	useEdpFunctionallyReadyLoggerModule(var4, universeId)
	local var5 = useNavigation()
	local var6 = useRoactService(appSessionService)
	local var7 = useTokens()
	local var8 = useGetCurrentLegacyRoute()
	local referralSource = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "referralSource")
	local experienceJoinData = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "experienceJoinData")
	local placeIdOverride = experienceDetailsPageUtilsModule.getFromPropsOrNavigationParams(p1, "placeIdOverride")
	reactModule.useEffect(function()
		-- upvalues: getSduiClientPageScope (copy), var2 (ref), referralSource (ref), experienceJoinData (ref), placeIdOverride (ref), fFlagSduiPlayWithRewardGapFix (copy), filterPlayWithReward (copy), sduiEdpPageScopeIsTenFoot (copy), isTenFoot (copy), guiService (copy)
		local var9 = getSduiClientPageScope(var2)
		var9.set("referralSource", referralSource)
		var9.set("experienceJoinData", experienceJoinData)
		var9.set("placeId", placeIdOverride)
		var9.set("launchSource", "ExperienceDetailsPage")
		
		if fFlagSduiPlayWithRewardGapFix then
			var9.set(filterPlayWithReward, nil)
		end
		if sduiEdpPageScopeIsTenFoot then
			var9.set(isTenFoot, guiService:IsTenFootInterface())
		end
	end, {
		var2,
		referralSource,
		experienceJoinData,
		placeIdOverride
	})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var5 (ref), removeGameDetailSessionIfDepartedModule (copy), var6 (ref)
		local var10 = var8()
		var5.goBack()
		removeGameDetailSessionIfDepartedModule(var6, var10)
	end, { var5, var6, var8 })
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), var4 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var4 then
			fetchExperienceDetailsPageModule(universeId, var4)
		end
	end, { universeId, var4 })
	local var10 = useUiStatus(var2)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), uiStatus (copy), universeId (ref), dataHydrationModule (copy)
		if var10 == uiStatus.Error and universeId then
			dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(universeId, function(p2)
				return if p2 ~= nil then p2.creator == nil else true
			end)
			dataHydrationModule.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(universeId)
		end
	end, { var10, universeId })
	local var11 = reactModule.useCallback(function()
		-- upvalues: universeId (ref), var4 (ref), fetchExperienceDetailsPageModule (copy)
		if universeId and var4 then
			fetchExperienceDetailsPageModule(universeId, var4, true)
		end
	end, { universeId, var4 })
	local var12 = useExperienceDetailsFocusNavigationModule(var9)
	local var13 = if fFlagSduiContainerQueries then usePublishContainerWidthModule(var2, var12) else var12
	
	if fFlagLuaAppMediaGalleryGamepadSupport then
		var1 = responsiveModule.useLastInput() == responsiveModule.Input.Directional
		var1 = nil
	else
		var1 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	end
	return if universeId == nil then nil else reactModule.createElement(detailsPageLayout.Root, {
		ref = var13,
		onClose = if var1 then nil else var9,
		selectionGroup = t,
		fullBleedAspectRatio = if fFlagLuaAppMediaGalleryGamepadSupport and var1 and edpBannerAspectRatioTenths > 0 then edpBannerAspectRatioTenths / 10 else nil,
		fullBleedOverlapOffset = if fFlagLuaAppMediaGalleryGamepadSupport and var1 then edpDirectionalFullBleedOverlapOffset else edpFullBleedOverlapOffset,
		gradientTopBleedOffset = if fFlagLuaAppMediaGalleryGamepadSupport and var1 then edpGradientTopBleedOffset else nil,
		gradientMidTransparency = if fFlagLuaAppEdpDirectionalGradientMidTransparency and fFlagLuaAppMediaGalleryGamepadSupport and var1 then edpDirectionalGradientMidTransparencyHundredths / 100 else nil,
		bannerBottomVisiblePercent = if fFlagLuaAppMediaGalleryGamepadSupport and var1 then edpDirectionalBannerBottomVisiblePercent / 100 else edpBannerBottomVisiblePercent / 100,
		reserveHeaderBarSpace = if fFlagLuaAppMediaGalleryGamepadSupport and var1 then false else nil,
		disableFocusNavEngineScroll = if fFlagLuaAppMediaGalleryGamepadSupport and var1 then true else nil,
		fullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = appPage.ExperienceDetail,
			configKey = var2,
			identifier = experienceDetailsPageConstantsModule.EDP_BANNER_IMAGE_IDENTIFIER,
			loadTimer = var4,
			Size = UDim2.fromScale(1, 1),
			loadingSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Skeleton),
			errorSlot = reactModule.createElement(experienceDetailsFallbackBannerImageModule.Error, { universeId = universeId })
		})
	}, {
		Header = if var1 then nil else reactModule.createElement(detailsPageLayout.Header, {
			fullWidthContent = true,
			closeIconName = foundationModule.Enums.IconName.X,
			backgroundColor = var7.Color.Surface.Surface_300
		}, {
			StickyHeaderContent = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				appPage = appPage.ExperienceDetail,
				configKey = var2,
				identifier = experienceDetailsPageConstantsModule.EDP_STICKY_HEADER_IDENTIFIER,
				loadTimer = var4,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = reactModule.createElement(detailsPageLayout.Content, { scrollingFrameRef = var3 }, {
			Feed = reactModule.createElement(sduiPageEntryPoint, {
				includeNavigationHeaderBar = false,
				snackbarPortalLayoutOrder = 2147483647,
				appPage = appPage.ExperienceDetail,
				configKey = var2,
				identifier = if fFlagSduiPageEntryUseSharedHooks then experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER else experienceDetailsPageUtilsModule.getResolvedIdentifier(var2, experienceDetailsPageConstantsModule.EDP_FEED_IDENTIFIER_SUFFIX),
				pageTimer = var4,
				scrollingFrameRef = var3,
				scrollToSelectionRevealOnly = if fFlagLuaAppMediaGalleryGamepadSupport and var1 then true else nil,
				backgroundStyle = var7.Color.None,
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
					refresh = var11,
					referralSource = referralSource,
					experienceJoinData = experienceJoinData,
					placeIdOverride = placeIdOverride
				})
			})
		})
	})
end)