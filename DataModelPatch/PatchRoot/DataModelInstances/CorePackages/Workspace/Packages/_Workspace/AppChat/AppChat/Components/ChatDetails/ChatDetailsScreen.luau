local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoactRoduxModule = require(Parent.RoactRodux)
local ChatDetailsContainerModule = require(script.Parent.ChatDetailsContainer)
local ChatDetailsNavigationOptionsModule = require(script.Parent.ChatDetailsNavigationOptions)
local LoggerModule = require(script.Parent.Logger)
local ConversationModule = require(AppChat.Models.Conversation)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatOpenChatIxpEnabledModule = require(AppChat.Flags.FFlagAppChatOpenChatIxpEnabled)
local FStringAppChatOpenChatIxpLayerModule = require(AppChat.Flags.FStringAppChatOpenChatIxpLayer)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
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
	-- upvalues: FFlagAppChatOpenChatIxpEnabledModule (copy), RoactNavigationModule (copy), IXPService (copy), FStringAppChatOpenChatIxpLayerModule (copy), LoggerModule (copy), EnumScreensModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy)
	p1.ixpSubscription = if FFlagAppChatOpenChatIxpEnabledModule then p1.props.navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
		-- upvalues: p1 (copy), IXPService (upval), FStringAppChatOpenChatIxpLayerModule (upval)
		if p1.props.isGroupConversation then
			IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatOpenChatIxpLayerModule)
		end
	end) else nil
	
	function p1.navigateToEditChatMembers(Conversation)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To EditChatMembers from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.EditChatMembers, { conversation = Conversation })
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
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
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
	-- upvalues: LoggerModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), ChatDetailsNavigationOptionsModule (copy)
	LoggerModule:info("{screen} mounted")
	
	if FFlagAppChatTopBarConfigDrivenModule() or FFlagAppChatTopBarSignalsStoreModule then
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatDetails, ChatDetailsNavigationOptionsModule.getTopBarConfig(p1.props.navigation))
	end
end

function ChatDetailsScreen.willUnmount(p1)
	-- upvalues: FFlagAppChatOpenChatIxpEnabledModule (copy)
	if FFlagAppChatOpenChatIxpEnabledModule then
		p1.ixpSubscription.remove()
	end
end

if FFlagAppChatOpenChatIxpEnabledModule then
	ChatDetailsScreen = RoactRoduxModule.connect(function(p1, p2)
		-- upvalues: ConversationModule (copy)
		local Conversation = p1.ChatAppReducer.Conversations[p2.navigation.getParam("conversationId")]
		
		return {
			isGroupConversation = Conversation ~= nil and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
		}
	end)(ChatDetailsScreen)
	ChatDetailsScreen.navigationOptions = if GetFFlagAppChatEnableRootedNavigationModule() then ChatDetailsNavigationOptionsModule.getNavigationOptions else navigationOptions
end
return ChatDetailsScreen