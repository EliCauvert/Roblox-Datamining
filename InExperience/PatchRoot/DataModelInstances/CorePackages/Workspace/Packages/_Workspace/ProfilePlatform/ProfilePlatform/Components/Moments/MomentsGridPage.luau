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
local var25 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local chevronLargeLeft = foundationModule.Enums.IconName.ChevronLargeLeft
local frozen = table.freeze({})

return function() --[[ line: 91 | named "MomentsGridPage" ]]
	-- upvalues: useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useStyle (ref), useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useUserMomentsModule (ref), fFlagMomentsProfileGridInfiniteLoad (ref), useLocalization (ref), textKeysModule (ref), useAppPolicy (ref), fireAnalyticsEvent (ref), eventNames (ref), makeProfileTileFieldsModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var25 (ref), navigateDown (ref), momentGridItemModule (ref), view (ref), iconButton (ref), chevronLargeLeft (ref), buttonSize (ref), userTile (ref), layoutMode (ref), fFlagProfileMomentsVideoPlaybackFix (ref), useNavigationFocus (ref), foundationModule (ref), scrollingGridView (ref), momentsCarouselMediaProviderModule (ref), frozen (ref), profileModalViewModule (ref), fullscreenPageWithSafeArea (ref)
	local var33
	local var27 = useNavigation()
	local var28 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local extraProps = var27.getParam("extraProps")
	local theme = useStyle().Theme
	local var30 = useTokens()
	local var31 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var32 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var33 = var32.forceFullView == true
		var33 = nil
	else
		var33 = nil
	end
	local var34 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var31) else math.min(getSafeAreaSize(useScreenSize(), useSelector(function(p0) --[[ line: 110 ]]
		return p0.GlobalGuiInset
	end)).X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var35 = if extraProps then extraProps.profileId else nil
	local var36 = useUserProfilesFetch({
		userIds = reactModule.useMemo(function() --[[ line: 122 ]]
			-- upvalues: var35 (ref)
			return if var35 == nil then {} else { var35 }
		end, { var35 }),
		query = userProfilesModule.Queries.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds
	})
	local var37 = if var36.data == nil or var35 == nil then nil else userProfilesModule.Selectors.getCombinedNameFromId(var36.data, var35)
	local var38 = if var36.data == nil or var35 == nil then nil else userProfilesModule.Selectors.getUsernameFromId(var36.data, var35)
	local var39 = useUserMomentsModule(var35)
	local moments = var39.moments
	local hasMore = var39.hasMore
	local loadMore = var39.loadMore
	local var40 = nil
	local var41 = false
	
	if fFlagMomentsProfileGridInfiniteLoad then
		var40 = useLocalization({ feedEndTitle = textKeysModule.MomentsFeedEndTitle })
		var41 = useAppPolicy(function(p1) --[[ line: 147 ]]
			return p1.getEnableContinuousLoad()
		end)
	end
	local var42, var43 = reactModule.useState(nil)
	local var44 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 156 ]]
		-- upvalues: var44 (ref), moments (ref), var35 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not var44.current and #moments > 0 and var35 ~= nil then
			var44.current = true
			fireAnalyticsEvent(eventNames.ProfileScreenImpression, { userId = var35, momentsCount = tostring(#moments) })
		end
	end, { moments, var35 })
	reactModule.useEffect(function() --[[ line: 166 ]]
		-- upvalues: var39 (ref), var35 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var39.hasFailed and var35 ~= nil then
			fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = var35 })
		end
	end, { var39.hasFailed, var35 })
	local var45 = reactModule.useCallback(function() --[[ line: 174 ]]
		-- upvalues: var27 (ref)
		var27.goBack()
	end, { var27.goBack })
	local var46 = reactModule.useCallback(function(p2) --[[ line: 178 ]]
		-- upvalues: moments (ref), var35 (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var25 (copy), var28 (ref), navigateDown (copy), var27 (ref), enumsModule (copy)
		local var56 = moments[p2]
		
		if var56 and var35 then
			local grid = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var56, var35, "grid", p2)
			
			if grid then
				fireAnalyticsEvent(eventNames.ProfileMomentSelected, grid)
			end
		end
		local t = { targetUserId = tonumber(var35) or 0, initialIndex = p2 }
		
		if not fFlagProfileMomentsFeedRootRoute then
			var27.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
			
			return
		end
		local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
		
		if fFlagSignalsNavP3Dispatch then
			var25.down(var25.fromLegacyPage(t_1))
			
			return
		end
		var28(navigateDown(t_1))
	end, { var27, var28, var35, moments })
	local var47 = reactModule.useCallback(function(p3, p4) --[[ line: 208 ]]
		-- upvalues: reactModule (copy), momentGridItemModule (copy), var42 (ref), var35 (ref), var46 (ref), var43 (ref)
		return reactModule.createElement(momentGridItemModule, {
			moment = p3,
			isActive = var42 == p4,
			userId = var35,
			index = p4,
			onActivated = function() --[[ line: 214 ]]
				-- upvalues: var46 (copy), p4 (ref)
				var46(p4)
			end,
			onHoverChanged = function(p5) --[[ line: 217 ]]
				-- upvalues: var43 (copy), p4 (ref)
				var43(function(p6) --[[ line: 218 ]]
					-- upvalues: p5 (ref), p4 (copy)
					return if p5 then p4 elseif p6 == p4 then nil else p6
				end)
			end
		})
	end, { var46, var42, var35 })
	local var48 = reactModule.useCallback(function() --[[ line: 230 ]]
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center grow size-full" })
	end, {})
	local var49 = reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small",
		Size = UDim2.new(1, 0, 0, 56),
		padding = {
			left = UDim.new(0, var30.Padding.Large),
			right = UDim.new(0, var30.Padding.Large)
		}
	}, {
		BackButton = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = chevronLargeLeft,
			size = buttonSize.Medium,
			onActivated = var45
		}),
		User = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "grow",
			Size = UDim2.new(0, 0, 1, 0)
		}, {
			UserTile = reactModule.createElement(userTile, {
				userPresenceType = nil,
				userId = var35 or "",
				title = var37,
				subtitle = if var38 == nil or var38 == "" then nil else `@{var38}`,
				layoutMode = layoutMode.wide,
				avatarSize = UDim2.fromOffset(40, 40),
				titleStyle = var30.Typography.HeadingSmall,
				subtitleStyle = var30.Typography.BodyMedium,
				isTitleLoading = var37 == nil,
				isSubtitleLoading = var38 == nil
			})
		})
	})
	local var50 = reactModule.useMemo(function() --[[ line: 272 ]]
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var51 = if var42 ~= nil then nil else moments[var42]
	local var52 = var51 ~= nil and (var51.metadata.captureType == Enum.CaptureType.Video and (if fFlagProfileMomentsVideoPlaybackFix then useNavigationFocus() else true))
	local var53 = reactModule.createElement(view, {
		tag = "grow size-full-0",
		padding = {
			left = UDim.new(0, var30.Padding.Large),
			right = UDim.new(0, var30.Padding.Large),
			top = UDim.new(0, var30.Padding.Large),
			bottom = UDim.new(0, var30.Padding.Large)
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
			renderItem = var47,
			renderEmptyState = var48,
			shouldShowShowMoreButton = hasMore,
			onShowMoreCallback = loadMore,
			enableInfiniteScroll = if var41 then true else nil,
			footer = if fFlagMomentsProfileGridInfiniteLoad and #moments > 0 then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy padding-large text-body-medium text-align-x-center content-muted",
				Text = var40.feedEndTitle
			}) else nil
		})
	})
	local var54 = if var50 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = if var52 then moments else frozen,
		activeIndex = var42 or 1,
		playbackActive = var52
	}, { Grid = var53 }) else var53
	
	if fFlagAXEnableProfileTab and var33 then
		return reactModule.createElement(view, {
			tag = "col gap-medium size-full padding-top-xlarge",
			backgroundStyle = {
				Color3 = theme.BackgroundDefault.Color,
				Transparency = theme.BackgroundDefault.Transparency
			}
		}, { Header = var49, Grid = var54 })
	elseif var31 then
		local var55 = 56 + var30.Padding.XLarge
		
		return reactModule.createElement(profileModalViewModule, {
			topBarHeight = 56,
			viewWidth = var34,
			navigateBack = var45,
			renderTopBar = function() --[[ line: 356 ]]
				-- upvalues: reactModule (copy), view (copy), var55 (ref), var30 (ref), var49 (ref)
				return reactModule.createElement(view, {
					tag = "col",
					Size = UDim2.new(1, 0, 0, var55),
					padding = { top = UDim.new(0, var30.Padding.XLarge) }
				}, { Header = var49 })
			end,
			renderContent = function() --[[ line: 365 ]]
				-- upvalues: reactModule (copy), view (copy), var55 (ref), var54 (ref)
				return reactModule.createElement(view, {
					tag = "col size-full",
					padding = { top = UDim.new(0, var55) }
				}, { Grid = var54 })
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
			padding = { top = UDim.new(0, var30.Padding.XLarge) }
		}, { Header = var49, Grid = var54 })
	})
end