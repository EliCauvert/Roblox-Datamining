local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local RoactModule = require(AppChat.Parent.Roact)
local ChatDetailsContainerModule = require(script.Parent.ChatDetailsContainer)
local ChatDetailsNavigationOptionsModule = require(script.Parent.ChatDetailsNavigationOptions)
local LoggerModule = require(script.Parent.Logger)
local FFlagAppChatIxpScreenExposureModule = require(AppChat.Flags.FFlagAppChatIxpScreenExposure)
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local GetRootedNavigationStoreModule = require(AppChat.Stores.GetRootedNavigationStore)
local ChatDetailsScreen = RoactModule.PureComponent:extend("ChatDetailsScreen")
ChatDetailsScreen.defaultProps = { navigation = nil }

local function navigationOptions()
	-- upvalues: ChatDetailsNavigationOptionsModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy)
	return {
		headerText = ChatDetailsNavigationOptionsModule.getHeaderText(),
		backButtonTestId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsTopBarActionButton("back") else nil
	}
end

ChatDetailsScreen.navigationOptions = if GetFFlagAppChatEnableRootedNavigationModule() then ChatDetailsNavigationOptionsModule.getNavigationOptions else navigationOptions

function ChatDetailsScreen.init(p1)
	-- upvalues: FFlagAppChatIxpScreenExposureModule (copy), IXPNavigationUtilsModule (copy), LoggerModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), EnumScreensModule (copy)
	p1.ixpSubscription = if FFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatDetailsPage") else nil
	
	function p1.navigateToEditChatMembers(Conversation)
		-- upvalues: LoggerModule (upval), GetFFlagAppChatEnableRootedNavigationModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To EditChatMembers from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.EditChatMembers, if GetFFlagAppChatEnableRootedNavigationModule() then {
			conversation = Conversation,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversation = Conversation })
	end
	
	function p1.navigateToToast(p2)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.navigateToDialog(p2, p3)
		-- upvalues: LoggerModule (upval), p1 (copy)
		LoggerModule:info("Navigate To {} from {screen}", p2)
		p1.props.navigation.navigate(p2, p3)
	end
	
	if GetFFlagAppChatEnableRootedNavigationModule() then
		function p1.closeRootedChatDetails()
			-- upvalues: p1 (copy)
			local NavigateToRootStackScreenProps: () -> () = p1.props.navigation.getScreenProps("navigateToRootStack", nil)
			
			if NavigateToRootStackScreenProps then
				NavigateToRootStackScreenProps()
				
				return
			end
			if p1.props.navigation.isFocused() then
				p1.props.navigation.goBack()
			end
		end
	end
	function p1.navigateBack()
		-- upvalues: p1 (copy), GetFFlagAppChatEnableRootedNavigationModule (upval)
		if p1.props.navigation.isFocused() then
			if GetFFlagAppChatEnableRootedNavigationModule() and p1.props.navigation.getParam("isRooted", false) then
				p1.closeRootedChatDetails()
				
				return
			end
			p1.props.navigation.goBack()
		end
	end
	
	function p1.navigateToConversation(ConversationId)
		-- upvalues: LoggerModule (upval), GetFFlagAppChatEnableRootedNavigationModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, if GetFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = ConversationId,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversationId = ConversationId })
	end
	
	function p1.navigateToChatLanding()
		-- upvalues: LoggerModule (upval), GetFFlagAppChatEnableRootedNavigationModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To ChatLanding from {screen}")
		
		if GetFFlagAppChatEnableRootedNavigationModule() and p1.props.navigation.getParam("isRooted", false) then
			p1.closeRootedChatDetails()
			
			return
		end
		if p1.props.navigation.getScreenProps("wideMode", false) then
			p1.props.navigation.navigate(EnumScreensModule.EmptyConversation)
			
			return
		else
			p1.props.navigation.navigate(EnumScreensModule.ChatLanding)
		end
	end
end

function ChatDetailsScreen.render(p1)
	-- upvalues: LoggerModule (copy), RoactModule (copy), ChatDetailsContainerModule (copy)
	local Navigation = p1.props.navigation
	assert(type(Navigation) ~= "nil", "ChatDetailsScreen should be wrapped with Roact Navigation")
	local ConversationIdParam = Navigation.getParam("conversationId", nil)
	
	if ConversationIdParam == nil then
		LoggerModule:warning("ConversationId is required to open {screen}")
		
		return nil
	else
		return RoactModule.createElement(ChatDetailsContainerModule, {
			topBarHeight = Navigation.getScreenProps("topBarHeight", 0),
			wideMode = Navigation.getScreenProps("wideMode", false),
			conversationId = ConversationIdParam,
			navigateBack = p1.navigateBack,
			navigateToEditChatMembers = p1.navigateToEditChatMembers,
			navigateToDialog = p1.navigateToDialog,
			navigateToToast = p1.navigateToToast,
			navigateToConversation = p1.navigateToConversation,
			navigateToChatLanding = p1.navigateToChatLanding
		})
	end
end

function ChatDetailsScreen.didMount(p1)
	-- upvalues: LoggerModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), ChatDetailsNavigationOptionsModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), GetRootedNavigationStoreModule (copy)
	LoggerModule:info("{screen} mounted")
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatDetails, ChatDetailsNavigationOptionsModule.getTopBarConfig(p1.props.navigation))
	
	if GetFFlagAppChatEnableRootedNavigationModule() and p1.props.navigation.getParam("isRooted", false) then
		GetRootedNavigationStoreModule(false).completeNavigation(p1.props.navigation.getParam("rootedNavigationRequestId", nil))
	end
end

function ChatDetailsScreen.willUnmount(p1)
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return ChatDetailsScreen