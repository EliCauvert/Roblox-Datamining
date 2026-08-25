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

local var21 = function() end

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

return function(p0)
	-- upvalues: useLocalization (ref), fFlagAddFriendsPageCapitalization (ref), reactModule (ref), friendsLandingContextModule (ref), friendsLandingAnalyticsModule (ref), useNavigation (ref), useDesignTokens (ref), useUiModeInfo (ref), fFlagFixScalingOnFriendsLandingModule (ref), useTokens (ref), useFocusGuiObject (ref), fFlagFixCohubUiBugs (ref), getPageMargin (ref), useScreenSize (ref), uiMode (ref), focusNavigationUtilsModule (ref), inputHandlersModule (ref), fixSearchYNavigation (ref), fFlagEnableLeftNavOnConsole (ref), appPage (ref), robloxAppEnumsModule (ref), enumScreensModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), useTextSizeOffset (ref), fFlagConnectionManagementChips (ref), ampApiProvider (ref), fStringIsUserInTcEligibleCountryAmpFeature (ref), fStringCanAccessTrustedContactsAmpNameSpace (ref), accessResponseEnum (ref), fFlagFriendsPageAlwaysOpenPPV (ref), convertUserPresenceTypeToString (ref), buttonClickEventsModule (ref), constantsModule (ref), fFlagFriendsPageUserListEnabled (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), friendTileModule (ref), dependencyArray (ref), var21 (ref), filterStatesModule (ref), fFlagCreateConnectionsHub (ref), gridMetrics (ref), useAnimatedScrollToSelection (ref), fFlagExtendScrollingFramesBySafeInsets (ref), useSignalState (ref), displayModule (ref), isFromConnectionsHubModule (ref), fFlagLuaAppsDefaultSelection (ref), useFocusOnMount (ref), roactModule (ref), horizontalPageMargin (ref), fixFriendsLandingRightMargin (ref), refreshScrollingFrame (ref), filterByButtonModule (ref), emptyResultsViewModule (ref), noFriendsViewModule (ref), userListLayoutAdaptor (ref), layoutMode (ref), collectionGrid (ref), button (ref), buttonType (ref)
	local var25 = useLocalization({
		pageError = "CommonUI.Messages.Response.PageError",
		successText = "Feature.Friends.Action.FriendRemoved",
		errorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		friends = "CommonUI.Features.Label.Friends",
		showMore = if fFlagAddFriendsPageCapitalization then "Feature.Friends.Action.ViewMore" else "Feature.Avatar.Action.ShowMore"
	})
	local var26 = reactModule.useContext(friendsLandingContextModule.Context)
	local var27 = reactModule.useContext(friendsLandingAnalyticsModule.Context)
	local var28 = useNavigation()
	local navigateToLuaAppPages = var26.navigateToLuaAppPages
	local var29 = useDesignTokens()
	local var30 = useUiModeInfo()
	local var31 = if fFlagFixScalingOnFriendsLandingModule then useTokens() else nil
	local var32 = useFocusGuiObject()
	local var33 = if fFlagFixCohubUiBugs then getPageMargin(useScreenSize().X) else nil
	local var34 = var30.uiMode == uiMode.TenFoot
	local isCursor = focusNavigationUtilsModule.useLastInputMode() == "Cursor"
	local var36 = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.Search, inputHandlersModule.onRelease(function(p1)
		-- upvalues: fixSearchYNavigation (copy), var34 (ref), fFlagEnableLeftNavOnConsole (copy), var28 (ref), appPage (copy), robloxAppEnumsModule (copy), navigateToLuaAppPages (ref), enumScreensModule (copy)
		p1:cancel()
		
		if not fixSearchYNavigation then
			navigateToLuaAppPages[enumScreensModule.SearchPage]()
			
			return
		elseif var34 and not fFlagEnableLeftNavOnConsole then
			var28.navigate(appPage.SearchPage, {
				defaultSearchType = robloxAppEnumsModule.SearchTypes.Players
			})
			
			return
		end
		var28.navigate(appPage.UserSearch, { shouldShowUserSearchLandingPage = true })
	end))
	local var37 = useTextSizeOffset()
	local var38 = (if var34 then var29.Size.Size_1600 else var29.Size.Size_2000) + var37 * 3
	local var39 = nil
	local var40 = nil
	
	if fFlagConnectionManagementChips then
		local var41, var42 = reactModule.useState(false)
		var39 = var41
		var40 = var42
	end
	local t, var63
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), fFlagConnectionManagementChips (copy), ampApiProvider (copy), fStringIsUserInTcEligibleCountryAmpFeature (copy), fStringCanAccessTrustedContactsAmpNameSpace (copy), accessResponseEnum (copy), var40 (write)
		var27:pageMountingTimeReport()
		
		if fFlagConnectionManagementChips and ampApiProvider.upsellFeatureAccess(fStringIsUserInTcEligibleCountryAmpFeature, {}, fStringCanAccessTrustedContactsAmpNameSpace).access == accessResponseEnum.Granted then
			var40(true)
		end
	end, {})
	local var43 = if fFlagFriendsPageAlwaysOpenPPV then nil else reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref), convertUserPresenceTypeToString (copy)
		return function()
			-- upvalues: var26 (copy), p2 (ref), convertUserPresenceTypeToString (copy)
			var26.openPlayerContextualMenu({
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
	end, { var26.openPlayerContextualMenu })
	local var44 = reactModule.useCallback(function(p3, p4, _, _, _)
		-- upvalues: var27 (ref), enumScreensModule (copy), buttonClickEventsModule (copy), var26 (ref), constantsModule (copy)
		return function()
			-- upvalues: var27 (copy), enumScreensModule (copy), buttonClickEventsModule (copy), p3 (ref), p4 (ref), var26 (copy), constantsModule (copy)
			var27:navigate(enumScreensModule.ViewUserProfile)
			var27:buttonClick(buttonClickEventsModule.PlayerTile, {
				subpage = "peekView",
				page = "playerProfile",
				friendId = p3,
				position = p4 - 1
			})
			var26.openProfilePeekView(p3, { source = constantsModule.FriendsLandingPageSourceName })
		end
	end, { var27, var26.openProfilePeekView })
	local var45 = if fFlagFriendsPageUserListEnabled or fFlagFriendsPageUnifiedOpenProfileLogic then reactModule.useCallback(function(p5, p6, p7)
		-- upvalues: fFlagFriendsPageAlwaysOpenPPV (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), var34 (ref), var43 (ref), var27 (ref), enumScreensModule (copy), buttonClickEventsModule (copy), var26 (ref), constantsModule (copy)
		if fFlagFriendsPageAlwaysOpenPPV or not fFlagFriendsPageUnifiedOpenProfileLogic or (not var34 or not var43) then
			var27:navigate(enumScreensModule.ViewUserProfile)
			var27:buttonClick(buttonClickEventsModule.PlayerTile, {
				subpage = "peekView",
				page = "playerProfile",
				friendId = p5,
				position = p6 - 1
			})
			var26.openProfilePeekView(p5, { source = constantsModule.FriendsLandingPageSourceName })
			
			return
		end
		return var43(p7)()
	end, {
		var27,
		if fFlagFriendsPageUnifiedOpenProfileLogic then var43 else nil,
		if fFlagFriendsPageUnifiedOpenProfileLogic then var34 else nil
	}) else nil
	
	local var46 = function()
		-- upvalues: var27 (ref)
		var27:pageLoadingTimeReport()
	end
	
	local var47 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), enumScreensModule (copy), var25 (ref)
		return function()
			-- upvalues: var28 (copy), enumScreensModule (copy), var25 (copy)
			var28.navigate(enumScreensModule.GenericToast, {
				toastProps = { toastContent = { toastTitle = var25.errorText } }
			})
		end
	end, { var28, var25 })
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function(p8, p9)
		-- upvalues: reactModule (copy), friendTileModule (copy), fFlagFriendsPageUnifiedOpenProfileLogic (copy), fFlagFriendsPageAlwaysOpenPPV (copy), var44 (ref), var34 (ref), var43 (ref), var47 (ref), var45 (ref), var46 (ref), p0 (ref), var32 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p9
		}, {
			tile = reactModule.createElement(friendTileModule, {
				user = p8,
				index = p9,
				openPlayerProfile = if fFlagFriendsPageUnifiedOpenProfileLogic then nil elseif fFlagFriendsPageAlwaysOpenPPV then var44 elseif var34 then if var43 == nil then var47 else var43 else var44,
				openPlayerProfileHandle = if fFlagFriendsPageUnifiedOpenProfileLogic then var45 else nil,
				isPlayerContextualMenuEnabled = if fFlagFriendsPageUnifiedOpenProfileLogic then nil else var34,
				pageLoadingTimeReport = var46,
				selected = p9 == p0.selectedItemIndex,
				focusGuiObject = var32
			})
		}), "FriendTile"
	end, {
		p0.selectedItemIndex,
		var34,
		if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else var43,
		var44,
		if fFlagFriendsPageUnifiedOpenProfileLogic then var45 else nil
	})
	local var48 = reactModule.useCallback(function(p10)
		-- upvalues: var38 (write)
		return p10 + var38
	end, dependencyArray(var38, var37))
	local var49 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), buttonClickEventsModule (copy), var28 (ref), enumScreensModule (copy), var21 (copy), p0 (ref)
		var27:buttonClick(buttonClickEventsModule.FriendFilterPill)
		var28.navigate(enumScreensModule.FilterByModal, {
			onFewestInteractionsSelection = var21,
			friendCount = p0.totalFriendCount
		})
	end, dependencyArray(var28, var27))
	local var50 = if fFlagConnectionManagementChips then reactModule.useCallback(function(p11)
		-- upvalues: var27 (ref), buttonClickEventsModule (copy), var26 (ref)
		var27:buttonClick(buttonClickEventsModule.FriendFilterPill)
		var26.setFilterKeys(p11)
	end, dependencyArray(var27, var26.setFilterKeys)) else nil
	local var51 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var26 (ref), filterStatesModule (copy), var25 (ref)
		var27:pageLoaded()
		var26.setFilterKeys(filterStatesModule.All)
		
		return var26.refreshPage({
			errorMessage = var25.pageError,
			onResolve = function()
				-- upvalues: var27 (copy)
				var27:pageLoadedWithArgs()
			end
		})
	end, dependencyArray(var26.refreshPage, var25, var27, var26.setFilterKeys))
	local var52 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), buttonClickEventsModule (copy), enumScreensModule (copy), fFlagCreateConnectionsHub (copy), var28 (ref), appPage (copy)
		var27:buttonClick(buttonClickEventsModule.AddFriendsNoFriendsEmptyView)
		var27:navigate(enumScreensModule.AddFriends)
		
		if fFlagCreateConnectionsHub then
			var28.navigate(appPage.CoHubAddConnections)
			
			return
		end
		var28.navigate(appPage.AddFriendsPage)
	end, dependencyArray(var27, var28))
	local var53 = if p0.friends then #p0.friends else 0
	local totalFriendCount = p0.totalFriendCount or 0
	local var55 = totalFriendCount == 0
	local var56 = var53 == 0 and totalFriendCount > 0
	local var57 = p0.fetchMoreFriends and (not var55 and (not var56 and (not var26.filter or var26.filter == filterStatesModule.All)))
	local var58 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		if p0.fetchMoreFriends then
			p0.fetchMoreFriends()
		end
	end, { p0.fetchMoreFriends })
	local var59 = if var34 then 24 else 12
	local var60, var61 = reactModule.useState(100)
	local _ = nil
	local _ = nil
	
	if var34 then
		t = var29.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
		var63 = var29.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	else
		t = {
			minimumItemsPerRow = 2,
			minimumItemWidth = if fFlagFixScalingOnFriendsLandingModule then 176 * var31.Config.UI.Scale else 176
		}
		var63 = 12
	end
	local var64 = reactModule.useMemo(function()
		-- upvalues: gridMetrics (copy), t (write)
		return gridMetrics.makeCustomMetricsGetter(t)
	end, { t })
	local var65 = reactModule.useMemo(function()
		-- upvalues: var64 (ref), var60 (ref), var63 (write)
		return var64(var60, var63)
	end, { var64 })
	local var66 = reactModule.useCallback(function(p12)
		-- upvalues: var61 (ref)
		var61(p12.X)
	end, {})
	local var67 = reactModule.useRef({})
	local var68, var69 = useAnimatedScrollToSelection(Enum.ScrollingDirection.Y, 0, var29.Size.Size_2000, var29.LuaApps.App.Page.ScrollAnimationConfig)
	local _ = nil
	local var70 = if not var34 then if var55 or var56 or isCursor then 8 else 1000 else 8
	local var71 = if fFlagExtendScrollingFramesBySafeInsets then useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding) else nil
	var70 += if fFlagExtendScrollingFramesBySafeInsets then var71.bottom else 0
	local var72 = fFlagCreateConnectionsHub and isFromConnectionsHubModule(var28)
	
	return reactModule.createElement("Frame", {
		[roactModule.Ref] = var36,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = if var72 then nil else var29.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = if var72 then 1 else var29.LuaApps.App.Page.BackgroundTransparency
	}, {
		HorizontalPageMargin = reactModule.createElement(horizontalPageMargin, { backgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Padding = if fFlagFixCohubUiBugs then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var33),
				PaddingRight = if fixFriendsLandingRightMargin then UDim.new(0, var33) else nil
			}) else nil,
			scrollView = reactModule.createElement(refreshScrollingFrame, {
				scrollingElementProps = {
					Size = UDim2.new(1, 0, 1, -constantsModule.TOP_BAR_HEIGHT + (if fFlagExtendScrollingFramesBySafeInsets then var71.bottom else 0)),
					BackgroundTransparency = 1,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarThickness = 0,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.XY,
					CanvasPosition = var68,
					[roactModule.Event.SelectionChanged] = var69,
					Selectable = if fFlagEnableLeftNavOnConsole then false else nil
				},
				[roactModule.Ref] = var67,
				refresh = var51,
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
				filterByButton = if var34 then nil else reactModule.createElement(filterByButtonModule, {
					layoutOrder = 2,
					analytics = var27,
					filter = var26.filter,
					friendCount = if var26.filter == filterStatesModule.All then totalFriendCount else var53,
					isDisabled = totalFriendCount == 0,
					onActivated = if fFlagConnectionManagementChips then var50 else var49,
					maxWidth = if fFlagConnectionManagementChips then 640 else nil,
					canAccessTrustedContacts = if fFlagConnectionManagementChips then var39 else nil
				}),
				NoResultsView = if var56 then reactModule.createElement(emptyResultsViewModule, { layoutOrder = 6 }) else nil,
				NoFriendsView = if var55 then reactModule.createElement(noFriendsViewModule, {
					layoutOrder = 6,
					pageLoadingTimeReport = var46,
					openAddFriendsPage = var52
				}) else nil,
				UserListLayoutAdaptor = if not fFlagFriendsPageUserListEnabled then if var56 or var55 then nil else reactModule.createElement(userListLayoutAdaptor, {
					layoutOrder = 6,
					isScrollEnabled = false,
					layoutMode = layoutMode.Vertical,
					header = { title = var25.peopleYouMayKnow },
					entities = p0.friends,
					renderRow = if fFlagFriendsPageUserListEnabled then reactModule.useCallback(function(p13, p14, p15)
						-- upvalues: reactModule (copy), friendTileModule (copy), var45 (ref), var46 (ref)
						return reactModule.createElement(friendTileModule, {
							isPlayerContextualMenuEnabled = nil,
							user = p14,
							createRow = p13,
							index = p15,
							openPlayerProfileHandle = var45,
							pageLoadingTimeReport = var46
						})
					end, { var46, var45 }) else nil,
					hasMore = var57,
					onLoadMore = var58
				}) else nil,
				FriendsGridView = if fFlagFriendsPageUserListEnabled then nil elseif var56 or var55 then nil else reactModule.createElement(collectionGrid, {
					LayoutOrder = 6,
					containerRef = if fFlagLuaAppsDefaultSelection then if fFlagLuaAppsDefaultSelection then useFocusOnMount() else nil else nil,
					items = p0.friends,
					verticalScrollingFrameRef = var67,
					renderItem = useCallback,
					getItemHeight = var48,
					numColumns = var65.itemsPerRow,
					columnGap = var63,
					verticalPadding = var59,
					onContainerSizeChanged = var66
				}),
				showMoreFrame = if fFlagFriendsPageUserListEnabled then nil elseif var57 then reactModule.createElement("Frame", {
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
						onActivated = var58,
						text = var25.showMore
					})
				}) else nil,
				additionalPadding = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 8,
					Size = UDim2.new(1, 0, 0, var70)
				})
			})
		})
	})
end