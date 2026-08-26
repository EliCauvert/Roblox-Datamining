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
chatDetailsScreen.navigationOptions = if getFFlagAppChatEnableRootedNavigationModule() then chatDetailsNavigationOptionsModule.getNavigationOptions else function()
	-- upvalues: chatDetailsNavigationOptionsModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	return {
		headerText = chatDetailsNavigationOptionsModule.getHeaderText(),
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsTopBarActionButton("back") else nil
	}
end

function chatDetailsScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), enumScreensModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatDetailsPage") else nil
	
	function p0.navigateToEditChatMembers(p2)
		-- upvalues: loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To EditChatMembers from {screen}")
		p1.props.navigation.navigate(enumScreensModule.EditChatMembers, if getFFlagAppChatEnableRootedNavigationModule() then {
			conversation = p2,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversation = p2 })
	end
	
	function p0.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p0.navigateToDialog(p2, p3)
		-- upvalues: loggerModule (copy), p1 (ref)
		loggerModule:info("Navigate To {} from {screen}", p2)
		p1.props.navigation.navigate(p2, p3)
	end
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		function p0.closeRootedChatDetails()
			-- upvalues: p1 (ref)
			local navigateToRootStack = p1.props.navigation.getScreenProps("navigateToRootStack", nil)
			
			if navigateToRootStack then
				navigateToRootStack()
				
				return
			elseif p1.props.navigation.isFocused() then
				p1.props.navigation.goBack()
			end
		end
	end
	function p0.navigateBack()
		-- upvalues: p1 (ref), getFFlagAppChatEnableRootedNavigationModule (copy)
		if p1.props.navigation.isFocused() then
			if getFFlagAppChatEnableRootedNavigationModule() and p1.props.navigation.getParam("isRooted", false) then
				p1.closeRootedChatDetails()
				
				return
			end
			p1.props.navigation.goBack()
		end
	end
	
	function p0.navigateToConversation(p2)
		-- upvalues: loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation from {screen}")
		p1.props.navigation.navigate(enumScreensModule.ChatConversation, if getFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = p2,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversationId = p2 })
	end
	
	function p0.navigateToChatLanding()
		-- upvalues: loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ChatLanding from {screen}")
		
		if getFFlagAppChatEnableRootedNavigationModule() and p1.props.navigation.getParam("isRooted", false) then
			p1.closeRootedChatDetails()
			
			return
		elseif p1.props.navigation.getScreenProps("wideMode", false) then
			p1.props.navigation.navigate(enumScreensModule.EmptyConversation)
			
			return
		end
		p1.props.navigation.navigate(enumScreensModule.ChatLanding)
	end
end

function chatDetailsScreen.render(p1)
	-- upvalues: loggerModule (ref), roactModule (ref), chatDetailsContainerModule (ref)
	local navigation = p1.props.navigation
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
		navigateBack = p1.navigateBack,
		navigateToEditChatMembers = p1.navigateToEditChatMembers,
		navigateToDialog = p1.navigateToDialog,
		navigateToToast = p1.navigateToToast,
		navigateToConversation = p1.navigateToConversation,
		navigateToChatLanding = p1.navigateToChatLanding
	})
end

function chatDetailsScreen.didMount(p1)
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), chatDetailsNavigationOptionsModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), getRootedNavigationStoreModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() or fFlagAppChatTopBarSignalsStoreModule then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatDetails, chatDetailsNavigationOptionsModule.getTopBarConfig(p1.props.navigation))
	end
	if getFFlagAppChatEnableRootedNavigationModule() and p1.props.navigation.getParam("isRooted", false) then
		getRootedNavigationStoreModule(false).completeNavigation(p1.props.navigation.getParam("rootedNavigationRequestId", nil))
	end
end

function chatDetailsScreen.willUnmount(p1)
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return chatDetailsScreen