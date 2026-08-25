local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)
local sharedFlagsModule = require(parent.SharedFlags)
local chatDetails = appChat.Components.ChatDetails
local genericDialogTypeModule = require(chatDetails.Dialogs.GenericDialogType)
local editChatGroupNameDialogScreenModule = require(chatDetails.EditChatGroupNameDialog.EditChatGroupNameDialogScreen)
local leaveGroupDialogScreenModule = require(chatDetails.LeaveGroupDialog.LeaveGroupDialogScreen)
local participantDialogScreenDeprecatedModule = require(chatDetails.ParticipantDialog.ParticipantDialogScreenDeprecated)
local removeUserDialogScreenModule = require(chatDetails.RemoveUserDialog.RemoveUserDialogScreen)
local abuseReportScreenModule = require(appChat.Components.ChatAbuseReport.AbuseReportScreen)
local fFlagAppChatEnableTrustedFriendEntryPointModule = require(appChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)
local trustedContactsModalScreenModule = require(appChat.Components.TrustedContactsModal.TrustedContactsModalScreen)
local messageContextMenuScreenModule = require(appChat.Components.ChatConversation.MessageInteraction.MessageContextMenuScreen)
local squadVoiceChangerOverlayModule = require(parent.Squads.SquadVoiceChangerOverlay)
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local chatConversation = appChat.Components.ChatConversation
local createUnfilteredChatPartialModalScreenModule = require(chatConversation.PartialModal.CreateUnfilteredChatPartialModalScreen)
local learnMorePartialModalScreenModule = require(chatConversation.PartialModal.LearnMorePartialModalScreen)
local squadVoiceAbuseReportScreenModule = require(parent.Squads.SquadVoiceAbuseReportScreen)
local conversationOverlayScreenModule = require(chatConversation.PartialModal.ConversationOverlayScreen)
local trustedConnectionsUpsellScreenModule = require(appChat.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellScreen)
local trustedFriendsUpsellScreenModule = require(appChat.Components.TrustedFriendsUpsell.TrustedFriendsUpsellScreen)
local groupOSADialogScreenModule = require(appChat.Components.OSA.GroupOSADialogScreen)
local makeDialogScreenTelemetryWrapperModule = require(appChat.Navigators.makeDialogScreenTelemetryWrapper)
local isolatedAutoFocusNavigationModule = require(appChat.Navigators.isolatedAutoFocusNavigation)
local blockingModal = require(parent.SocialBlockingModal).BlockingModal
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagAppChatConsolidateTrustedFriendsModalModule = require(appChat.Flags.FFlagAppChatConsolidateTrustedFriendsModal)
local chatLandingStackNavigatorModule = require(script.Parent.chatLandingStackNavigator)
local chatLandingStackNavigatorConnector = roactModule.Component:extend("ChatLandingStackNavigatorConnector")
chatLandingStackNavigatorConnector.router = chatLandingStackNavigatorModule.router

function chatLandingStackNavigatorConnector.render(p0)
	-- upvalues: roactModule (ref), chatLandingStackNavigatorModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ChatLandingStackNavigator = roactModule.createElement(chatLandingStackNavigatorModule, p0.props)
	})
end

local list = {
	{
		[enumScreensModule.ChatLandingStack] = chatLandingStackNavigatorConnector
	},
	{
		[genericDialogTypeModule.EditChatGroupNameDialog] = {
			screen = isolatedAutoFocusNavigationModule(editChatGroupNameDialogScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[genericDialogTypeModule.LeaveGroupDialog] = {
			screen = isolatedAutoFocusNavigationModule(makeDialogScreenTelemetryWrapperModule(leaveGroupDialogScreenModule), focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[genericDialogTypeModule.ParticipantDialog] = {
			screen = isolatedAutoFocusNavigationModule(makeDialogScreenTelemetryWrapperModule(participantDialogScreenDeprecatedModule), focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[genericDialogTypeModule.RemoveUserDialog] = {
			screen = isolatedAutoFocusNavigationModule(removeUserDialogScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[enumScreensModule.CreateUnfilteredChatPartialModal] = {
			screen = isolatedAutoFocusNavigationModule(createUnfilteredChatPartialModalScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	},
	{
		[enumScreensModule.LearnMorePartialModal] = {
			screen = isolatedAutoFocusNavigationModule(learnMorePartialModalScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	}
}
table.insert(list, {
	[enumScreensModule.AppChatReportAbuse] = {
		screen = isolatedAutoFocusNavigationModule(abuseReportScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})

if fFlagAppChatEnableTrustedFriendEntryPointModule then
	table.insert(list, {
		[enumScreensModule.AppChatTrustedContactsModal] = {
			screen = isolatedAutoFocusNavigationModule(trustedContactsModalScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	})
end
table.insert(list, {
	[enumScreensModule.BlockingModal] = {
		screen = isolatedAutoFocusNavigationModule(blockingModal, focusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})
table.insert(list, {
	[enumScreensModule.MessageContextMenu] = {
		screen = isolatedAutoFocusNavigationModule(messageContextMenuScreenModule, focusNavigableSurfaceIdentifierEnum.ContextualMenu),
		navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
	}
})

if getFFlagIsSquadEnabled() and getFFlagEnableCrossExpVoice() then
	table.insert(list, {
		[enumScreensModule.SquadVoiceReportAbuse] = {
			screen = isolatedAutoFocusNavigationModule(squadVoiceAbuseReportScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { backButtonEnabled = true, overlayEnabled = true }
		}
	})
end
table.insert(list, {
	[enumScreensModule.ConversationOverlay] = {
		screen = isolatedAutoFocusNavigationModule(conversationOverlayScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp),
		navigationOptions = {
			overlayEnabled = true,
			transparent = true,
			overlayTransparency = 0.5
		}
	}
})

if fFlagAppChatEnableDoubleOptIn or fFlagAppChatConsolidateTrustedFriendsModalModule then
	table.insert(list, {
		[enumScreensModule.TrustedConnectionsUpsell] = {
			screen = if fFlagAppChatConsolidateTrustedFriendsModalModule then isolatedAutoFocusNavigationModule(trustedFriendsUpsellScreenModule, focusNavigableSurfaceIdentifierEnum.PopUp) else trustedConnectionsUpsellScreenModule,
			navigationOptions = {
				transparent = true,
				overlayTransparency = 0.5,
				overlayEnabled = true
			}
		}
	})
end
table.insert(list, {
	[enumScreensModule.GroupOSADialog] = {
		screen = groupOSADialogScreenModule,
		navigationOptions = {
			transparent = true,
			overlayTransparency = 0.5,
			overlayEnabled = true
		}
	}
})

if fFlagEnablePartyVoiceChangersInLua then
	table.insert(list, {
		[enumScreensModule.SquadVoiceChangers] = {
			screen = isolatedAutoFocusNavigationModule(squadVoiceChangerOverlayModule, focusNavigableSurfaceIdentifierEnum.PopUp),
			navigationOptions = { overlayEnabled = true, overlayTransparency = 0.5 }
		}
	})
end
return roactNavigationModule.createRobloxStackNavigator(list, {
	defaultNavigationOptions = if fFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})