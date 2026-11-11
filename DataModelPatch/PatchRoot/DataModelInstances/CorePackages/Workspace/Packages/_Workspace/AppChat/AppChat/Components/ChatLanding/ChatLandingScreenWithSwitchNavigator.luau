local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FocusBehaviorsModule = require(Parent.FocusBehaviors)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local ChatDetailsTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local ChatDetailsTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatDetailsTelemetryState)
local TopBarProviderModule = require(AppChat.TopBarProvider)
local CreateChatTopBarModule = require(AppChat.createChatTopBar)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ChatLandingTopBarModule = require(AppChat.Components.TopBar.ChatLandingTopBar)
local ConversationSwitchNavigatorModule = require(AppChat.Navigators.Wide.conversationSwitchNavigator)
local ConversationStackNavigationFocusListenerModule = require(script.Parent.ConversationStackNavigationFocusListener)
local ResetForSquadLobbyForWideModeModule = require(AppChat.Utils.resetForSquadLobbyForWideMode)
local ChatLandingScreenModule = require(script.Parent.ChatLandingScreen)
local ChatSearchBoxModule = require(script.Parent.ChatSearchBox)
local ChatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local LoggerModule = require(script.Parent.Logger)
local GetCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local ProviderModule = require(AppChat.Contexts.ChatPagePadding.Provider)
local UseGetAndSetRefModule = require(AppChat.Hooks.useGetAndSetRef)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local GetFFlagEnableAppChatInExperienceFunction = SharedFlagsModule.GetFFlagEnableAppChatInExperience
local AppChatFixChatLandingContainerKeyPropConflict = game:DefineFastFlag("AppChatFixChatLandingContainerKeyPropConflict", false)
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation

local function LeftContainerTelemetryProviders(p1)
	-- upvalues: UseGetAndSetRefModule (copy), ReactModule (copy), ChatLandingTelemetryStateModule (copy), ChatLandingTelemetryLayerModule (copy)
	local UseGetAndSetRefModuleResult, UseGetAndSetRefModuleResult2 = UseGetAndSetRefModule({})
	
	return ReactModule.createElement(ChatLandingTelemetryStateModule.Provider, {
		value = {
			get = UseGetAndSetRefModuleResult,
			set = UseGetAndSetRefModuleResult2
		}
	}, {
		ReactModule.createElement(ChatLandingTelemetryLayerModule.Provider, {
			value = ReactModule.useCallback(function()
				-- upvalues: UseGetAndSetRefModuleResult (copy)
				local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult()
				
				return {
					chatLandingListCount = UseGetAndSetRefModuleResultResult.chatLandingListCount,
					pendingConversationCount = UseGetAndSetRefModuleResultResult.pendingConversationCount,
					unfilteredConversationCount = UseGetAndSetRefModuleResultResult.unfilteredConversationCount
				}
			end, { UseGetAndSetRefModuleResult })
		}, p1.children)
	})
end

local function RightContainerTelemetryProviders(p1)
	-- upvalues: UseGetAndSetRefModule (copy), ReactModule (copy), ChatDetailsTelemetryStateModule (copy), ChatDetailsTelemetryLayerModule (copy), ChatConversationTelemetryStateModule (copy), ChatConversationTelemetryLayerModule (copy)
	local UseGetAndSetRefModuleResult, UseGetAndSetRefModuleResult2 = UseGetAndSetRefModule({})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseGetAndSetRefModuleResult (copy)
		local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult()
		
		return {
			conversationId = UseGetAndSetRefModuleResultResult.conversationId,
			moderationType = UseGetAndSetRefModuleResultResult.moderationType,
			userPendingStatus = UseGetAndSetRefModuleResultResult.userPendingStatus
		}
	end, { UseGetAndSetRefModuleResult })
	local _ = p1.children
	local UseGetAndSetRefModuleResult1, UseGetAndSetRefModuleResult2_1 = UseGetAndSetRefModule({})
	
	return ReactModule.createElement(ChatConversationTelemetryStateModule.Provider, {
		value = {
			get = UseGetAndSetRefModuleResult,
			set = UseGetAndSetRefModuleResult2
		}
	}, {
		ReactModule.createElement(ChatConversationTelemetryLayerModule.Provider, { value = UseResult }, (ReactModule.createElement(ChatDetailsTelemetryStateModule.Provider, {
			value = {
				get = UseGetAndSetRefModuleResult1,
				set = UseGetAndSetRefModuleResult2_1
			}
		}, ReactModule.createElement(ChatDetailsTelemetryLayerModule.Provider, {
			value = ReactModule.useCallback(function()
				-- upvalues: UseGetAndSetRefModuleResult1 (copy)
				local UseGetAndSetRefModuleResultResult = UseGetAndSetRefModuleResult1()
				
				return {
					participantsCount = UseGetAndSetRefModuleResultResult.participantsCount,
					isGroupOwner = UseGetAndSetRefModuleResultResult.isGroupOwner
				}
			end, {
				UseGetAndSetRefModuleResult1,
				UseGetAndSetRefModuleResult
			})
		}, p1.children))))
	})
end

local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local ChatLandingScreenWithSwitchNavigator = RoactModule.PureComponent:extend("ChatLandingScreenWithSwitchNavigator")
ChatLandingScreenWithSwitchNavigator.router = ConversationSwitchNavigatorModule.router
ChatLandingScreenWithSwitchNavigator.defaultProps = { navigation = nil }

function ChatLandingScreenWithSwitchNavigator.init(p1)
	-- upvalues: LoggerModule (copy), EnumScreensModule (copy), GetCurrentRouteModule (copy), FFlagEnablePartyQuickStartButton (copy), ResetForSquadLobbyForWideModeModule (copy), RoactNavigationModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), GetTopBarStoreModule (copy), ArgCheckModule (copy), RoactModule (copy), ReactFocusNavigationModule (copy)
	function p1.navigateToConversation(ConversationId)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
	end
	
	function p1.navigateToCreateChat()
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To CreateNewChat from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.CreateNewChat)
	end
	
	function p1.navigateToToast(p2)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.navigateToNotifications()
		-- upvalues: p1 (copy), EnumScreensModule (upval), LoggerModule (upval)
		local NavigateToLuaAppPagesScreenProp: () -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.Notifications]
		
		if NavigateToLuaAppPagesScreenProp then
			LoggerModule:info("Navigate To Notifications from {screen}")
			NavigateToLuaAppPagesScreenProp()
			
			return
		else
			LoggerModule:warning("Notifications page was not set in navigateToLuaAppPages screenProps")
		end
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
		-- upvalues: LoggerModule (upval), GetCurrentRouteModule (upval), p1 (copy), EnumScreensModule (upval), FFlagEnablePartyQuickStartButton (upval), ResetForSquadLobbyForWideModeModule (upval), RoactNavigationModule (upval)
		LoggerModule:info("Navigate To SquadLobby from {screen}")
		local CurrentRouteModule = GetCurrentRouteModule(p1.props.navigation.state)
		
		if CurrentRouteModule and CurrentRouteModule.params and CurrentRouteModule.params.conversationId == ConversationId and CurrentRouteModule.routeName == EnumScreensModule.ChatConversation then
			p1.props.navigation.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
			
			return
		end
		if FFlagEnablePartyQuickStartButton then
			ResetForSquadLobbyForWideModeModule(p1.props.navigation, ConversationId)
			
			return
		else
			p1.props.navigation.navigate(EnumScreensModule.ChatLanding, nil, RoactNavigationModule.StackActions.reset({
				index = 2,
				actions = {
					RoactNavigationModule.Actions.navigate({
						routeName = EnumScreensModule.ChatConversation,
						params = { conversationId = ConversationId }
					}),
					RoactNavigationModule.Actions.navigate({
						routeName = EnumScreensModule.SquadLobby,
						params = { conversationId = ConversationId }
					})
				}
			}))
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
	
	p1.leftContainerRef = RoactModule.createRef()
	p1.rightContainerRef = RoactModule.createRef()
	p1.focusNavigationService = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
end

function ChatLandingScreenWithSwitchNavigator.render(p1)
	-- upvalues: LoggerModule (copy), ArgCheckModule (copy), WithStyleFunction (copy), RoactModule (copy), LeftContainerTelemetryProviders (copy), TopBarProviderModule (copy), EnumScreensModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), ChatLandingTopBarModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), ChatLandingScreenModule (copy), ChatSearchBoxModule (copy), ProviderModule (copy), AppChatFixChatLandingContainerKeyPropConflict (copy), ChatLandingContainerModule (copy), RightContainerTelemetryProviders (copy), ConversationSwitchNavigatorModule (copy), ConversationStackNavigationFocusListenerModule (copy)
	LoggerModule:info("{screen} render")
	local NavigationInChatLandingScreenWithSwitchNavigator = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in ChatLandingScreenWithSwitchNavigator")
	local KeyParam = NavigationInChatLandingScreenWithSwitchNavigator and NavigationInChatLandingScreenWithSwitchNavigator.getParam("key", "") or ""
	local ShowSearchRowScreenProps = NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("showSearchRow", true)
	local TopBarHeightScreenProps = NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("topBarHeight", 0)
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), LeftContainerTelemetryProviders (upval), TopBarProviderModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), p1 (copy), FFlagAppChatTopBarConfigDrivenModule (upval), ChatLandingTopBarModule (upval), NavigationInChatLandingScreenWithSwitchNavigator (copy), CreateChatTopBarModule (upval), CryoModule (upval), ChatLandingScreenModule (upval), ShowSearchRowScreenProps (copy), ChatSearchBoxModule (upval), TopBarHeightScreenProps (copy), ProviderModule (upval), AppChatFixChatLandingContainerKeyPropConflict (upval), ChatLandingContainerModule (upval), KeyParam (copy), RightContainerTelemetryProviders (upval), ConversationSwitchNavigatorModule (upval), ConversationStackNavigationFocusListenerModule (upval)
		return RoactModule.createElement(ConversationStackNavigationFocusListenerModule, {
			navigation = NavigationInChatLandingScreenWithSwitchNavigator,
			leftContainerRef = p1.leftContainerRef,
			rightContainerRef = p1.rightContainerRef
		}, {
			LeftContainerProviders = RoactModule.createElement(LeftContainerTelemetryProviders, {}, {
				LeftContainer = RoactModule.createElement(TopBarProviderModule, {
					screenName = EnumScreensModule.ChatLanding,
					render = function(p3)
						-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), RoactModule (upval), p1 (upval), FFlagAppChatTopBarConfigDrivenModule (upval), ChatLandingTopBarModule (upval), NavigationInChatLandingScreenWithSwitchNavigator (upval), CreateChatTopBarModule (upval), CryoModule (upval), ChatLandingScreenModule (upval), ShowSearchRowScreenProps (upval), ChatSearchBoxModule (upval), TopBarHeightScreenProps (upval), ProviderModule (upval), p2 (copy), AppChatFixChatLandingContainerKeyPropConflict (upval), ChatLandingContainerModule (upval), KeyParam (upval)
						local ScreenTopBar = p3.getScreenTopBar(EnumScreensModule.ChatLanding)
						ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
						
						return RoactModule.createElement("Frame", {
							Size = UDim2.new(0.37, 0, 1, 0),
							Position = UDim2.new(0, 0, 0, 0),
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							[RoactModule.Ref] = p1.leftContainerRef
						}, {
							layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
							leftTopBar = if FFlagAppChatTopBarConfigDrivenModule() then RoactModule.createElement(ChatLandingTopBarModule, {
								screenName = EnumScreensModule.ChatLanding,
								navigation = NavigationInChatLandingScreenWithSwitchNavigator
							}) else CreateChatTopBarModule(CryoModule.Dictionary.join(ScreenTopBar, {
								navigation = NavigationInChatLandingScreenWithSwitchNavigator
							}, ChatLandingScreenModule.navigationOptions({
								screenProps = nil,
								navigationOptions = nil,
								navigation = NavigationInChatLandingScreenWithSwitchNavigator
							}), { backButtonEnabled = false, shouldBoldHeader = true })),
							filterBox = if ShowSearchRowScreenProps then RoactModule.createElement(ChatSearchBoxModule, {
								height = TopBarHeightScreenProps,
								initialText = ScreenTopBar.filterText,
								onFilter = function(FilterText)
									-- upvalues: p3 (copy), EnumScreensModule (upval)
									p3.setScreenTopBar(EnumScreensModule.ChatLanding, { filterText = FilterText })
								end
							}) else nil,
							content = RoactModule.createElement(ProviderModule, {
								value = {
									left = NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("appChatOuterPadding", 12),
									right = NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("appChatInnerPadding", 12)
								}
							}, {
								ChatLanding = RoactModule.createElement("Frame", {
									BorderSizePixel = 0,
									LayoutOrder = 2,
									Size = UDim2.new(1, 0, 1, -NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("topBarHeight", 0) - (if ShowSearchRowScreenProps then TopBarHeightScreenProps else 0)),
									BackgroundTransparency = p2.Tokens.Color.None.Transparency
								}, {
									ChatLandingContainer = if AppChatFixChatLandingContainerKeyPropConflict then nil else RoactModule.createElement(ChatLandingContainerModule, {
										isShowingFilterBox = ScreenTopBar.shouldRenderCenter,
										filterText = ScreenTopBar.filterText,
										navigateToConversation = p1.navigateToConversation,
										navigateToCreateChat = p1.navigateToCreateChat,
										navigateToPrivacy = p1.navigateToPrivacy,
										navigateToSquadLobby = p1.navigateToSquadLobby,
										navigateToToast = p1.navigateToToast,
										navigateToAddFriends = p1.props.navigation.getScreenProps("navigateToAddFriends", {}),
										key = "ChatLanding" .. KeyParam
									}),
									if AppChatFixChatLandingContainerKeyPropConflict then RoactModule.createElement(ChatLandingContainerModule, {
										isShowingFilterBox = ScreenTopBar.shouldRenderCenter,
										filterText = ScreenTopBar.filterText,
										navigateToConversation = p1.navigateToConversation,
										navigateToCreateChat = p1.navigateToCreateChat,
										navigateToPrivacy = p1.navigateToPrivacy,
										navigateToSquadLobby = p1.navigateToSquadLobby,
										navigateToToast = p1.navigateToToast,
										navigateToAddFriends = p1.props.navigation.getScreenProps("navigateToAddFriends", {}),
										key = "ChatLanding" .. KeyParam
									}) else nil
								})
							})
						})
					end
				})
			}),
			Border = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Divider.Color,
				BackgroundTransparency = p2.Theme.Divider.Transparency,
				Position = UDim2.new(0.37, 0, 0, 0),
				Size = UDim2.new(0, 1, 1, 0)
			}),
			RightContainerProviders = RoactModule.createElement(RightContainerTelemetryProviders, {}, {
				RightContainer = RoactModule.createElement("Frame", {
					Size = UDim2.new(0.63, -1, 1, 0),
					Position = UDim2.new(0.37, 1, 0, 0),
					ClipsDescendants = true,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[RoactModule.Ref] = p1.rightContainerRef
				}, {
					Content = RoactModule.createElement(ProviderModule, {
						value = {
							left = NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("appChatInnerPadding", 12),
							right = NavigationInChatLandingScreenWithSwitchNavigator.getScreenProps("appChatOuterPadding", 12)
						}
					}, {
						ConversationSwitchNavigator = RoactModule.createElement(ConversationSwitchNavigatorModule, {
							navigation = NavigationInChatLandingScreenWithSwitchNavigator
						})
					})
				})
			})
		})
	end)
end

function ChatLandingScreenWithSwitchNavigator.didMount(p1)
	-- upvalues: LoggerModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetFFlagEnableAppChatInExperienceFunction (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), GetFFlagIsSquadEnabledFunction (copy), FocusBehaviorsModule (copy)
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
			headerText = if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then {
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
			},
			closeButtonEnabled = GetFFlagEnableAppChatInExperienceFunction() and IsInExperienceScreenProps and v1,
			leftPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = Navigation.getScreenProps("appChatInnerPadding", 12)
		})
	else
		p1.setScreenTopBar({ shouldRenderCenter = false, filterText = "" })
	end
	if p1.focusNavigationService then
		p1.focusNavigationService:registerFocusBehavior(p1.leftContainerRef.current, FocusBehaviorsModule.mostRecent())
		p1.focusNavigationService:registerFocusBehavior(p1.rightContainerRef.current, FocusBehaviorsModule.mostRecent())
	end
end

function ChatLandingScreenWithSwitchNavigator.willUnmount(p1)
	p1.focusNavigationService:teardown()
end

return ChatLandingScreenWithSwitchNavigator