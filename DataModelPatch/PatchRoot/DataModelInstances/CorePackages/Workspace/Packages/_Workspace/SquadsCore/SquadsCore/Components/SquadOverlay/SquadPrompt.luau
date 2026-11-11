local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local UseCurrentSquadIdModule = require(SquadsCore.Hooks.useCurrentSquadId)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local EnableSquadPromptAnalytics = game:DefineFastFlag("EnableSquadPromptAnalytics", false)
local FFlagEnableScheduledSquads = require(Parent.SharedFlags).FFlagEnableScheduledSquads
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local config = {
	hideCancelButton = false,
	bodyTextLocalizationProps = nil
}

local function _()
	-- upvalues: UniversalAppPolicyModule (copy)
	return UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), SquadExternalContractContextModule (copy), UseDispatchFunction (copy), UseCurrentSquadIdModule (copy), UseScreenSizeFunction (copy), EventNamesModule (copy), EnableSquadPromptAnalytics (copy), SquadPromptTypeModule (copy), UniversalAppPolicyModule (copy), FFlagEnableScheduledSquads (copy), UseLocalizationFunction (copy), ButtonType (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), InteractiveAlert (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseCurrentSquadIdModuleResult = UseCurrentSquadIdModule() or ""
	local UseResult = ReactModule.useCallback(function(ResponseType)
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), JoinResult (copy), UseCurrentSquadIdModuleResult (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.SquadPromptResponded, {
			promptType = JoinResult.promptType,
			squadId = UseCurrentSquadIdModuleResult or "",
			responseType = ResponseType
		})
	end, {
		JoinResult.promptType,
		UseCurrentSquadIdModuleResult,
		UseContextResult.fireSquadAnalytics
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: EnableSquadPromptAnalytics (upval), UseResult (copy), UseDispatchResult (copy), UseContextResult (copy), JoinResult (copy)
		if EnableSquadPromptAnalytics then
			UseResult("cancel")
		end
		UseDispatchResult(UseContextResult.closeSquadPrompt())
		
		if JoinResult.onCancel then
			JoinResult.onCancel()
		end
	end, {
		UseDispatchResult,
		JoinResult.onCancel,
		UseContextResult.closeSquadPrompt,
		UseResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: EnableSquadPromptAnalytics (upval), UseResult (copy), UseDispatchResult (copy), UseContextResult (copy), JoinResult (copy)
		if EnableSquadPromptAnalytics then
			UseResult("confirm")
		end
		UseDispatchResult(UseContextResult.closeSquadPrompt())
		
		if JoinResult.onConfirm then
			JoinResult.onConfirm()
		end
	end, {
		UseDispatchResult,
		JoinResult.onConfirm,
		UseContextResult.closeSquadPrompt,
		UseResult
	})
	local UseResult3 = ReactModule.useCallback(function(AddFriends)
		-- upvalues: SquadPromptTypeModule (upval), UniversalAppPolicyModule (upval), FFlagEnableScheduledSquads (upval), JoinResult (copy)
		local CancelButtonText = "CommonUI.Controls.Action.Cancel"
		local FeatureSquadsDescriptionInviteConnectionsToParty = nil
		local FeatureSquadsLabelInviteConnectionsConfirmation = nil
		local ConfirmText = nil
		
		if AddFriends == SquadPromptTypeModule.AlreadyJoined then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.Error"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.AlreadyJoined"
			ConfirmText = "Feature.Squads.Action.Ok"
		elseif AddFriends == SquadPromptTypeModule.ConfirmInviteToSquad then
			FeatureSquadsLabelInviteConnectionsConfirmation = if UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Squads.Label.InviteConnectionsConfirmation" else "Feature.Squads.Label.InviteFriendsConfirmation"
			FeatureSquadsDescriptionInviteConnectionsToParty = if UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Squads.Description.InviteConnectionsToParty" else "Feature.Squads.Description.InviteFriendsToParty"
			ConfirmText = "Feature.Squads.Action.Yes"
		elseif AddFriends == SquadPromptTypeModule.AddFriends then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.AddFriends"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.AddFriends"
			ConfirmText = "Feature.Squads.Action.Ok"
		elseif AddFriends == SquadPromptTypeModule.FailedToJoin then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.FailedToJoin"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.FailedToJoin"
			ConfirmText = "Feature.Squads.Action.Join"
		elseif AddFriends == SquadPromptTypeModule.JoinAnotherSquad then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.JoinAnotherParty"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.JoinAnotherParty"
			ConfirmText = "Feature.Squads.Action.Switch"
		elseif AddFriends == SquadPromptTypeModule.SquadEnded then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.PartyEnded"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.PartyEnded"
			ConfirmText = "Feature.Squads.Action.Start"
		elseif AddFriends == SquadPromptTypeModule.SquadFull then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.PartyFull"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.PartyFull"
			ConfirmText = "Feature.Squads.Action.Join"
		elseif AddFriends == SquadPromptTypeModule.InvitedToExperience then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.InvitedToExperience"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.InvitedToExperience"
			ConfirmText = "Feature.Squads.Action.Retry"
		elseif AddFriends == SquadPromptTypeModule.RemoveFromChat then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.RemoveFromChat"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.RemoveFromChat"
			ConfirmText = "Feature.Squads.Action.Remove"
		elseif AddFriends == SquadPromptTypeModule.RemoveFromParty then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.RemoveFromParty"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.RemoveFromParty"
			ConfirmText = "Feature.Squads.Action.Ok"
		elseif AddFriends == SquadPromptTypeModule.JoinWithLowMemory then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.LowMemory"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.JoinWithLowMemory"
			ConfirmText = "Feature.Squads.Action.ContinueWithoutVoice"
			CancelButtonText = "Feature.Squads.Action.ConnectToVoice"
		elseif AddFriends == SquadPromptTypeModule.ConnectVoiceWithLowMemory then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.LowMemory"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.ConnectVoiceWithLowMemory"
			ConfirmText = "Feature.Squads.Action.ContinueWithoutVoice"
			CancelButtonText = "Feature.Squads.Action.ConnectToVoice"
		elseif AddFriends == SquadPromptTypeModule.DisconnectVoiceDueToLowMemory then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.LowMemory"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.DisconnectVoiceDueToLowMemory"
			ConfirmText = "Feature.Squads.Action.DisconnectFromVoice"
			CancelButtonText = "Feature.Chat.Action.Continue"
		elseif AddFriends == SquadPromptTypeModule.ParticipantChatDisabled then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.Error"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Chat.Toast.Error.InvalidUserSelected"
			ConfirmText = "Feature.Squads.Action.Ok"
		elseif AddFriends == SquadPromptTypeModule.EuVoiceConsentPrompt then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.VoiceRecordedTitle"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.VoiceRecordedDisclosure"
			ConfirmText = "Feature.Chat.Action.Continue"
			CancelButtonText = "Feature.Squads.Action.JoinWithoutVoice"
		elseif FFlagEnableScheduledSquads and AddFriends == SquadPromptTypeModule.ConfirmDeleteScheduledSquad then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.DeleteScheduledParty"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.DeleteScheduledSquad"
			ConfirmText = "CommonUI.Controls.Action.Yes"
		elseif FFlagEnableScheduledSquads and AddFriends == SquadPromptTypeModule.ScheduledSquadConflict then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.PartyOperationFailed"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.ScheduledPartyAlreadyExists"
			ConfirmText = "Feature.Squads.Action.Ok"
		elseif AddFriends == SquadPromptTypeModule.CannotExpandToGroupChatActiveParty then
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.PartyOperationFailed"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError"
			ConfirmText = "Feature.Squads.Action.Ok"
		else
			FeatureSquadsLabelInviteConnectionsConfirmation = "Feature.Squads.Label.PartyOperationFailed"
			FeatureSquadsDescriptionInviteConnectionsToParty = "Feature.Squads.Description.PleaseTryAgain"
			ConfirmText = "Feature.Squads.Action.Ok"
		end
		if JoinResult.bodyTextLocalizationProps then
			FeatureSquadsDescriptionInviteConnectionsToParty = { FeatureSquadsDescriptionInviteConnectionsToParty }
			
			for i, bodyTextLocalizationProp in pairs(JoinResult.bodyTextLocalizationProps) do
				FeatureSquadsDescriptionInviteConnectionsToParty[i] = bodyTextLocalizationProp
			end
		end
		return {
			title = FeatureSquadsLabelInviteConnectionsConfirmation,
			bodyText = FeatureSquadsDescriptionInviteConnectionsToParty,
			confirmText = ConfirmText,
			cancelButtonText = CancelButtonText
		}
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseResult3 (copy), JoinResult (copy)
		return UseResult3(JoinResult.promptType)
	end, { JoinResult.promptType })
	local UseLocalizationResult = UseLocalizationFunction({
		title = UseMemoResult.title,
		bodyText = UseMemoResult.bodyText,
		confirmText = UseMemoResult.confirmText,
		cancelButtonText = UseMemoResult.cancelButtonText
	})
	
	return (ReactModule.createElement(FocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseResult1 (upval)
						UseResult1()
						p2:cancel()
					end)
				}
			}
		end, { UseResult1 }),
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		ReactModule.createElement(InteractiveAlert, {
			screenSize = if JoinResult.screenSize then JoinResult.screenSize else UseScreenSizeFunction(),
			title = UseLocalizationResult.title,
			bodyText = UseLocalizationResult.bodyText,
			buttonStackInfo = {
				buttons = ReactModule.useCallback(function()
					-- upvalues: JoinResult (copy), UseResult1 (copy), UseLocalizationResult (copy), ButtonType (upval), UseResult2 (copy)
					local List = {}
					
					if not JoinResult.hideCancelButton then
						table.insert(List, {
							props = {
								onActivated = UseResult1,
								text = UseLocalizationResult.cancelButtonText
							}
						})
					end
					table.insert(List, {
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseResult2,
							text = UseLocalizationResult.confirmText
						}
					})
					
					return List
				end, {
					UseLocalizationResult.cancelButtonText,
					UseLocalizationResult.confirmText,
					JoinResult.hideCancelButton,
					UseResult2,
					UseResult1
				})()
			}
		})
	}))
end