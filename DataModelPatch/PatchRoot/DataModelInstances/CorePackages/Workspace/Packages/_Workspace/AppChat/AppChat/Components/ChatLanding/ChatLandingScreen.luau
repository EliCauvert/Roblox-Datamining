local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ConstantsModule = require(AppChat.Constants)
local EnumScreensModule = require(AppChat.EnumScreens)
local SnoozeToastNotificationsButtonModule = require(AppChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local TopBarProviderModule = require(AppChat.TopBarProvider)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local SearchTopBarModule = require(script.Parent.SearchTopBar)
local ChatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local LoggerModule = require(script.Parent.Logger)
local GetCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local ChatSearchBoxModule = require(script.Parent.ChatSearchBox)
local CheckAndOpenChatPushUpsellModule = require(script.Parent.CheckAndOpenChatPushUpsell)
local WithTelemetryModule = require(AppChat.Telemetry.withTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEventsModule = require(script.Parent.ChatLandingTelemetryEvents)
local ResetForSquadLobbyForCompactModeModule = require(AppChat.Utils.resetForSquadLobbyForCompactMode)
local StreamNotificationsBellIcon = require(Parent.StreamNotifications).StreamNotificationsBellIcon
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local FFlagStreamNotificationBellEntryPoint = require(Parent.SharedFlags).FFlagStreamNotificationBellEntryPoint
local GetFFlagEnableAppChatInExperienceFunction = require(Parent.SharedFlags).GetFFlagEnableAppChatInExperience
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local GetFFlagEnablePushNotificationsUpsellModalChatFunction = require(Parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModalChat
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagEnableHeaderBarButtonsUpdate = require(Parent.SharedFlags).FFlagEnableHeaderBarButtonsUpdate
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatDomLocatorFoundationMigrationModule = require(AppChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local ChatLandingScreen = RoactModule.PureComponent:extend("ChatLandingScreen")
ChatLandingScreen.defaultProps = { navigation = nil }

local function RenderCenter()
	-- upvalues: RoactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ArgCheckModule (copy), WithLocalizationFunction (copy), SearchTopBarModule (copy)
	return RoactModule.createElement(TopBarProviderModule, {
		screenName = EnumScreensModule.ChatLanding,
		render = function(p1)
			-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), RoactModule (upval), SearchTopBarModule (upval)
			local ScreenTopBar = p1.getScreenTopBar(EnumScreensModule.ChatLanding)
			ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
			
			return WithLocalizationFunction({
				searchPlaceholderText = "Feature.Chat.Label.SearchWord",
				cancelText = "Feature.Chat.Action.Cancel"
			})(function(p2)
				-- upvalues: RoactModule (upval), SearchTopBarModule (upval), ScreenTopBar (copy), p1 (copy), EnumScreensModule (upval)
				return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					filterBox = RoactModule.createElement(SearchTopBarModule, {
						initialInputText = ScreenTopBar.filterText,
						cancelText = p2.cancelText,
						searchPlaceholderText = p2.searchPlaceholderText,
						captureFocusOnMount = ScreenTopBar.shouldAutoFocusCenter,
						onSelectCallback = ScreenTopBar.closeInputBar or function() end,
						resetOnMount = function()
							-- upvalues: p1 (upval), EnumScreensModule (upval)
							p1.setScreenTopBar(EnumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
						end,
						cancelCallback = function()
							-- upvalues: p1 (upval), EnumScreensModule (upval)
							p1.setScreenTopBar(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
						end,
						textChangedCallback = function(FilterText)
							-- upvalues: p1 (upval), EnumScreensModule (upval)
							p1.setScreenTopBar(EnumScreensModule.ChatLanding, { filterText = FilterText })
						end
					})
				})
			end)
		end
	})
end

function ChatLandingScreen.navigationOptions(p1)
	-- upvalues: ConstantsModule (copy), GetFFlagEnableAppChatInExperienceFunction (copy), FFlagEnableHeaderBarButtonsUpdate (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), GetFFlagIsSquadEnabledFunction (copy), FFlagAppChatTopBarConfigDrivenModule (copy), RenderCenter (copy), WithTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), RoactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ArgCheckModule (copy), FoundationModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ChatLandingTelemetryEventsModule (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), SnoozeToastNotificationsButtonModule (copy), FFlagAppChatDomLocatorFoundationMigrationModule (copy), IconButton (copy), Images (copy)
	local Navigation = p1.navigation
	local NavigateToRootStackScreenProps = Navigation.getScreenProps("navigateToRootStack", nil)
	local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
	local IconButtonWidth = ConstantsModule:GetIconButtonWidth(WideModeScreenProps)
	local IsInExperienceScreenProps = Navigation.getScreenProps("isInExperience", false)
	local v1: boolean = if NavigateToRootStackScreenProps then true else false
	local IsInExperienceScreenProps1 = GetFFlagEnableAppChatInExperienceFunction() and IsInExperienceScreenProps
	local AppChatInnerPaddingScreenProps = if Navigation.getScreenProps("wideMode", false) then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12)
	
	if FFlagEnableHeaderBarButtonsUpdate then
		AppChatInnerPaddingScreenProps -= Navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
	local Config = if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then {
		raw = "CommonUI.Features.Label.Chat",
		shouldLocalize = true
	} else {
		raw = "Feature.Squads.Label.Party",
		shouldLocalize = true
	} elseif GetFFlagIsSquadEnabledFunction() then {
		raw = "Feature.Squads.Label.Party",
		shouldLocalize = true
	} else {
		raw = "CommonUI.Features.Label.Chat",
		shouldLocalize = true
	}
	
	return if FFlagAppChatTopBarConfigDrivenModule() then {
		backButtonEnabled = false,
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = Config,
		closeButtonEnabled = IsInExperienceScreenProps1 and v1,
		tabBarVisible = not NavigateToRootStackScreenProps or nil,
		leftPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = AppChatInnerPaddingScreenProps
	} else {
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = Config,
		backButtonEnabled = not IsInExperienceScreenProps1 and v1,
		closeButtonEnabled = IsInExperienceScreenProps1 and v1,
		tabBarVisible = not NavigateToRootStackScreenProps or nil,
		leftPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = AppChatInnerPaddingScreenProps,
		renderCenter = RenderCenter,
		renderRight = function()
			-- upvalues: WithTelemetryModule (upval), ChatLandingTelemetryLayerModule (upval), RoactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), Navigation (copy), FFlagEnableHeaderBarButtonsUpdate (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), ChatLandingTelemetryEventsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButtonWidth (copy), FFlagAppChatDomLocatorFoundationMigrationModule (upval), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), WideModeScreenProps (copy)
			return WithTelemetryModule(ChatLandingTelemetryLayerModule.Context)(function(p2)
				-- upvalues: RoactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), Navigation (upval), FFlagEnableHeaderBarButtonsUpdate (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), ChatLandingTelemetryEventsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButtonWidth (upval), FFlagAppChatDomLocatorFoundationMigrationModule (upval), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), WideModeScreenProps (upval)
				return RoactModule.createElement(TopBarProviderModule, {
					screenName = EnumScreensModule.ChatLanding,
					render = function(p3)
						-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), Navigation (upval), FFlagEnableHeaderBarButtonsUpdate (upval), RoactModule (upval), FoundationModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval), p2 (copy), ChatLandingTelemetryEventsModule (upval), StreamNotificationsBellIcon (upval), FFlagStreamNotificationBellEntryPoint (upval), AppPage (upval), SnoozeToastNotificationsButtonModule (upval), IconButtonWidth (upval), FFlagAppChatDomLocatorFoundationMigrationModule (upval), IconButton (upval), Images (upval), GetFFlagIsSquadEnabledFunction (upval), WideModeScreenProps (upval)
						local ScreenTopBar = p3.getScreenTopBar(EnumScreensModule.ChatLanding)
						ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
						local NotificationCountScreenProps = Navigation.getScreenProps("notificationCount", 0)
						local TopBarShowSearchScreenProps = Navigation.getScreenProps("topBarShowSearch", false)
						local TopBarShowCreateChatGroupScreenProps = Navigation.getScreenProps("topBarShowCreateChatGroup", false)
						local TopBarShowNotificationsScreenProps = Navigation.getScreenProps("topBarShowNotifications", false)
						local TopBarShowSnoozeNotificationsScreenProps = Navigation.getScreenProps("topBarShowSnoozeNotifications", false)
						
						return if ScreenTopBar.shouldRenderCenter then nil elseif FFlagEnableHeaderBarButtonsUpdate then RoactModule.createElement(FoundationModule.View, {
							tag = "auto-xy row align-x-right align-y-center gap-xsmall"
						}, {
							filter = if TopBarShowSearchScreenProps then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 1,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.MagnifyingGlass,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("search") else nil,
								onActivated = function()
									-- upvalues: p3 (copy), EnumScreensModule (upval), p2 (upval), ChatLandingTelemetryEventsModule (upval)
									p3.setScreenTopBar(EnumScreensModule.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p2.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
								end
							}) else nil,
							createNewChat = if TopBarShowCreateChatGroupScreenProps then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 2,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.PlusLarge,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
								onActivated = function()
									-- upvalues: Navigation (upval), EnumScreensModule (upval), p2 (upval), ChatLandingTelemetryEventsModule (upval)
									Navigation.navigate(EnumScreensModule.CreateNewChat)
									p2.emit(ChatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
								end
							}) else nil,
							notifications = if TopBarShowNotificationsScreenProps then RoactModule.createElement(StreamNotificationsBellIcon, {
								layoutOrder = 3,
								notificationCount = NotificationCountScreenProps,
								entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
							}) else nil,
							snoozeChatNotifications = if TopBarShowSnoozeNotificationsScreenProps then RoactModule.createElement(SnoozeToastNotificationsButtonModule, {
								layoutOrder = 4,
								size = UDim2.new(0, IconButtonWidth, 1, 0)
							}) else nil
						}) else RoactModule.createFragment({
							filter = TopBarShowSearchScreenProps and (if FFlagAppChatDomLocatorFoundationMigrationModule then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 1,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.MagnifyingGlass,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("search") else nil,
								onActivated = function()
									-- upvalues: p3 (copy), EnumScreensModule (upval), p2 (upval), ChatLandingTelemetryEventsModule (upval)
									p3.setScreenTopBar(EnumScreensModule.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p2.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
								end
							}) else RoactModule.createElement(IconButton, {
								layoutOrder = 1,
								size = UDim2.new(0, IconButtonWidth, 1, 0),
								icon = Images["icons/common/search"],
								onActivated = function()
									-- upvalues: p3 (copy), EnumScreensModule (upval), p2 (upval), ChatLandingTelemetryEventsModule (upval)
									p3.setScreenTopBar(EnumScreensModule.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p2.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
								end
							})),
							createNewChat = TopBarShowCreateChatGroupScreenProps and (if FFlagAppChatDomLocatorFoundationMigrationModule then RoactModule.createElement(FoundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 2,
								size = FoundationModule.Enums.InputSize.Medium,
								icon = FoundationModule.Enums.IconName.PlusLarge,
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
								onActivated = function()
									-- upvalues: Navigation (upval), EnumScreensModule (upval), p2 (upval), ChatLandingTelemetryEventsModule (upval)
									Navigation.navigate(EnumScreensModule.CreateNewChat)
									p2.emit(ChatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
								end
							}) else RoactModule.createElement(IconButton, {
								layoutOrder = 2,
								size = UDim2.new(0, IconButtonWidth, 1, 0),
								icon = if GetFFlagIsSquadEnabledFunction() then Images["icons/common/plus"] else Images["icons/actions/compose"],
								onActivated = function()
									-- upvalues: Navigation (upval), EnumScreensModule (upval), p2 (upval), ChatLandingTelemetryEventsModule (upval)
									Navigation.navigate(EnumScreensModule.CreateNewChat)
									p2.emit(ChatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
								end
							})),
							notifications = TopBarShowNotificationsScreenProps and (if FFlagAppChatDomLocatorFoundationMigrationModule then RoactModule.createElement(FoundationModule.View, {
								tag = "radius-circle row align-x-center align-y-center",
								Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
								testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
							}, {
								BellIcon = RoactModule.createElement(StreamNotificationsBellIcon, {
									notificationCount = NotificationCountScreenProps,
									compactWidth = not WideModeScreenProps,
									entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil
								})
							}) else RoactModule.createElement(StreamNotificationsBellIcon, {
								layoutOrder = 3,
								notificationCount = NotificationCountScreenProps,
								compactWidth = not WideModeScreenProps,
								entryPoint = if FFlagStreamNotificationBellEntryPoint then AppPage.Chat else nil
							})),
							snoozeChatNotifications = if TopBarShowSnoozeNotificationsScreenProps then RoactModule.createElement(SnoozeToastNotificationsButtonModule, {
								layoutOrder = 4,
								size = UDim2.new(0, IconButtonWidth, 1, 0)
							}) else nil
						})
					end
				})
			end)
		end
	}
end

function ChatLandingScreen.init(p1)
	-- upvalues: LoggerModule (copy), EnumScreensModule (copy), GetCurrentRouteModule (copy), FFlagEnablePartyQuickStartButton (copy), ResetForSquadLobbyForCompactModeModule (copy), RoactNavigationModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), GetTopBarStoreModule (copy), ArgCheckModule (copy)
	function p1.navigateToConversation(ConversationId)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, {
			navigatedWithFocus = false,
			conversationId = ConversationId
		})
		p1.resetScreenTopBar()
	end
	
	function p1.navigateToCreateChat()
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To CreateNewChat from {screen}")
		p1.props.navigation.push(EnumScreensModule.CreateNewChat)
	end
	
	function p1.navigateToToast(p2)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.navigateToPrivacy()
		-- upvalues: p1 (copy), EnumScreensModule (upval), LoggerModule (upval)
		local NavigateToLuaAppPagesScreenProp: () -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.PrivacySettings]
		
		if NavigateToLuaAppPagesScreenProp then
			LoggerModule:info("Navigate To PrivacySettings from {screen}")
			NavigateToLuaAppPagesScreenProp()
			
			return
		else
			LoggerModule:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
		end
	end
	
	function p1.navigateToSquadLobby(ConversationId)
		-- upvalues: LoggerModule (upval), GetCurrentRouteModule (upval), p1 (copy), EnumScreensModule (upval), FFlagEnablePartyQuickStartButton (upval), ResetForSquadLobbyForCompactModeModule (upval), RoactNavigationModule (upval)
		LoggerModule:info("Navigate To SquadLobby from {screen}")
		local CurrentRouteModule = GetCurrentRouteModule(p1.props.navigation.state)
		
		if CurrentRouteModule and CurrentRouteModule.params and CurrentRouteModule.params.conversationId == ConversationId and CurrentRouteModule.routeName == EnumScreensModule.ChatConversation then
			p1.props.navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
			
			return
		end
		if FFlagEnablePartyQuickStartButton then
			ResetForSquadLobbyForCompactModeModule(p1.props.navigation, ConversationId)
			
			return
		else
			p1.props.navigation.reset({
				RoactNavigationModule.Actions.navigate({ routeName = EnumScreensModule.ChatLanding }),
				RoactNavigationModule.Actions.navigate({
					routeName = EnumScreensModule.ChatConversation,
					params = { conversationId = ConversationId }
				}),
				RoactNavigationModule.Actions.navigate({
					routeName = EnumScreensModule.SquadLobby,
					params = { conversationId = ConversationId }
				})
			}, 3)
		end
	end
	
	function p1.setScreenTopBar(ChatLanding)
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy), ArgCheckModule (upval)
		if FFlagAppChatTopBarSignalsStoreModule then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatLanding, ChatLanding)
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.ChatLanding, ChatLanding)
		end
	end
	
	function p1.resetScreenTopBar()
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), p1 (copy)
		local v1 = if FFlagAppChatTopBarSignalsStoreModule then GetTopBarStoreModule(false).getScreenTopBar(EnumScreensModule.ChatLanding)(false) or {} else ArgCheckModule.isNotNil(p1.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(EnumScreensModule.ChatLanding)
		
		if v1.filterText == "" and v1.shouldRenderCenter then
			p1.setScreenTopBar({ shouldRenderCenter = false, isSecondary = false })
		end
	end
end

function ChatLandingScreen.render(p1)
	-- upvalues: LoggerModule (copy), ArgCheckModule (copy), RoactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ChatLandingContainerModule (copy), ChatSearchBoxModule (copy), GetFFlagEnablePushNotificationsUpsellModalChatFunction (copy), CheckAndOpenChatPushUpsellModule (copy)
	LoggerModule:info("{screen} render")
	local NavigationInChatLandingScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in ChatLandingScreen")
	local KeyParam = NavigationInChatLandingScreen and NavigationInChatLandingScreen.getParam("key", "") or ""
	local ShowSearchRowScreenProps = NavigationInChatLandingScreen.getScreenProps("showSearchRow", true)
	local TopBarHeightScreenProps = NavigationInChatLandingScreen.getScreenProps("topBarHeight", 0)
	
	return RoactModule.createElement(TopBarProviderModule, {
		screenName = EnumScreensModule.ChatLanding,
		render = function(p2)
			-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), RoactModule (upval), ChatLandingContainerModule (upval), NavigationInChatLandingScreen (copy), p1 (copy), KeyParam (copy), ShowSearchRowScreenProps (copy), ChatSearchBoxModule (upval), TopBarHeightScreenProps (copy), GetFFlagEnablePushNotificationsUpsellModalChatFunction (upval), CheckAndOpenChatPushUpsellModule (upval)
			local ScreenTopBar = p2.getScreenTopBar(EnumScreensModule.ChatLanding)
			ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
			local Element = RoactModule.createElement(ChatLandingContainerModule, {
				isShowingFilterBox = ScreenTopBar.shouldRenderCenter,
				filterText = ScreenTopBar.filterText,
				topBarHeight = NavigationInChatLandingScreen.getScreenProps("topBarHeight", 0),
				navigateToAddFriends = p1.props.navigation.getScreenProps("navigateToAddFriends", {}),
				navigateToConversation = p1.navigateToConversation,
				navigateToCreateChat = p1.navigateToCreateChat,
				navigateToPrivacy = p1.navigateToPrivacy,
				navigateToSquadLobby = p1.navigateToSquadLobby,
				navigateToToast = p1.navigateToToast,
				key = "ChatLanding" .. KeyParam
			})
			
			return if ShowSearchRowScreenProps then RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					VerticalFlex = Enum.UIFlexAlignment.Fill,
					Padding = UDim.new(0, 0)
				}),
				ChatSearchBox = RoactModule.createElement(ChatSearchBoxModule, {
					height = TopBarHeightScreenProps,
					initialText = ScreenTopBar.filterText,
					onFilter = function(FilterText)
						-- upvalues: p2 (copy), EnumScreensModule (upval)
						p2.setScreenTopBar(EnumScreensModule.ChatLanding, { filterText = FilterText })
					end
				}),
				Element
			}) elseif GetFFlagEnablePushNotificationsUpsellModalChatFunction() then RoactModule.createFragment({
				Element,
				CheckAndOpenChatPushUpsell = RoactModule.createElement(CheckAndOpenChatPushUpsellModule)
			}) else Element
		end
	})
end

function ChatLandingScreen.didMount(p1)
	-- upvalues: LoggerModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetFFlagEnableAppChatInExperienceFunction (copy), ArgoPartyExperimentation (copy), GetFFlagIsSquadEnabledFunction (copy)
	LoggerModule:info("{screen} mounted")
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		local Navigation = p1.props.navigation
		local IsInExperienceScreenProps = Navigation.getScreenProps("isInExperience", false)
		local v1: boolean = if Navigation.getScreenProps("navigateToRootStack", nil) then true else false
		p1.setScreenTopBar({
			shouldRenderCenter = false,
			filterText = "",
			backButtonEnabled = false,
			isRoot = true,
			isTitleLeftAligned = true,
			shouldBoldHeader = true,
			headerText = if ArgoPartyExperimentation.getIsRenameEnabled() or not GetFFlagIsSquadEnabledFunction() then {
				raw = "CommonUI.Features.Label.Chat",
				shouldLocalize = true
			} else {
				raw = "Feature.Squads.Label.Party",
				shouldLocalize = true
			},
			closeButtonEnabled = GetFFlagEnableAppChatInExperienceFunction() and IsInExperienceScreenProps and v1,
			leftPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = if Navigation.getScreenProps("wideMode", false) then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12)
		})
		
		return
	else
		p1.setScreenTopBar({ shouldRenderCenter = false, filterText = "" })
	end
end

return ChatLandingScreen