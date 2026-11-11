local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local TopBarProviderModule = require(AppChat.TopBarProvider)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local FFlagAppChatWideModalTabBarVisibleModule = require(AppChat.Flags.FFlagAppChatWideModalTabBarVisible)
local CreateSystemMenuButtonModule = require(AppChat.Components.SelectChatMembers.createSystemMenuButton)
local CreateNewChatContainerModule = require(script.Parent.CreateNewChatContainer)
local LoggerModule = require(script.Parent.Logger)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagAppChatUseNewSelectChatMembersIxpEnabledModule = require(AppChat.Flags.FFlagAppChatUseNewSelectChatMembersIxpEnabled)
local FStringAppChatUseNewSelectChatMembersIxpLayerModule = require(AppChat.Flags.FStringAppChatUseNewSelectChatMembersIxpLayer)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local CreateNewChatScreen = RoactModule.PureComponent:extend("CreateNewChatScreen")
CreateNewChatScreen.defaultProps = {}

local function _(p1)
	-- upvalues: FFlagAppChatWideModalTabBarVisibleModule (copy)
	local Navigation = p1 and p1.navigation
	
	return if FFlagAppChatWideModalTabBarVisibleModule and Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
end

function CreateNewChatScreen.navigationOptions(p1)
	-- upvalues: FFlagAppChatWideModalTabBarVisibleModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetFFlagIsSquadEnabledFunction (copy), ArgoPartyExperimentation (copy), FFlagConnectionsToFriendsRename (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), RoactModule (copy), TopBarProviderModule (copy), EnumScreensModule (copy), ArgCheckModule (copy), WithLocalizationFunction (copy), CreateSystemMenuButtonModule (copy)
	local Navigation = p1 and p1.navigation
	local WideModeScreenProps = if FFlagAppChatWideModalTabBarVisibleModule and Navigation and Navigation.getScreenProps then Navigation.getScreenProps("wideMode", false) else false
	
	return if FFlagAppChatTopBarConfigDrivenModule() then { tabBarVisible = WideModeScreenProps } else {
		backButtonEnabled = true,
		tabBarVisible = WideModeScreenProps,
		headerText = {
			shouldLocalize = true,
			raw = if GetFFlagIsSquadEnabledFunction() then if ArgoPartyExperimentation.getIsRenameEnabled() then "Feature.Chat.Heading.ChatWithFriends" elseif FFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections"
		},
		backButtonTestId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.selectChatMembersTopBarActionButton("back") else nil,
		renderRight = function()
			-- upvalues: RoactModule (upval), TopBarProviderModule (upval), EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), GetFFlagIsSquadEnabledFunction (upval), CreateSystemMenuButtonModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
			return RoactModule.createElement(TopBarProviderModule, {
				screenName = EnumScreensModule.CreateNewChat,
				render = function(p2)
					-- upvalues: EnumScreensModule (upval), ArgCheckModule (upval), WithLocalizationFunction (upval), GetFFlagIsSquadEnabledFunction (upval), CreateSystemMenuButtonModule (upval), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
					local ScreenTopBar = p2.getScreenTopBar(EnumScreensModule.CreateNewChat)
					ArgCheckModule.isType(ScreenTopBar, "table", "screenTopBar")
					
					return WithLocalizationFunction({
						networkErrorText = "Feature.Chat.Response.NetworkError",
						invalidParticipantText = "Feature.Chat.Toast.Error.InvalidUserSelected",
						systemButtonText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
					})(function(LocalizedStrings)
						-- upvalues: CreateSystemMenuButtonModule (upval), ScreenTopBar (copy), FFlagDebugAppChatEnableDomLocatorsModule (upval), DomLocatorsModule (upval)
						return CreateSystemMenuButtonModule({
							localizedStrings = LocalizedStrings,
							isDisabled = not ScreenTopBar.systemButtonEnabled,
							onActivated = ScreenTopBar.systemButtonActivated,
							testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.selectChatMembersTopBarActionButton("create") else nil
						})
					end)
				end
			})
		end
	}
end

function CreateNewChatScreen.init(p1)
	-- upvalues: FFlagAppChatUseNewSelectChatMembersIxpEnabledModule (copy), RoactNavigationModule (copy), IXPService (copy), FStringAppChatUseNewSelectChatMembersIxpLayerModule (copy), LoggerModule (copy), EnumScreensModule (copy), FFlagAppChatTopBarSignalsStoreModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), ArgCheckModule (copy)
	p1.ixpSubscription = if FFlagAppChatUseNewSelectChatMembersIxpEnabledModule then p1.props.navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
		-- upvalues: IXPService (upval), FStringAppChatUseNewSelectChatMembersIxpLayerModule (upval)
		IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatUseNewSelectChatMembersIxpLayerModule)
	end) else nil
	
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
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy), ArgCheckModule (upval)
		if FFlagAppChatTopBarSignalsStoreModule or FFlagAppChatTopBarConfigDrivenModule() then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.CreateNewChat, { systemButtonActivated = SystemButtonActivated })
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.CreateNewChat, { systemButtonActivated = SystemButtonActivated })
		end
	end
	
	function p1.setSystemButtonEnabled(SystemButtonEnabled)
		-- upvalues: FFlagAppChatTopBarSignalsStoreModule (upval), FFlagAppChatTopBarConfigDrivenModule (upval), GetTopBarStoreModule (upval), EnumScreensModule (upval), p1 (copy), ArgCheckModule (upval)
		if FFlagAppChatTopBarSignalsStoreModule or FFlagAppChatTopBarConfigDrivenModule() then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.CreateNewChat, { systemButtonEnabled = SystemButtonEnabled })
			
			return
		else
			local SetScreenTopBarScreenProps: (any, any) -> () = p1.props.navigation.getScreenProps("setScreenTopBar", nil)
			ArgCheckModule.isNotNil(SetScreenTopBarScreenProps, "setScreenTopBar in screenProps")
			SetScreenTopBarScreenProps(EnumScreensModule.CreateNewChat, { systemButtonEnabled = SystemButtonEnabled })
		end
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
	-- upvalues: LoggerModule (copy), FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), GetFFlagIsSquadEnabledFunction (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), FFlagConnectionsToFriendsRename (copy)
	LoggerModule:info("{screen} mounted")
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.CreateNewChat, {
			backButtonEnabled = true,
			headerText = {
				shouldLocalize = true,
				raw = if GetFFlagIsSquadEnabledFunction() then if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Heading.ChatWithFriends" else "Feature.Chat.Heading.PartyWithFriends" elseif FFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections"
			},
			systemButtonText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends"
		})
	end
	p1.setSystemButtonEnabled(false)
end

function CreateNewChatScreen.willUnmount(p1)
	-- upvalues: FFlagAppChatTopBarConfigDrivenModule (copy), GetTopBarStoreModule (copy), EnumScreensModule (copy), FFlagAppChatUseNewSelectChatMembersIxpEnabledModule (copy)
	if FFlagAppChatTopBarConfigDrivenModule() then
		GetTopBarStoreModule(false).clearScreenTopBar(EnumScreensModule.CreateNewChat)
	end
	if FFlagAppChatUseNewSelectChatMembersIxpEnabledModule then
		p1.ixpSubscription.remove()
	end
end

return CreateNewChatScreen