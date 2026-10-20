local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local TopBarProviderModule = require(AppChat.TopBarProvider)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagAppChatWideModalTabBarVisibleModule = require(AppChat.Flags.FFlagAppChatWideModalTabBarVisible)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagAppChatUseNewSelectChatMembersIxpEnabledModule = require(AppChat.Flags.FFlagAppChatUseNewSelectChatMembersIxpEnabled)
local FStringAppChatUseNewSelectChatMembersIxpLayerModule = require(AppChat.Flags.FStringAppChatUseNewSelectChatMembersIxpLayer)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local EditChatMembersContainerModule = require(script.Parent.EditChatMembersContainer)
local LoggerModule = require(script.Parent.Logger)
local EditChatMembersScreen = RoactModule.PureComponent:extend("EditChatMembersScreen")
EditChatMembersScreen.defaultProps = {}

local function _(p1)
	-- upvalues: FFlagAppChatWideModalTabBarVisibleModule (copy)
	local Navigation = p1 and p1.navigation
	
	return if FFlagAppChatWideModalTabBarVisibleModule and Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
end

function EditChatMembersScreen.navigationOptions(p1)
	-- upvalues: FFlagAppChatWideModalTabBarVisibleModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), FFlagConnectionsToFriendsRename (copy), UniversalAppPolicyModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), RoactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ArgCheckModule (copy), WithLocalizationFunction (copy), CreateSystemMenuButtonModule (copy)
	local Navigation = p1 and p1.navigation
	local WideModeScreenProps = if FFlagAppChatWideModalTabBarVisibleModule and Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
	
	return if FFlagAppChatTopBarConfigDrivenModule() then { tabBarVisible = WideModeScreenProps } else {
		backButtonEnabled = true,
		tabBarVisible = WideModeScreenProps,
		headerText = {
			shouldLocalize = true,
			raw = if FFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" elseif UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Chat.Label.AddConnections" else "Feature.Chat.Label.AddFriends"
		},
		backButtonTestId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.selectChatMembersTopBarActionButton("back") else nil,
		renderRight = function()
			-- upvalues: RoactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
			return RoactModule.createElement(TopBarProviderModule, {
				screenName = EnumScreensModule.EditChatMembers,
				render = function(p2)
					-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), CreateSystemMenuButtonModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
					local ScreenTopBar = p2.getScreenTopBar(EnumScreensModule.EditChatMembers)
					ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
					
					return WithLocalizationFunction({
						systemButtonText = "Feature.Chat.Action.Add",
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
						cannotExpandToGroupChatActivePartyText = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError"
					})(function(LocalizedStrings)
						-- upvalues: CreateSystemMenuButtonModule (upval), ScreenTopBar (copy), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
						return CreateSystemMenuButtonModule({
							localizedStrings = LocalizedStrings,
							isDisabled = not ScreenTopBar.systemButtonEnabled,
							onActivated = ScreenTopBar.systemButtonActivated,
							testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.selectChatMembersTopBarActionButton("add") else nil
						})
					end)
				end
			})
		end
	}
end

function EditChatMembersScreen.init(p1)
	-- upvalues: FFlagAppChatUseNewSelectChatMembersIxpEnabledModule (copy), RoactNavigationModule (copy), IXPService (copy), FStringAppChatUseNewSelectChatMembersIxpLayerModule (copy), LoggerModule (copy), EnumScreensModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), ArgCheckModule (copy)
	p1.ixpSubscription = if FFlagAppChatUseNewSelectChatMembersIxpEnabledModule then p1.props.navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
		-- upvalues: IXPService (upval), FStringAppChatUseNewSelectChatMembersIxpLayerModule (upval)
		IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatUseNewSelectChatMembersIxpLayerModule)
	end) else nil
	
	function p1.navigateToConversation(ConversationId)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Conversation: {} from {screen}", ConversationId)
		p1.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationId })
	end
	
	function p1.navigateToToast(p2)
		-- upvalues: LoggerModule (upval), p1 (copy), EnumScreensModule (upval)
		LoggerModule:info("Navigate To Toast from {screen}")
		p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, p2)
	end
	
	function p1.setSystemButtonActivated(SystemButtonActivated)
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy), ArgCheckModule (upval)
		if FFlagAppChatTopBarSignalsStoreModule or FFlagAppChatTopBarConfigDrivenModule() then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.EditChatMembers, { systemButtonActivated = SystemButtonActivated })
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.EditChatMembers, { systemButtonActivated = SystemButtonActivated })
		end
	end
	
	function p1.setSystemButtonEnabled(SystemButtonEnabled)
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy), ArgCheckModule (upval)
		if FFlagAppChatTopBarSignalsStoreModule or FFlagAppChatTopBarConfigDrivenModule() then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.EditChatMembers, { systemButtonEnabled = SystemButtonEnabled })
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.EditChatMembers, { systemButtonEnabled = SystemButtonEnabled })
		end
	end
end

function EditChatMembersScreen.render(p1)
	-- upvalues: ArgCheckModule (copy), LoggerModule (copy), RoactModule (copy), EditChatMembersContainerModule (copy)
	local NavigationInEditChatMembersScreen = ArgCheckModule.isNotNil(p1.props.navigation, "navigation in EditChatMembersScreen")
	local ConversationParam = NavigationInEditChatMembersScreen.getParam("conversation", nil)
	
	if ConversationParam then
		return RoactModule.createElement(EditChatMembersContainerModule, {
			topBarHeight = NavigationInEditChatMembersScreen.getScreenProps("topBarHeight", 0),
			conversation = ConversationParam,
			navigateToConversation = p1.navigateToConversation,
			navigateToToast = p1.navigateToToast,
			setSystemButtonActivated = p1.setSystemButtonActivated,
			setSystemButtonEnabled = p1.setSystemButtonEnabled
		})
	else
		LoggerModule:warning("Conversation info required to open {screen}")
		
		return nil
	end
end

function EditChatMembersScreen.didMount(p1)
	-- upvalues: LoggerModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), FFlagConnectionsToFriendsRename (copy), UniversalAppPolicyModule (copy)
	LoggerModule:info("{screen} mounted")
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.EditChatMembers, {
			backButtonEnabled = true,
			systemButtonText = "Feature.Chat.Action.Add",
			headerText = {
				shouldLocalize = true,
				raw = if FFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" elseif UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Chat.Label.AddConnections" else "Feature.Chat.Label.AddFriends"
			}
		})
	end
	p1.setSystemButtonEnabled(false)
end

function EditChatMembersScreen.willUnmount(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), FFlagAppChatUseNewSelectChatMembersIxpEnabledModule (copy)
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).clearScreenTopBar(EnumScreensModule.EditChatMembers)
	end
	if FFlagAppChatUseNewSelectChatMembersIxpEnabledModule then
		p1.ixpSubscription.remove()
	end
end

return EditChatMembersScreen