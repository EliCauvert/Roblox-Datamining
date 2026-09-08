local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local topBarProviderModule = require(appChat.TopBarProvider)
local argCheckModule = require(parent.ArgCheck)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local chatLandingContainerModule = require(script.Parent.ChatLandingContainer)
local loggerModule = require(script.Parent.Logger)
local getCurrentRouteModule = require(script.Parent.Utils.getCurrentRoute)
local chatSearchBoxModule = require(script.Parent.ChatSearchBox)
local checkAndOpenChatPushUpsellModule = require(script.Parent.CheckAndOpenChatPushUpsell)
local resetForSquadLobbyForCompactModeModule = require(appChat.Utils.resetForSquadLobbyForCompactMode)
local getFFlagEnableAppChatInExperience = require(parent.SharedFlags).GetFFlagEnableAppChatInExperience
local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local getFFlagEnablePushNotificationsUpsellModalChat = require(parent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModalChat
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableHeaderBarButtonsUpdate = sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local fFlagAppChatChatLandingScreenRenameFixEnabled = sharedFlagsModule.FFlagAppChatChatLandingScreenRenameFixEnabled
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local chatLandingScreen = roactModule.PureComponent:extend("ChatLandingScreen")
chatLandingScreen.defaultProps = { navigation = nil }

function chatLandingScreen.navigationOptions(p1)
	-- upvalues: getFFlagEnableAppChatInExperience (ref), fFlagEnableHeaderBarButtonsUpdate (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), getFFlagIsSquadEnabled (ref)
	local navigation = p1.navigation
	local navigateToRootStack = navigation.getScreenProps("navigateToRootStack", nil)
	local var1 = if navigateToRootStack then true else false
	local isInExperience = getFFlagEnableAppChatInExperience() and navigation.getScreenProps("isInExperience", false)
	local var2 = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
	
	if fFlagEnableHeaderBarButtonsUpdate then
		var2 -= navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
	return {
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
		tabBarVisible = not navigateToRootStack or nil,
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = var2
	}
end

function chatLandingScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), getCurrentRouteModule (ref), fFlagEnablePartyQuickStartButton (ref), resetForSquadLobbyForCompactModeModule (ref), roactNavigationModule (ref), getTopBarStoreModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.LandingPage") else nil
	
	function p1.navigateToConversation(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p2)
		p1.props.navigation.navigate(enumScreensModule.ChatConversation, { navigatedWithFocus = false, conversationId = p2 })
		p1.resetScreenTopBar()
	end
	
	function p1.navigateToCreateChat()
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To CreateNewChat from {screen}")
		p1.props.navigation.push(enumScreensModule.CreateNewChat)
	end
	
	function p1.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p1.navigateToPrivacy()
		-- upvalues: p1 (ref), enumScreensModule (copy), loggerModule (copy)
		local privacySettings = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.PrivacySettings]
		
		if privacySettings then
			loggerModule:info("Navigate To PrivacySettings from {screen}")
			privacySettings()
			
			return
		end
		loggerModule:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p1.navigateToSquadLobby(p2)
		-- upvalues: loggerModule (copy), getCurrentRouteModule (copy), p1 (ref), enumScreensModule (copy), fFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForCompactModeModule (copy), roactNavigationModule (copy)
		loggerModule:info("Navigate To SquadLobby from {screen}")
		local var1 = getCurrentRouteModule(p1.props.navigation.state)
		
		if var1 and var1.params and (var1.params.conversationId == p2 and var1.routeName == enumScreensModule.ChatConversation) then
			p1.props.navigation.navigate(enumScreensModule.SquadLobby, { conversationId = p2 })
			
			return
		elseif fFlagEnablePartyQuickStartButton then
			resetForSquadLobbyForCompactModeModule(p1.props.navigation, p2)
			
			return
		end
		p1.props.navigation.reset({
			roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding }),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatConversation,
				params = { conversationId = p2 }
			}),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.SquadLobby,
				params = { conversationId = p2 }
			})
		}, 3)
	end
	
	function p1.setScreenTopBar(p2)
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, p2)
	end
	
	function p1.resetScreenTopBar()
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy), p1 (ref)
		local var1 = getTopBarStoreModule(false).getScreenTopBar(enumScreensModule.ChatLanding)(false) or {}
		
		if var1.filterText == "" and var1.shouldRenderCenter then
			p1.setScreenTopBar({ shouldRenderCenter = false, isSecondary = false })
		end
	end
end

function chatLandingScreen.render(p1)
	-- upvalues: loggerModule (ref), argCheckModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), chatLandingContainerModule (ref), chatSearchBoxModule (ref), getFFlagEnablePushNotificationsUpsellModalChat (ref), checkAndOpenChatPushUpsellModule (ref)
	loggerModule:info("{screen} render")
	local var1 = argCheckModule.isNotNil(p1.props.navigation, "navigation in ChatLandingScreen")
	local key = var1 and var1.getParam("key", "") or ""
	local showSearchRow = var1.getScreenProps("showSearchRow", true)
	local topBarHeight = var1.getScreenProps("topBarHeight", 0)
	
	return roactModule.createElement(topBarProviderModule, {
		screenName = enumScreensModule.ChatLanding,
		render = function(p2)
			-- upvalues: enumScreensModule (copy), argCheckModule (copy), roactModule (copy), chatLandingContainerModule (copy), var1 (ref), p1 (ref), key (ref), showSearchRow (ref), chatSearchBoxModule (copy), topBarHeight (ref), getFFlagEnablePushNotificationsUpsellModalChat (copy), checkAndOpenChatPushUpsellModule (copy)
			local screenTopBar = p2.getScreenTopBar(enumScreensModule.ChatLanding)
			argCheckModule.isType(screenTopBar, "table", "screenTopBar")
			local var2 = roactModule.createElement(chatLandingContainerModule, {
				isShowingFilterBox = screenTopBar.shouldRenderCenter,
				filterText = screenTopBar.filterText,
				topBarHeight = var1.getScreenProps("topBarHeight", 0),
				navigateToAddFriends = p1.props.navigation.getScreenProps("navigateToAddFriends", {}),
				navigateToConversation = p1.navigateToConversation,
				navigateToCreateChat = p1.navigateToCreateChat,
				navigateToPrivacy = p1.navigateToPrivacy,
				navigateToSquadLobby = p1.navigateToSquadLobby,
				navigateToToast = p1.navigateToToast,
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
					onFilter = function(p3)
						-- upvalues: p2 (ref), enumScreensModule (copy)
						p2.setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p3 })
					end
				}),
				var2
			}) elseif getFFlagEnablePushNotificationsUpsellModalChat() then roactModule.createFragment({
				var2,
				CheckAndOpenChatPushUpsell = roactModule.createElement(checkAndOpenChatPushUpsellModule)
			}) else var2
		end
	})
end

function chatLandingScreen.didMount(p1)
	-- upvalues: loggerModule (ref), getFFlagEnableAppChatInExperience (ref), sharedFlagsModule (ref), fFlagAppChatChatLandingScreenRenameFixEnabled (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), getFFlagIsSquadEnabled (ref)
	loggerModule:info("{screen} mounted")
	local navigation = p1.props.navigation
	local var1 = if navigation.getScreenProps("navigateToRootStack", nil) then true else false
	local isInExperience = getFFlagEnableAppChatInExperience() and navigation.getScreenProps("isInExperience", false)
	local var2 = if navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatInnerPadding", 12) else navigation.getScreenProps("appChatOuterPadding", 12)
	
	if sharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate then
		var2 -= navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end
	local _ = nil
	p1.setScreenTopBar({
		shouldRenderCenter = false,
		filterText = "",
		backButtonEnabled = false,
		isRoot = true,
		isTitleLeftAligned = true,
		shouldBoldHeader = true,
		headerText = if fFlagAppChatChatLandingScreenRenameFixEnabled then if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then {
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
		} elseif argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		} else {
			raw = "Feature.Squads.Label.Party",
			shouldLocalize = true
		},
		closeButtonEnabled = isInExperience and var1,
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = var2
	})
end

function chatLandingScreen.willUnmount(p1)
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return chatLandingScreen