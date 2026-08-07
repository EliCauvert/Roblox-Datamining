local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local argCheckModule = require(parent.ArgCheck)
local roactModule = require(parent.Roact)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local withLocalization = require(parent.Localization).withLocalization
local topBarProviderModule = require(appChat.TopBarProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatWideModalTabBarVisibleModule = require(appChat.Flags.FFlagAppChatWideModalTabBarVisible)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local createNewChatContainerModule = require(script.Parent.CreateNewChatContainer)
local loggerModule = require(script.Parent.Logger)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagAppChatNewChatFixEnabled = require(parent.SharedFlags).FFlagAppChatNewChatFixEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local createNewChatScreen = roactModule.PureComponent:extend("CreateNewChatScreen")
createNewChatScreen.defaultProps = {}

local function _(p0) --[[ line: 34 | named "getTabBarVisible" ]]
	-- upvalues: fFlagAppChatWideModalTabBarVisibleModule (ref)
	local navigation = p0 and p0.navigation
	
	return if fFlagAppChatWideModalTabBarVisibleModule and navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
end

function createNewChatScreen.navigationOptions(p1) --[[ line: 43 ]]
	-- upvalues: fFlagAppChatWideModalTabBarVisibleModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getFFlagIsSquadEnabled (ref), argoPartyExperimentation (ref), fFlagAppChatNewChatFixEnabled (ref), fFlagConnectionsToFriendsRename (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	local navigation = p1 and p1.navigation
	local var20 = if fFlagAppChatWideModalTabBarVisibleModule and navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
	
	return if fFlagAppChatTopBarConfigDrivenModule() then { tabBarVisible = var20 } else {
		backButtonEnabled = true,
		tabBarVisible = var20,
		headerText = {
			shouldLocalize = true,
			raw = if getFFlagIsSquadEnabled() then if argoPartyExperimentation.getIsRenameEnabled() then if fFlagAppChatNewChatFixEnabled then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.ChatWithFriends" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections"
		},
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersTopBarActionButton("back") else nil,
		renderRight = function() --[[ line: 72 ]]
			-- upvalues: roactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), getFFlagIsSquadEnabled (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
			return roactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.CreateNewChat,
				render = function(p2) --[[ line: 75 ]]
					-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), getFFlagIsSquadEnabled (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
					local screenTopBar = p2.getScreenTopBar(enumScreensModule.CreateNewChat)
					argCheckModule.isType(screenTopBar, "table", "screenTopBar")
					
					return withLocalization({
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
						systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
					})(function(p3) --[[ line: 85 ]]
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
						return createSystemMenuButtonModule({
							localizedStrings = p3,
							isDisabled = not screenTopBar.systemButtonEnabled,
							onActivated = screenTopBar.systemButtonActivated,
							testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersTopBarActionButton("create") else nil
						})
					end)
				end
			})
		end
	}
end

function createNewChatScreen.init(p4) --[[ line: 101 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), argCheckModule (ref)
	p4.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p4.props.navigation, "Party.ChatMembersPage") else nil
	
	function p4.navigateToConversation(p5) --[[ line: 107 ]]
		-- upvalues: p4 (ref), loggerModule (copy), enumScreensModule (copy)
		local navigation = p4.props.navigation
		loggerModule:info("Navigate To Conversation: {} from {screen}", p5)
		
		if navigation.getScreenProps("wideMode", false) then
			navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p5 })
			
			return
		end
		navigation.replace(enumScreensModule.ChatConversation, { conversationId = p5 })
	end
	
	function p4.navigateToToast(p6) --[[ line: 118 ]]
		-- upvalues: loggerModule (copy), p4 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p4.props.navigation.navigate(enumScreensModule.RoactChatToast, p6)
	end
	
	function p4.setSystemButtonActivated(p7) --[[ line: 123 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p4 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonActivated = p7 })
			
			return
		end
		local setScreenTopBar = p4.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonActivated = p7 })
	end
	
	function p4.setSystemButtonEnabled(p8) --[[ line: 137 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p4 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonEnabled = p8 })
			
			return
		end
		local setScreenTopBar = p4.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonEnabled = p8 })
	end
end

function createNewChatScreen.render(p9) --[[ line: 152 ]]
	-- upvalues: argCheckModule (ref), roactModule (ref), createNewChatContainerModule (ref)
	return roactModule.createElement(createNewChatContainerModule, {
		topBarHeight = argCheckModule.isNotNil(p9.props.navigation, "navigation in CreateNewChatScreen").getScreenProps("topBarHeight", 0),
		navigateToConversation = p9.navigateToConversation,
		navigateToToast = p9.navigateToToast,
		setSystemButtonActivated = p9.setSystemButtonActivated,
		setSystemButtonEnabled = p9.setSystemButtonEnabled
	})
end

function createNewChatScreen.didMount(p10) --[[ line: 164 ]]
	-- upvalues: loggerModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref), getFFlagIsSquadEnabled (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), fFlagAppChatNewChatFixEnabled (ref), fFlagConnectionsToFriendsRename (ref)
	loggerModule:info("{screen} mounted")
	
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, {
			backButtonEnabled = true,
			headerText = {
				shouldLocalize = true,
				raw = if getFFlagIsSquadEnabled() then if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then if fFlagAppChatNewChatFixEnabled then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.ChatWithFriends" else "Feature.Chat.Heading.PartyWithFriends" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections"
			},
			systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
		})
	end
	p10.setSystemButtonEnabled(false)
end

function createNewChatScreen.willUnmount(p11) --[[ line: 192 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.CreateNewChat)
	end
	if p11.ixpSubscription then
		p11.ixpSubscription.remove()
	end
end

return createNewChatScreen