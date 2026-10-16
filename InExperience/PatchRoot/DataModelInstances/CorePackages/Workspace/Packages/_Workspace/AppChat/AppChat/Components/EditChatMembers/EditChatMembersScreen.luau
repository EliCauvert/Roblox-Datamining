local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatIxpScreenExposureModule = require(AppChat.Flags.FFlagAppChatIxpScreenExposure)
local IXPNavigationUtilsModule = require(AppChat.Utils.IXPNavigationUtils)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local EditChatMembersContainerModule = require(script.Parent.EditChatMembersContainer)
local LoggerModule = require(script.Parent.Logger)

local function renderContainer(Navigation, Conversation, NavigateToConversation, NavigateToToast, SetSystemButtonActivated, SetSystemButtonEnabled) --[[ Line: 20 ]]
	-- upvalues: RoactModule (copy), EditChatMembersContainerModule (copy)
	return RoactModule.createElement(EditChatMembersContainerModule, {
		topBarHeight = Navigation.getScreenProps("topBarHeight", 0),
		conversation = Conversation,
		navigateToConversation = NavigateToConversation,
		navigateToToast = NavigateToToast,
		setSystemButtonActivated = SetSystemButtonActivated,
		setSystemButtonEnabled = SetSystemButtonEnabled
	})
end

local function RootedEditChatMembersContainer(p1) --[[ Line: 38 ]]
	-- upvalues: ReactModule (copy), ParentContainerContextModule (copy), LoggerModule (copy), renderContainer (copy)
	local NavigateToConversationFunction = p1.navigateToConversation
	local OpenFriendsChatConversationFunction = ReactModule.useContext(ParentContainerContextModule).openFriendsChatConversation
	
	return renderContainer(p1.navigation, p1.conversation, ReactModule.useCallback(function(p2) --[[ Line: 42 ]]
		-- upvalues: OpenFriendsChatConversationFunction (copy), LoggerModule (upval), NavigateToConversationFunction (copy)
		OpenFriendsChatConversationFunction(p2):andThen(function(Result) --[[ Line: 43 ]]
			-- upvalues: LoggerModule (upval), p2 (copy), NavigateToConversationFunction (upval)
			if not Result then
				LoggerModule:warning("Failed to navigate to Friends Chat conversation {}", p2)
				NavigateToConversationFunction(p2)
			end
		end)
	end, {
		NavigateToConversationFunction,
		OpenFriendsChatConversationFunction
	}), p1.navigateToToast, p1.setSystemButtonActivated, p1.setSystemButtonEnabled)
end

local EditChatMembersScreen = RoactModule.PureComponent:extend("EditChatMembersScreen")
EditChatMembersScreen.defaultProps = {}

local function _(p1) --[[ Line: 64 | Named "getTabBarVisible" ]]
	local Navigation = p1 and p1.navigation
	
	return if Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
end

function EditChatMembersScreen.navigationOptions(p1) --[[ Line: 69 ]]
	local Navigation = p1 and p1.navigation
	
	return {
		tabBarVisible = if Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
	}
end

function EditChatMembersScreen.init(p1) --[[ Line: 77 ]]
	-- upvalues: FFlagAppChatIxpScreenExposureModule (copy), IXPNavigationUtilsModule (copy), LoggerModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), EnumScreensModule (copy), GetTopBarStoreModule (copy)
	p1.ixpSubscription = if FFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatMembersPage") else nil
	
	function p1.navigateToConversation(ConversationId) --[[ Line: 83 ]]
		-- upvalues: LoggerModule (upval), GetFFlagAppChatEnableRootedNavigationModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, if GetFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = ConversationId,
			isRooted = p1.props.navigation.getParam("isRooted", false)
		} else { conversationId = ConversationId })
	end
	
	function p1.navigateToToast(p2) --[[ Line: 94 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.setSystemButtonActivated(SystemButtonActivated) --[[ Line: 99 ]]
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.EditChatMembers, { systemButtonActivated = SystemButtonActivated })
	end
	
	function p1.setSystemButtonEnabled(SystemButtonEnabled) --[[ Line: 105 ]]
		-- upvalues: GetTopBarStoreModule (upval), EnumScreensModule (upval)
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.EditChatMembers, { systemButtonEnabled = SystemButtonEnabled })
	end
end

function EditChatMembersScreen.render(p1) --[[ Line: 112 ]]
	-- upvalues: ArgCheckModule (copy), LoggerModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), RoactModule (copy), RootedEditChatMembersContainer (copy), renderContainer (copy)
	local NavigationInEditChatMembersScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in EditChatMembersScreen")
	local ConversationParam = NavigationInEditChatMembersScreen.getParam("conversation", nil)
	
	if ConversationParam then
		return if GetFFlagAppChatEnableRootedNavigationModule() and NavigationInEditChatMembersScreen.getParam("isRooted", false) then RoactModule.createElement(RootedEditChatMembersContainer, {
			navigation = NavigationInEditChatMembersScreen,
			conversation = ConversationParam,
			navigateToConversation = p1.navigateToConversation,
			navigateToToast = p1.navigateToToast,
			setSystemButtonActivated = p1.setSystemButtonActivated,
			setSystemButtonEnabled = p1.setSystemButtonEnabled
		}) else renderContainer(NavigationInEditChatMembersScreen, ConversationParam, p1.navigateToConversation, p1.navigateToToast, p1.setSystemButtonActivated, p1.setSystemButtonEnabled)
	else
		LoggerModule:warning("Conversation info required to open {screen}")
		
		return nil
	end
end

function EditChatMembersScreen.didMount(p1) --[[ Line: 142 ]]
	-- upvalues: LoggerModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy)
	LoggerModule:info("{screen} mounted")
	GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.EditChatMembers, {
		backButtonEnabled = true,
		systemButtonText = "Feature.Chat.Action.Add",
		headerText = {
			raw = "Feature.Chat.Label.AddFriends",
			shouldLocalize = true
		}
	})
	p1.setSystemButtonEnabled(false)
end

function EditChatMembersScreen.willUnmount(p1) --[[ Line: 156 ]]
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	GetTopBarStoreModule(false).clearScreenTopBar(EnumScreensModule.EditChatMembers)
	
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return EditChatMembersScreen