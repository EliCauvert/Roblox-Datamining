local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local roactNavigationModule = require(parent.RoactNavigation)
local focusBehaviorsModule = require(parent.FocusBehaviors)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local enumScreensModule = require(appChat.EnumScreens)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local chatConversationTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local chatDetailsTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local chatDetailsTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local topBarProviderModule = require(appChat.TopBarProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local chatLandingTopBarModule = require(appChat.Components.TopBar.ChatLandingTopBar)
local conversationSwitchNavigatorModule = require(appChat.Navigators.Wide.conversationSwitchNavigator)
local conversationStackNavigationFocusListenerModule = require(script.Parent.ConversationStackNavigationFocusListener)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local resetForSquadLobbyForWideModeModule = require(appChat.Utils.resetForSquadLobbyForWideMode)
local chatSearchBoxModule = require(script.Parent.ChatSearchBox)
local chatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local loggerModule = require(script.Parent.Logger)
local getCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local withStyle = UIBloxModule.Style.withStyle
local providerModule = require(appChat.Contexts.ChatPagePadding.Provider)
local contextModule = require(appChat.Contexts.ChatWideModeFocus.Context)
local useGetAndSetRefModule = require(appChat.Hooks.useGetAndSetRef)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local getFFlagEnableAppChatInExperience = sharedFlagsModule.GetFFlagEnableAppChatInExperience
local appChatFixChatLandingContainerKeyPropConflict = game:DefineFastFlag("AppChatFixChatLandingContainerKeyPropConflict", false)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation

local function LeftContainerTelemetryProviders(p1)
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref)
	local var1, var2 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var1 (ref), var2 (ref)
			return { get = var1, set = var2 }
		end, { var1, var2 })
	}, {
		reactModule.createElement(chatLandingTelemetryLayerModule.Provider, {
			value = reactModule.useCallback(function()
				-- upvalues: var1 (ref)
				local var3 = var1()
				
				return {
					chatLandingListCount = var3.chatLandingListCount,
					pendingConversationCount = var3.pendingConversationCount,
					unfilteredConversationCount = var3.unfilteredConversationCount
				}
			end, { var1 })
		}, p1.children)
	})
end

local function RightContainerTelemetryProviders(p1)
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatDetailsTelemetryStateModule (ref), chatDetailsTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), chatConversationTelemetryLayerModule (ref)
	local var1, var2 = useGetAndSetRefModule({})
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local var4 = var1()
		
		return {
			conversationId = var4.conversationId,
			moderationType = var4.moderationType,
			userPendingStatus = var4.userPendingStatus
		}
	end, { var1 })
	local _ = p1.children
	local var4, var5 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatConversationTelemetryStateModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var1 (ref), var2 (ref)
			return { get = var1, set = var2 }
		end, { var1, var2 })
	}, {
		reactModule.createElement(chatConversationTelemetryLayerModule.Provider, { value = var3 }, reactModule.createElement(chatDetailsTelemetryStateModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var4 (ref), var5 (ref)
				return { get = var4, set = var5 }
			end, { var4, var5 })
		}, reactModule.createElement(chatDetailsTelemetryLayerModule.Provider, {
			value = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				local var6 = var4()
				
				return {
					participantsCount = var6.participantsCount,
					isGroupOwner = var6.isGroupOwner
				}
			end, { var4, var1 })
		}, p1.children)))
	})
end

local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local chatLandingScreenWithSwitchNavigator = roactModule.PureComponent:extend("ChatLandingScreenWithSwitchNavigator")
chatLandingScreenWithSwitchNavigator.router = conversationSwitchNavigatorModule.router
chatLandingScreenWithSwitchNavigator.defaultProps = { navigation = nil }

function chatLandingScreenWithSwitchNavigator.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), getCurrentRouteModule (ref), fFlagEnablePartyQuickStartButton (ref), resetForSquadLobbyForWideModeModule (ref), roactNavigationModule (ref), getTopBarStoreModule (ref), roactModule (ref), reactFocusNavigationModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.LandingPage") else nil
	
	function p2.navigateToConversation(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p2)
		p1.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p2 })
	end
	
	function p2.navigateToCreateChat()
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To CreateNewChat from {screen}")
		p1.props.navigation.navigate(enumScreensModule.CreateNewChat)
	end
	
	function p2.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p2.navigateToNotifications()
		-- upvalues: p1 (ref), enumScreensModule (copy), loggerModule (copy)
		local notifications = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.Notifications]
		
		if notifications then
			loggerModule:info("Navigate To Notifications from {screen}")
			notifications()
			
			return
		end
		loggerModule:warning("Notifications page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p2.navigateToPrivacy()
		-- upvalues: p1 (ref), enumScreensModule (copy), loggerModule (copy)
		local privacySettings = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.PrivacySettings]
		
		if privacySettings then
			loggerModule:info("Navigate To PrivacySettings from {screen}")
			privacySettings()
			
			return
		end
		loggerModule:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p2.navigateToSquadLobby(p2)
		-- upvalues: loggerModule (copy), getCurrentRouteModule (copy), p1 (ref), enumScreensModule (copy), fFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForWideModeModule (copy), roactNavigationModule (copy)
		loggerModule:info("Navigate To SquadLobby from {screen}")
		local var1 = getCurrentRouteModule(p1.props.navigation.state)
		
		if var1 and var1.params and (var1.params.conversationId == p2 and var1.routeName == enumScreensModule.ChatConversation) then
			p1.props.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = p2 })
			
			return
		elseif fFlagEnablePartyQuickStartButton then
			resetForSquadLobbyForWideModeModule(p1.props.navigation, p2)
			
			return
		end
		p1.props.navigation.navigate(enumScreensModule.ChatLanding, nil, roactNavigationModule.StackActions.reset({
			index = 2,
			actions = {
				roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.ChatConversation,
					params = { conversationId = p2 }
				}),
				roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.SquadLobby,
					params = { conversationId = p2 }
				})
			}
		}))
	end
	
	function p2.setScreenTopBar(p2)
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, p2)
	end
	
	p1.leftContainerRef = roactModule.createRef()
	p1.rightContainerRef = roactModule.createRef()
	p1.conversationTopBarRef = roactModule.createRef()
	p1.conversationPanelRef = roactModule.createRef()
	p1.wideModeFocusValue = {
		conversationListRef = p1.leftContainerRef,
		conversationTopBarRef = p1.conversationTopBarRef,
		conversationPanelRef = p1.conversationPanelRef
	}
	p1.focusNavigationService = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

function chatLandingScreenWithSwitchNavigator.render(p1)
	-- upvalues: loggerModule (ref), argCheckModule (ref), withStyle (ref), roactModule (ref), LeftContainerTelemetryProviders (ref), topBarProviderModule (ref), enumScreensModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), chatLandingTopBarModule (ref), chatSearchBoxModule (ref), providerModule (ref), appChatFixChatLandingContainerKeyPropConflict (ref), chatLandingContainerModule (ref), RightContainerTelemetryProviders (ref), conversationSwitchNavigatorModule (ref), reactModule (ref), contextModule (ref), conversationStackNavigationFocusListenerModule (ref)
	loggerModule:info("{screen} render")
	local var1 = argCheckModule.isNotNil(p1.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator")
	local key = var1 and var1.getParam("key", "") or ""
	local showSearchRow = var1.getScreenProps("showSearchRow", true)
	local topBarHeight = var1.getScreenProps("topBarHeight", 0)
	
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), LeftContainerTelemetryProviders (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), fFlagAppChatConsoleFocusFixesModule (copy), p1 (ref), chatLandingTopBarModule (copy), var1 (ref), showSearchRow (ref), chatSearchBoxModule (copy), topBarHeight (ref), providerModule (copy), appChatFixChatLandingContainerKeyPropConflict (copy), chatLandingContainerModule (copy), key (ref), RightContainerTelemetryProviders (copy), conversationSwitchNavigatorModule (copy), reactModule (copy), contextModule (copy), conversationStackNavigationFocusListenerModule (copy)
		return reactModule.createElement(contextModule.Provider, { value = p1.wideModeFocusValue }, {
			FocusListener = roactModule.createElement(conversationStackNavigationFocusListenerModule, {
				navigation = var1,
				leftContainerRef = p1.leftContainerRef,
				rightContainerRef = p1.rightContainerRef,
				conversationTopBarRef = p1.conversationTopBarRef,
				conversationPanelRef = p1.conversationPanelRef
			}, {
				LeftContainerProviders = roactModule.createElement(LeftContainerTelemetryProviders, {}, {
					LeftContainer = roactModule.createElement(topBarProviderModule, {
						screenName = enumScreensModule.ChatLanding,
						render = function(p3)
							-- upvalues: enumScreensModule (copy), argCheckModule (copy), roactModule (copy), fFlagAppChatConsoleFocusFixesModule (copy), p1 (copy), chatLandingTopBarModule (copy), var1 (copy), showSearchRow (copy), chatSearchBoxModule (copy), topBarHeight (copy), providerModule (copy), p2 (ref), appChatFixChatLandingContainerKeyPropConflict (copy), chatLandingContainerModule (copy), key (copy)
							local screenTopBar = p3.getScreenTopBar(enumScreensModule.ChatLanding)
							argCheckModule.isType(screenTopBar, "table", "screenTopBar")
							
							return roactModule.createElement("Frame", {
								Size = UDim2.new(0.37, 0, 1, 0),
								Position = UDim2.new(0, 0, 0, 0),
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								SelectionGroup = if fFlagAppChatConsoleFocusFixesModule then true else nil,
								SelectionBehaviorDown = if fFlagAppChatConsoleFocusFixesModule then Enum.SelectionBehavior.Stop else nil,
								SelectionBehaviorUp = if fFlagAppChatConsoleFocusFixesModule then Enum.SelectionBehavior.Stop else nil,
								[roactModule.Ref] = p1.leftContainerRef
							}, {
								layout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
								leftTopBar = roactModule.createElement(chatLandingTopBarModule, {
									screenName = enumScreensModule.ChatLanding,
									navigation = var1
								}),
								filterBox = if showSearchRow then roactModule.createElement(chatSearchBoxModule, {
									height = topBarHeight,
									initialText = screenTopBar.filterText,
									onFilter = function(p4)
										-- upvalues: p3 (ref), enumScreensModule (copy)
										p3.setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p4 })
									end
								}) else nil,
								content = roactModule.createElement(providerModule, {
									value = {
										left = var1.getScreenProps("appChatOuterPadding", 12),
										right = var1.getScreenProps("appChatInnerPadding", 12)
									}
								}, {
									ChatLanding = roactModule.createElement("Frame", {
										BorderSizePixel = 0,
										LayoutOrder = 2,
										Size = UDim2.new(1, 0, 1, (-var1.getScreenProps("topBarHeight", 0)) - (if showSearchRow then topBarHeight else 0)),
										BackgroundTransparency = p2.Tokens.Color.None.Transparency
									}, {
										ChatLandingContainer = if appChatFixChatLandingContainerKeyPropConflict then nil else roactModule.createElement(chatLandingContainerModule, {
											isShowingFilterBox = screenTopBar.shouldRenderCenter,
											filterText = screenTopBar.filterText,
											navigateToConversation = p1.navigateToConversation,
											navigateToCreateChat = p1.navigateToCreateChat,
											navigateToPrivacy = p1.navigateToPrivacy,
											navigateToSquadLobby = p1.navigateToSquadLobby,
											navigateToToast = p1.navigateToToast,
											navigateToAddFriends = p1.props.navigation.getScreenProps("navigateToAddFriends", {}),
											key = "ChatLanding" .. key
										}),
										if appChatFixChatLandingContainerKeyPropConflict then roactModule.createElement(chatLandingContainerModule, {
											isShowingFilterBox = screenTopBar.shouldRenderCenter,
											filterText = screenTopBar.filterText,
											navigateToConversation = p1.navigateToConversation,
											navigateToCreateChat = p1.navigateToCreateChat,
											navigateToPrivacy = p1.navigateToPrivacy,
											navigateToSquadLobby = p1.navigateToSquadLobby,
											navigateToToast = p1.navigateToToast,
											navigateToAddFriends = p1.props.navigation.getScreenProps("navigateToAddFriends", {}),
											key = "ChatLanding" .. key
										}) else nil
									})
								})
							})
						end
					})
				}),
				Border = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency,
					Position = UDim2.new(0.37, 0, 0, 0),
					Size = UDim2.new(0, 1, 1, 0)
				}),
				RightContainerProviders = roactModule.createElement(RightContainerTelemetryProviders, {}, {
					RightContainer = roactModule.createElement("Frame", {
						Size = UDim2.new(0.63, -1, 1, 0),
						Position = UDim2.new(0.37, 1, 0, 0),
						ClipsDescendants = true,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						[roactModule.Ref] = p1.rightContainerRef,
						SelectionGroup = if fFlagAppChatConsoleFocusFixesModule then true else nil,
						SelectionBehaviorDown = if fFlagAppChatConsoleFocusFixesModule then Enum.SelectionBehavior.Stop else nil,
						SelectionBehaviorUp = if fFlagAppChatConsoleFocusFixesModule then Enum.SelectionBehavior.Stop else nil
					}, {
						Content = roactModule.createElement(providerModule, {
							value = {
								left = var1.getScreenProps("appChatInnerPadding", 12),
								right = var1.getScreenProps("appChatOuterPadding", 12)
							}
						}, {
							ConversationSwitchNavigator = roactModule.createElement(conversationSwitchNavigatorModule, { navigation = var1 })
						})
					})
				})
			})
		})
	end)
end

function chatLandingScreenWithSwitchNavigator.didMount(p1)
	-- upvalues: loggerModule (ref), getFFlagEnableAppChatInExperience (ref), sharedFlagsModule (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), getFFlagIsSquadEnabled (ref), focusBehaviorsModule (ref)
	loggerModule:info("{screen} mounted")
	local navigation = p1.props.navigation
	local var1 = if navigation.getScreenProps("navigateToRootStack", nil) then true else false
	local isInExperience = getFFlagEnableAppChatInExperience() and navigation.getScreenProps("isInExperience", false)
	local appChatInnerPadding = navigation.getScreenProps("appChatInnerPadding", 12)
	
	if sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate then
		appChatInnerPadding -= navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
	p1.setScreenTopBar({
		shouldRenderCenter = false,
		filterText = "",
		backButtonEnabled = false,
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		} else {
			raw = "Feature.Squads.Label.Party",
			shouldLocalize = true
		} elseif getFFlagIsSquadEnabled() then {
			raw = "Feature.Squads.Label.Party",
			shouldLocalize = true
		} else {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		},
		closeButtonEnabled = isInExperience and var1,
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = appChatInnerPadding
	})
	
	if p1.focusNavigationService then
		p1.focusNavigationService:registerFocusBehavior(p1.leftContainerRef.current, focusBehaviorsModule.mostRecent())
		p1.focusNavigationService:registerFocusBehavior(p1.rightContainerRef.current, focusBehaviorsModule.mostRecent())
	end
end

function chatLandingScreenWithSwitchNavigator.willUnmount(p1)
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
	p1.focusNavigationService:teardown()
end

return chatLandingScreenWithSwitchNavigator