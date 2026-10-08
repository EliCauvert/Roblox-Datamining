local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local parent = friendsLanding.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local UIBlox = dependenciesModule.UIBlox
local useNavigation = require(parent.Navigation).useNavigation
local useDesignTokens = require(parent.Style).useDesignTokens
local useTokens = require(parent.Foundation).Hooks.useTokens
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local uiMode = require(parent.RobloxAppEnums).UiMode
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.PlayerContextualMenu)
local dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
local useLocalization = require(parent.Localization).Hooks.useLocalization
local collectionGrid = require(parent.CollectionViews).CollectionGrid
local horizontalPageMargin = UIBlox.App.Container.HorizontalPageMargin
local getPageMargin = UIBlox.App.Container.getPageMargin
local convertUserPresenceTypeToString = require(parent.SocialCommon).Utils.convertUserPresenceTypeToString
local useFocusGuiObject = dependenciesModule.useFocusGuiObject
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local friendsLandingAnalyticsModule = require(friendsLanding.FriendsLandingAnalytics)
local refreshScrollingFrame = dependenciesModule.SocialLibraries.Components.RefreshScrollingFrame
local gridMetrics = UIBlox.App.Grid.GridMetrics
local enumScreensModule = require(friendsLanding.EnumScreens)
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local buttonClickEventsModule = require(friendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local constantsModule = require(friendsLanding.Common.Constants)
local useAnimatedScrollToSelection = require(parent.RobloxAppHooks).useAnimatedScrollToSelection
local useSignalState = require(parent.SignalsReact).useSignalState
local displayModule = require(parent.Display)
local useFocusOnMount = require(parent.FocusNavigationUtils).useFocusOnMount
local filterByButtonModule = require(friendsLanding.Components.FilterByButton)
local friendTileModule = require(friendsLanding.Components.FriendTile)
local emptyResultsViewModule = require(friendsLanding.Components.EmptyResultsView)
local noFriendsViewModule = require(friendsLanding.Components.NoFriendsView)
local isFromConnectionsHubModule = require(friendsLanding.Navigator.isFromConnectionsHub)
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local useTextSizeOffset = UIBlox.Core.Style.useTextSizeOffset
local appPage = require(parent.RobloxAppEnums).AppPage
local userListModule = require(parent.UserList)
local userListLayoutAdaptor = userListModule.UserListLayoutAdaptor
local layoutMode = userListModule.Enums.LayoutMode

local var1 = function() end

local fFlagFixScalingOnFriendsLandingModule = require(friendsLanding.Flags.FFlagFixScalingOnFriendsLanding)
local fFlagEnableFriendsLandingFilterChipsOnConsoleModule = require(friendsLanding.Flags.FFlagEnableFriendsLandingFilterChipsOnConsole)
local fFlagFriendsPageUserListCtaEnabledModule = require(friendsLanding.Flags.FFlagFriendsPageUserListCtaEnabled)
local var2 = if fFlagFriendsPageUserListCtaEnabledModule then require(friendsLanding.Common.FriendsLandingCtaConfig) else nil
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagFixCohubUiBugs = require(parent.SharedFlags).FFlagFixCohubUiBugs
local fFlagFriendsPageAlwaysOpenPPV = require(parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local fFlagFriendsPageUserListEnabled = require(parent.SharedFlags).FFlagFriendsPageUserListEnabled
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local fStringIsUserInTcEligibleCountryAmpFeature = require(parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local fStringCanAccessTrustedContactsAmpNameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local fixFriendsLandingRightMargin = game:DefineFastFlag("FixFriendsLandingRightMargin", false)
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), friendsLandingContextModule (ref), friendsLandingAnalyticsModule (ref), useNavigation (ref), useDesignTokens (ref), useUiModeInfo (ref), fFlagFixScalingOnFriendsLandingModule (ref), useTokens (ref), useFocusGuiObject (ref), fFlagFixCohubUiBugs (ref), getPageMargin (ref), useScreenSize (ref), uiMode (ref), fFlagEnableFriendsLandingFilterChipsOnConsoleModule (ref), focusNavigationUtilsModule (ref), inputHandlersModule (ref), appPage (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), useTextSizeOffset (ref), fFlagConnectionManagementChips (ref), ampApiProvider (ref), fStringIsUserInTcEligibleCountryAmpFeature (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), accessResponseEnum (ref), fFlagFriendsPageAlwaysOpenPPV (ref), convertUserPresenceTypeToString (ref), enumScreensModule (ref), buttonClickEventsModule (ref), constantsModule (ref), friendTileModule (ref), dependencyArray (ref), var1 (ref), filterStatesModule (ref), fFlagCreateConnectionsHub (ref), gridMetrics (ref), useAnimatedScrollToSelection (ref), fFlagExtendScrollingFramesBySafeInsets (ref), useSignalState (ref), displayModule (ref), isFromConnectionsHubModule (ref), fFlagLuaAppsDefaultSelection (ref), useFocusOnMount (ref), fFlagFriendsPageUserListEnabled (ref), roactModule (ref), horizontalPageMargin (ref), fixFriendsLandingRightMargin (ref), refreshScrollingFrame (ref), filterByButtonModule (ref), emptyResultsViewModule (ref), noFriendsViewModule (ref), userListLayoutAdaptor (ref), layoutMode (ref), fFlagFriendsPageUserListCtaEnabledModule (ref), var2 (write), collectionGrid (ref), button (ref), buttonType (ref)
	local var3 = useLocalization({
		pageError = "CommonUI.Messages.Response.PageError",
		successText = "Feature.Friends.Action.FriendRemoved",
		errorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		friends = "CommonUI.Features.Label.Friends",
		showMore = "Feature.Friends.Action.ViewMore"
	})
	local var4 = reactModule.useContext(friendsLandingContextModule.Context)
	local var5 = reactModule.useContext(friendsLandingAnalyticsModule.Context)
	local var6 = useNavigation()
	local var7 = useDesignTokens()
	local var8 = useUiModeInfo()
	local var9 = if fFlagFixScalingOnFriendsLandingModule then useTokens() else nil
	local var10 = useFocusGuiObject()
	local var11 = if fFlagFixCohubUiBugs then getPageMargin(useScreenSize().X) else nil
	local var12 = var8.uiMode == uiMode.TenFoot
	local var13 = var12 and not fFlagEnableFriendsLandingFilterChipsOnConsoleModule
	local isCursor = focusNavigationUtilsModule.useLastInputMode() == "Cursor"
	local var14 = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.Search, inputHandlersModule.onRelease(function(p2)
		-- upvalues: var6 (ref), appPage (copy)
		p2:cancel()
		var6.navigate(appPage.UserSearch, { shouldShowUserSearchLandingPage = true })
	end))
	local var15 = useTextSizeOffset()
	local var16 = (if var12 then var7.Size.Size_1600 else var7.Size.Size_2000) + var15 * 3
	local var17 = nil
	local var18 = nil
	
	if fFlagConnectionManagementChips then
		local var19, var20 = reactModule.useState(false)
		var17 = var19
		var18 = var20
	end
	local t, var21
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), fFlagConnectionManagementChips (copy), ampApiProvider (copy), fStringIsUserInTcEligibleCountryAmpFeature (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), accessResponseEnum (copy), var18 (write)
		var5:pageMountingTimeReport()
		
		if fFlagConnectionManagementChips and ampApiProvider.upsellFeatureAccess(fStringIsUserInTcEligibleCountryAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access == accessResponseEnum.Granted then
			var18(true)
		end
	end, {})
	local var22 = if fFlagFriendsPageAlwaysOpenPPV then nil else reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), convertUserPresenceTypeToString (copy)
		return function()
			-- upvalues: var4 (copy), p2 (ref), convertUserPresenceTypeToString (copy)
			var4.openPlayerContextualMenu({
				friendshipOriginSourceType = nil,
				subjectUserId = p2.id,
				robloxFriendshipStatus = Enum.FriendStatus.Friend,
				subjectPresence = {
					locationString = p2.lastLocation,
					locationPlaceId = p2.placeId,
					locationRootPlaceId = p2.rootPlaceId,
					locationUniverseId = p2.universeId,
					status = convertUserPresenceTypeToString(p2.userPresenceType)
				}
			})
		end
	end, { var4.openPlayerContextualMenu })
	local var23 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: fFlagFriendsPageAlwaysOpenPPV (copy), var12 (ref), var22 (ref), var5 (ref), enumScreensModule (copy), buttonClickEventsModule (copy), var4 (ref), constantsModule (copy)
		if fFlagFriendsPageAlwaysOpenPPV or not var12 or not var22 then
			var5:navigate(enumScreensModule.ViewUserProfile)
			var5:buttonClick(buttonClickEventsModule.PlayerTile, {
				subpage = "peekView",
				page = "playerProfile",
				friendId = p2,
				position = p3 - 1
			})
			var4.openProfilePeekView(p2, { source = constantsModule.FriendsLandingPageSourceName })
			
			return
		end
		return var22(p4)()
	end, { var5, var22, var12 })
	
	local var24 = function()
		-- upvalues: var5 (ref)
		var5:pageLoadingTimeReport()
	end
	
	local var25 = reactModule.useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), friendTileModule (copy), var23 (ref), var24 (ref), p1 (ref), var10 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p3
		}, {
			tile = reactModule.createElement(friendTileModule, {
				user = p2,
				index = p3,
				openPlayerProfileHandle = var23,
				pageLoadingTimeReport = var24,
				selected = p3 == p1.selectedItemIndex,
				focusGuiObject = var10
			})
		}), "FriendTile"
	end, { p1.selectedItemIndex, var12, var23 })
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (write)
		return p2 + var16
	end, dependencyArray(var16, var15))
	local var27 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), buttonClickEventsModule (copy), var6 (ref), enumScreensModule (copy), var1 (copy), p1 (ref)
		var5:buttonClick(buttonClickEventsModule.FriendFilterPill)
		var6.navigate(enumScreensModule.FilterByModal, {
			onFewestInteractionsSelection = var1,
			friendCount = p1.totalFriendCount
		})
	end, dependencyArray(var6, var5))
	local var28 = if fFlagConnectionManagementChips then reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), buttonClickEventsModule (copy), var4 (ref)
		var5:buttonClick(buttonClickEventsModule.FriendFilterPill)
		var4.setFilterKeys(p2)
	end, dependencyArray(var5, var4.setFilterKeys)) else nil
	local var29 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var4 (ref), filterStatesModule (copy), var3 (ref)
		var5:pageLoaded()
		var4.setFilterKeys(filterStatesModule.All)
		
		return var4.refreshPage({
			errorMessage = var3.pageError,
			onResolve = function()
				-- upvalues: var5 (copy)
				var5:pageLoadedWithArgs()
			end
		})
	end, dependencyArray(var4.refreshPage, var3, var5, var4.setFilterKeys))
	local var30 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), buttonClickEventsModule (copy), enumScreensModule (copy), fFlagCreateConnectionsHub (copy), var6 (ref), appPage (copy)
		var5:buttonClick(buttonClickEventsModule.AddFriendsNoFriendsEmptyView)
		var5:navigate(enumScreensModule.AddFriends)
		
		if fFlagCreateConnectionsHub then
			var6.navigate(appPage.CoHubAddConnections)
			
			return
		end
		var6.navigate(appPage.AddFriendsPage)
	end, dependencyArray(var5, var6))
	local var31 = if p1.friends then #p1.friends else 0
	local totalFriendCount = p1.totalFriendCount or 0
	local var32 = totalFriendCount == 0
	local var33 = var31 == 0 and totalFriendCount > 0
	local var34 = p1.fetchMoreFriends and (not var32 and (not var33 and (not var4.filter or var4.filter == filterStatesModule.All)))
	local var35 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.fetchMoreFriends then
			p1.fetchMoreFriends()
		end
	end, { p1.fetchMoreFriends })
	local var36 = if var12 then 24 else 12
	local var37, var38 = reactModule.useState(100)
	local _ = nil
	local _ = nil
	
	if var12 then
		t = var7.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
		var21 = var7.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	else
		t = {
			minimumItemsPerRow = 2,
			minimumItemWidth = if fFlagFixScalingOnFriendsLandingModule then 176 * var9.Config.UI.Scale else 176
		}
		var21 = 12
	end
	local var39 = reactModule.useMemo(function()
		-- upvalues: gridMetrics (copy), t (write)
		return gridMetrics.makeCustomMetricsGetter(t)
	end, { t })
	local var40 = reactModule.useMemo(function()
		-- upvalues: var39 (ref), var37 (ref), var21 (write)
		return var39(var37, var21)
	end, { var39 })
	local var41 = reactModule.useCallback(function(p2)
		-- upvalues: var38 (ref)
		var38(p2.X)
	end, {})
	local var42 = reactModule.useRef({})
	local var43, var44 = useAnimatedScrollToSelection(Enum.ScrollingDirection.Y, 0, var7.Size.Size_2000, var7.LuaApps.App.Page.ScrollAnimationConfig)
	local _ = nil
	local var45 = if not var12 then if var32 or var33 or isCursor then 8 else 1000 else 8
	local var46 = if fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	var45 += if fFlagExtendScrollingFramesBySafeInsets then var46.bottom else 0
	local var47 = fFlagCreateConnectionsHub and isFromConnectionsHubModule(var6)
	
	return reactModule.createElement("Frame", {
		[roactModule.Ref] = var14,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if var47 then nil else var7.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = if var47 then 1 else var7.LuaApps.App.Page.BackgroundTransparency
	}, {
		HorizontalPageMargin = reactModule.createElement(horizontalPageMargin, { backgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = if fFlagFixCohubUiBugs then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var11),
				PaddingRight = if fixFriendsLandingRightMargin then UDim.new(0, var11) else nil
			}) else nil,
			scrollView = reactModule.createElement(refreshScrollingFrame, {
				scrollingElementProps = {
					Size = UDim2.new(1, 0, 1, -constantsModule.TOP_BAR_HEIGHT + (if fFlagExtendScrollingFramesBySafeInsets then var46.bottom else 0)),
					BackgroundTransparency = 1,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarThickness = 0,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.XY,
					CanvasPosition = var43,
					[roactModule.Event.SelectionChanged] = var44,
					Selectable = false
				},
				[roactModule.Ref] = var42,
				refresh = var29,
				usesBuilderIcon = true
			}, {
				UISizeConstraint = if fFlagFriendsPageUserListEnabled then reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 1e999) }) else nil,
				layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				pulldownSpacing = reactModule.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 1)
				}) or nil,
				filterByButton = if var13 then nil else reactModule.createElement(filterByButtonModule, {
					layoutOrder = 2,
					analytics = var5,
					filter = var4.filter,
					friendCount = if var4.filter == filterStatesModule.All then totalFriendCount else var31,
					isDisabled = totalFriendCount == 0,
					onActivated = if fFlagConnectionManagementChips then var28 else var27,
					maxWidth = if fFlagConnectionManagementChips then 640 else nil,
					canAccessTrustedContacts = if fFlagConnectionManagementChips then var17 else nil
				}),
				NoResultsView = if var33 then reactModule.createElement(emptyResultsViewModule, { layoutOrder = 6 }) else nil,
				NoFriendsView = if var32 then reactModule.createElement(noFriendsViewModule, {
					layoutOrder = 6,
					pageLoadingTimeReport = var24,
					openAddFriendsPage = var30
				}) else nil,
				UserListLayoutAdaptor = if not fFlagFriendsPageUserListEnabled then if var33 or var32 then nil else reactModule.createElement(userListLayoutAdaptor, {
					layoutOrder = 6,
					isScrollEnabled = false,
					layoutMode = layoutMode.Vertical,
					header = { title = var3.peopleYouMayKnow },
					entities = p1.friends,
					renderRow = if fFlagFriendsPageUserListEnabled then reactModule.useCallback(function(p2, p3, p4)
						-- upvalues: reactModule (copy), friendTileModule (copy), var23 (ref), var24 (ref)
						return reactModule.createElement(friendTileModule, {
							user = p3,
							createRow = p2,
							index = p4,
							openPlayerProfileHandle = var23,
							pageLoadingTimeReport = var24
						})
					end, { var24, var23 }) else nil,
					ctaConfig = if fFlagFriendsPageUserListCtaEnabledModule then var2 else nil,
					hasMore = var34,
					onLoadMore = var35
				}) else nil,
				FriendsGridView = if fFlagFriendsPageUserListEnabled then nil elseif var33 or var32 then nil else reactModule.createElement(collectionGrid, {
					LayoutOrder = 6,
					containerRef = if fFlagLuaAppsDefaultSelection then if fFlagLuaAppsDefaultSelection then useFocusOnMount() else nil else nil,
					items = p1.friends,
					verticalScrollingFrameRef = var42,
					renderItem = var25,
					getItemHeight = var26,
					numColumns = var40.itemsPerRow,
					columnGap = var21,
					verticalPadding = var36,
					onContainerSizeChanged = var41
				}),
				showMoreFrame = if fFlagFriendsPageUserListEnabled then nil elseif var34 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 7,
					Size = UDim2.new(1, 0, 0, constantsModule.CTA_BUTTON_HEIGHT)
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 2),
						PaddingRight = UDim.new(0, 2),
						PaddingTop = UDim.new(0, 10)
					}),
					showMoreButton = reactModule.createElement(button, {
						buttonType = buttonType.Secondary,
						size = UDim2.new(1, 0, 1, 0),
						onActivated = var35,
						text = var3.showMore
					})
				}) else nil,
				additionalPadding = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 8,
					Size = UDim2.new(1, 0, 0, var45)
				})
			})
		})
	})
end