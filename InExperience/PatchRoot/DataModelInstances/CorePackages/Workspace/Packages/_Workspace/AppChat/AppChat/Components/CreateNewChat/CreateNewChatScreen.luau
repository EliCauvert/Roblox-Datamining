local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local argCheckModule = require(parent.ArgCheck)
local roactModule = require(parent.Roact)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local createNewChatContainerModule = require(script.Parent.CreateNewChatContainer)
local loggerModule = require(script.Parent.Logger)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagAppChatNewChatFixEnabled = require(parent.SharedFlags).FFlagAppChatNewChatFixEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local createNewChatScreen = roactModule.PureComponent:extend("CreateNewChatScreen")
createNewChatScreen.defaultProps = {}

local function _(p1)
	local navigation = p1 and p1.navigation
	
	return if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
end

function createNewChatScreen.navigationOptions(p1)
	local navigation = p1 and p1.navigation
	
	return {
		tabBarVisible = if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
	}
end

function createNewChatScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), getTopBarStoreModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatMembersPage") else nil
	
	function p2.navigateToConversation(p2)
		-- upvalues: p1 (ref), loggerModule (copy), enumScreensModule (copy)
		local navigation = p1.props.navigation
		loggerModule:info("Navigate To Conversation: {} from {screen}", p2)
		
		if navigation.getScreenProps("wideMode", false) then
			navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p2 })
			
			return
		end
		navigation.replace(enumScreensModule.ChatConversation, { conversationId = p2 })
	end
	
	function p2.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p2.setSystemButtonActivated(p2)
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonActivated = p2 })
	end
	
	function p2.setSystemButtonEnabled(p2)
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonEnabled = p2 })
	end
end

function createNewChatScreen.render(p1)
	-- upvalues: argCheckModule (ref), roactModule (ref), createNewChatContainerModule (ref)
	return roactModule.createElement(createNewChatContainerModule, {
		topBarHeight = argCheckModule.isNotNil(p1.props.navigation, "navigation in CreateNewChatScreen").getScreenProps("topBarHeight", 0),
		navigateToConversation = p1.navigateToConversation,
		navigateToToast = p1.navigateToToast,
		setSystemButtonActivated = p1.setSystemButtonActivated,
		setSystemButtonEnabled = p1.setSystemButtonEnabled
	})
end

function createNewChatScreen.didMount(p1)
	-- upvalues: loggerModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), getFFlagIsSquadEnabled (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), fFlagAppChatNewChatFixEnabled (ref), fFlagConnectionsToFriendsRename (ref)
	loggerModule:info("{screen} mounted")
	getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, {
		backButtonEnabled = true,
		headerText = {
			shouldLocalize = true,
			raw = if getFFlagIsSquadEnabled() then if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then if fFlagAppChatNewChatFixEnabled then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.ChatWithFriends" else "Feature.Chat.Heading.PartyWithFriends" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections"
		},
		systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
	})
	p1.setSystemButtonEnabled(false)
end

function createNewChatScreen.willUnmount(p1)
	-- upvalues: getTopBarStoreModule (ref), enumScreensModule (ref)
	getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.CreateNewChat)
	
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return createNewChatScreen