local SocialTab = script:FindFirstAncestor("SocialTab")
local Parent = SocialTab.Parent
local DependenciesModule = require(SocialTab.dependencies)
local LoggerModule = require(SocialTab.Logger)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local MemoizeFunction = DependenciesModule.memoize
local RoactAppExperiment = DependenciesModule.RoactAppExperiment
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local ChatEntryPointNames = DependenciesModule.SocialCommon.Enums.ChatEntryPointNames
local DefaultMetricsGridView = UIBlox.App.Grid.DefaultMetricsGridView
local GridMetrics = UIBlox.App.Grid.GridMetrics
local HorizontalPageMargin = UIBlox.App.Container.HorizontalPageMargin
local HeaderBar = UIBlox.App.Bar.HeaderBar
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local Promise = DependenciesModule.Promise
local UserSearchBarButton = require(Parent.SocialCommon).Components.UserSearchBar.UserSearchBarButton
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local Components = script:FindFirstAncestor("Components")
local ChatTileModule = require(Components.ChatTile)
local GroupsTileModule = require(Components.GroupsTile)
local ProfileEntryModule = require(Components.ProfileEntry)
local RefreshScrollingFrame = DependenciesModule.SocialLibraries.Components.RefreshScrollingFrame
local EntryPoints = DependenciesModule.DiscoverabilityModal.Analytics.EntryPoints
local GetFStringSocialConnectTabLayerFunction = require(Parent.SharedFlags).getFStringSocialConnectTabLayer
local YOffset = 24
local YOffset1 = 22
local EnumScreensModule = require(SocialTab.EnumScreens)
local StreamNotificationsBellIcon = DependenciesModule.StreamNotifications.StreamNotificationsBellIcon
local SocialTabPage = Roact.PureComponent:extend("SocialTabPage")
SocialTabPage.TileCellSize = {
	Wide = UDim2.fromOffset(176, 176),
	Compact = UDim2.fromOffset(158, 158)
}
SocialTabPage.TileHorizontalAlignment = {
	Wide = Enum.HorizontalAlignment.Left,
	Compact = Enum.HorizontalAlignment.Center
}
SocialTabPage.defaultProps = {
	topBarHeight = 56,
	navigation = nil,
	wideMode = false,
	unreadConversationCount = 0,
	numberOfNotifications = 0,
	enableDisplayNamePolicy = false,
	socialText = "[LOCALIZE] TITLE",
	chatsText = "[LOCALIZE] CHATS",
	groupsText = "[LOCALIZE] GROUPS",
	shouldShowGroupsTilePolicy = false,
	enableNotificationsPolicy = false,
	disableWebViewSupport = false,
	localUser = {},
	renderUserCarousel = function(Frame)
		-- upvalues: Roact (copy)
		return Roact.createElement("TextLabel", {
			Text = "User Carousel PlaceHolder",
			Size = UDim2.new(1, 0, 0, 40),
			LayoutOrder = Frame.LayoutOrder
		})
	end,
	refreshPageData = function()
		-- upvalues: Promise (copy)
		return Promise.resolve()
	end,
	enteredChatFromEntryPoint = function() end
}
SocialTabPage.validateProps = T.interface({
	topBarHeight = T.optional(T.number),
	showTopBar = T.optional(T.boolean),
	analytics = T.table,
	wideMode = T.optional(T.boolean),
	navigateToLuaAppPages = T.optional(T.table),
	navigation = T.optional(T.table),
	localUser = require(SocialTab.User).validateUser,
	enableDisplayNamePolicy = T.optional(T.boolean),
	enableNotificationsPolicy = T.optional(T.boolean),
	renderUserCarousel = T.callback,
	socialText = T.optional(T.string),
	chatsText = T.optional(T.string),
	groupsText = T.optional(T.string),
	numberOfNotifications = T.optional(T.number),
	unreadConversationCount = T.optional(T.number),
	refreshPageData = T.optional(T.callback),
	shouldShowGroupsTilePolicy = T.optional(T.boolean),
	luaAddFriendsPageEnabled = T.optional(T.boolean),
	isLuaProfilePageEnabled = T.optional(T.boolean),
	replaceSearchEntry = T.optional(T.boolean),
	enteredChatFromEntryPoint = T.optional(T.callback)
})

function SocialTabPage.init(p1)
	-- upvalues: YOffset (ref), YOffset1 (ref), LoggerModule (copy), ChatEntryPointNames (copy), EnumScreensModule (copy), Sources (copy), EntryPoints (copy), FormFactor (copy), MemoizeFunction (copy), Roact (copy), StreamNotificationsBellIcon (copy), IconButton (copy), Images (copy), ChatTileModule (copy), GroupsTileModule (copy)
	if p1.props.replaceSearchEntry then
		YOffset = 16
		YOffset1 = 16
	end
	p1.gridButtons = p1:getGridItems()
	
	function p1.goToChat()
		-- upvalues: LoggerModule (upval), p1 (copy), ChatEntryPointNames (upval), EnumScreensModule (upval)
		LoggerModule:info("Going to Chats")
		p1.props.analytics:buttonClick("Chats")
		p1.props.analytics:navigate("Chats")
		p1.props.enteredChatFromEntryPoint(ChatEntryPointNames.SocialTab)
		p1.props.navigation.navigate(EnumScreensModule.RoactChat)
	end
	
	function p1.goToGroups()
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Going to Groups")
		p1.props.analytics:buttonClick("Groups")
		p1.props.analytics:navigate("Groups")
		p1.props.navigateToLuaAppPages[EnumScreensModule.Groups]()
	end
	
	function p1.goToUserProfile()
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval), Sources (upval), EntryPoints (upval)
		LoggerModule:info("Going to User Profile")
		p1.props.analytics:buttonClick("LoggedInUserIdentity")
		p1.props.analytics:navigate("LoggedInUserIdentity")
		
		if p1.props.isPhoneVerified and p1.props.isDiscoverabilityUnset then
			p1.props.navigateToLuaAppPages[EnumScreensModule.DiscoverabilityModal]({
				isStandaloneDiscoverabilityModal = true,
				showToast = p1.props.showToast,
				openLearnMoreLink = p1.props.openLearnMoreLink,
				navigateOnActivated = function()
					-- upvalues: p1 (upval), EnumScreensModule (upval), Sources (upval)
					p1.props.navigateToLuaAppPages[EnumScreensModule.ViewUserProfile](p1.props.localUser.id, { profilePeekViewProps = { source = Sources.SocialTab } })
				end,
				entryPoint = EntryPoints.SocialTabProfile,
				onClose = p1.props.closeCentralOverlay
			})
			
			return
		else
			p1.props.navigateToLuaAppPages[EnumScreensModule.ViewUserProfile](p1.props.localUser.id, { profilePeekViewProps = { source = Sources.SocialTab } })
		end
	end
	
	function p1.goToFriendsLanding()
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		if p1.props.navigatingFromSocialTabEvent then
			p1.props.navigatingFromSocialTabEvent(EnumScreensModule.FriendsLanding)
		end
		p1.props.navigateToFriendsPage()
	end
	
	function p1.goToAddFriends()
		-- upvalues: p1 (copy)
		p1.props.navigateToAddFriendsPage()
	end
	
	function p1.goToUserSearch()
		-- upvalues: p1 (copy), FormFactor (upval)
		p1.props.analytics:buttonClick("peopleSearchBar", {
			formFactor = p1.props.wideMode and FormFactor.WIDE or FormFactor.COMPACT
		})
		p1.props.analytics:openPlayerSearch()
		p1.props.navigateToUserSearch()
	end
	
	p1.renderTopBarButtons = MemoizeFunction(function(NotificationCount, _)
		-- upvalues: Roact (upval), StreamNotificationsBellIcon (upval), p1 (copy), IconButton (upval), Images (upval), LoggerModule (upval), EnumScreensModule (upval)
		local function _()
			-- upvalues: Roact (upval), StreamNotificationsBellIcon (upval), NotificationCount (copy), p1 (upval)
			return Roact.createElement(StreamNotificationsBellIcon, {
				layoutOrder = 3,
				notificationCount = NotificationCount,
				compactWidth = not p1.props.wideMode
			})
		end
		
		local Element = nil
		Element = if p1.props.enableNotificationsPolicy then Roact.createElement(StreamNotificationsBellIcon, {
			layoutOrder = 3,
			notificationCount = NotificationCount,
			compactWidth = not p1.props.wideMode
		}) else nil
		
		return if p1.props.disableWebViewSupport then function()
			-- upvalues: Roact (upval)
			return Roact.createFragment({})
		end else function()
			-- upvalues: Roact (upval), p1 (upval), IconButton (upval), Images (upval), LoggerModule (upval), EnumScreensModule (upval), Element (ref)
			return Roact.createFragment({
				filter = if p1.props.replaceSearchEntry then nil else Roact.createElement(IconButton, {
					layoutOrder = 1,
					size = UDim2.fromOffset(0, 0),
					icon = Images["icons/common/search"],
					onActivated = function()
						-- upvalues: LoggerModule (upval), p1 (upval), EnumScreensModule (upval)
						LoggerModule:info("Going to AddFriends")
						p1.props.analytics:buttonClick("SearchFriends")
						p1.props.analytics:navigate("SearchFriends")
						p1.props.navigateToLuaAppPages[EnumScreensModule.AddFriends]()
					end
				}),
				notifications = Element
			})
		end
	end)
	p1.renderButtonGridItem = MemoizeFunction(function(UnreadConversationCount)
		-- upvalues: Roact (upval), ChatTileModule (upval), p1 (copy), GroupsTileModule (upval)
		return function(p2, LayoutOrder)
			-- upvalues: Roact (upval), ChatTileModule (upval), UnreadConversationCount (copy), p1 (upval), GroupsTileModule (upval)
			return if p2 == "Chats" then Roact.createElement(ChatTileModule, {
				unreadConversationCount = UnreadConversationCount,
				LayoutOrder = LayoutOrder,
				title = p1.props.chatsText,
				onActivated = p1.goToChat
			}) elseif p2 == "Groups" then Roact.createElement(GroupsTileModule, {
				LayoutOrder = LayoutOrder,
				title = p1.props.groupsText,
				onActivated = p1.goToGroups
			}) else nil
		end
	end)
	
	function p1.getButtonGridItemHeight(p2)
		return p2
	end
	
	p1.contentHeight, p1.updateContentHeight = Roact.createBinding(0)
end

function SocialTabPage.getGridItems(p1)
	local List = { "Chats" }
	
	if p1.props.shouldShowGroupsTilePolicy and not p1.props.disableWebViewSupport then
		table.insert(List, "Groups")
	end
	return List
end

function SocialTabPage.render(p1)
	-- upvalues: UIBlox (copy), Roact (copy), HeaderBar (copy), UserSearchBarButton (copy), RefreshScrollingFrame (copy), HorizontalPageMargin (copy), YOffset (ref), ProfileEntryModule (copy), YOffset1 (ref), DefaultMetricsGridView (copy), GridMetrics (copy)
	return UIBlox.Style.withStyle(function(_)
		-- upvalues: Roact (upval), p1 (copy), HeaderBar (upval), UserSearchBarButton (upval), RefreshScrollingFrame (upval), HorizontalPageMargin (upval), YOffset (upval), ProfileEntryModule (upval), YOffset1 (upval), DefaultMetricsGridView (upval), GridMetrics (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			layout = Roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			topBar = Roact.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, if p1.props.replaceSearchEntry then p1.props.topBarHeight + 48 else p1.props.topBarHeight)
			}, {
				UIListLayout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Header = Roact.createElement(HeaderBar, {
					barHeight = p1.props.topBarHeight,
					title = p1.props.socialText,
					renderRight = p1.renderTopBarButtons(p1.props.numberOfNotifications, p1.props.enableNotificationsPolicy)
				}),
				UserSearchBarButton = if p1.props.replaceSearchEntry then Roact.createElement(UserSearchBarButton, { onActivated = p1.goToUserSearch }) else nil
			}),
			gridFrame = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				ScrollView = Roact.createElement(RefreshScrollingFrame, {
					usesBuilderIcon = true,
					scrollingElementProps = {
						ScrollBarThickness = 0,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, if p1.props.replaceSearchEntry then -(p1.props.topBarHeight + 48) else -p1.props.topBarHeight),
						CanvasSize = UDim2.new(1, 0, 1, if p1.props.replaceSearchEntry then -(p1.props.topBarHeight + 48) + 1 else -p1.props.topBarHeight + 1),
						AutomaticCanvasSize = Enum.AutomaticSize.XY,
						ScrollingDirection = Enum.ScrollingDirection.Y
					},
					refresh = p1.props.refreshPageData
				}, {
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					pageMargin = Roact.createElement(HorizontalPageMargin, {
						useAutomaticSizing = true,
						layoutOrder = 1,
						backgroundTransparency = 1,
						size = UDim2.new(1, 0, 0, 0)
					}, {
						Layout = Roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						spacerTopBar = Roact.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, YOffset)
						}),
						profileEntry = Roact.createElement(ProfileEntryModule, {
							layoutOrder = 2,
							userText = p1.props.enableDisplayNamePolicy and p1.props.localUser.displayName or p1.props.localUser.username,
							avatarImage = p1.props.localUser.thumbnail,
							isPremium = p1.props.localUser.isPremium,
							isRobloxSubscriber = p1.props.localUser.isRobloxSubscriber,
							navigateToLuaAppPages = p1.props.navigateToLuaAppPages,
							hasVerifiedBadge = p1.props.localUser.hasVerifiedBadge,
							onActivated = p1.goToUserProfile
						}),
						spacerProfile = Roact.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, YOffset1)
						}),
						friendsCarousel = p1.props.renderUserCarousel({
							LayoutOrder = 4,
							wideMode = p1.props.wideMode,
							navigateToLuaAppPages = p1.props.navigateToLuaAppPages,
							goToFriendsLanding = p1.goToFriendsLanding,
							goToAddFriends = p1.goToAddFriends,
							luaAddFriendsPageEnabled = p1.props.luaAddFriendsPageEnabled
						}),
						spacerFriends = Roact.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 5,
							Size = UDim2.new(1, 0, 0, 36)
						}),
						buttonGrid = Roact.createElement(DefaultMetricsGridView, {
							LayoutOrder = 6,
							renderItem = p1.renderButtonGridItem(p1.props.unreadConversationCount),
							getItemHeight = p1.getButtonGridItemHeight,
							getItemMetrics = GridMetrics.getMediumMetrics,
							itemPadding = Vector2.new(12, 12),
							items = p1.gridButtons
						})
					})
				})
			})
		})
	end)
end

function SocialTabPage.didMount(p1)
	-- upvalues: LoggerModule (copy)
	LoggerModule:info("SocialTabPage mounted")
	p1.props.analytics:pageLoaded()
end

return (RoactAppExperiment.connectUserLayer({ GetFStringSocialConnectTabLayerFunction() }, function(p1, _)
	-- upvalues: GetFStringSocialConnectTabLayerFunction (copy)
	return {
		replaceSearchEntry = (p1[GetFStringSocialConnectTabLayerFunction()] or {}).replace_search_entry
	}
end)(SocialTabPage))