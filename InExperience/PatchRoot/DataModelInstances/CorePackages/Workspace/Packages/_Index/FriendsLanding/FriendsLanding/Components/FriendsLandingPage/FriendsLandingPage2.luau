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
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
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
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagFixCohubUiBugs = require(parent.SharedFlags).FFlagFixCohubUiBugs
local fFlagFriendsPageAlwaysOpenPPV = require(parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local fFlagFriendsPageUserListEnabled = require(parent.SharedFlags).FFlagFriendsPageUserListEnabled
local fFlagFriendsPageUnifiedOpenProfileLogic = require(parent.SharedFlags).FFlagFriendsPageUnifiedOpenProfileLogic
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local fStringIsUserInTcEligibleCountryAmpFeature = require(parent.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature
local fStringCanAccessTrustedContactsAmpNameSpace = require(parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local fixSearchYNavigation = game:DefineFastFlag("FixSearchYNavigation", false)
local fixFriendsLandingRightMargin = game:DefineFastFlag("FixFriendsLandingRightMargin", false)
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection
local fFlagAddFriendsPageCapitalization = require(parent.SharedFlags).FFlagAddFriendsPageCapitalization

return function(p1)
	-- upvalues: useLocalization (ref), fFlagAddFriendsPageCapitalization (ref), reactModule (ref), friendsLandingContextModule (ref), friendsLandingAnalyticsModule (ref), useNavigation (ref), useDesignTokens (ref), useUiModeInfo (ref), fFlagFixScalingOnFriendsLandingModule (ref), useTokens (ref), useFocusGuiObject (ref), fFlagFixCohubUiBugs (ref), getPageMargin (ref), useScreenSize (ref), uiMode (ref), focusNavigationUtilsModule (ref), inputHandlersModule (ref), fixSearchYNavigation (ref), fFlagEnableLeftNavOnConsole (ref), appPage (ref), robloxAppEnumsModule (ref), enumScreensModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), useTextSizeOffset (ref), fFlagConnectionManagementChips (ref), ampApiProvider (ref), fStringIsUserInTcEligibleCountryAmpFeature (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), accessResponseEnum (ref), fFlagFriendsPageAlwaysOpenPPV (ref), convertUserPresenceTypeToString (ref), buttonClickEventsModule (ref), constantsModule (ref), fFlagFriendsPageUserListEnabled (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), friendTileModule (ref), dependencyArray (ref), var1 (ref), filterStatesModule (ref), fFlagCreateConnectionsHub (ref), gridMetrics (ref), useAnimatedScrollToSelection (ref), fFlagExtendScrollingFramesBySafeInsets (ref), useSignalState (ref), displayModule (ref), isFromConnectionsHubModule (ref), fFlagLuaAppsDefaultSelection (ref), useFocusOnMount (ref), roactModule (ref), horizontalPageMargin (ref), fixFriendsLandingRightMargin (ref), refreshScrollingFrame (ref), filterByButtonModule (ref), emptyResultsViewModule (ref), noFriendsViewModule (ref), userListLayoutAdaptor (ref), layoutMode (ref), collectionGrid (ref), button (ref), buttonType (ref)
	local var2 = useLocalization({
		pageError = "CommonUI.Messages.Response.PageError",
		successText = "Feature.Friends.Action.FriendRemoved",
		errorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		friends = "CommonUI.Features.Label.Friends",
		showMore = if fFlagAddFriendsPageCapitalization then "Feature.Friends.Action.ViewMore" else "Feature.Avatar.Action.ShowMore"
	})
	local var3 = reactModule.useContext(friendsLandingContextModule.Context)
	local var4 = reactModule.useContext(friendsLandingAnalyticsModule.Context)
	local var5 = useNavigation()
	local navigateToLuaAppPages = var3.navigateToLuaAppPages
	local var6 = useDesignTokens()
	local var7 = useUiModeInfo()
	local var8 = if fFlagFixScalingOnFriendsLandingModule then useTokens() else nil
	local var9 = useFocusGuiObject()
	local var10 = if fFlagFixCohubUiBugs then getPageMargin(useScreenSize().X) else nil
	local var11 = var7.uiMode == uiMode.TenFoot
	local isCursor = focusNavigationUtilsModule.useLastInputMode() == "Cursor"
	local var12 = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.Search, inputHandlersModule.onRelease(function(p2)
		-- upvalues: fixSearchYNavigation (copy), var11 (ref), fFlagEnableLeftNavOnConsole (copy), var5 (ref), appPage (copy), robloxAppEnumsModule (copy), navigateToLuaAppPages (ref), enumScreensModule (copy)
		p2:cancel()
		
		if not fixSearchYNavigation then
			navigateToLuaAppPages[enumScreensModule.SearchPage]()
			
			return
		elseif var11 and not fFlagEnableLeftNavOnConsole then
			var5.navigate(appPage.SearchPage, {
				defaultSearchType = robloxAppEnumsModule.SearchTypes.Players
			})
			
			return
		end
		var5.navigate(appPage.UserSearch, { shouldShowUserSearchLandingPage = true })
	end))
	local var13 = useTextSizeOffset()
	local var14 = (if var11 then var6.Size.Size_1600 else var6.Size.Size_2000) + var13 * 3
	local var15 = nil
	local var16 = nil
	
	if fFlagConnectionManagementChips then
		local var17, var18 = reactModule.useState(false)
		var15 = var17
		var16 = var18
	end
	local t, var19
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), fFlagConnectionManagementChips (copy), ampApiProvider (copy), fStringIsUserInTcEligibleCountryAmpFeature (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), accessResponseEnum (copy), var16 (write)
		var4:pageMountingTimeReport()
		
		if fFlagConnectionManagementChips and ampApiProvider.upsellFeatureAccess(fStringIsUserInTcEligibleCountryAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access == accessResponseEnum.Granted then
			var16(true)
		end
	end, {})
	local var20 = if fFlagFriendsPageAlwaysOpenPPV then nil else reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), convertUserPresenceTypeToString (copy)
		return function()
			-- upvalues: var3 (copy), p2 (ref), convertUserPresenceTypeToString (copy)
			var3.openPlayerContextualMenu({
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
	end, { var3.openPlayerContextualMenu })
	local var21 = reactModule.useCallback(function(p2, p3, _, _, _)
		-- upvalues: var4 (ref), enumScreensModule (copy), buttonClickEventsModule (copy), var3 (ref), constantsModule (copy)
		return function()
			-- upvalues: var4 (copy), enumScreensModule (copy), buttonClickEventsModule (copy), p2 (ref), p3 (ref), var3 (copy), constantsModule (copy)
			var4:navigate(enumScreensModule.ViewUserProfile)
			var4:buttonClick(buttonClickEventsModule.PlayerTile, {
				subpage = "peekView",
				page = "playerProfile",
				friendId = p2,
				position = p3 - 1
			})
			var3.openProfilePeekView(p2, { source = constantsModule.FriendsLandingPageSourceName })
		end
	end, { var4, var3.openProfilePeekView })
	local var22 = if fFlagFriendsPageUserListEnabled or fFlagFriendsPageUnifiedOpenProfileLogic then reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: fFlagFriendsPageAlwaysOpenPPV (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), var11 (ref), var20 (ref), var4 (ref), enumScreensModule (copy), buttonClickEventsModule (copy), var3 (ref), constantsModule (copy)
		if fFlagFriendsPageAlwaysOpenPPV or not fFlagFriendsPageUnifiedOpenProfileLogic or (not var11 or not var20) then
			var4:navigate(enumScreensModule.ViewUserProfile)
			var4:buttonClick(buttonClickEventsModule.PlayerTile, {
				subpage = "peekView",
				page = "playerProfile",
				friendId = p2,
				position = p3 - 1
			})
			var3.openProfilePeekView(p2, { source = constantsModule.FriendsLandingPageSourceName })
			
			return
		end
		return var20(p4)()
	end, {
		var4,
		if fFlagFriendsPageUnifiedOpenProfileLogic then var20 else nil,
		if fFlagFriendsPageUnifiedOpenProfileLogic then var11 else nil
	}) else nil
	
	local var23 = function()
		-- upvalues: var4 (ref)
		var4:pageLoadingTimeReport()
	end
	
	local var24 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), enumScreensModule (copy), var2 (ref)
		return function()
			-- upvalues: var5 (copy), enumScreensModule (copy), var2 (copy)
			var5.navigate(enumScreensModule.GenericToast, {
				toastProps = { toastContent = { toastTitle = var2.errorText } }
			})
		end
	end, { var5, var2 })
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), friendTileModule (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), fFlagFriendsPageAlwaysOpenPPV (copy), var21 (ref), var11 (ref), var20 (ref), var24 (ref), var22 (ref), var23 (ref), p1 (ref), var9 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p3
		}, {
			tile = reactModule.createElement(friendTileModule, {
				user = p2,
				index = p3,
				openPlayerProfile = if fFlagFriendsPageUnifiedOpenProfileLogic then nil elseif fFlagFriendsPageAlwaysOpenPPV then var21 elseif var11 then if var20 == nil then var24 else var20 else var21,
				openPlayerProfileHandle = if fFlagFriendsPageUnifiedOpenProfileLogic then var22 else nil,
				isPlayerContextualMenuEnabled = if fFlagFriendsPageUnifiedOpenProfileLogic then nil else var11,
				pageLoadingTimeReport = var23,
				selected = p3 == p1.selectedItemIndex,
				focusGuiObject = var9
			})
		}), "FriendTile"
	end, {
		p1.selectedItemIndex,
		var11,
		if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else var20,
		var21,
		if fFlagFriendsPageUnifiedOpenProfileLogic then var22 else nil
	})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var14 (write)
		return p2 + var14
	end, dependencyArray(var14, var13))
	local var26 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), buttonClickEventsModule (copy), var5 (ref), enumScreensModule (copy), var1 (copy), p1 (ref)
		var4:buttonClick(buttonClickEventsModule.FriendFilterPill)
		var5.navigate(enumScreensModule.FilterByModal, {
			onFewestInteractionsSelection = var1,
			friendCount = p1.totalFriendCount
		})
	end, dependencyArray(var5, var4))
	local var27 = if fFlagConnectionManagementChips then reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), buttonClickEventsModule (copy), var3 (ref)
		var4:buttonClick(buttonClickEventsModule.FriendFilterPill)
		var3.setFilterKeys(p2)
	end, dependencyArray(var4, var3.setFilterKeys)) else nil
	local var28 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var3 (ref), filterStatesModule (copy), var2 (ref)
		var4:pageLoaded()
		var3.setFilterKeys(filterStatesModule.All)
		
		return var3.refreshPage({
			errorMessage = var2.pageError,
			onResolve = function()
				-- upvalues: var4 (copy)
				var4:pageLoadedWithArgs()
			end
		})
	end, dependencyArray(var3.refreshPage, var2, var4, var3.setFilterKeys))
	local var29 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), buttonClickEventsModule (copy), enumScreensModule (copy), fFlagCreateConnectionsHub (copy), var5 (ref), appPage (copy)
		var4:buttonClick(buttonClickEventsModule.AddFriendsNoFriendsEmptyView)
		var4:navigate(enumScreensModule.AddFriends)
		
		if fFlagCreateConnectionsHub then
			var5.navigate(appPage.CoHubAddConnections)
			
			return
		end
		var5.navigate(appPage.AddFriendsPage)
	end, dependencyArray(var4, var5))
	local var30 = if p1.friends then #p1.friends else 0
	local totalFriendCount = p1.totalFriendCount or 0
	local var31 = totalFriendCount == 0
	local var32 = var30 == 0 and totalFriendCount > 0
	local var33 = p1.fetchMoreFriends and (not var31 and (not var32 and (not var3.filter or var3.filter == filterStatesModule.All)))
	local var34 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.fetchMoreFriends then
			p1.fetchMoreFriends()
		end
	end, { p1.fetchMoreFriends })
	local var35 = if var11 then 24 else 12
	local var36, var37 = reactModule.useState(100)
	local _ = nil
	local _ = nil
	
	if var11 then
		t = var6.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
		var19 = var6.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	else
		t = {
			minimumItemsPerRow = 2,
			minimumItemWidth = if fFlagFixScalingOnFriendsLandingModule then 176 * var8.Config.UI.Scale else 176
		}
		var19 = 12
	end
	local var38 = reactModule.useMemo(function()
		-- upvalues: gridMetrics (copy), t (write)
		return gridMetrics.makeCustomMetricsGetter(t)
	end, { t })
	local var39 = reactModule.useMemo(function()
		-- upvalues: var38 (ref), var36 (ref), var19 (write)
		return var38(var36, var19)
	end, { var38 })
	local var40 = reactModule.useCallback(function(p2)
		-- upvalues: var37 (ref)
		var37(p2.X)
	end, {})
	local var41 = reactModule.useRef({})
	local var42, var43 = useAnimatedScrollToSelection(Enum.ScrollingDirection.Y, 0, var6.Size.Size_2000, var6.LuaApps.App.Page.ScrollAnimationConfig)
	local _ = nil
	local var44 = if not var11 then if var31 or var32 or isCursor then 8 else 1000 else 8
	local var45 = if fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	var44 += if fFlagExtendScrollingFramesBySafeInsets then var45.bottom else 0
	local var46 = fFlagCreateConnectionsHub and isFromConnectionsHubModule(var5)
	
	return reactModule.createElement("Frame", {
		[roactModule.Ref] = var12,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if var46 then nil else var6.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = if var46 then 1 else var6.LuaApps.App.Page.BackgroundTransparency
	}, {
		HorizontalPageMargin = reactModule.createElement(horizontalPageMargin, { backgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = if fFlagFixCohubUiBugs then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var10),
				PaddingRight = if fixFriendsLandingRightMargin then UDim.new(0, var10) else nil
			}) else nil,
			scrollView = reactModule.createElement(refreshScrollingFrame, {
				scrollingElementProps = {
					Size = UDim2.new(1, 0, 1, -constantsModule.TOP_BAR_HEIGHT + (if fFlagExtendScrollingFramesBySafeInsets then var45.bottom else 0)),
					BackgroundTransparency = 1,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarThickness = 0,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.XY,
					CanvasPosition = var42,
					[roactModule.Event.SelectionChanged] = var43,
					Selectable = if fFlagEnableLeftNavOnConsole then false else nil
				},
				[roactModule.Ref] = var41,
				refresh = var28,
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
				filterByButton = if var11 then nil else reactModule.createElement(filterByButtonModule, {
					layoutOrder = 2,
					analytics = var4,
					filter = var3.filter,
					friendCount = if var3.filter == filterStatesModule.All then totalFriendCount else var30,
					isDisabled = totalFriendCount == 0,
					onActivated = if fFlagConnectionManagementChips then var27 else var26,
					maxWidth = if fFlagConnectionManagementChips then 640 else nil,
					canAccessTrustedContacts = if fFlagConnectionManagementChips then var15 else nil
				}),
				NoResultsView = if var32 then reactModule.createElement(emptyResultsViewModule, { layoutOrder = 6 }) else nil,
				NoFriendsView = if var31 then reactModule.createElement(noFriendsViewModule, {
					layoutOrder = 6,
					pageLoadingTimeReport = var23,
					openAddFriendsPage = var29
				}) else nil,
				UserListLayoutAdaptor = if not fFlagFriendsPageUserListEnabled then if var32 or var31 then nil else reactModule.createElement(userListLayoutAdaptor, {
					layoutOrder = 6,
					isScrollEnabled = false,
					layoutMode = layoutMode.Vertical,
					header = { title = var2.peopleYouMayKnow },
					entities = p1.friends,
					renderRow = if fFlagFriendsPageUserListEnabled then reactModule.useCallback(function(p2, p3, p4)
						-- upvalues: reactModule (copy), friendTileModule (copy), var22 (ref), var23 (ref)
						return reactModule.createElement(friendTileModule, {
							isPlayerContextualMenuEnabled = nil,
							user = p3,
							createRow = p2,
							index = p4,
							openPlayerProfileHandle = var22,
							pageLoadingTimeReport = var23
						})
					end, { var23, var22 }) else nil,
					hasMore = var33,
					onLoadMore = var34
				}) else nil,
				FriendsGridView = if fFlagFriendsPageUserListEnabled then nil elseif var32 or var31 then nil else reactModule.createElement(collectionGrid, {
					LayoutOrder = 6,
					containerRef = if fFlagLuaAppsDefaultSelection then if fFlagLuaAppsDefaultSelection then useFocusOnMount() else nil else nil,
					items = p1.friends,
					verticalScrollingFrameRef = var41,
					renderItem = useCallback,
					getItemHeight = var25,
					numColumns = var39.itemsPerRow,
					columnGap = var19,
					verticalPadding = var35,
					onContainerSizeChanged = var40
				}),
				showMoreFrame = if fFlagFriendsPageUserListEnabled then nil elseif var33 then reactModule.createElement("Frame", {
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
						onActivated = var34,
						text = var2.showMore
					})
				}) else nil,
				additionalPadding = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 8,
					Size = UDim2.new(1, 0, 0, var44)
				})
			})
		})
	})
end