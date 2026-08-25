local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local _ = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local enableSquadPromptAnalytics = game:DefineFastFlag("EnableSquadPromptAnalytics", false)
local useScreenSize = robloxAppHooksModule.useScreenSize
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local t = {
	hideCancelButton = false,
	bodyTextLocalizationProps = nil
}

local function _()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), squadExternalContractContextModule (ref), useDispatch (ref), useCurrentSquadIdModule (ref), useScreenSize (ref), eventNamesModule (ref), enableSquadPromptAnalytics (ref), squadPromptTypeModule (ref), universalAppPolicyModule (ref), useLocalization (ref), buttonType (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), interactiveAlert (ref)
	local var14 = cryoModule.Dictionary.join(t, p0)
	local var15 = reactModule.useContext(squadExternalContractContextModule)
	local var16 = useDispatch()
	local var17 = useCurrentSquadIdModule() or ""
	local var18 = if var14.screenSize then var14.screenSize else useScreenSize()
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var15 (ref), eventNamesModule (copy), var14 (ref), var17 (ref)
		var15.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
			promptType = var14.promptType,
			squadId = var17 or "",
			responseType = p1
		})
	end, { var14.promptType, var17, var15.fireSquadAnalytics })
	local var20 = reactModule.useCallback(function()
		-- upvalues: enableSquadPromptAnalytics (copy), var19 (ref), var16 (ref), var15 (ref), var14 (ref)
		if enableSquadPromptAnalytics then
			var19("cancel")
		end
		var16(var15.closeSquadPrompt())
		
		if var14.onCancel then
			var14.onCancel()
		end
	end, { var16, var14.onCancel, var15.closeSquadPrompt, var19 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: enableSquadPromptAnalytics (copy), var19 (ref), var16 (ref), var15 (ref), var14 (ref)
		if enableSquadPromptAnalytics then
			var19("confirm")
		end
		var16(var15.closeSquadPrompt())
		
		if var14.onConfirm then
			var14.onConfirm()
		end
	end, { var16, var14.onConfirm, var15.closeSquadPrompt, var19 })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: squadPromptTypeModule (copy), universalAppPolicyModule (copy), var14 (ref)
		local var26, var27, var28
		local _ = nil
		local _ = nil
		local _ = nil
		local var25 = "CommonUI.Controls.Action.Cancel"
		
		if p2 == squadPromptTypeModule.AlreadyJoined then
			var26 = "Feature.Squads.Label.Error"
			var27 = "Feature.Squads.Description.AlreadyJoined"
			var28 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.ConfirmInviteToSquad then
			var26 = if universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Squads.Label.InviteConnectionsConfirmation" else "Feature.Squads.Label.InviteFriendsConfirmation"
			var27 = if universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Squads.Description.InviteConnectionsToParty" else "Feature.Squads.Description.InviteFriendsToParty"
			var28 = "Feature.Squads.Action.Yes"
		elseif p2 == squadPromptTypeModule.AddFriends then
			var26 = "Feature.Squads.Label.AddFriends"
			var27 = "Feature.Squads.Description.AddFriends"
			var28 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.FailedToJoin then
			var26 = "Feature.Squads.Label.FailedToJoin"
			var27 = "Feature.Squads.Description.FailedToJoin"
			var28 = "Feature.Squads.Action.Join"
		elseif p2 == squadPromptTypeModule.JoinAnotherSquad then
			var26 = "Feature.Squads.Label.JoinAnotherParty"
			var27 = "Feature.Squads.Description.JoinAnotherParty"
			var28 = "Feature.Squads.Action.Switch"
		elseif p2 == squadPromptTypeModule.SquadEnded then
			var26 = "Feature.Squads.Label.PartyEnded"
			var27 = "Feature.Squads.Description.PartyEnded"
			var28 = "Feature.Squads.Action.Start"
		elseif p2 == squadPromptTypeModule.SquadFull then
			var26 = "Feature.Squads.Label.PartyFull"
			var27 = "Feature.Squads.Description.PartyFull"
			var28 = "Feature.Squads.Action.Join"
		elseif p2 == squadPromptTypeModule.InvitedToExperience then
			var26 = "Feature.Squads.Label.InvitedToExperience"
			var27 = "Feature.Squads.Description.InvitedToExperience"
			var28 = "Feature.Squads.Action.Retry"
		elseif p2 == squadPromptTypeModule.RemoveFromChat then
			var26 = "Feature.Squads.Label.RemoveFromChat"
			var27 = "Feature.Squads.Description.RemoveFromChat"
			var28 = "Feature.Squads.Action.Remove"
		elseif p2 == squadPromptTypeModule.RemoveFromParty then
			var26 = "Feature.Squads.Label.RemoveFromParty"
			var27 = "Feature.Squads.Description.RemoveFromParty"
			var28 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.JoinWithLowMemory then
			var26 = "Feature.Squads.Label.LowMemory"
			var27 = "Feature.Squads.Description.JoinWithLowMemory"
			var28 = "Feature.Squads.Action.ContinueWithoutVoice"
			var25 = "Feature.Squads.Action.ConnectToVoice"
		elseif p2 == squadPromptTypeModule.ConnectVoiceWithLowMemory then
			var26 = "Feature.Squads.Label.LowMemory"
			var27 = "Feature.Squads.Description.ConnectVoiceWithLowMemory"
			var28 = "Feature.Squads.Action.ContinueWithoutVoice"
			var25 = "Feature.Squads.Action.ConnectToVoice"
		elseif p2 == squadPromptTypeModule.DisconnectVoiceDueToLowMemory then
			var26 = "Feature.Squads.Label.LowMemory"
			var27 = "Feature.Squads.Description.DisconnectVoiceDueToLowMemory"
			var28 = "Feature.Squads.Action.DisconnectFromVoice"
			var25 = "Feature.Chat.Action.Continue"
		elseif p2 == squadPromptTypeModule.ParticipantChatDisabled then
			var26 = "Feature.Squads.Label.Error"
			var27 = "Feature.Chat.Toast.Error.InvalidUserSelected"
			var28 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.EuVoiceConsentPrompt then
			var26 = "Feature.Squads.Label.VoiceRecordedTitle"
			var27 = "Feature.Squads.Description.VoiceRecordedDisclosure"
			var28 = "Feature.Chat.Action.Continue"
			var25 = "Feature.Squads.Action.JoinWithoutVoice"
		elseif p2 == squadPromptTypeModule.ConfirmDeleteScheduledSquad then
			var26 = "Feature.Squads.Label.DeleteScheduledParty"
			var27 = "Feature.Squads.Description.DeleteScheduledSquad"
			var28 = "CommonUI.Controls.Action.Yes"
		elseif p2 == squadPromptTypeModule.ScheduledSquadConflict then
			var26 = "Feature.Squads.Label.PartyOperationFailed"
			var27 = "Feature.Squads.Description.ScheduledPartyAlreadyExists"
			var28 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.CannotExpandToGroupChatActiveParty then
			var26 = "Feature.Squads.Label.PartyOperationFailed"
			var27 = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError"
			var28 = "Feature.Squads.Action.Ok"
		else
			var26 = "Feature.Squads.Label.PartyOperationFailed"
			var27 = "Feature.Squads.Description.PleaseTryAgain"
			var28 = "Feature.Squads.Action.Ok"
		end
		if var14.bodyTextLocalizationProps then
			var27 = { var27 }
			
			for i, v in pairs(var14.bodyTextLocalizationProps) do
				var27[i] = v
			end
		end
		return {
			title = var26,
			bodyText = var27,
			confirmText = var28,
			cancelButtonText = var25
		}
	end, {})
	local var23 = reactModule.useMemo(function()
		-- upvalues: var22 (ref), var14 (ref)
		return var22(var14.promptType)
	end, { var14.promptType })
	local var24 = useLocalization({
		title = var23.title,
		bodyText = var23.bodyText,
		confirmText = var23.confirmText,
		cancelButtonText = var23.cancelButtonText
	})
	
	return reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var20 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p3)
						-- upvalues: var20 (copy)
						var20()
						p3:cancel()
					end)
				}
			}
		end, { var20 }),
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var18,
			title = var24.title,
			bodyText = var24.bodyText,
			buttonStackInfo = {
				buttons = reactModule.useCallback(function()
					-- upvalues: var14 (ref), var20 (ref), var24 (ref), buttonType (copy), var21 (ref)
					local t = {}
					
					if not var14.hideCancelButton then
						table.insert(t, {
							props = { onActivated = var20, text = var24.cancelButtonText }
						})
					end
					table.insert(t, {
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var21, text = var24.confirmText }
					})
					
					return t
				end, {
					var24.cancelButtonText,
					var24.confirmText,
					var14.hideCancelButton,
					var21,
					var20
				})()
			}
		})
	})
end