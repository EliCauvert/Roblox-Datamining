local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local TopBarProviderModule = require(AppChat.TopBarProvider)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local ChatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local LoggerModule = require(script.Parent.Logger)
local GetCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local ChatSearchBoxModule = require(script.Parent.ChatSearchBox)
local CheckAndOpenChatPushUpsellModule = require(script.Parent.CheckAndOpenChatPushUpsell)
local ResetForSquadLobbyForCompactModeModule = require(AppChat.Utils.resetForSquadLobbyForCompactMode)
local GetFFlagEnableAppChatInExperienceFunction = require(Parent.SharedFlags).GetFFlagEnableAppChatInExperience
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local GetFFlagEnablePushNotificationsUpsellModalChatFunction = require(Parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModalChat
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local FFlagAppChatIxpScreenExposureModule = require(AppChat.Flags.FFlagAppChatIxpScreenExposure)
local FFlagAppChatIxpParallelScreenLayersModule = require(AppChat.Flags.FFlagAppChatIxpParallelScreenLayers)
local FStringAppChatLandingConversationRowsIxpLayerModule = require(AppChat.Flags.FStringAppChatLandingConversationRowsIxpLayer)
local FStringAppChatLandingConversationListIxpLayerModule = require(AppChat.Flags.FStringAppChatLandingConversationListIxpLayer)
local FStringAppChatLandingPerformanceIxpLayerModule = require(AppChat.Flags.FStringAppChatLandingPerformanceIxpLayer)
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local ChatLandingScreen = RoactModule.PureComponent:extend("ChatLandingScreen")
ChatLandingScreen.defaultProps = { navigation = nil }

function ChatLandingScreen.navigationOptions(p1) --[[ Line: 45 ]]
	-- upvalues: GetFFlagEnableAppChatInExperienceFunction (copy), FFlagEnableHeaderBarButtonsUpdate (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), GetFFlagIsSquadEnabledFunction (copy)
	local Navigation = p1.navigation
	local NavigateToRootStackScreenProps = Navigation.getScreenProps("navigateToRootStack", nil)
	local IsInExperienceScreenProps = Navigation.getScreenProps("isInExperience", false)
	local v1: boolean = if NavigateToRootStackScreenProps then true else false
	local IsInExperienceScreenProps1 = GetFFlagEnableAppChatInExperienceFunction() and IsInExperienceScreenProps
	local AppChatInnerPaddingScreenProps = if Navigation.getScreenProps("wideMode", false) then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12)
	
	if FFlagEnableHeaderBarButtonsUpdate then
		AppChatInnerPaddingScreenProps -= Navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
	return {
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
		closeButtonEnabled = IsInExperienceScreenProps1 and v1,
		tabBarVisible = not NavigateToRootStackScreenProps or nil,
		leftPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = AppChatInnerPaddingScreenProps
	}
end

function ChatLandingScreen.init(p1) --[[ Line: 96 ]]
	-- upvalues: FFlagAppChatIxpScreenExposureModule (copy), IXPNavigationUtilsModule (copy), FFlagAppChatIxpParallelScreenLayersModule (copy), FStringAppChatLandingConversationRowsIxpLayerModule (copy), FStringAppChatLandingConversationListIxpLayerModule (copy), FStringAppChatLandingPerformanceIxpLayerModule (copy), LoggerModule (copy), EnumScreensModule (copy), GetCurrentRouteModule (copy), FFlagEnablePartyQuickStartButton (copy), ResetForSquadLobbyForCompactModeModule (copy), RoactNavigationModule (copy), GetTopBarStoreModule (copy)
	p1.ixpSubscription = if FFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.LandingPage") else nil
	p1.conversationRowsIxpSubscription = if FFlagAppChatIxpScreenExposureModule and FFlagAppChatIxpParallelScreenLayersModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, FStringAppChatLandingConversationRowsIxpLayerModule) else nil
	p1.conversationListIxpSubscription = if FFlagAppChatIxpScreenExposureModule and FFlagAppChatIxpParallelScreenLayersModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, FStringAppChatLandingConversationListIxpLayerModule) else nil
	p1.performanceIxpSubscription = if FFlagAppChatIxpScreenExposureModule and FFlagAppChatIxpParallelScreenLayersModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, FStringAppChatLandingPerformanceIxpLayerModule) else nil
	
	function p1.navigateToConversation(ConversationId) --[[ Line: 116 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, {
			navigatedWithFocus = false,
			conversationId = ConversationId
		})
		p1.resetScreenTopBar()
	end
	
	function p1.navigateToCreateChat() --[[ Line: 125 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To CreateNewChat from {screen}")
		p1.props.navigation.push(EnumScreensModule.CreateNewChat)
	end
	
	function p1.navigateToToast(p2) --[[ Line: 130 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.navigateToPrivacy() --[[ Line: 135 ]]
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
	
	function p1.navigateToSquadLobby(ConversationId) --[[ Line: 146 ]]
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
	
	function p1.setScreenTopBar(ChatLanding) --[[ Line: 178 ]]
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatLanding, ChatLanding)
	end
	
	function p1.resetScreenTopBar() --[[ Line: 182 ]]
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy)
		local v1 = GetTopBarStoreModule(false).getScreenTopBar(EnumScreensModule.ChatLanding)(false) or {}
		
		if v1.filterText == "" and v1.shouldRenderCenter then
			p1.setScreenTopBar({ shouldRenderCenter = false, isSecondary = false })
		end
	end
end

function ChatLandingScreen.render(p1) --[[ Line: 193 ]]
	-- upvalues: LoggerModule (copy), ArgCheckModule (copy), RoactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ChatLandingContainerModule (copy), ChatSearchBoxModule (copy), GetFFlagEnablePushNotificationsUpsellModalChatFunction (copy), CheckAndOpenChatPushUpsellModule (copy)
	LoggerModule:info("{screen} render")
	local NavigationInChatLandingScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in ChatLandingScreen")
	local KeyParam = NavigationInChatLandingScreen and NavigationInChatLandingScreen.getParam("key", "") or ""
	local ShowSearchRowScreenProps = NavigationInChatLandingScreen.getScreenProps("showSearchRow", true)
	local TopBarHeightScreenProps = NavigationInChatLandingScreen.getScreenProps("topBarHeight", 0)
	
	return RoactModule.createElement(TopBarProviderModule, {
		screenName = EnumScreensModule.ChatLanding,
		render = function(p2) --[[ Line: 202 ]]
			-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), RoactModule (upval), ChatLandingContainerModule (upval), ShowSearchRowScreenProps (copy), NavigationInChatLandingScreen (copy), p1 (copy), KeyParam (copy), ChatSearchBoxModule (upval), TopBarHeightScreenProps (copy), GetFFlagEnablePushNotificationsUpsellModalChatFunction (upval), CheckAndOpenChatPushUpsellModule (upval)
			local ScreenTopBar = p2.getScreenTopBar(EnumScreensModule.ChatLanding)
			ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
			local Element = RoactModule.createElement(ChatLandingContainerModule, {
				isShowingFilterBox = ScreenTopBar.shouldRenderCenter or ShowSearchRowScreenProps,
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
					onFilter = function(FilterText) --[[ Line: 236 ]]
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

function ChatLandingScreen.didMount(p1) --[[ Line: 257 ]]
	-- upvalues: LoggerModule (copy), GetFFlagEnableAppChatInExperienceFunction (copy), SharedFlagsModule (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), GetFFlagIsSquadEnabledFunction (copy)
	LoggerModule:info("{screen} mounted")
	local Navigation = p1.props.navigation
	local IsInExperienceScreenProps = Navigation.getScreenProps("isInExperience", false)
	local v1: boolean = if Navigation.getScreenProps("navigateToRootStack", nil) then true else false
	local IsInExperienceScreenProps1 = GetFFlagEnableAppChatInExperienceFunction() and IsInExperienceScreenProps
	local AppChatInnerPaddingScreenProps = if Navigation.getScreenProps("wideMode", false) then Navigation.getScreenProps("appChatInnerPadding", 12) else Navigation.getScreenProps("appChatOuterPadding", 12)
	
	if SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate then
		AppChatInnerPaddingScreenProps -= Navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
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
		closeButtonEnabled = IsInExperienceScreenProps1 and v1,
		leftPaddingOverride = Navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = AppChatInnerPaddingScreenProps
	})
end

function ChatLandingScreen.willUnmount(p1) --[[ Line: 309 ]]
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
	if p1.conversationRowsIxpSubscription then
		p1.conversationRowsIxpSubscription.remove()
	end
	if p1.conversationListIxpSubscription then
		p1.conversationListIxpSubscription.remove()
	end
	if p1.performanceIxpSubscription then
		p1.performanceIxpSubscription.remove()
	end
end

return ChatLandingScreen