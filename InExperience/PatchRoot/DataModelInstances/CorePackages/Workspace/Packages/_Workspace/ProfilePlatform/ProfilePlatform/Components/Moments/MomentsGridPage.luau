local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NavigationModule = require(Parent.Navigation)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RoactUtilsModule = require(Parent.RoactUtils)
local MomentsCommonModule = require(Parent.MomentsCommon)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local Analytics = MomentsCommonModule.Analytics
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local EventNames = Analytics.EventNames
local MakeProfileTileFieldsModule = require(ProfilePlatform.Analytics.makeProfileTileFields)
local MomentGridItemModule = require(script.Parent.MomentGridItem)
local MomentsCarouselMediaProviderModule = require(script.Parent.MomentsCarouselMediaProvider)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ProfileModalViewModule = require(ProfilePlatform.Components.ProfilePlatformViewAdaptor.ProfileModalView)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseUserMomentsModule = require(ProfilePlatform.Hooks.useUserMoments)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseProfileCardWidthModule = require(ProfilePlatform.Hooks.useProfileCardWidth)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UserProfilesModule = require(Parent.UserProfiles)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local ScrollingGridView = MomentsCommonModule.ScrollingGridView
local UseNavigationFunction = NavigationModule.useNavigation
local UseNavigationFocusFunction = NavigationModule.useNavigationFocus
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseStatusBarHeightFunction = MomentsCommonModule.Hooks.useStatusBarHeight
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = SharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local FFlagProfileMomentsVideoPlaybackFix = SharedFlagsModule.FFlagProfileMomentsVideoPlaybackFix
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagAXEnableProfileTab = SharedFlagsModule.FFlagAXEnableProfileTab
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagProfileMomentsFeedRootRoute = SharedFlagsModule.FFlagProfileMomentsFeedRootRoute
local FFlagProfileMomentsLoadFailureAnalyticsModule = require(ProfilePlatform.Flags.FFlagProfileMomentsLoadFailureAnalytics)
local ProfileMomentsGridMeTabTopInset = game:DefineFastFlag("ProfileMomentsGridMeTabTopInset", false)
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ChevronLargeLeft = FoundationModule.Enums.IconName.ChevronLargeLeft
local Frozen = table.freeze({})

return function() --[[ Line: 94 | Named "MomentsGridPage" ]]
	-- upvalues: UseNavigationFunction (copy), FFlagProfileMomentsFeedRootRoute (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), FFlagAXEnableProfileTab (copy), UseProfileWrapperContextModule (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), GetSafeAreaSizeFunction (copy), ProfileMomentsGridMeTabTopInset (copy), UseStatusBarHeightFunction (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), UseProfileCardWidthFunction (copy), UseProfileCardWidthModule (copy), ConstantsModule (copy), ReactModule (copy), UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), UseUserMomentsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseAppPolicyFunction (copy), FFlagMomentsOptimisticProfilePending (copy), FireAnalyticsEventFunction (copy), EventNames (copy), FFlagProfileMomentsLoadFailureAnalyticsModule (copy), MakeProfileTileFieldsModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), MomentGridItemModule (copy), View (copy), IconButton (copy), ChevronLargeLeft (copy), ButtonSize (copy), UserTile (copy), LayoutMode (copy), FFlagProfileMomentsVideoPlaybackFix (copy), UseNavigationFocusFunction (copy), FoundationModule (copy), ScrollingGridView (copy), MomentsCarouselMediaProviderModule (copy), Frozen (copy), ProfileModalViewModule (copy), FullscreenPageWithSafeArea (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = if FFlagProfileMomentsFeedRootRoute then UseDispatchFunction() else nil
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local Theme = UseStyleFunction().Theme
	local UseTokensResult = UseTokensFunction()
	local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseProfileWrapperContextModuleResult = if FFlagAXEnableProfileTab then UseProfileWrapperContextModule() else nil
	local IsForceFullView = if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.forceFullView == true else nil
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeFunction(), (UseSelectorFunction(function(p1) --[[ Line: 113 ]]
		return p1.GlobalGuiInset
	end)))
	local UseStatusBarHeightResult = if ProfileMomentsGridMeTabTopInset then UseStatusBarHeightFunction() else 0
	local UseProfileCardWidthResult = if FFlagProfilePlatformNewProfileHeader then if FFlagSwitchProfileWidthHookToSocialCommon then UseProfileCardWidthFunction() else UseProfileCardWidthModule(IsFormFactorMatch) else math.min(SafeAreaSize.X.Offset, ConstantsModule.MAXIMUM_CONTAINER_WIDTH)
	local ProfileId = if ExtraPropsParam then ExtraPropsParam.profileId else nil
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = ReactModule.useMemo(function() --[[ Line: 126 ]]
			-- upvalues: ProfileId (copy)
			return if ProfileId == nil then {} else { ProfileId }
		end, { ProfileId }),
		query = UserProfilesModule.Queries.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds
	})
	local CombinedNameFromId = if UseUserProfilesFetchResult.data == nil or ProfileId == nil then nil else UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, ProfileId)
	local UsernameFromId = if UseUserProfilesFetchResult.data == nil or ProfileId == nil then nil else UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, ProfileId)
	local UseUserMomentsModuleResult = UseUserMomentsModule(ProfileId)
	local Moments = UseUserMomentsModuleResult.moments
	local HasMore = UseUserMomentsModuleResult.hasMore
	local LoadMore = UseUserMomentsModuleResult.loadMore
	local UseLocalizationResult = UseLocalizationFunction({ feedEndTitle = TextKeysModule.MomentsFeedEndTitle })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1) --[[ Line: 146 ]]
		return p1.getEnableContinuousLoad()
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = if FFlagMomentsOptimisticProfilePending then ReactModule.useRef(nil) else nil
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 157 ]]
		-- upvalues: UseRefResult1 (copy), Moments (copy), ProfileId (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not UseRefResult1.current and #Moments > 0 and ProfileId ~= nil then
			UseRefResult1.current = true
			FireAnalyticsEventFunction(EventNames.ProfileScreenImpression, { userId = ProfileId, momentsCount = tostring(#Moments) })
		end
	end, { Moments, ProfileId })
	ReactModule.useEffect(function() --[[ Line: 167 ]]
		-- upvalues: FFlagProfileMomentsLoadFailureAnalyticsModule (upval), UseUserMomentsModuleResult (copy), ProfileId (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not FFlagProfileMomentsLoadFailureAnalyticsModule and UseUserMomentsModuleResult.hasFailed and ProfileId ~= nil then
			FireAnalyticsEventFunction(EventNames.ProfileLoadFailed, { userId = ProfileId })
		end
	end, { UseUserMomentsModuleResult.hasFailed, ProfileId })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 175 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult.goBack })
	local UseResult1 = ReactModule.useCallback(function(InitialIndex) --[[ Line: 179 ]]
		-- upvalues: Moments (copy), ProfileId (copy), MakeProfileTileFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), FFlagMomentsOptimisticProfilePending (upval), UseRefResult (ref), FFlagProfileMomentsFeedRootRoute (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), UseNavigationResult (copy), EnumsModule (upval)
		local Moment = Moments[InitialIndex]
		
		if Moment and ProfileId then
			local Grid = MakeProfileTileFieldsModule.makeProfileTileInteractionFields(Moment, ProfileId, "grid", InitialIndex)
			
			if Grid then
				FireAnalyticsEventFunction(EventNames.ProfileMomentSelected, Grid)
			end
		end
		local ExtraProps = {
			targetUserId = tonumber(ProfileId) or 0,
			initialIndex = InitialIndex,
			initialMomentId = if FFlagMomentsOptimisticProfilePending and Moment ~= nil then Moment.momentId else nil
		}
		
		if FFlagMomentsOptimisticProfilePending and UseRefResult ~= nil and UseRefResult.current ~= nil then
			UseRefResult.current.release()
		end
		if not FFlagProfileMomentsFeedRootRoute then
			UseNavigationResult.navigate(EnumsModule.Screens.MomentsFeed, { extraProps = ExtraProps })
			
			return
		end
		local config = {
			name = AppPage.ProfileMomentsFeed,
			extraProps = ExtraProps
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseNavigationResult,
		UseDispatchResult,
		ProfileId,
		Moments
	})
	local UseResult2 = ReactModule.useCallback(function(Moment, Index) --[[ Line: 213 ]]
		-- upvalues: ReactModule (upval), MomentGridItemModule (upval), UseStateResult (copy), ProfileId (copy), UseResult1 (copy), UseStateResult2 (copy)
		return ReactModule.createElement(MomentGridItemModule, {
			moment = Moment,
			isActive = UseStateResult == Index,
			userId = ProfileId,
			index = Index,
			onActivated = function() --[[ Line: 219 ]]
				-- upvalues: UseResult1 (upval), Index (copy)
				UseResult1(Index)
			end,
			onHoverChanged = function(p1) --[[ Line: 222 ]]
				-- upvalues: UseStateResult2 (upval), Index (copy)
				UseStateResult2(function(Index1) --[[ Line: 223 ]]
					-- upvalues: p1 (copy), Index (upval)
					return if p1 then Index elseif Index1 == Index then nil else Index1
				end)
			end
		})
	end, { UseResult1, UseStateResult, ProfileId })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 235 ]]
		-- upvalues: ReactModule (upval), View (upval)
		return ReactModule.createElement(View, { tag = "col align-x-center align-y-center grow size-full" })
	end, {})
	local Element = ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-small",
		Size = UDim2.new(1, 0, 0, 56),
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large)
		}
	}, {
		BackButton = ReactModule.createElement(IconButton, {
			LayoutOrder = 1,
			icon = ChevronLargeLeft,
			size = ButtonSize.Medium,
			onActivated = UseResult
		}),
		User = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "grow",
			Size = UDim2.new(0, 0, 1, 0)
		}, {
			UserTile = ReactModule.createElement(UserTile, {
				userPresenceType = nil,
				userId = ProfileId or "",
				title = CombinedNameFromId,
				subtitle = if UsernameFromId == nil or UsernameFromId == "" then nil else `@{UsernameFromId}`,
				layoutMode = LayoutMode.wide,
				avatarSize = UDim2.fromOffset(40, 40),
				titleStyle = UseTokensResult.Typography.HeadingSmall,
				subtitleStyle = UseTokensResult.Typography.BodyMedium,
				isTitleLoading = CombinedNameFromId == nil,
				isSubtitleLoading = UsernameFromId == nil
			})
		})
	})
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 277 ]]
		-- upvalues: Moments (copy)
		for _, moment in Moments do
			if moment.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { Moments })
	local NoFFlagMomentsOptimisticProfilePending = not FFlagProfileMomentsVideoPlaybackFix and not FFlagMomentsOptimisticProfilePending or UseNavigationFocusFunction()
	local Moment = if UseStateResult == nil then nil else Moments[UseStateResult]
	local NoFFlagMomentsOptimisticProfilePending1 = Moment ~= nil and (Moment.metadata.captureType == Enum.CaptureType.Video and NoFFlagMomentsOptimisticProfilePending)
	local Element1 = ReactModule.createElement(View, {
		tag = "grow size-full-0",
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large),
			top = UDim.new(0, UseTokensResult.Padding.Large),
			bottom = UDim.new(0, UseTokensResult.Padding.Large)
		}
	}, {
		ScrollingGridView = ReactModule.createElement(ScrollingGridView, {
			aspectRatio = 1.5,
			showMoreButtonText = "Show More",
			items = Moments,
			itemConfig = {
				padding = 8,
				maxItemsPerRow = 3,
				minItemsPerPage = 9,
				minItemWidth = 100
			},
			renderItem = UseResult2,
			renderEmptyState = UseResult3,
			shouldShowShowMoreButton = HasMore,
			onShowMoreCallback = LoadMore,
			enableInfiniteScroll = if UseAppPolicyResult then true else nil,
			footer = if #Moments > 0 then ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy padding-large text-body-medium text-align-x-center content-muted",
				Text = UseLocalizationResult.feedEndTitle
			}) else nil
		})
	})
	local Element2 = if UseMemoResult then ReactModule.createElement(MomentsCarouselMediaProviderModule, {
		moments = if NoFFlagMomentsOptimisticProfilePending1 then Moments else Frozen,
		activeIndex = UseStateResult or 1,
		playbackActive = NoFFlagMomentsOptimisticProfilePending1,
		handoffRef = if FFlagMomentsOptimisticProfilePending then UseRefResult else nil
	}, { Grid = Element1 }) else Element1
	
	if FFlagAXEnableProfileTab and IsForceFullView then
		return ReactModule.createElement(View, {
			backgroundStyle = {
				Color3 = Theme.BackgroundDefault.Color,
				Transparency = Theme.BackgroundDefault.Transparency
			},
			padding = if ProfileMomentsGridMeTabTopInset then {
				top = UDim.new(0, UseStatusBarHeightResult + UseTokensResult.Padding.XLarge)
			} else nil,
			tag = if ProfileMomentsGridMeTabTopInset then "col gap-medium size-full" else "col gap-medium size-full padding-top-xlarge"
		}, { Header = Element, Grid = Element2 })
	elseif IsFormFactorMatch then
		local NewXLarge = 56 + UseTokensResult.Padding.XLarge
		
		return ReactModule.createElement(ProfileModalViewModule, {
			topBarHeight = 56,
			viewWidth = UseProfileCardWidthResult,
			navigateBack = UseResult,
			renderTopBar = function() --[[ Line: 369 ]]
				-- upvalues: ReactModule (upval), View (upval), NewXLarge (copy), UseTokensResult (copy), Element (copy)
				return ReactModule.createElement(View, {
					tag = "col",
					Size = UDim2.new(1, 0, 0, NewXLarge),
					padding = { top = UDim.new(0, UseTokensResult.Padding.XLarge) }
				}, { Header = Element })
			end,
			renderContent = function() --[[ Line: 378 ]]
				-- upvalues: ReactModule (upval), View (upval), NewXLarge (copy), Element2 (copy)
				return ReactModule.createElement(View, {
					tag = "col size-full",
					padding = { top = UDim.new(0, NewXLarge) }
				}, { Grid = Element2 })
			end
		})
	else
		return ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		}, {
			Content = ReactModule.createElement(View, {
				tag = "col gap-medium size-full",
				padding = { top = UDim.new(0, UseTokensResult.Padding.XLarge) }
			}, { Header = Element, Grid = Element2 })
		})
	end
end