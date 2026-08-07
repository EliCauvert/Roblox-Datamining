local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
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
local createChatTopBarModule = require(appChat.createChatTopBar)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local chatLandingTopBarModule = require(appChat.Components.TopBar.ChatLandingTopBar)
local conversationSwitchNavigatorModule = require(appChat.Navigators.Wide.conversationSwitchNavigator)
local conversationStackNavigationFocusListenerModule = require(script.Parent.ConversationStackNavigationFocusListener)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local resetForSquadLobbyForWideModeModule = require(appChat.Utils.resetForSquadLobbyForWideMode)
local chatLandingScreenModule = require(script.Parent.ChatLandingScreen)
local chatSearchBoxModule = require(script.Parent.ChatSearchBox)
local chatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local loggerModule = require(script.Parent.Logger)
local getCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local withStyle = UIBloxModule.Style.withStyle
local providerModule = require(appChat.Contexts.ChatPagePadding.Provider)
local useGetAndSetRefModule = require(appChat.Hooks.useGetAndSetRef)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local getFFlagEnableAppChatInExperience = sharedFlagsModule.GetFFlagEnableAppChatInExperience
local appChatFixChatLandingContainerKeyPropConflict = game:DefineFastFlag("AppChatFixChatLandingContainerKeyPropConflict", false)
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation

local function LeftContainerTelemetryProviders(p0) --[[ line: 54 ]]
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatLandingTelemetryStateModule (ref), chatLandingTelemetryLayerModule (ref)
	local var40, var41 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatLandingTelemetryStateModule.Provider, { value = { get = var40, set = var41 } }, {
		reactModule.createElement(chatLandingTelemetryLayerModule.Provider, {
			value = reactModule.useCallback(function() --[[ line: 57 ]]
				-- upvalues: var40 (ref)
				local var42 = var40()
				
				return {
					chatLandingListCount = var42.chatLandingListCount,
					pendingConversationCount = var42.pendingConversationCount,
					unfilteredConversationCount = var42.unfilteredConversationCount
				}
			end, { var40 })
		}, p0.children)
	})
end

local function RightContainerTelemetryProviders(p1) --[[ line: 81 ]]
	-- upvalues: useGetAndSetRefModule (ref), reactModule (ref), chatDetailsTelemetryStateModule (ref), chatDetailsTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), chatConversationTelemetryLayerModule (ref)
	local var43, var44 = useGetAndSetRefModule({})
	local var45 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: var43 (ref)
		local var48 = var43()
		
		return {
			conversationId = var48.conversationId,
			moderationType = var48.moderationType,
			userPendingStatus = var48.userPendingStatus
		}
	end, { var43 })
	local _ = p1.children
	local var46, var47 = useGetAndSetRefModule({})
	
	return reactModule.createElement(chatConversationTelemetryStateModule.Provider, { value = { get = var43, set = var44 } }, {
		reactModule.createElement(chatConversationTelemetryLayerModule.Provider, { value = var45 }, reactModule.createElement(chatDetailsTelemetryStateModule.Provider, { value = { get = var46, set = var47 } }, reactModule.createElement(chatDetailsTelemetryLayerModule.Provider, {
			value = reactModule.useCallback(function() --[[ line: 96 ]]
				-- upvalues: var46 (ref)
				local var49 = var46()
				
				return {
					participantsCount = var49.participantsCount,
					isGroupOwner = var49.isGroupOwner
				}
			end, { var46, var43 })
		}, p1.children)))
	})
end

local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local chatLandingScreenWithSwitchNavigator = roactModule.PureComponent:extend("ChatLandingScreenWithSwitchNavigator")
chatLandingScreenWithSwitchNavigator.router = conversationSwitchNavigatorModule.router
chatLandingScreenWithSwitchNavigator.defaultProps = { navigation = nil }

function chatLandingScreenWithSwitchNavigator.init(p2) --[[ line: 140 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), getCurrentRouteModule (ref), fFlagEnablePartyQuickStartButton (ref), resetForSquadLobbyForWideModeModule (ref), roactNavigationModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), argCheckModule (ref), roactModule (ref), reactFocusNavigationModule (ref)
	p2.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p2.props.navigation, "Party.LandingPage") else nil
	
	function p2.navigateToConversation(p3) --[[ line: 145 ]]
		-- upvalues: loggerModule (copy), p2 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p3)
		p2.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p3 })
	end
	
	function p2.navigateToCreateChat() --[[ line: 150 ]]
		-- upvalues: loggerModule (copy), p2 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To CreateNewChat from {screen}")
		p2.props.navigation.navigate(enumScreensModule.CreateNewChat)
	end
	
	function p2.navigateToToast(p4) --[[ line: 155 ]]
		-- upvalues: loggerModule (copy), p2 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p2.props.navigation.navigate(enumScreensModule.RoactChatToast, p4)
	end
	
	function p2.navigateToNotifications() --[[ line: 160 ]]
		-- upvalues: p2 (ref), enumScreensModule (copy), loggerModule (copy)
		local notifications = p2.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.Notifications]
		
		if notifications then
			loggerModule:info("Navigate To Notifications from {screen}")
			notifications()
			
			return
		end
		loggerModule:warning("Notifications page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p2.navigateToPrivacy() --[[ line: 171 ]]
		-- upvalues: p2 (ref), enumScreensModule (copy), loggerModule (copy)
		local privacySettings = p2.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.PrivacySettings]
		
		if privacySettings then
			loggerModule:info("Navigate To PrivacySettings from {screen}")
			privacySettings()
			
			return
		end
		loggerModule:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p2.navigateToSquadLobby(p5) --[[ line: 182 ]]
		-- upvalues: loggerModule (copy), getCurrentRouteModule (copy), p2 (ref), enumScreensModule (copy), fFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForWideModeModule (copy), roactNavigationModule (copy)
		loggerModule:info("Navigate To SquadLobby from {screen}")
		local var50 = getCurrentRouteModule(p2.props.navigation.state)
		
		if var50 and var50.params and (var50.params.conversationId == p5 and var50.routeName == enumScreensModule.ChatConversation) then
			p2.props.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = p5 })
			
			return
		elseif fFlagEnablePartyQuickStartButton then
			resetForSquadLobbyForWideModeModule(p2.props.navigation, p5)
			
			return
		end
		p2.props.navigation.navigate(enumScreensModule.ChatLanding, nil, roactNavigationModule.StackActions.reset({
			index = 2,
			actions = {
				roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.ChatConversation,
					params = { conversationId = p5 }
				}),
				roactNavigationModule.Actions.navigate({
					routeName = enumScreensModule.SquadLobby,
					params = { conversationId = p5 }
				})
			}
		}))
	end
	
	function p2.setScreenTopBar(p6) --[[ line: 219 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p2 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, p6)
			
			return
		end
		local setScreenTopBar = p2.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.ChatLanding, p6)
	end
	
	p2.leftContainerRef = roactModule.createRef()
	p2.rightContainerRef = roactModule.createRef()
	p2.focusNavigationService = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

function chatLandingScreenWithSwitchNavigator.render(p7) --[[ line: 234 ]]
	-- upvalues: loggerModule (ref), argCheckModule (ref), withStyle (ref), roactModule (ref), LeftContainerTelemetryProviders (ref), topBarProviderModule (ref), enumScreensModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), chatLandingTopBarModule (ref), createChatTopBarModule (ref), cryoModule (ref), chatLandingScreenModule (ref), chatSearchBoxModule (ref), providerModule (ref), appChatFixChatLandingContainerKeyPropConflict (ref), chatLandingContainerModule (ref), RightContainerTelemetryProviders (ref), conversationSwitchNavigatorModule (ref), conversationStackNavigationFocusListenerModule (ref)
	loggerModule:info("{screen} render")
	local var52 = argCheckModule.isNotNil(p7.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator")
	local key = var52 and var52.getParam("key", "") or ""
	local showSearchRow = var52.getScreenProps("showSearchRow", true)
	local topBarHeight = var52.getScreenProps("topBarHeight", 0)
	
	return withStyle(function(p8) --[[ line: 241 ]]
		-- upvalues: roactModule (copy), LeftContainerTelemetryProviders (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), p7 (ref), fFlagAppChatTopBarConfigDrivenModule (copy), chatLandingTopBarModule (copy), var52 (ref), createChatTopBarModule (copy), cryoModule (copy), chatLandingScreenModule (copy), showSearchRow (ref), chatSearchBoxModule (copy), topBarHeight (ref), providerModule (copy), appChatFixChatLandingContainerKeyPropConflict (copy), chatLandingContainerModule (copy), key (ref), RightContainerTelemetryProviders (copy), conversationSwitchNavigatorModule (copy), conversationStackNavigationFocusListenerModule (copy)
		return roactModule.createElement(conversationStackNavigationFocusListenerModule, {
			navigation = var52,
			leftContainerRef = p7.leftContainerRef,
			rightContainerRef = p7.rightContainerRef
		}, {
			LeftContainerProviders = roactModule.createElement(LeftContainerTelemetryProviders, {}, {
				LeftContainer = roactModule.createElement(topBarProviderModule, {
					screenName = enumScreensModule.ChatLanding,
					render = function(p9) --[[ line: 246 ]]
						-- upvalues: enumScreensModule (copy), argCheckModule (copy), roactModule (copy), p7 (copy), fFlagAppChatTopBarConfigDrivenModule (copy), chatLandingTopBarModule (copy), var52 (copy), createChatTopBarModule (copy), cryoModule (copy), chatLandingScreenModule (copy), showSearchRow (copy), chatSearchBoxModule (copy), topBarHeight (copy), providerModule (copy), p8 (ref), appChatFixChatLandingContainerKeyPropConflict (copy), chatLandingContainerModule (copy), key (copy)
						local screenTopBar = p9.getScreenTopBar(enumScreensModule.ChatLanding)
						argCheckModule.isType(screenTopBar, "table", "screenTopBar")
						
						return roactModule.createElement("Frame", {
							Size = UDim2.new(0.37, 0, 1, 0),
							Position = UDim2.new(0, 0, 0, 0),
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							[roactModule.Ref] = p7.leftContainerRef
						}, {
							layout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
							leftTopBar = if fFlagAppChatTopBarConfigDrivenModule() then roactModule.createElement(chatLandingTopBarModule, {
								screenName = enumScreensModule.ChatLanding,
								navigation = var52
							}) else createChatTopBarModule(cryoModule.Dictionary.join(screenTopBar, { navigation = var52 }, chatLandingScreenModule.navigationOptions({
								screenProps = nil,
								navigationOptions = nil,
								navigation = var52
							}), { backButtonEnabled = false, shouldBoldHeader = true })),
							filterBox = if showSearchRow then roactModule.createElement(chatSearchBoxModule, {
								height = topBarHeight,
								initialText = screenTopBar.filterText,
								onFilter = function(p10) --[[ line: 284 ]]
									-- upvalues: p9 (ref), enumScreensModule (copy)
									p9.setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p10 })
								end
							}) else nil,
							content = roactModule.createElement(providerModule, {
								value = {
									left = var52.getScreenProps("appChatOuterPadding", 12),
									right = var52.getScreenProps("appChatInnerPadding", 12)
								}
							}, {
								ChatLanding = roactModule.createElement("Frame", {
									BorderSizePixel = 0,
									LayoutOrder = 2,
									Size = UDim2.new(1, 0, 1, (-var52.getScreenProps("topBarHeight", 0)) - (if showSearchRow then topBarHeight else 0)),
									BackgroundTransparency = p8.Tokens.Color.None.Transparency
								}, {
									ChatLandingContainer = if appChatFixChatLandingContainerKeyPropConflict then nil else roactModule.createElement(chatLandingContainerModule, {
										isShowingFilterBox = screenTopBar.shouldRenderCenter,
										filterText = screenTopBar.filterText,
										navigateToConversation = p7.navigateToConversation,
										navigateToCreateChat = p7.navigateToCreateChat,
										navigateToPrivacy = p7.navigateToPrivacy,
										navigateToSquadLobby = p7.navigateToSquadLobby,
										navigateToToast = p7.navigateToToast,
										navigateToAddFriends = p7.props.navigation.getScreenProps("navigateToAddFriends", {}),
										key = "ChatLanding" .. key
									}),
									if appChatFixChatLandingContainerKeyPropConflict then roactModule.createElement(chatLandingContainerModule, {
										isShowingFilterBox = screenTopBar.shouldRenderCenter,
										filterText = screenTopBar.filterText,
										navigateToConversation = p7.navigateToConversation,
										navigateToCreateChat = p7.navigateToCreateChat,
										navigateToPrivacy = p7.navigateToPrivacy,
										navigateToSquadLobby = p7.navigateToSquadLobby,
										navigateToToast = p7.navigateToToast,
										navigateToAddFriends = p7.props.navigation.getScreenProps("navigateToAddFriends", {}),
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
				BackgroundColor3 = p8.Theme.Divider.Color,
				BackgroundTransparency = p8.Theme.Divider.Transparency,
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
					[roactModule.Ref] = p7.rightContainerRef
				}, {
					Content = roactModule.createElement(providerModule, {
						value = {
							left = var52.getScreenProps("appChatInnerPadding", 12),
							right = var52.getScreenProps("appChatOuterPadding", 12)
						}
					}, {
						ConversationSwitchNavigator = roactModule.createElement(conversationSwitchNavigatorModule, { navigation = var52 })
					})
				})
			})
		})
	end)
end

function chatLandingScreenWithSwitchNavigator.didMount(p11) --[[ line: 384 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getFFlagEnableAppChatInExperience (ref), sharedFlagsModule (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), getFFlagIsSquadEnabled (ref), focusBehaviorsModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		local navigation = p11.props.navigation
		local var57 = if navigation.getScreenProps("navigateToRootStack", nil) then true else false
		local isInExperience = getFFlagEnableAppChatInExperience() and navigation.getScreenProps("isInExperience", false)
		local appChatInnerPadding = navigation.getScreenProps("appChatInnerPadding", 12)
		
		if sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate then
			appChatInnerPadding -= navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
		end
		p11.setScreenTopBar({
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
			closeButtonEnabled = isInExperience and var57,
			leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = appChatInnerPadding
		})
	else
		p11.setScreenTopBar({ shouldRenderCenter = false, filterText = "" })
	end
	if p11.focusNavigationService then
		p11.focusNavigationService:registerFocusBehavior(p11.leftContainerRef.current, focusBehaviorsModule.mostRecent())
		p11.focusNavigationService:registerFocusBehavior(p11.rightContainerRef.current, focusBehaviorsModule.mostRecent())
	end
end

function chatLandingScreenWithSwitchNavigator.willUnmount(p12) --[[ line: 446 ]]
	if p12.ixpSubscription then
		p12.ixpSubscription.remove()
	end
	p12.focusNavigationService:teardown()
end

return chatLandingScreenWithSwitchNavigator