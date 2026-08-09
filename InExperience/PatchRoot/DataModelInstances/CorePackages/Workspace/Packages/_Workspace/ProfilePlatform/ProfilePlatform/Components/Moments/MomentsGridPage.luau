local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local appBloxModule = require(parent.AppBlox)
local inputUiModule = require(parent.InputUi)
local navigationModule = require(parent.Navigation)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local analytics = momentsCommonModule.Analytics
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local eventNames = analytics.EventNames
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
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagSwitchProfileWidthHookToSocialCommon = sharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local fFlagProfileMomentsVideoPlaybackFix = sharedFlagsModule.FFlagProfileMomentsVideoPlaybackFix
local fFlagAXEnableProfileTab = sharedFlagsModule.FFlagAXEnableProfileTab
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local chevronLargeLeft = foundationModule.Enums.IconName.ChevronLargeLeft
local frozen = table.freeze({})

return function() --[[ line: 75 | named "MomentsGridPage" ]]
	-- upvalues: useNavigation (ref), useStyle (ref), useTokens (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useUserMomentsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), momentGridItemModule (ref), view (ref), iconButton (ref), chevronLargeLeft (ref), buttonSize (ref), userTile (ref), layoutMode (ref), fFlagProfileMomentsVideoPlaybackFix (ref), useNavigationFocus (ref), scrollingGridView (ref), momentsCarouselMediaProviderModule (ref), frozen (ref), profileModalViewModule (ref), fullscreenPageWithSafeArea (ref)
	local var27
	local var22 = useNavigation()
	local extraProps = var22.getParam("extraProps")
	local theme = useStyle().Theme
	local var24 = useTokens()
	local var25 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var26 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var27 = var26.forceFullView == true
		var27 = nil
	else
		var27 = nil
	end
	local var28 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var25) else math.min(getSafeAreaSize(useScreenSize(), useSelector(function(p0) --[[ line: 93 ]]
		return p0.GlobalGuiInset
	end)).X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var29 = if extraProps then extraProps.profileId else nil
	local var30 = useUserProfilesFetch({
		userIds = reactModule.useMemo(function() --[[ line: 105 ]]
			-- upvalues: var29 (ref)
			return if var29 == nil then {} else { var29 }
		end, { var29 }),
		query = userProfilesModule.Queries.userProfilesCombinedNameUsernameAndIsVerifiedByUserIds
	})
	local var31 = if var30.data == nil or var29 == nil then nil else userProfilesModule.Selectors.getCombinedNameFromId(var30.data, var29)
	local var32 = if var30.data == nil or var29 == nil then nil else userProfilesModule.Selectors.getUsernameFromId(var30.data, var29)
	local var33 = useUserMomentsModule(var29)
	local moments = var33.moments
	local hasMore = var33.hasMore
	local loadMore = var33.loadMore
	local var34, var35 = reactModule.useState(nil)
	local var36 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 127 ]]
		-- upvalues: var36 (ref), moments (ref), var29 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if not var36.current and #moments > 0 and var29 ~= nil then
			var36.current = true
			fireAnalyticsEvent(eventNames.ProfileScreenImpression, { userId = var29, momentsCount = tostring(#moments) })
		end
	end, { moments, var29 })
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: var33 (ref), var29 (ref), fireAnalyticsEvent (copy), eventNames (copy)
		if var33.hasFailed and var29 ~= nil then
			fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = var29 })
		end
	end, { var33.hasFailed, var29 })
	local var37 = reactModule.useCallback(function() --[[ line: 145 ]]
		-- upvalues: var22 (ref)
		var22.goBack()
	end, { var22.goBack })
	local var38 = reactModule.useCallback(function(p1) --[[ line: 149 ]]
		-- upvalues: moments (ref), var29 (ref), fireAnalyticsEvent (copy), eventNames (copy), var22 (ref), enumsModule (copy)
		local var48 = moments[p1]
		
		if var48 and var29 then
			local recommendationMetadata = var48.recommendationMetadata
			fireAnalyticsEvent(eventNames.ProfileMomentSelected, {
				userId = var29,
				itemId = if recommendationMetadata then recommendationMetadata.itemId or "" else "",
				gridIndex = tostring(p1)
			})
		end
		var22.navigate(enumsModule.Screens.MomentsFeed, {
			extraProps = { targetUserId = tonumber(var29) or 0, initialIndex = p1 }
		})
	end, { var22, var29, moments })
	local var39 = reactModule.useCallback(function(p2, p3) --[[ line: 167 ]]
		-- upvalues: reactModule (copy), momentGridItemModule (copy), var34 (ref), var29 (ref), var38 (ref), var35 (ref)
		return reactModule.createElement(momentGridItemModule, {
			moment = p2,
			isActive = var34 == p3,
			userId = var29,
			index = p3,
			onActivated = function() --[[ line: 173 ]]
				-- upvalues: var38 (copy), p3 (ref)
				var38(p3)
			end,
			onHoverChanged = function(p4) --[[ line: 176 ]]
				-- upvalues: var35 (copy), p3 (ref)
				var35(function(p5) --[[ line: 177 ]]
					-- upvalues: p4 (ref), p3 (copy)
					return if p4 then p3 elseif p5 == p3 then nil else p5
				end)
			end
		})
	end, { var38, var34, var29 })
	local var40 = reactModule.useCallback(function() --[[ line: 189 ]]
		-- upvalues: reactModule (copy), view (copy)
		return reactModule.createElement(view, { tag = "col align-x-center align-y-center grow size-full" })
	end, {})
	local var41 = reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-small",
		Size = UDim2.new(1, 0, 0, 56),
		padding = {
			left = UDim.new(0, var24.Padding.Large),
			right = UDim.new(0, var24.Padding.Large)
		}
	}, {
		BackButton = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = chevronLargeLeft,
			size = buttonSize.Medium,
			onActivated = var37
		}),
		User = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "grow",
			Size = UDim2.new(0, 0, 1, 0)
		}, {
			UserTile = reactModule.createElement(userTile, {
				userPresenceType = nil,
				userId = var29 or "",
				title = var31,
				subtitle = if var32 == nil or var32 == "" then nil else `@{var32}`,
				layoutMode = layoutMode.wide,
				avatarSize = UDim2.fromOffset(40, 40),
				titleStyle = var24.Typography.HeadingSmall,
				subtitleStyle = var24.Typography.BodyMedium,
				isTitleLoading = var31 == nil,
				isSubtitleLoading = var32 == nil
			})
		})
	})
	local var42 = reactModule.useMemo(function() --[[ line: 231 ]]
		-- upvalues: moments (ref)
		for i, v in moments do
			if v.metadata.captureType == Enum.CaptureType.Video then
				return true
			end
		end
		return false
	end, { moments })
	local var43 = if var34 ~= nil then nil else moments[var34]
	local var44 = var43 ~= nil and (var43.metadata.captureType == Enum.CaptureType.Video and (if fFlagProfileMomentsVideoPlaybackFix then useNavigationFocus() else true))
	local var45 = reactModule.createElement(view, {
		tag = "grow size-full-0",
		padding = {
			left = UDim.new(0, var24.Padding.Large),
			right = UDim.new(0, var24.Padding.Large),
			top = UDim.new(0, var24.Padding.Large),
			bottom = UDim.new(0, var24.Padding.Large)
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
			renderItem = var39,
			renderEmptyState = var40,
			shouldShowShowMoreButton = hasMore,
			onShowMoreCallback = loadMore
		})
	})
	local var46 = if var42 then reactModule.createElement(momentsCarouselMediaProviderModule, {
		moments = if var44 then moments else frozen,
		activeIndex = var34 or 1,
		playbackActive = var44
	}, { Grid = var45 }) else var45
	
	if fFlagAXEnableProfileTab and var27 then
		return reactModule.createElement(view, {
			tag = "col gap-medium size-full padding-top-xlarge",
			backgroundStyle = {
				Color3 = theme.BackgroundDefault.Color,
				Transparency = theme.BackgroundDefault.Transparency
			}
		}, { Header = var41, Grid = var46 })
	elseif var25 then
		local var47 = 56 + var24.Padding.XLarge
		
		return reactModule.createElement(profileModalViewModule, {
			topBarHeight = 56,
			viewWidth = var28,
			navigateBack = var37,
			renderTopBar = function() --[[ line: 306 ]]
				-- upvalues: reactModule (copy), view (copy), var47 (ref), var24 (ref), var41 (ref)
				return reactModule.createElement(view, {
					tag = "col",
					Size = UDim2.new(1, 0, 0, var47),
					padding = { top = UDim.new(0, var24.Padding.XLarge) }
				}, { Header = var41 })
			end,
			renderContent = function() --[[ line: 315 ]]
				-- upvalues: reactModule (copy), view (copy), var47 (ref), var46 (ref)
				return reactModule.createElement(view, {
					tag = "col size-full",
					padding = { top = UDim.new(0, var47) }
				}, { Grid = var46 })
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
			padding = { top = UDim.new(0, var24.Padding.XLarge) }
		}, { Header = var41, Grid = var46 })
	})
end