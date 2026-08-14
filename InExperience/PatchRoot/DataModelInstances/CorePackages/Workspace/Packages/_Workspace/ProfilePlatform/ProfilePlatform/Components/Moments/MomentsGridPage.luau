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
local var26 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local chevronLargeLeft = foundationModule.Enums.IconName.ChevronLargeLeft
local frozen = table.freeze({})

return function() --[[ line: 92 | named "MomentsGridPage" ]]
	-- upvalues: useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useStyle (ref), useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useUserMomentsModule (ref), fFlagMomentsProfileGridInfiniteLoad (ref), useLocalization (ref), textKeysModule (ref), useAppPolicy (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagProfileMomentsLoadFailureAnalyticsModule (ref), makeProfileTileFieldsModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var26 (ref), navigateDown (ref), momentGridItemModule (ref), view (ref), iconButton (ref), chevronLargeLeft (ref), buttonSize (ref), userTile (ref), layoutMode (ref), fFlagProfileMomentsVideoPlaybackFix (ref), useNavigationFocus (ref), foundationModule (ref), scrollingGridView (ref), momentsCarouselMediaProviderModule (ref), frozen (ref), profileModalViewModule (ref), fullscreenPageWithSafeArea (ref)
	local var34
	local var28 = useNavigation()
	local var29 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local extraProps = var28.getParam("extraProps")
	local theme = useStyle().Theme
	local var31 = useTokens()
	local var32 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var33 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var34 = var33.forceFullView == true
		var34 = nil
	else
		var34 = nil
	end
	local var35 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var32) else math.min(getSafeAreaSize(useScreenSize(), useSelector(function(p0) --[[ line: 111 ]]
		return p0.GlobalGuiInset
	end)).X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var36 = if extraProps then extraProps.profileId else nil
	local var37 = useUserProfilesFetch({
		userIds = reactModule.useMemo(function() --[[ line: 123 ]]
			-- upvalues: var36 (ref)
			return if var36 == nil then {} else { var36 }
		end, { var36 }),
		query = userProfilesModule.Queries.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds
	})
	local var38 = if var37.data == nil or var36 == nil then nil else userProfilesModule.Selectors.getCombinedNameFromId(var37.data, var36)
	local var39 = if var37.data == nil or var36 == nil then nil else userProfilesModule.Selectors.getUsernameFromId(var37.data, var36)
	local var40 = useUserMomentsModule(var36)
	local moments = var40.moments
	local hasMore = var40.hasMore
	local loadMore = var40.loadMore
	local var41 = nil
	local var42 = false
	
	if fFlagMomentsProfileGridInfiniteLoad then
		var41 = useLocalization({ feedEndTitle = textKeysModule.MomentsFeedEndTitle })
		var42 = useAppPolicy(function(p1) --[[ line: 148 ]]
			return p1.getEnableContinuousLoad()
		end)
	end
	local var43, var44 = reactModule.useState(nil)
	local var45 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 157 ]]
		-- upvalues: var45 (ref), moments (ref), var36 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not var45.current and #moments > 0 and var36 ~= nil then
			var45.current = true
			fireAnalyticsEvent(eventNames.ProfileScreenImpression, { userId = var36, momentsCount = tostring(#moments) })
		end
	end, { moments, var36 })
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: fFlagProfileMomentsLoadFailureAnalyticsModule (copy), var40 (ref), var36 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not fFlagProfileMomentsLoadFailureAnalyticsModule and var40.hasFailed and var36 ~= nil then
			fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = var36 })
		end
	end, { var40.hasFailed, var36 })
	local var46 = reactModule.useCallback(function() --[[ line: 175 ]]
		-- upvalues: var28 (ref)
		var28.goBack()
	end, { var28.goBack })
	local var47 = reactModule.useCallback(function(p2) --[[ line: 179 ]]
		-- upvalues: moments (ref), var36 (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var26 (copy), var29 (ref), navigateDown (copy), var28 (ref), enumsModule (copy)
		local var57 = moments[p2]
		
		if var57 and var36 then
			local grid = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var57, var36, "grid", p2)
			
			if grid then
				fireAnalyticsEvent(eventNames.ProfileMomentSelected, grid)
			end
		end
		local t = { targetUserId = tonumber(var36) or 0, initialIndex = p2 }
		
		if not fFlagProfileMomentsFeedRootRoute then
			var28.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
			
			return
		end
		local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
		
		if fFlagSignalsNavP3Dispatch then
			var26.down(var26.fromLegacyPage(t_1))
			
			return
		end
		var29(navigateDown(t_1))
	end, { var28, var29, var36, moments })
	local var48 = reactModule.useCallback(function(p3, p4) --[[ line: 209 ]]
		-- upvalues: reactModule (copy), momentGridItemModule (copy), var43 (ref), var36 (ref), var47 (ref), var44 (ref)
		return reactModule.createElement(momentGridItemModule, {
			moment = p3,
			isActive = var43 == p4,
			userId = var36,
			index = p4,
			onActivated = function() --[[ line: 215 ]]
				-- upvalues: var47 (copy), p4 (ref)
				var47(p4)
			end,
			onHoverChanged = function(p5) --[[ line: 218 ]]
				-- upvalues: var44 (copy), p4 (ref)
				var44(function(p6) --[[ line: 219 ]]
					-- upvalues: p5 (ref), p4 (copy)
					return if p5 then p4 elseif p6 == p4 then nil else p6
				end)
			end
		})
	end, { var47, var43, var36 })
	local var49 = reactModule.useCallback(function() --[[ line: 231 ]]
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center grow size-full" })
	end, {})
	local var50 = reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small",
		Size = UDim2.new(1, 0, 0, 56),
		padding = {
			left = UDim.new(0, var31.Padding.Large),
			right = UDim.new(0, var31.Padding.Large)
		}
	}, {
		BackButton = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = chevronLargeLeft,
			size = buttonSize.Medium,
			onActivated = var46
		}),
		User = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "grow",
			Size = UDim2.new(0, 0, 1, 0)
		}, {
			UserTile = reactModule.createElement(userTile, {
				userPresenceType = nil,
				userId = var36 or "",
				title = var38,
				subtitle = if var39 == nil or var39 == "" then nil else `@{var39}`,
				layoutMode = layoutMode.wide,
				avatarSize = UDim2.fromOffset(40, 40),
				titleStyle = var31.Typography.HeadingSmall,
				subtitleStyle = var31.Typography.BodyMedium,
				isTitleLoading = var38 == nil,
				isSubtitleLoading = var39 == nil
			})
		})
	})
	local var51 = reactModule.useMemo(function() --[[ line: 273 ]]
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var52 = if var43 ~= nil then nil else moments[var43]
	local var53 = var52 ~= nil and (var52.metadata.captureType == Enum.CaptureType.Video and (if fFlagProfileMomentsVideoPlaybackFix then useNavigationFocus() else true))
	local var54 = reactModule.createElement(view, {
		tag = "grow size-full-0",
		padding = {
			left = UDim.new(0, var31.Padding.Large),
			right = UDim.new(0, var31.Padding.Large),
			top = UDim.new(0, var31.Padding.Large),
			bottom = UDim.new(0, var31.Padding.Large)
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
			renderItem = var48,
			renderEmptyState = var49,
			shouldShowShowMoreButton = hasMore,
			onShowMoreCallback = loadMore,
			enableInfiniteScroll = if var42 then true else nil,
			footer = if fFlagMomentsProfileGridInfiniteLoad and #moments > 0 then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy padding-large text-body-medium text-align-x-center content-muted",
				Text = var41.feedEndTitle
			}) else nil
		})
	})
	local var55 = if var51 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = if var53 then moments else frozen,
		activeIndex = var43 or 1,
		playbackActive = var53
	}, { Grid = var54 }) else var54
	
	if fFlagAXEnableProfileTab and var34 then
		return reactModule.createElement(view, {
			tag = "col gap-medium size-full padding-top-xlarge",
			backgroundStyle = {
				Color3 = theme.BackgroundDefault.Color,
				Transparency = theme.BackgroundDefault.Transparency
			}
		}, { Header = var50, Grid = var55 })
	elseif var32 then
		local var56 = 56 + var31.Padding.XLarge
		
		return reactModule.createElement(profileModalViewModule, {
			topBarHeight = 56,
			viewWidth = var35,
			navigateBack = var46,
			renderTopBar = function() --[[ line: 357 ]]
				-- upvalues: reactModule (copy), view (copy), var56 (ref), var31 (ref), var50 (ref)
				return reactModule.createElement(view, {
					tag = "col",
					Size = UDim2.new(1, 0, 0, var56),
					padding = { top = UDim.new(0, var31.Padding.XLarge) }
				}, { Header = var50 })
			end,
			renderContent = function() --[[ line: 366 ]]
				-- upvalues: reactModule (copy), view (copy), var56 (ref), var55 (ref)
				return reactModule.createElement(view, {
					tag = "col size-full",
					padding = { top = UDim.new(0, var56) }
				}, { Grid = var55 })
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
			padding = { top = UDim.new(0, var31.Padding.XLarge) }
		}, { Header = var50, Grid = var55 })
	})
end