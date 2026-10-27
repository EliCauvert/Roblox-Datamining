local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local RoactNavigationModule = require(Parent.RoactNavigation)
local EnumScreensModule = require(AppChat.EnumScreens)
local SharedFlagsModule = require(Parent.SharedFlags)
local ChatDetails = AppChat.Components.ChatDetails
local GenericDialogTypeModule = require(ChatDetails.Dialogs.GenericDialogType)
local EditChatGroupNameDialogScreenModule = require(ChatDetails.EditChatGroupNameDialog.EditChatGroupNameDialogScreen)
local LeaveGroupDialogScreenModule = require(ChatDetails.LeaveGroupDialog.LeaveGroupDialogScreen)
local ParticipantDialogScreenDeprecatedModule = require(ChatDetails.ParticipantDialog.ParticipantDialogScreenDeprecated)
local RemoveUserDialogScreenModule = require(ChatDetails.RemoveUserDialog.RemoveUserDialogScreen)
local AbuseReportScreenModule = require(AppChat.Components.ChatAbuseReport.AbuseReportScreen)
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local MessageContextMenuScreenModule = require(AppChat.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen)
local SquadVoiceChangerOverlayModule = require(Parent.Squads.SquadVoiceChangerOverlay)
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local ChatConversation = AppChat.Components.ChatConversation
local CreateUnfilteredChatPartialModalScreenModule = require(ChatConversation.PartialModal.CreateUnfilteredChatPartialModalScreen)
local LearnMorePartialModalScreenModule = require(ChatConversation.PartialModal.LearnMorePartialModalScreen)
local SquadVoiceAbuseReportScreenModule = require(Parent.Squads.SquadVoiceAbuseReportScreen)
local ConversationOverlayScreenModule = require(ChatConversation.PartialModal.ConversationOverlayScreen)
local TrustedFriendsUpsellScreenModule = require(AppChat.Components.TrustedFriendsUpsell.TrustedFriendsUpsellScreen)
local GroupOSADialogScreenModule = require(AppChat.Components.OSA.GroupOSADialogScreen)
local MakeDialogScreenTelemetryWrapperModule = require(AppChat.Navigators.makeDialogScreenTelemetryWrapper)
local IsolatedAutoFocusNavigationModule = require(AppChat.Navigators.isolatedAutoFocusNavigation)
local BlockingModal = require(Parent.SocialBlockingModal).BlockingModal
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagEnablePartyVoiceChangersInLua = SharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local ChatLandingStackNavigatorModule = require(script.Parent.chatLandingStackNavigator)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local ChatLandingStackNavigatorConnector = RoactModule.Component:extend("ChatLandingStackNavigatorConnector")
ChatLandingStackNavigatorConnector.router = ChatLandingStackNavigatorModule.router

function ChatLandingStackNavigatorConnector.render(p1)
	-- upvalues: RoactModule (copy), FFlagAppChatConsoleFocusFixesModule (copy), ChatLandingStackNavigatorModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ClipsDescendants = not FFlagAppChatConsoleFocusFixesModule or nil
	}, {
		ChatLandingStackNavigator = RoactModule.createElement(ChatLandingStackNavigatorModule, p1.props)
	})
end

local List = {
	{
		[EnumScreensModule.ChatLandingStack] = ChatLandingStackNavigatorConnector
	},
	{
		[GenericDialogTypeModule.EditChatGroupNameDialog] = {
			screen = IsolatedAutoFocusNavigationModule(EditChatGroupNameDialogScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[GenericDialogTypeModule.LeaveGroupDialog] = {
			screen = IsolatedAutoFocusNavigationModule(MakeDialogScreenTelemetryWrapperModule(LeaveGroupDialogScreenModule), FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[GenericDialogTypeModule.ParticipantDialog] = {
			screen = IsolatedAutoFocusNavigationModule(MakeDialogScreenTelemetryWrapperModule(ParticipantDialogScreenDeprecatedModule), FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[GenericDialogTypeModule.RemoveUserDialog] = {
			screen = IsolatedAutoFocusNavigationModule(RemoveUserDialogScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[EnumScreensModule.CreateUnfilteredChatPartialModal] = {
			screen = IsolatedAutoFocusNavigationModule(CreateUnfilteredChatPartialModalScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[EnumScreensModule.LearnMorePartialModal] = {
			screen = IsolatedAutoFocusNavigationModule(LearnMorePartialModalScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	}
}
table.insert(List, {
	[EnumScreensModule.AppChatReportAbuse] = {
		screen = IsolatedAutoFocusNavigationModule(AbuseReportScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})
table.insert(List, {
	[EnumScreensModule.BlockingModal] = {
		screen = IsolatedAutoFocusNavigationModule(BlockingModal, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})
table.insert(List, {
	[EnumScreensModule.MessageContextMenu] = {
		screen = IsolatedAutoFocusNavigationModule(MessageContextMenuScreenModule, FocusNavigableSurfaceIdentifierEnum.ContextualMenu),
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})

if GetFFlagIsSquadEnabledFunction() and GetFFlagEnableCrossExpVoiceFunction() then
	table.insert(List, {
		[EnumScreensModule.SquadVoiceReportAbuse] = {
			screen = IsolatedAutoFocusNavigationModule(SquadVoiceAbuseReportScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	})
end
table.insert(List, {
	[EnumScreensModule.ConversationOverlay] = {
		screen = IsolatedAutoFocusNavigationModule(ConversationOverlayScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = {
			overlayEnabled = true,
			transparent = true,
			overlayTransparency = 0.5
		}
	}
})
table.insert(List, {
	[EnumScreensModule.TrustedConnectionsUpsell] = {
		screen = IsolatedAutoFocusNavigationModule(TrustedFriendsUpsellScreenModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			overlayEnabled = true
		}
	}
})
table.insert(List, {
	[EnumScreensModule.GroupOSADialog] = {
		screen = GroupOSADialogScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			overlayEnabled = true
		}
	}
})

if FFlagEnablePartyVoiceChangersInLua then
	table.insert(List, {
		[EnumScreensModule.SquadVoiceChangers] = {
			screen = IsolatedAutoFocusNavigationModule(SquadVoiceChangerOverlayModule, FocusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { overlayEnabled = true, overlayTransparency = 0.5 }
		}
	})
end
return RoactNavigationModule.createRobloxStackNavigator(List, {
	defaultNavigationOptions = if FFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})