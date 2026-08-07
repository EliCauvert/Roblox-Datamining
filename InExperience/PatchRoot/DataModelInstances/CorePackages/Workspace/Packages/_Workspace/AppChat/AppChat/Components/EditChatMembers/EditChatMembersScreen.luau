local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local argCheckModule = require(parent.ArgCheck)
local roactModule = require(parent.Roact)
local withLocalization = require(parent.Localization).withLocalization
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local topBarProviderModule = require(appChat.TopBarProvider)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local fFlagAppChatTopBarConfigDrivenModule = require(appChat.Flags.FFlagAppChatTopBarConfigDriven)
local fFlagAppChatWideModalTabBarVisibleModule = require(appChat.Flags.FFlagAppChatWideModalTabBarVisible)
local createSystemMenuButtonModule = require(appChat.Components.SelectChatMembers.createSystemMenuButton)
local fFlagAppChatIxpScreenExposureModule = require(appChat.Flags.FFlagAppChatIxpScreenExposure)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local IXPNavigationUtilsModule = require(appChat.Utils.IXPNavigationUtils)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local editChatMembersContainerModule = require(script.Parent.EditChatMembersContainer)
local loggerModule = require(script.Parent.Logger)
local editChatMembersScreen = roactModule.PureComponent:extend("EditChatMembersScreen")
editChatMembersScreen.defaultProps = {}

local function _(p0) --[[ line: 30 | named "getTabBarVisible" ]]
	-- upvalues: fFlagAppChatWideModalTabBarVisibleModule (ref)
	local navigation = p0 and p0.navigation
	
	return if fFlagAppChatWideModalTabBarVisibleModule and navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
end

function editChatMembersScreen.navigationOptions(p1) --[[ line: 39 ]]
	-- upvalues: fFlagAppChatWideModalTabBarVisibleModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), fFlagConnectionsToFriendsRename (ref), universalAppPolicyModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), roactModule (ref), topBarProviderModule (ref), enumScreensModule (ref), argCheckModule (ref), withLocalization (ref), createSystemMenuButtonModule (ref)
	local navigation = p1 and p1.navigation
	local var20 = if fFlagAppChatWideModalTabBarVisibleModule and navigation and navigation.getScreenProps then navigation.getScreenProps("wideMode", false) else false
	
	return if fFlagAppChatTopBarConfigDrivenModule() then { tabBarVisible = var20 } else {
		backButtonEnabled = true,
		tabBarVisible = var20,
		headerText = {
			shouldLocalize = true,
			raw = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" elseif universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Chat.Label.AddConnections" else "Feature.Chat.Label.AddFriends"
		},
		backButtonTestId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersTopBarActionButton("back") else nil,
		renderRight = function() --[[ line: 65 ]]
			-- upvalues: roactModule (copy), topBarProviderModule (copy), enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
			return roactModule.createElement(topBarProviderModule, {
				screenName = enumScreensModule.EditChatMembers,
				render = function(p2) --[[ line: 68 ]]
					-- upvalues: enumScreensModule (copy), argCheckModule (copy), withLocalization (copy), createSystemMenuButtonModule (copy), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
					local screenTopBar = p2.getScreenTopBar(enumScreensModule.EditChatMembers)
					argCheckModule.isType(screenTopBar, "table", "screenTopBar")
					
					return withLocalization({
						systemButtonText = "Feature.Chat.Action.Add",
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
						cannotExpandToGroupChatActivePartyText = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError"
					})(function(p3) --[[ line: 77 ]]
						-- upvalues: createSystemMenuButtonModule (copy), screenTopBar (ref), fFlagDebugAppChatEnableDomLocatorsModule (copy), domLocatorsModule (copy)
						return createSystemMenuButtonModule({
							localizedStrings = p3,
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

function editChatMembersScreen.init(p4) --[[ line: 93 ]]
	-- upvalues: fFlagAppChatIxpScreenExposureModule (ref), IXPNavigationUtilsModule (ref), loggerModule (ref), enumScreensModule (ref), fFlagAppChatTopBarSignalsStoreModule (ref), fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), argCheckModule (ref)
	p4.ixpSubscription = if fFlagAppChatIxpScreenExposureModule then IXPNavigationUtilsModule.registerExposureOnFocus(p4.props.navigation, "Party.ChatMembersPage") else nil
	
	function p4.navigateToConversation(p5) --[[ line: 99 ]]
		-- upvalues: loggerModule (copy), p4 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Conversation: {} from {screen}", p5)
		p4.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p5 })
	end
	
	function p4.navigateToToast(p6) --[[ line: 104 ]]
		-- upvalues: loggerModule (copy), p4 (ref), enumScreensModule (copy)
		loggerModule:info("Navigate To Toast from {screen}")
		p4.props.navigation.navigate(enumScreensModule.RoactChatToast, p6)
	end
	
	function p4.setSystemButtonActivated(p7) --[[ line: 109 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p4 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonActivated = p7 })
			
			return
		end
		local setScreenTopBar = p4.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonActivated = p7 })
	end
	
	function p4.setSystemButtonEnabled(p8) --[[ line: 123 ]]
		-- upvalues: fFlagAppChatTopBarSignalsStoreModule (copy), fFlagAppChatTopBarConfigDrivenModule (copy), getTopBarStoreModule (copy), enumScreensModule (copy), p4 (ref), argCheckModule (copy)
		if fFlagAppChatTopBarSignalsStoreModule or fFlagAppChatTopBarConfigDrivenModule() then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonEnabled = p8 })
			
			return
		end
		local setScreenTopBar = p4.props.navigation.getScreenProps("setScreenTopBar", nil)
		argCheckModule.isNotNil(setScreenTopBar, "setScreenTopBar in screenProps")
		setScreenTopBar(enumScreensModule.EditChatMembers, { systemButtonEnabled = p8 })
	end
end

function editChatMembersScreen.render(p9) --[[ line: 138 ]]
	-- upvalues: argCheckModule (ref), loggerModule (ref), roactModule (ref), editChatMembersContainerModule (ref)
	local var24 = argCheckModule.isNotNil(p9.props.navigation, "navigation in EditChatMembersScreen")
	local conversation = var24.getParam("conversation", nil)
	
	if conversation then
		return roactModule.createElement(editChatMembersContainerModule, {
			topBarHeight = var24.getScreenProps("topBarHeight", 0),
			conversation = conversation,
			navigateToConversation = p9.navigateToConversation,
			navigateToToast = p9.navigateToToast,
			setSystemButtonActivated = p9.setSystemButtonActivated,
			setSystemButtonEnabled = p9.setSystemButtonEnabled
		})
	end
	loggerModule:warning("Conversation info required to open {screen}")
	
	return nil
end

function editChatMembersScreen.didMount(p10) --[[ line: 157 ]]
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
	p10.setSystemButtonEnabled(false)
end

function editChatMembersScreen.willUnmount(p11) --[[ line: 178 ]]
	-- upvalues: fFlagAppChatTopBarConfigDrivenModule (ref), getTopBarStoreModule (ref), enumScreensModule (ref)
	if fFlagAppChatTopBarConfigDrivenModule() then
		getTopBarStoreModule(false).clearScreenTopBar(enumScreensModule.EditChatMembers)
	end
	if p11.ixpSubscription then
		p11.ixpSubscription.remove()
	end
end

return editChatMembersScreen