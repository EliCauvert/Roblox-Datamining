local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local appBloxModule = require(parent.AppBlox)
local inputUiModule = require(parent.InputUi)
local navigationModule = require(parent.Navigation)
local navigationRoduxModule = require(parent.NavigationRodux)
local appPage = require(parent.RobloxAppEnums).AppPage
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalization = localizationModule.Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local analytics = momentsCommonModule.Analytics
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local eventNames = analytics.EventNames
local makeProfileTileFieldsModule = require(profilePlatform.Analytics.makeProfileTileFields)
local momentGridItemModule = require(script.Parent.MomentGridItem)
local momentsCarouselMediaProviderModule = require(script.Parent.MomentsCarouselMediaProvider)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local profileModalViewModule = require(profilePlatform.Components.ProfilePlatformViewAdaptor.ProfileModalView)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useUserMomentsModule = require(profilePlatform.Hooks.useUserMoments)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useProfileCardWidthModule = require(profilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local userProfilesModule = require(parent.UserProfiles)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local fullscreenPageWithSafeArea = appBloxModule.FullscreenPageWithSafeArea
local scrollingGridView = momentsCommonModule.ScrollingGridView
local useNavigation = navigationModule.useNavigation
local useNavigationFocus = navigationModule.useNavigationFocus
local useStyle = UIBloxModule.Core.Style.useStyle
local useScreenSize = robloxAppHooksModule.useScreenSize
local useStatusBarHeight = momentsCommonModule.Hooks.useStatusBarHeight
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagSwitchProfileWidthHookToSocialCommon = sharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local fFlagProfileMomentsVideoPlaybackFix = sharedFlagsModule.FFlagProfileMomentsVideoPlaybackFix
local fFlagAXEnableProfileTab = sharedFlagsModule.FFlagAXEnableProfileTab
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagProfileMomentsFeedRootRoute = sharedFlagsModule.FFlagProfileMomentsFeedRootRoute
local fFlagMomentsProfileGridInfiniteLoad = momentsCommonModule.Flags.FFlagMomentsProfileGridInfiniteLoad
local fFlagProfileMomentsLoadFailureAnalyticsModule = require(profilePlatform.Flags.FFlagProfileMomentsLoadFailureAnalytics)
local profileMomentsGridMeTabTopInset = game:DefineFastFlag("ProfileMomentsGridMeTabTopInset", false)
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local chevronLargeLeft = foundationModule.Enums.IconName.ChevronLargeLeft
local frozen = table.freeze({})

return function()
	-- upvalues: useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useStyle (ref), useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), profileMomentsGridMeTabTopInset (ref), useStatusBarHeight (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useUserMomentsModule (ref), fFlagMomentsProfileGridInfiniteLoad (ref), useLocalization (ref), textKeysModule (ref), useAppPolicy (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagProfileMomentsLoadFailureAnalyticsModule (ref), makeProfileTileFieldsModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), momentGridItemModule (ref), view (ref), iconButton (ref), chevronLargeLeft (ref), buttonSize (ref), userTile (ref), layoutMode (ref), fFlagProfileMomentsVideoPlaybackFix (ref), useNavigationFocus (ref), foundationModule (ref), scrollingGridView (ref), momentsCarouselMediaProviderModule (ref), frozen (ref), profileModalViewModule (ref), fullscreenPageWithSafeArea (ref)
	local var2
	local var3 = useNavigation()
	local var4 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local extraProps = var3.getParam("extraProps")
	local theme = useStyle().Theme
	local var5 = useTokens()
	local var6 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var7 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var2 = var7.forceFullView == true
		var2 = nil
	else
		var2 = nil
	end
	local var8 = if profileMomentsGridMeTabTopInset then useStatusBarHeight() else 0
	local var9 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var6) else math.min(getSafeAreaSize(useScreenSize(), useSelector(function(p1)
		return p1.GlobalGuiInset
	end)).X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var10 = if extraProps then extraProps.profileId else nil
	local var11 = useUserProfilesFetch({
		userIds = reactModule.useMemo(function()
			-- upvalues: var10 (ref)
			return if var10 == nil then {} else { var10 }
		end, { var10 }),
		query = userProfilesModule.Queries.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds
	})
	local var12 = if var11.data == nil or var10 == nil then nil else userProfilesModule.Selectors.getCombinedNameFromId(var11.data, var10)
	local var13 = if var11.data == nil or var10 == nil then nil else userProfilesModule.Selectors.getUsernameFromId(var11.data, var10)
	local var14 = useUserMomentsModule(var10)
	local moments = var14.moments
	local hasMore = var14.hasMore
	local loadMore = var14.loadMore
	local var15 = nil
	local var16 = false
	
	if fFlagMomentsProfileGridInfiniteLoad then
		var15 = useLocalization({ feedEndTitle = textKeysModule.MomentsFeedEndTitle })
		var16 = useAppPolicy(function(p1)
			return p1.getEnableContinuousLoad()
		end)
	end
	local var17, var18 = reactModule.useState(nil)
	local var19 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), moments (ref), var10 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not var19.current and #moments > 0 and var10 ~= nil then
			var19.current = true
			fireAnalyticsEvent(eventNames.ProfileScreenImpression, { userId = var10, momentsCount = tostring(#moments) })
		end
	end, { moments, var10 })
	reactModule.useEffect(function()
		-- upvalues: fFlagProfileMomentsLoadFailureAnalyticsModule (copy), var14 (ref), var10 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not fFlagProfileMomentsLoadFailureAnalyticsModule and var14.hasFailed and var10 ~= nil then
			fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = var10 })
		end
	end, { var14.hasFailed, var10 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3.goBack()
	end, { var3.goBack })
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: moments (ref), var10 (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy), var3 (ref), enumsModule (copy)
		local var22 = moments[p1]
		
		if var22 and var10 then
			local grid = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var22, var10, "grid", p1)
			
			if grid then
				fireAnalyticsEvent(eventNames.ProfileMomentSelected, grid)
			end
		end
		local t = { targetUserId = tonumber(var10) or 0, initialIndex = p1 }
		
		if not fFlagProfileMomentsFeedRootRoute then
			var3.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
			
			return
		end
		local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t_1))
			
			return
		end
		var4(navigateDown(t_1))
	end, { var3, var4, var10, moments })
	local var22 = reactModule.useCallback(function(p1, p2)
		-- upvalues: reactModule (copy), momentGridItemModule (copy), var17 (ref), var10 (ref), var21 (ref), var18 (ref)
		return reactModule.createElement(momentGridItemModule, {
			moment = p1,
			isActive = var17 == p2,
			userId = var10,
			index = p2,
			onActivated = function()
				-- upvalues: var21 (copy), p2 (ref)
				var21(p2)
			end,
			onHoverChanged = function(p3)
				-- upvalues: var18 (copy), p2 (ref)
				var18(function(p4)
					-- upvalues: p3 (ref), p2 (copy)
					return if p3 then p2 elseif p4 == p2 then nil else p4
				end)
			end
		})
	end, { var21, var17, var10 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center grow size-full" })
	end, {})
	local var24 = reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small",
		Size = UDim2.new(1, 0, 0, 56),
		padding = {
			left = UDim.new(0, var5.Padding.Large),
			right = UDim.new(0, var5.Padding.Large)
		}
	}, {
		BackButton = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = chevronLargeLeft,
			size = buttonSize.Medium,
			onActivated = var20
		}),
		User = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "grow",
			Size = UDim2.new(0, 0, 1, 0)
		}, {
			UserTile = reactModule.createElement(userTile, {
				userPresenceType = nil,
				userId = var10 or "",
				title = var12,
				subtitle = if var13 == nil or var13 == "" then nil else `@{var13}`,
				layoutMode = layoutMode.wide,
				avatarSize = UDim2.fromOffset(40, 40),
				titleStyle = var5.Typography.HeadingSmall,
				subtitleStyle = var5.Typography.BodyMedium,
				isTitleLoading = var12 == nil,
				isSubtitleLoading = var13 == nil
			})
		})
	})
	local var25 = reactModule.useMemo(function()
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var26 = if var17 ~= nil then nil else moments[var17]
	local var27 = var26 ~= nil and (var26.metadata.captureType == Enum.CaptureType.Video and (if fFlagProfileMomentsVideoPlaybackFix then useNavigationFocus() else true))
	local var28 = reactModule.createElement(view, {
		tag = "grow size-full-0",
		padding = {
			left = UDim.new(0, var5.Padding.Large),
			right = UDim.new(0, var5.Padding.Large),
			top = UDim.new(0, var5.Padding.Large),
			bottom = UDim.new(0, var5.Padding.Large)
		}
	}, {
		ScrollingGridView = reactModule.createElement(scrollingGridView, {
			aspectRatio = 1.5,
			showMoreButtonText = "Show More",
			items = moments,
			itemConfig = {
				padding = 8,
				maxItemsPerRow = 3,
				minItemsPerPage = 9,
				minItemWidth = 100
			},
			renderItem = var22,
			renderEmptyState = var23,
			shouldShowShowMoreButton = hasMore,
			onShowMoreCallback = loadMore,
			enableInfiniteScroll = if var16 then true else nil,
			footer = if fFlagMomentsProfileGridInfiniteLoad and #moments > 0 then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy padding-large text-body-medium text-align-x-center content-muted",
				Text = var15.feedEndTitle
			}) else nil
		})
	})
	local var29 = if var25 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = if var27 then moments else frozen,
		activeIndex = var17 or 1,
		playbackActive = var27
	}, { Grid = var28 }) else var28
	
	if fFlagAXEnableProfileTab and var2 then
		return reactModule.createElement(view, {
			backgroundStyle = {
				Color3 = theme.BackgroundDefault.Color,
				Transparency = theme.BackgroundDefault.Transparency
			},
			padding = if profileMomentsGridMeTabTopInset then { top = UDim.new(0, var8 + var5.Padding.XLarge) } else nil,
			tag = if profileMomentsGridMeTabTopInset then "col gap-medium size-full" else "col gap-medium size-full padding-top-xlarge"
		}, { Header = var24, Grid = var29 })
	elseif var6 then
		local var30 = 56 + var5.Padding.XLarge
		
		return reactModule.createElement(profileModalViewModule, {
			topBarHeight = 56,
			viewWidth = var9,
			navigateBack = var20,
			renderTopBar = function()
				-- upvalues: reactModule (copy), view (copy), var30 (ref), var5 (ref), var24 (ref)
				return reactModule.createElement(view, {
					tag = "col",
					Size = UDim2.new(1, 0, 0, var30),
					padding = { top = UDim.new(0, var5.Padding.XLarge) }
				}, { Header = var24 })
			end,
			renderContent = function()
				-- upvalues: reactModule (copy), view (copy), var30 (ref), var29 (ref)
				return reactModule.createElement(view, {
					tag = "col size-full",
					padding = { top = UDim.new(0, var30) }
				}, { Grid = var29 })
			end
		})
	end
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = theme.BackgroundDefault.Transparency
	}, {
		Content = reactModule.createElement(view, {
			tag = "col gap-medium size-full",
			padding = { top = UDim.new(0, var5.Padding.XLarge) }
		}, { Header = var24, Grid = var29 })
	})
end