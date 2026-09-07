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

local function _(p1)
	local navigation = p1 and p1.navigation
	
	return if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
end

function createNewChatScreen.navigationOptions(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getFFlagIsSquadEnabled (ref), argoPartyExperimentation (ref), fFlagAppChatNewChatFixEnabled (ref), fFlagConnectionsToFriendsRename (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	local navigation = p1 and p1.navigation
	local var1 = if navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
	
	return if fFlagAppChatTopBarConfigDrivenModule() then { tabBarVisible = var1 } else {
		backButtonEnabled = true,
		tabBarVisible = var1,
		headerText = {
			shouldLocalize = true,
			raw = if getFFlagIsSquadEnabled() then if argoPartyExperimentation.getIsRenameEnabled() then if fFlagAppChatNewChatFixEnabled then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.ChatWithFriends" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections"
		},
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersTopBarActionButton("back") else nil,
		renderRight = function()
			-- upvalues: roactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), getFFlagIsSquadEnabled (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
			return roactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.CreateNewChat,
				render = function(p2)
					-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), getFFlagIsSquadEnabled (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
					local screenTopBar = p2.getScreenTopBar(enumScreensModule.CreateNewChat)
					argCheckModule.isType(screenTopBar, "table", "screenTopBar")
					
					return withLocalization({
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
						systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
					})(function(p3)
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

function createNewChatScreen.init(p1)
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), argCheckModule (ref)
	p1.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p1.props.navigation, "Party.ChatMembersPage") else nil
	
	function p4.navigateToConversation(p2)
		-- upvalues: p1 (ref), loggerModule (copy), enumScreensModule (copy)
		local navigation = p1.props.navigation
		loggerModule:info("Navigate To Conversation: {} from {screen}", p2)
		
		if navigation.getScreenProps("wideMode", false) then
			navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p2 })
			
			return
		end
		navigation.replace(enumScreensModule.ChatConversation, { conversationId = p2 })
	end
	
	function p4.navigateToToast(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(enumScreensModule.RoactChatToast, p2)
	end
	
	function p4.setSystemButtonActivated(p2)
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p1 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonActivated = p2 })
			
			return
		end
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonActivated = p2 })
	end
	
	function p4.setSystemButtonEnabled(p2)
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p1 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonEnabled = p2 })
			
			return
		end
		local setScreenTopBar = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.CreateNewChat, { systemButtonEnabled = p2 })
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
	p1.setSystemButtonEnabled(false)
end

function createNewChatScreen.willUnmount(p1)
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.CreateNewChat)
	end
	if p1.ixpSubscription then
		p1.ixpSubscription.remove()
	end
end

return createNewChatScreen