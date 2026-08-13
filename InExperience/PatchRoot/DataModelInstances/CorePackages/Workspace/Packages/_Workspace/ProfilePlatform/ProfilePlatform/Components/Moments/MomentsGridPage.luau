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
local var27 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local chevronLargeLeft = foundationModule.Enums.IconName.ChevronLargeLeft
local frozen = table.freeze({})

return function() --[[ line: 94 | named "MomentsGridPage" ]]
	-- upvalues: useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useStyle (ref), useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), profileMomentsGridMeTabTopInset (ref), useStatusBarHeight (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useUserMomentsModule (ref), fFlagMomentsProfileGridInfiniteLoad (ref), useLocalization (ref), textKeysModule (ref), useAppPolicy (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagProfileMomentsLoadFailureAnalyticsModule (ref), makeProfileTileFieldsModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var27 (ref), navigateDown (ref), momentGridItemModule (ref), view (ref), iconButton (ref), chevronLargeLeft (ref), buttonSize (ref), userTile (ref), layoutMode (ref), fFlagProfileMomentsVideoPlaybackFix (ref), useNavigationFocus (ref), foundationModule (ref), scrollingGridView (ref), momentsCarouselMediaProviderModule (ref), frozen (ref), profileModalViewModule (ref), fullscreenPageWithSafeArea (ref)
	local var35
	local var29 = useNavigation()
	local var30 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local extraProps = var29.getParam("extraProps")
	local theme = useStyle().Theme
	local var32 = useTokens()
	local var33 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var34 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var35 = var34.forceFullView == true
		var35 = nil
	else
		var35 = nil
	end
	local var36 = if profileMomentsGridMeTabTopInset then useStatusBarHeight() else 0
	local var37 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var33) else math.min(getSafeAreaSize(useScreenSize(), useSelector(function(p0) --[[ line: 113 ]]
		return p0.GlobalGuiInset
	end)).X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var38 = if extraProps then extraProps.profileId else nil
	local var39 = useUserProfilesFetch({
		userIds = reactModule.useMemo(function() --[[ line: 126 ]]
			-- upvalues: var38 (ref)
			return if var38 == nil then {} else { var38 }
		end, { var38 }),
		query = userProfilesModule.Queries.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds
	})
	local var40 = if var39.data == nil or var38 == nil then nil else userProfilesModule.Selectors.getCombinedNameFromId(var39.data, var38)
	local var41 = if var39.data == nil or var38 == nil then nil else userProfilesModule.Selectors.getUsernameFromId(var39.data, var38)
	local var42 = useUserMomentsModule(var38)
	local moments = var42.moments
	local hasMore = var42.hasMore
	local loadMore = var42.loadMore
	local var43 = nil
	local var44 = false
	
	if fFlagMomentsProfileGridInfiniteLoad then
		var43 = useLocalization({ feedEndTitle = textKeysModule.MomentsFeedEndTitle })
		var44 = useAppPolicy(function(p1) --[[ line: 151 ]]
			return p1.getEnableContinuousLoad()
		end)
	end
	local var45, var46 = reactModule.useState(nil)
	local var47 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 160 ]]
		-- upvalues: var47 (ref), moments (ref), var38 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not var47.current and #moments > 0 and var38 ~= nil then
			var47.current = true
			fireAnalyticsEvent(eventNames.ProfileScreenImpression, { userId = var38, momentsCount = tostring(#moments) })
		end
	end, { moments, var38 })
	reactModule.useEffect(function() --[[ line: 170 ]]
		-- upvalues: fFlagProfileMomentsLoadFailureAnalyticsModule (copy), var42 (ref), var38 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not fFlagProfileMomentsLoadFailureAnalyticsModule and var42.hasFailed and var38 ~= nil then
			fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = var38 })
		end
	end, { var42.hasFailed, var38 })
	local var48 = reactModule.useCallback(function() --[[ line: 178 ]]
		-- upvalues: var29 (ref)
		var29.goBack()
	end, { var29.goBack })
	local var49 = reactModule.useCallback(function(p2) --[[ line: 182 ]]
		-- upvalues: moments (ref), var38 (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var27 (copy), var30 (ref), navigateDown (copy), var29 (ref), enumsModule (copy)
		local var59 = moments[p2]
		
		if var59 and var38 then
			local grid = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var59, var38, "grid", p2)
			
			if grid then
				fireAnalyticsEvent(eventNames.ProfileMomentSelected, grid)
			end
		end
		local t = { targetUserId = tonumber(var38) or 0, initialIndex = p2 }
		
		if not fFlagProfileMomentsFeedRootRoute then
			var29.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
			
			return
		end
		local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
		
		if fFlagSignalsNavP3Dispatch then
			var27.down(var27.fromLegacyPage(t_1))
			
			return
		end
		var30(navigateDown(t_1))
	end, { var29, var30, var38, moments })
	local var50 = reactModule.useCallback(function(p3, p4) --[[ line: 212 ]]
		-- upvalues: reactModule (copy), momentGridItemModule (copy), var45 (ref), var38 (ref), var49 (ref), var46 (ref)
		return reactModule.createElement(momentGridItemModule, {
			moment = p3,
			isActive = var45 == p4,
			userId = var38,
			index = p4,
			onActivated = function() --[[ line: 218 ]]
				-- upvalues: var49 (copy), p4 (ref)
				var49(p4)
			end,
			onHoverChanged = function(p5) --[[ line: 221 ]]
				-- upvalues: var46 (copy), p4 (ref)
				var46(function(p6) --[[ line: 222 ]]
					-- upvalues: p5 (ref), p4 (copy)
					return if p5 then p4 elseif p6 == p4 then nil else p6
				end)
			end
		})
	end, { var49, var45, var38 })
	local var51 = reactModule.useCallback(function() --[[ line: 234 ]]
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center grow size-full" })
	end, {})
	local var52 = reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small",
		Size = UDim2.new(1, 0, 0, 56),
		padding = {
			left = UDim.new(0, var32.Padding.Large),
			right = UDim.new(0, var32.Padding.Large)
		}
	}, {
		BackButton = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = chevronLargeLeft,
			size = buttonSize.Medium,
			onActivated = var48
		}),
		User = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "grow",
			Size = UDim2.new(0, 0, 1, 0)
		}, {
			UserTile = reactModule.createElement(userTile, {
				userPresenceType = nil,
				userId = var38 or "",
				title = var40,
				subtitle = if var41 == nil or var41 == "" then nil else `@{var41}`,
				layoutMode = layoutMode.wide,
				avatarSize = UDim2.fromOffset(40, 40),
				titleStyle = var32.Typography.HeadingSmall,
				subtitleStyle = var32.Typography.BodyMedium,
				isTitleLoading = var40 == nil,
				isSubtitleLoading = var41 == nil
			})
		})
	})
	local var53 = reactModule.useMemo(function() --[[ line: 276 ]]
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var54 = if var45 ~= nil then nil else moments[var45]
	local var55 = var54 ~= nil and (var54.metadata.captureType == Enum.CaptureType.Video and (if fFlagProfileMomentsVideoPlaybackFix then useNavigationFocus() else true))
	local var56 = reactModule.createElement(view, {
		tag = "grow size-full-0",
		padding = {
			left = UDim.new(0, var32.Padding.Large),
			right = UDim.new(0, var32.Padding.Large),
			top = UDim.new(0, var32.Padding.Large),
			bottom = UDim.new(0, var32.Padding.Large)
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
			renderItem = var50,
			renderEmptyState = var51,
			shouldShowShowMoreButton = hasMore,
			onShowMoreCallback = loadMore,
			enableInfiniteScroll = if var44 then true else nil,
			footer = if fFlagMomentsProfileGridInfiniteLoad and #moments > 0 then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy padding-large text-body-medium text-align-x-center content-muted",
				Text = var43.feedEndTitle
			}) else nil
		})
	})
	local var57 = if var53 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = if var55 then moments else frozen,
		activeIndex = var45 or 1,
		playbackActive = var55
	}, { Grid = var56 }) else var56
	
	if fFlagAXEnableProfileTab and var35 then
		return reactModule.createElement(view, {
			backgroundStyle = {
				Color3 = theme.BackgroundDefault.Color,
				Transparency = theme.BackgroundDefault.Transparency
			},
			padding = if profileMomentsGridMeTabTopInset then { top = UDim.new(0, var36 + var32.Padding.XLarge) } else nil,
			tag = if profileMomentsGridMeTabTopInset then "col gap-medium size-full" else "col gap-medium size-full padding-top-xlarge"
		}, { Header = var52, Grid = var57 })
	elseif var33 then
		local var58 = 56 + var32.Padding.XLarge
		
		return reactModule.createElement(profileModalViewModule, {
			topBarHeight = 56,
			viewWidth = var37,
			navigateBack = var48,
			renderTopBar = function() --[[ line: 365 ]]
				-- upvalues: reactModule (copy), view (copy), var58 (ref), var32 (ref), var52 (ref)
				return reactModule.createElement(view, {
					tag = "col",
					Size = UDim2.new(1, 0, 0, var58),
					padding = { top = UDim.new(0, var32.Padding.XLarge) }
				}, { Header = var52 })
			end,
			renderContent = function() --[[ line: 374 ]]
				-- upvalues: reactModule (copy), view (copy), var58 (ref), var57 (ref)
				return reactModule.createElement(view, {
					tag = "col size-full",
					padding = { top = UDim.new(0, var58) }
				}, { Grid = var57 })
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
			padding = { top = UDim.new(0, var32.Padding.XLarge) }
		}, { Header = var52, Grid = var57 })
	})
end