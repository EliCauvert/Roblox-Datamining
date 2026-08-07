local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local roactModule = require(appChat.Parent.Roact)
local chatDetailsContainerModule = require(script.Parent.ChatDetailsContainer)
local chatDetailsNavigationOptionsModule = require(script.Parent.ChatDetailsNavigationOptions)
local loggerModule = require(script.Parent.Logger)
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local getRootedNavigationStoreModule = require(appChat.Stores.GetRootedNavigationStore)
local chatDetailsScreen = roactModule.PureComponent:extend("ChatDetailsScreen")
chatDetailsScreen.defaultProps = { navigation = nil }
chatDetailsScreen.navigationOptions = if getFFlagAppChatEnableRootedNavigationModule() then chatDetailsNavigationOptionsModule.getNavigationOptions else function() --[[ line: 26 | named "navigationOptions" ]]
	-- upvalues: chatDetailsNavigationOptionsModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	return {
		headerText = chatDetailsNavigationOptionsModule.getHeaderText(),
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsTopBarActionButton("back") else nil
	}
end

function chatDetailsScreen.init(p0) --[[ line: 38 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref)
	p0.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p0.props.navigation, "Party.ChatDetailsPage") else nil
	
	function p0.navigateToEditChatMembers(p1) --[[ line: 43 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To EditChatMembers from {screen}")
		p0.props.navigation.navigate(enumScreensModule.EditChatMembers, { conversation = p1 })
	end
	
	function p0.navigateToToast(p2) --[[ line: 48 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p0.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p0.navigateToDialog(p3, p4) --[[ line: 53 ]]
		-- upvalues: loggerModule (copy), p0 (ref)
		loggerModule:info("Navigate To {} from {screen}", p3)
		p0.props.navigation.navigate(p3, p4)
	end
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		function p0.closeRootedChatDetails() --[[ line: 59 ]]
			-- upvalues: p0 (ref)
			local navigateToRootStack = p0.props.navigation.getScreenProps("navigateToRootStack", nil)
			
			if navigateToRootStack then
				navigateToRootStack()
				
				return
			elseif p0.props.navigation.isFocused() then
				p0.props.navigation.goBack()
			end
		end
	end
	function p0.navigateBack() --[[ line: 69 ]]
		-- upvalues: p0 (ref), getFFlagAppChatEnableRootedNavigationModule (copy)
		if p0.props.navigation.isFocused() then
			if getFFlagAppChatEnableRootedNavigationModule() and p0.props.navigation.getParam("isRooted", false) then
				p0.closeRootedChatDetails()
				
				return
			end
			p0.props.navigation.goBack()
		end
	end
	
	function p0.navigateToConversation(p5) --[[ line: 79 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation from {screen}")
		p0.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p5 })
	end
	
	function p0.navigateToChatLanding() --[[ line: 84 ]]
		-- upvalues: loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ChatLanding from {screen}")
		
		if getFFlagAppChatEnableRootedNavigationModule() and p0.props.navigation.getParam("isRooted", false) then
			p0.closeRootedChatDetails()
			
			return
		elseif p0.props.navigation.getScreenProps("wideMode", false) then
			p0.props.navigation.navigate(enumScreensModule.EmptyConversation)
			
			return
		end
		p0.props.navigation.navigate(enumScreensModule.ChatLanding)
	end
end

function chatDetailsScreen.render(p6) --[[ line: 100 ]]
	-- upvalues: loggerModule (ref), roactModule (ref), chatDetailsContainerModule (ref)
	local navigation = p6.props.navigation
	assert(type(navigation) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation")
	local conversationId = navigation.getParam("conversationId", nil)
	
	if conversationId == nil then
		loggerModule:warning("ConversationId is required to open {screen}")
		
		return nil
	end
	return roactModule.createElement(chatDetailsContainerModule, {
		topBarHeight = navigation.getScreenProps("topBarHeight", 0),
		wideMode = navigation.getScreenProps("wideMode", false),
		conversationId = conversationId,
		navigateBack = p6.navigateBack,
		navigateToEditChatMembers = p6.navigateToEditChatMembers,
		navigateToDialog = p6.navigateToDialog,
		navigateToToast = p6.navigateToToast,
		navigateToConversation = p6.navigateToConversation,
		navigateToChatLanding = p6.navigateToChatLanding
	})
end

function chatDetailsScreen.didMount(p7) --[[ line: 123 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), chatDetailsNavigationOptionsModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), getRootedNavigationStoreModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatDetails, chatDetailsNavigationOptionsModule.getTopBarConfig(p7.props.navigation))
	end
	if getFFlagAppChatEnableRootedNavigationModule() and p7.props.navigation.getParam("isRooted", false) then
		getRootedNavigationStoreModule(false).completeNavigation(p7.props.navigation.getParam("rootedNavigationRequestId", nil))
	end
end

function chatDetailsScreen.willUnmount(p8) --[[ line: 140 ]]
	if p8.ixpSubscription then
		p8.ixpSubscription.remove()
	end
end

return chatDetailsScreen