local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(appChat.Constants)
local enumScreensModule = require(appChat.EnumScreens)
local snoozeToastNotificationsButtonModule = require(appChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local topBarProviderModule = require(appChat.TopBarProvider)
local argCheckModule = require(parent.ArgCheck)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local withLocalization = require(parent.Localization).withLocalization
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local searchTopBarModule = require(script.Parent.SearchTopBar)
local chatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local loggerModule = require(script.Parent.Logger)
local getCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local chatSearchBoxModule = require(script.Parent.ChatSearchBox)
local checkAndOpenChatPushUpsellModule = require(script.Parent.CheckAndOpenChatPushUpsell)
local withTelemetryModule = require(appChat.Telemetry.withTelemetry)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryEventsModule = require(script.Parent.ChatLandingTelemetryEvents)
local resetForSquadLobbyForCompactModeModule = require(appChat.Utils.resetForSquadLobbyForCompactMode)
local streamNotificationsBellIcon = require(parent.StreamNotifications).StreamNotificationsBellIcon
local domLocatorsModule = require(appChat.Utils.DomLocators)
local fFlagStreamNotificationBellEntryPoint = require(parent.SharedFlags).FFlagStreamNotificationBellEntryPoint
local getFFlagEnableAppChatInExperience = require(parent.SharedFlags).GetFFlagEnableAppChatInExperience
local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local getFFlagEnablePushNotificationsUpsellModalChat = require(parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModalChat
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagEnableHeaderBarButtonsUpdate = require(parent.SharedFlags).FFlagEnableHeaderBarButtonsUpdate
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatDomLocatorFoundationMigrationModule = require(appChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local chatLandingScreen = roactModule.PureComponent:extend("ChatLandingScreen")
chatLandingScreen.defaultProps = { navigation = nil }

local var27 = function() --[[ line: 57 ]]
	-- upvalues: roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), searchTopBarModule (ref)
	return roactModule.createElement(topBarProviderModule, {
		screenName = enumScreensModule.ChatLanding,
		render = function(p0) --[[ line: 60 ]]
			-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), roactModule (copy), searchTopBarModule (copy)
			local screenTopBar = p0.getScreenTopBar(enumScreensModule.ChatLanding)
			argCheckModule.isType(screenTopBar, "table", "screenTopBar")
			
			return withLocalization({
				searchPlaceholderText = "Feature.Chat.Label.SearchWord",
				cancelText = "Feature.Chat.Action.Cancel"
			})(function(p1) --[[ line: 67 ]]
				-- upvalues: roactModule (copy), searchTopBarModule (copy), screenTopBar (ref), p0 (ref), enumScreensModule (copy)
				return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					filterBox = roactModule.createElement(searchTopBarModule, {
						initialInputText = screenTopBar.filterText,
						cancelText = p1.cancelText,
						searchPlaceholderText = p1.searchPlaceholderText,
						captureFocusOnMount = screenTopBar.shouldAutoFocusCenter,
						onSelectCallback = screenTopBar.closeInputBar or function() --[[ line: 77 ]] end,
						resetOnMount = function() --[[ line: 79 ]]
							-- upvalues: p0 (copy), enumScreensModule (copy)
							p0.setScreenTopBar(enumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
						end,
						cancelCallback = function() --[[ line: 85 ]]
							-- upvalues: p0 (copy), enumScreensModule (copy)
							p0.setScreenTopBar(enumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
						end,
						textChangedCallback = function(p2) --[[ line: 92 ]]
							-- upvalues: p0 (copy), enumScreensModule (copy)
							p0.setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p2 })
						end
					})
				})
			end)
		end
	})
end

function chatLandingScreen.navigationOptions(p3) --[[ line: 104 ]]
	-- upvalues: constantsModule (ref), getFFlagEnableAppChatInExperience (ref), fFlagEnableHeaderBarButtonsUpdate (ref), argoPartyExperimentation (ref), getFFlagIsSquadEnabled (ref), fFlagAppChatTopBarConfigDrivenModule (ref), var27 (ref), withTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), chatLandingTelemetryEventsModule (ref), streamNotificationsBellIcon (ref), fFlagStreamNotificationBellEntryPoint (ref), appPage (ref), snoozeToastNotificationsButtonModule (ref), fFlagAppChatDomLocatorFoundationMigrationModule (ref), iconButton (ref), images (ref)
	local navigation = p3.navigation
	local navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil)
	local wideMode = navigation.getScreenProps("wideMode", false)
	local var31 = constantsModule:GetIconButtonWidth(wideMode)
	local var32 = if navigateToRootStack then true else false
	local isInExperience = getFFlagEnableAppChatInExperience() and navigation.getScreenProps("isInExperience", false)
	local var34 = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
	
	if fFlagEnableHeaderBarButtonsUpdate then
		var34 -= navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
	local var35 = if argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then {
		raw = "CommonUI.Features.Label.Chat",
		shouldLocalize = true
	} else {
		raw = "Feature.Squads.Label.Party",
		shouldLocalize = true
	}
	
	return if fFlagAppChatTopBarConfigDrivenModule() then {
		backButtonEnabled = false,
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = var35,
		closeButtonEnabled = isInExperience and var32,
		tabBarVisible = not navigateToRootStack or nil,
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = var34
	} else {
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = var35,
		backButtonEnabled = if isInExperience then false else var32,
		closeButtonEnabled = isInExperience and var32,
		tabBarVisible = not navigateToRootStack or nil,
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = var34,
		renderCenter = var27,
		renderRight = function() --[[ line: 165 ]]
			-- upvalues: withTelemetryModule (copy), chatLandingTelemetryLayerModule (copy), roactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), navigation (ref), fFlagEnableHeaderBarButtonsUpdate (copy), foundationModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy), chatLandingTelemetryEventsModule (copy), streamNotificationsBellIcon (copy), fFlagStreamNotificationBellEntryPoint (copy), appPage (copy), snoozeToastNotificationsButtonModule (copy), var31 (ref), fFlagAppChatDomLocatorFoundationMigrationModule (copy), iconButton (copy), images (copy), getFFlagIsSquadEnabled (copy), wideMode (ref)
			return withTelemetryModule(chatLandingTelemetryLayerModule.Context)(function(p4) --[[ line: 166 ]]
				-- upvalues: roactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), navigation (copy), fFlagEnableHeaderBarButtonsUpdate (copy), foundationModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy), chatLandingTelemetryEventsModule (copy), streamNotificationsBellIcon (copy), fFlagStreamNotificationBellEntryPoint (copy), appPage (copy), snoozeToastNotificationsButtonModule (copy), var31 (copy), fFlagAppChatDomLocatorFoundationMigrationModule (copy), iconButton (copy), images (copy), getFFlagIsSquadEnabled (copy), wideMode (copy)
				return roactModule.createElement(topBarProviderModule, {
					screenName = enumScreensModule.ChatLanding,
					render = function(p5) --[[ line: 169 ]]
						-- upvalues: enumScreensModule (copy), argCheckModule (copy), navigation (copy), fFlagEnableHeaderBarButtonsUpdate (copy), roactModule (copy), foundationModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy), p4 (ref), chatLandingTelemetryEventsModule (copy), streamNotificationsBellIcon (copy), fFlagStreamNotificationBellEntryPoint (copy), appPage (copy), snoozeToastNotificationsButtonModule (copy), var31 (copy), fFlagAppChatDomLocatorFoundationMigrationModule (copy), iconButton (copy), images (copy), getFFlagIsSquadEnabled (copy), wideMode (copy)
						local screenTopBar = p5.getScreenTopBar(enumScreensModule.ChatLanding)
						argCheckModule.isType(screenTopBar, "table", "screenTopBar")
						local notificationCount = navigation.getScreenProps("notificationCount", 0)
						local topBarShowSearch = navigation.getScreenProps("topBarShowSearch", false)
						local topBarShowCreateChatGroup = navigation.getScreenProps("topBarShowCreateChatGroup", false)
						local topBarShowNotifications = navigation.getScreenProps("topBarShowNotifications", false)
						local topBarShowSnoozeNotifications = navigation.getScreenProps("topBarShowSnoozeNotifications", false)
						
						return if screenTopBar.shouldRenderCenter then nil elseif fFlagEnableHeaderBarButtonsUpdate then roactModule.createElement(foundationModule.View, {
							tag = "auto-xy row align-x-right align-y-center gap-xsmall"
						}, {
							filter = if topBarShowSearch then roactModule.createElement(foundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 1,
								size = foundationModule.Enums.InputSize.Medium,
								icon = foundationModule.Enums.IconName.MagnifyingGlass,
								testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("search") else nil,
								onActivated = function() --[[ line: 197 ]]
									-- upvalues: p5 (ref), enumScreensModule (copy), p4 (copy), chatLandingTelemetryEventsModule (copy)
									p5.setScreenTopBar(enumScreensModule.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p4.emit(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
								end
							}) else nil,
							createNewChat = if topBarShowCreateChatGroup then roactModule.createElement(foundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 2,
								size = foundationModule.Enums.InputSize.Medium,
								icon = foundationModule.Enums.IconName.PlusLarge,
								testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
								onActivated = function() --[[ line: 217 ]]
									-- upvalues: navigation (copy), enumScreensModule (copy), p4 (copy), chatLandingTelemetryEventsModule (copy)
									navigation.navigate(enumScreensModule.CreateNewChat)
									p4.emit(chatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
								end
							}) else nil,
							notifications = if topBarShowNotifications then roactModule.createElement(streamNotificationsBellIcon, {
								layoutOrder = 3,
								notificationCount = notificationCount,
								entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil,
								testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
							}) else nil,
							snoozeChatNotifications = if topBarShowSnoozeNotifications then roactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var31, 1, 0) }) else nil
						}) else roactModule.createFragment({
							filter = topBarShowSearch and (if fFlagAppChatDomLocatorFoundationMigrationModule then roactModule.createElement(foundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 1,
								size = foundationModule.Enums.InputSize.Medium,
								icon = foundationModule.Enums.IconName.MagnifyingGlass,
								testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("search") else nil,
								onActivated = function() --[[ line: 254 ]]
									-- upvalues: p5 (ref), enumScreensModule (copy), p4 (copy), chatLandingTelemetryEventsModule (copy)
									p5.setScreenTopBar(enumScreensModule.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p4.emit(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
								end
							}) else roactModule.createElement(iconButton, {
								layoutOrder = 1,
								size = UDim2.new(0, var31, 1, 0),
								icon = images["icons/common/search"],
								onActivated = function() --[[ line: 268 ]]
									-- upvalues: p5 (ref), enumScreensModule (copy), p4 (copy), chatLandingTelemetryEventsModule (copy)
									p5.setScreenTopBar(enumScreensModule.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p4.emit(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
								end
							})),
							createNewChat = topBarShowCreateChatGroup and (if fFlagAppChatDomLocatorFoundationMigrationModule then roactModule.createElement(foundationModule.IconButton, {
								isCircular = true,
								LayoutOrder = 2,
								size = foundationModule.Enums.InputSize.Medium,
								icon = foundationModule.Enums.IconName.PlusLarge,
								testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("createChat") else nil,
								onActivated = function() --[[ line: 289 ]]
									-- upvalues: navigation (copy), enumScreensModule (copy), p4 (copy), chatLandingTelemetryEventsModule (copy)
									navigation.navigate(enumScreensModule.CreateNewChat)
									p4.emit(chatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
								end
							}) else roactModule.createElement(iconButton, {
								layoutOrder = 2,
								size = UDim2.new(0, var31, 1, 0),
								icon = if getFFlagIsSquadEnabled() then images["icons/common/plus"] else images["icons/actions/compose"],
								onActivated = function() --[[ line: 303 ]]
									-- upvalues: navigation (copy), enumScreensModule (copy), p4 (copy), chatLandingTelemetryEventsModule (copy)
									navigation.navigate(enumScreensModule.CreateNewChat)
									p4.emit(chatLandingTelemetryEventsModule.ChatLandingComposeBtnClicked, {})
								end
							})),
							notifications = topBarShowNotifications and (if fFlagAppChatDomLocatorFoundationMigrationModule then roactModule.createElement(foundationModule.View, {
								tag = "radius-circle row align-x-center align-y-center",
								Size = UDim2.new(0, var31, 0, var31),
								testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("notifications") else nil
							}, {
								BellIcon = roactModule.createElement(streamNotificationsBellIcon, {
									notificationCount = notificationCount,
									compactWidth = not wideMode,
									entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil
								})
							}) else roactModule.createElement(streamNotificationsBellIcon, {
								layoutOrder = 3,
								notificationCount = notificationCount,
								compactWidth = not wideMode,
								entryPoint = if fFlagStreamNotificationBellEntryPoint then appPage.Chat else nil
							})),
							snoozeChatNotifications = if topBarShowSnoozeNotifications then roactModule.createElement(snoozeToastNotificationsButtonModule, { layoutOrder = 4, size = UDim2.new(0, var31, 1, 0) }) else nil
						})
					end
				})
			end)
		end
	}
end

function chatLandingScreen.init(p6) --[[ line: 348 ]]
	-- upvalues: loggerModule (ref), enumScreensModule (ref), getCurrentRouteModule (ref), fFlagEnablePartyQuickStartButton (ref), resetForSquadLobbyForCompactModeModule (ref), roactNavigationModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), argCheckModule (ref)
	function p6.navigateToConversation(p7) --[[ line: 349 ]]
		-- upvalues: loggerModule (copy), p6 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p7)
		p6.props.navigation.navigate(enumScreensModule.ChatConversation, { navigatedWithFocus = false, conversationId = p7 })
		p6.resetScreenTopBar()
	end
	
	function p6.navigateToCreateChat() --[[ line: 358 ]]
		-- upvalues: loggerModule (copy), p6 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To CreateNewChat from {screen}")
		p6.props.navigation.push(enumScreensModule.CreateNewChat)
	end
	
	function p6.navigateToToast(p8) --[[ line: 363 ]]
		-- upvalues: loggerModule (copy), p6 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p6.props.navigation.navigate(enumScreensModule.RoactChatToast, p8)
	end
	
	function p6.navigateToPrivacy() --[[ line: 368 ]]
		-- upvalues: p6 (ref), enumScreensModule (copy), loggerModule (copy)
		local privacySettings = p6.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.PrivacySettings]
		
		if privacySettings then
			loggerModule:info("Navigate To PrivacySettings from {screen}")
			privacySettings()
			
			return
		end
		loggerModule:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p6.navigateToSquadLobby(p9) --[[ line: 379 ]]
		-- upvalues: loggerModule (copy), getCurrentRouteModule (copy), p6 (ref), enumScreensModule (copy), fFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForCompactModeModule (copy), roactNavigationModule (copy)
		loggerModule:info("Navigate To SquadLobby from {screen}")
		local var42 = getCurrentRouteModule(p6.props.navigation.state)
		
		if var42 and var42.params and (var42.params.conversationId == p9 and var42.routeName == enumScreensModule.ChatConversation) then
			p6.props.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = p9 })
			
			return
		elseif fFlagEnablePartyQuickStartButton then
			resetForSquadLobbyForCompactModeModule(p6.props.navigation, p9)
			
			return
		end
		p6.props.navigation.reset({
			roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding }),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatConversation,
				params = { conversationId = p9 }
			}),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.SquadLobby,
				params = { conversationId = p9 }
			})
		}, 3)
	end
	
	function p6.setScreenTopBar(p10) --[[ line: 411 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p6 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, p10)
			
			return
		end
		local setScreenTopBar = p6.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatLanding, p10)
	end
	
	function p6.resetScreenTopBar() --[[ line: 421 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), argCheckModule (copy), p6 (ref)
		local _ = nil
		local var44 = if fFlagAppChatTopBarSignalsStoreModule then getTopBarStoreModule(false).getScreenTopBar(enumScreensModule.ChatLanding)(false) or {} else argCheckModule.isNotNil(p6.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(enumScreensModule.ChatLanding)
		
		if var44.filterText == "" and var44.shouldRenderCenter then
			p6.setScreenTopBar({ shouldRenderCenter = false, isSecondary = false })
		end
	end
end

function chatLandingScreen.render(p11) --[[ line: 441 ]]
	-- upvalues: loggerModule (ref), argCheckModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), chatLandingContainerModule (ref), chatSearchBoxModule (ref), getFFlagEnablePushNotificationsUpsellModalChat (ref), checkAndOpenChatPushUpsellModule (ref)
	loggerModule:info("{screen} render")
	local var45 = argCheckModule.isNotNil(p11.props.navigation, "navigation in ChatLandingScreen")
	local key = var45 and var45.getParam("key", "") or ""
	local showSearchRow = var45.getScreenProps("showSearchRow", true)
	local topBarHeight = var45.getScreenProps("topBarHeight", 0)
	
	return roactModule.createElement(topBarProviderModule, {
		screenName = enumScreensModule.ChatLanding,
		render = function(p12) --[[ line: 450 ]]
			-- upvalues: enumScreensModule (copy), argCheckModule (copy), roactModule (copy), chatLandingContainerModule (copy), var45 (ref), p11 (ref), key (ref), showSearchRow (ref), chatSearchBoxModule (copy), topBarHeight (ref), getFFlagEnablePushNotificationsUpsellModalChat (copy), checkAndOpenChatPushUpsellModule (copy)
			local screenTopBar = p12.getScreenTopBar(enumScreensModule.ChatLanding)
			argCheckModule.isType(screenTopBar, "table", "screenTopBar")
			local var50 = roactModule.createElement(chatLandingContainerModule, {
				isShowingFilterBox = screenTopBar.shouldRenderCenter,
				filterText = screenTopBar.filterText,
				topBarHeight = var45.getScreenProps("topBarHeight", 0),
				navigateToAddFriends = p11.props.navigation.getScreenProps("navigateToAddFriends", {}),
				navigateToConversation = p11.navigateToConversation,
				navigateToCreateChat = p11.navigateToCreateChat,
				navigateToPrivacy = p11.navigateToPrivacy,
				navigateToSquadLobby = p11.navigateToSquadLobby,
				navigateToToast = p11.navigateToToast,
				key = "ChatLanding" .. key
			})
			
			return if showSearchRow then roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				UIListLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					VerticalFlex = Enum.UIFlexAlignment.Fill,
					Padding = UDim.new(0, 0)
				}),
				ChatSearchBox = roactModule.createElement(chatSearchBoxModule, {
					height = topBarHeight,
					initialText = screenTopBar.filterText,
					onFilter = function(p13) --[[ line: 481 ]]
						-- upvalues: p12 (ref), enumScreensModule (copy)
						p12.setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p13 })
					end
				}),
				var50
			}) elseif getFFlagEnablePushNotificationsUpsellModalChat() then roactModule.createFragment({
				var50,
				CheckAndOpenChatPushUpsell = roactModule.createElement(checkAndOpenChatPushUpsellModule)
			}) else var50
		end
	})
end

function chatLandingScreen.didMount(p14) --[[ line: 502 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getFFlagEnableAppChatInExperience (ref), argoPartyExperimentation (ref), getFFlagIsSquadEnabled (ref)
	loggerModule:info("{screen} mounted")
	
	if not fFlagAppChatTopBarConfigDrivenModule() then
		p14.setScreenTopBar({ shouldRenderCenter = false, filterText = "" })
		
		return
	end
	local navigation = p14.props.navigation
	p14.setScreenTopBar({
		shouldRenderCenter = false,
		filterText = "",
		backButtonEnabled = false,
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = if argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		} else {
			raw = "Feature.Squads.Label.Party",
			shouldLocalize = true
		},
		closeButtonEnabled = getFFlagEnableAppChatInExperience() and navigation.getScreenProps("isInExperience", false) and (if navigation.getScreenProps("navigateToRootStack", nil) then true else false),
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
	})
end

return chatLandingScreen