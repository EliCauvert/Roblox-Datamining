local IXPService = game:GetService("IXPService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local roactRoduxModule = require(parent.RoactRodux)
local chatDetailsContainerModule = require(script.Parent.ChatDetailsContainer)
local loggerModule = require(script.Parent.Logger)
local conversationModule = require(appChat.Models.Conversation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatOpenChatIxpEnabledModule = require(appChat.Flags.FFlagAppChatOpenChatIxpEnabled)
local fStringAppChatOpenChatIxpLayerModule = require(appChat.Flags.FStringAppChatOpenChatIxpLayer)
local chatDetailsScreen = roactModule.PureComponent:extend("ChatDetailsScreen")
chatDetailsScreen.defaultProps = { navigation = nil }

local function navigationOptions() --[[ line: 26 ]]
	-- upvalues: getFFlagIsSquadEnabled (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref)
	return {
		headerText = {
			shouldLocalize = true,
			raw = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.Details" else "Feature.Chat.Label.ChatDetails"
		},
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsTopBarActionButton("back") else nil
	}
end

chatDetailsScreen.navigationOptions = navigationOptions

function chatDetailsScreen.init(p0) --[[ line: 39 ]]
	-- upvalues: fFlagAppChatOpenChatIxpEnabledModule (ref), roactNavigationModule (ref), IXPService (ref), fStringAppChatOpenChatIxpLayerModule (ref), loggerModule (ref), enumScreensModule (ref)
	p0.ixpSubscription = if fFlagAppChatOpenChatIxpEnabledModule then p0.props.navigation.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 44 ]]
		-- upvalues: p0 (ref), IXPService (copy), fStringAppChatOpenChatIxpLayerModule (copy)
		if p0.props.isGroupConversation then
			IXPService:LogFlagLinkedUserLayerExposure(fStringAppChatOpenChatIxpLayerModule)
		end
	end) else nil
	
	function p0.navigateToEditChatMembers(p1) --[[ line: 51 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To EditChatMembers from {screen}")
		p0.props.navigation.navigate(enumScreensModule.EditChatMembers, { conversation = p1 })
	end
	
	function p0.navigateToToast(p2) --[[ line: 56 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p0.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p0.navigateToDialog(p3, p4) --[[ line: 61 ]]
		-- upvalues: loggerModule (copy), p0 (ref)
		loggerModule:info("Navigate To {} from {screen}", p3)
		p0.props.navigation.navigate(p3, p4)
	end
	
	function p0.navigateBack() --[[ line: 66 ]]
		-- upvalues: p0 (ref)
		if p0.props.navigation.isFocused() then
			p0.props.navigation.goBack()
		end
	end
	
	function p0.navigateToConversation(p5) --[[ line: 72 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation from {screen}")
		p0.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p5 })
	end
	
	function p0.navigateToChatLanding() --[[ line: 77 ]]
		-- upvalues: loggerModule (copy), p0 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To ChatLanding from {screen}")
		
		if p0.props.navigation.getScreenProps("wideMode", false) then
			p0.props.navigation.navigate(enumScreensModule.EmptyConversation)
			
			return
		end
		p0.props.navigation.navigate(enumScreensModule.ChatLanding)
	end
end

function chatDetailsScreen.render(p6) --[[ line: 88 ]]
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

function chatDetailsScreen.didMount(_) --[[ line: 111 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getFFlagIsSquadEnabled (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatDetails, {
			backButtonEnabled = true,
			headerText = if getFFlagIsSquadEnabled() then {
				raw = "Feature.Chat.Label.Details",
				shouldLocalize = true
			} else {
				raw = "Feature.Chat.Label.ChatDetails",
				shouldLocalize = true
			}
		})
	end
end

function chatDetailsScreen.willUnmount(p7) --[[ line: 132 ]]
	-- upvalues: fFlagAppChatOpenChatIxpEnabledModule (ref)
	if fFlagAppChatOpenChatIxpEnabledModule then
		p7.ixpSubscription.remove()
	end
end

if fFlagAppChatOpenChatIxpEnabledModule then
	chatDetailsScreen = roactRoduxModule.connect(function(p8, p9) --[[ line: 142 ]]
		-- upvalues: conversationModule (ref)
		local conversationId = p8.ChatAppReducer.Conversations[p9.navigation.getParam("conversationId")]
		
		return {
			isGroupConversation = conversationId ~= nil and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		}
	end)(chatDetailsScreen)
	chatDetailsScreen.navigationOptions = navigationOptions
end
return chatDetailsScreen