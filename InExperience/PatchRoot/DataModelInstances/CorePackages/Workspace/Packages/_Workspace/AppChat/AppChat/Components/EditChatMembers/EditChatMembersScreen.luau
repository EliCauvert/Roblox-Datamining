local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local withLocalization = require(parent.Localization).withLocalization
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local topBarProviderModule = require(appChat.TopBarProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local editChatMembersContainerModule = require(script.Parent.EditChatMembersContainer)
local loggerModule = require(script.Parent.Logger)

local function renderContainer(p0, p1, p2, p3, p4, p5) --[[ line: 29 ]]
	-- upvalues: roactModule (ref), editChatMembersContainerModule (ref)
	return roactModule.createElement(editChatMembersContainerModule, {
		topBarHeight = p0.getScreenProps("topBarHeight", 0),
		conversation = p1,
		navigateToConversation = p2,
		navigateToToast = p3,
		setSystemButtonActivated = p4,
		setSystemButtonEnabled = p5
	})
end

local function RootedEditChatMembersContainer(p6) --[[ line: 47 ]]
	-- upvalues: reactModule (ref), parentContainerContextModule (ref), loggerModule (ref), renderContainer (ref)
	local navigateToConversation = p6.navigateToConversation
	local openFriendsChatConversation = reactModule.useContext(parentContainerContextModule).openFriendsChatConversation
	
	return renderContainer(p6.navigation, p6.conversation, reactModule.useCallback(function(p7) --[[ line: 51 ]]
		-- upvalues: openFriendsChatConversation (ref), loggerModule (copy), navigateToConversation (ref)
		openFriendsChatConversation(p7):andThen(function(p8) --[[ line: 52 ]]
			-- upvalues: loggerModule (copy), p7 (ref), navigateToConversation (copy)
			if not p8 then
				loggerModule:warning("Failed to navigate to Friends Chat conversation {}", p7)
				navigateToConversation(p7)
			end
		end)
	end, { navigateToConversation, openFriendsChatConversation }), p6.navigateToToast, p6.setSystemButtonActivated, p6.setSystemButtonEnabled)
end

local editChatMembersScreen = roactModule.PureComponent:extend("EditChatMembersScreen")
editChatMembersScreen.defaultProps = {}

local function _(p9) --[[ line: 73 | named "getTabBarVisible" ]]
	local navigation = p9 and p9.navigation
	
	return if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
end

function editChatMembersScreen.navigationOptions(p10) --[[ line: 78 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), fFlagConnectionsToFriendsRename (ref), universalAppPolicyModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	local navigation = p10 and p10.navigation
	local var24 = if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
	
	return if fFlagAppChatTopBarConfigDrivenModule() then { tabBarVisible = var24 } else {
		backButtonEnabled = true,
		tabBarVisible = var24,
		headerText = {
			shouldLocalize = true,
			raw = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" elseif universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Chat.Label.AddConnections" else "Feature.Chat.Label.AddFriends"
		},
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersTopBarActionButton("back") else nil,
		renderRight = function() --[[ line: 104 ]]
			-- upvalues: roactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
			return roactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.EditChatMembers,
				render = function(p11) --[[ line: 107 ]]
					-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
					local screenTopBar = p11.getScreenTopBar(enumScreensModule.EditChatMembers)
					argCheckModule.isType(screenTopBar, "table", "screenTopBar")
					
					return withLocalization({
						systemButtonText = "Feature.Chat.Action.Add",
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
						cannotExpandToGroupChatActivePartyText = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError"
					})(function(p12) --[[ line: 116 ]]
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
						return createSystemMenuButtonModule({
							localizedStrings = p12,
							isDisabled = not screenTopBar.systemButtonEnabled,
							onActivated = screenTopBar.systemButtonActivated,
							testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersTopBarActionButton("add") else nil
						})
					end)
				end
			})
		end
	}
end

function editChatMembersScreen.init(p13) --[[ line: 132 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), enumScreensModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), argCheckModule (ref)
	p13.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p13.props.navigation, "Party.ChatMembersPage") else nil
	
	function p13.navigateToConversation(p14) --[[ line: 138 ]]
		-- upvalues: loggerModule (copy), getFFlagAppChatEnableRootedNavigationModule (copy), p13 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p14)
		p13.props.navigation.navigate(enumScreensModule.ChatConversation, if getFFlagAppChatEnableRootedNavigationModule() then {
			conversationId = p14,
			isRooted = p13.props.navigation.getParam("isRooted", false)
		} else { conversationId = p14 })
	end
	
	function p13.navigateToToast(p15) --[[ line: 149 ]]
		-- upvalues: loggerModule (copy), p13 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p13.props.navigation.navigate(enumScreensModule.RoactChatToast, p15)
	end
	
	function p13.setSystemButtonActivated(p16) --[[ line: 154 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p13 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonActivated = p16 })
			
			return
		end
		local setScreenTopBar = p13.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonActivated = p16 })
	end
	
	function p13.setSystemButtonEnabled(p17) --[[ line: 168 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p13 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonEnabled = p17 })
			
			return
		end
		local setScreenTopBar = p13.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonEnabled = p17 })
	end
end

function editChatMembersScreen.render(p18) --[[ line: 183 ]]
	-- upvalues: argCheckModule (ref), loggerModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), roactModule (ref), RootedEditChatMembersContainer (ref), renderContainer (ref)
	local var28 = argCheckModule.isNotNil(p18.props.navigation, "navigation in EditChatMembersScreen")
	local conversation = var28.getParam("conversation", nil)
	
	if not conversation then
		loggerModule:warning("Conversation info required to open {screen}")
		
		return nil
	end
	return if getFFlagAppChatEnableRootedNavigationModule() and var28.getParam("isRooted", false) then roactModule.createElement(RootedEditChatMembersContainer, {
		navigation = var28,
		conversation = conversation,
		navigateToConversation = p18.navigateToConversation,
		navigateToToast = p18.navigateToToast,
		setSystemButtonActivated = p18.setSystemButtonActivated,
		setSystemButtonEnabled = p18.setSystemButtonEnabled
	}) else renderContainer(var28, conversation, p18.navigateToConversation, p18.navigateToToast, p18.setSystemButtonActivated, p18.setSystemButtonEnabled)
end

function editChatMembersScreen.didMount(p19) --[[ line: 213 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), fFlagConnectionsToFriendsRename (ref), universalAppPolicyModule (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Chat.Action.Add",
			headerText = {
				shouldLocalize = true,
				raw = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" elseif universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Chat.Label.AddConnections" else "Feature.Chat.Label.AddFriends"
			}
		})
	end
	p19.setSystemButtonEnabled(false)
end

function editChatMembersScreen.willUnmount(p20) --[[ line: 234 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.EditChatMembers)
	end
	if p20.ixpSubscription then
		p20.ixpSubscription.remove()
	end
end

return editChatMembersScreen