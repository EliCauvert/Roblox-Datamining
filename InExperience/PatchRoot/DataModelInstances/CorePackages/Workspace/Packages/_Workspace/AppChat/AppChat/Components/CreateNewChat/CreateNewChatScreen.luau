local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactModule = require(Parent.Roact)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local CreateNewChatContainerModule = require(script.Parent.CreateNewChatContainer)
local LoggerModule = require(script.Parent.Logger)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagAppChatIxpScreenExposureModule = require(AppChat.Flags.FFlagAppChatIxpScreenExposure)
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local CreateNewChatScreen = RoactModule.PureComponent:extend("CreateNewChatScreen")
CreateNewChatScreen.defaultProps = {}

local function _(p1)
	local Navigation = p1 and p1.navigation
	
	return if Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
end

function CreateNewChatScreen.navigationOptions(p1)
	local Navigation = p1 and p1.navigation
	
	return {
		tabBarVisible = if Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
	}
end

function CreateNewChatScreen.init(p1)
	-- upvalues: FFlagAppChatIxpScreenExposureModule (copy), IXPNavigationUtilsModule (copy), LoggerModule (copy), EnumScreensModule (copy), GetTopBarStoreModule (copy)
	p1.ixpSubscription = if FFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatMembersPage") else nil
	
	function p1.navigateToConversation(ConversationId)
		-- upvalues: p1 (copy), LoggerModule (upval), EnumScreensModule (upval)
		local Navigation = p1.props.navigation
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		
		if Navigation.getScreenProps("wideMode", false) then
			Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
			
			return
		else
			Navigation.replace(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
		end
	end
	
	function p1.navigateToToast(p2)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.setSystemButtonActivated(SystemButtonActivated)
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.CreateNewChat, { systemButtonActivated = SystemButtonActivated })
	end
	
	function p1.setSystemButtonEnabled(SystemButtonEnabled)
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.CreateNewChat, { systemButtonEnabled = SystemButtonEnabled })
	end
end

function CreateNewChatScreen.render(p1)
	-- upvalues: ArgCheckModule (copy), RoactModule (copy), CreateNewChatContainerModule (copy)
	return RoactModule.createElement(CreateNewChatContainerModule, {
		topBarHeight = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in CreateNewChatScreen").getScreenProps("topBarHeight", 0),
		navigateToConversation = p1.navigateToConversation,
		navigateToToast = p1.navigateToToast,
		setSystemButtonActivated = p1.setSystemButtonActivated,
		setSystemButtonEnabled = p1.setSystemButtonEnabled
	})
end

function CreateNewChatScreen.didMount(p1)
	-- upvalues: LoggerModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), GetFFlagIsSquadEnabledFunction (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy)
	LoggerModule:info("{screen} mounted")
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.CreateNewChat, {
		backButtonEnabled = true,
		headerText = {
			shouldLocalize = true,
			raw = if GetFFlagIsSquadEnabledFunction() then if ArgoPartyExperimentation.getIsRenameEnabled() and UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.ChatWithConnections"
		},
		systemButtonText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
	})
	p1.setSystemButtonEnabled(false)
end

function CreateNewChatScreen.willUnmount(p1)
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	GetTopBarStoreModule(false).clearScreenTopBar(EnumScreensModule.CreateNewChat)
	
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return CreateNewChatScreen