local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local editChatMembersContainerModule = require(script.Parent.EditChatMembersContainer)
local loggerModule = require(script.Parent.Logger)

local function renderContainer(p1, p2, p3, p4, p5, p6)
	-- upvalues: roactModule (ref), editChatMembersContainerModule (ref)
	return roactModule.createElement(editChatMembersContainerModule, {
		topBarHeight = p1.getScreenProps("topBarHeight", 0),
		conversation = p2,
		navigateToConversation = p3,
		navigateToToast = p4,
		setSystemButtonActivated = p5,
		setSystemButtonEnabled = p6
	})
end

local function RootedEditChatMembersContainer(p1)
	-- upvalues: reactModule (ref), parentContainerContextModule (ref), loggerModule (ref), renderContainer (ref)
	local navigateToConversation = p1.navigateToConversation
	local openFriendsChatConversation = reactModule.useContext(parentContainerContextModule).openFriendsChatConversation
	
	return renderContainer(p1.navigation, p1.conversation, reactModule.useCallback(function(p2)
		-- upvalues: openFriendsChatConversation (ref), loggerModule (copy), navigateToConversation (ref)
		openFriendsChatConversation(p2):andThen(function(p3)
			-- upvalues: loggerModule (copy), p2 (ref), navigateToConversation (copy)
			if not p3 then
				loggerModule:warning("Failed to navigate to Friends Chat conversation {}", p2)
				navigateToConversation(p2)
			end
		end)
	end, { navigateToConversation, openFriendsChatConversation }), p1.navigateToToast, p1.setSystemButtonActivated, p1.setSystemButtonEnabled)
end

local editChatMembersScreen = roactModule.PureComponent:extend("EditChatMembersScreen")
editChatMembersScreen.defaultProps = {}

local function _(p1)
	local navigation = p1 and p1.navigation
	
	return if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
end

function editChatMembersScreen.navigationOptions(p1)
	local navigation = p1 and p1.navigation
	
	return {
		tabBarVisible = if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
	}
end

function editChatMembersScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), enumScreensModule (ref), getTopBarStoreModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatMembersPage") else nil
	
	function p11.navigateToConversation(p2)
		-- upvalues: loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p2)
		p1.props.navigation.navigate(enumScreensModule.ChatConversation, if getFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = p2,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversationId = p2 })
	end
	
	function p11.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p11.setSystemButtonActivated(p2)
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonActivated = p2 })
	end
	
	function p11.setSystemButtonEnabled(p2)
		-- upvalues: getTopBarStoreModule (copy), enumScreensModule (copy)
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonEnabled = p2 })
	end
end

function editChatMembersScreen.render(p1)
	-- upvalues: argCheckModule (ref), loggerModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), roactModule (ref), RootedEditChatMembersContainer (ref), renderContainer (ref)
	local var1 = argCheckModule.isNotNil(p1.props.navigation, "navigation in EditChatMembersScreen")
	local conversation = var1.getParam("conversation", nil)
	
	if not conversation then
		loggerModule:warning("Conversation info required to open {screen}")
		
		return nil
	end
	return if getFFlagAppChatEnableRootedNavigationModule() and var1.getParam("isRooted", false) then roactModule.createElement(RootedEditChatMembersContainer, {
		navigation = var1,
		conversation = conversation,
		navigateToConversation = p1.navigateToConversation,
		navigateToToast = p1.navigateToToast,
		setSystemButtonActivated = p1.setSystemButtonActivated,
		setSystemButtonEnabled = p1.setSystemButtonEnabled
	}) else renderContainer(var1, conversation, p1.navigateToConversation, p1.navigateToToast, p1.setSystemButtonActivated, p1.setSystemButtonEnabled)
end

function editChatMembersScreen.didMount(p1)
	-- upvalues: loggerModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), fFlagConnectionsToFriendsRename (ref), universalAppPolicyModule (ref)
	loggerModule:info("{screen} mounted")
	getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, {
		backButtonEnabled = true,
		systemButtonText = "Feature.Chat.Action.Add",
		headerText = {
			shouldLocalize = true,
			raw = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" elseif universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Chat.Label.AddConnections" else "Feature.Chat.Label.AddFriends"
		}
	})
	p1.setSystemButtonEnabled(false)
end

function editChatMembersScreen.willUnmount(p1)
	-- upvalues: getTopBarStoreModule (ref), enumScreensModule (ref)
	getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.EditChatMembers)
	
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return editChatMembersScreen