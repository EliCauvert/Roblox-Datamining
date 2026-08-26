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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), squadExternalContractContextModule (ref), useDispatch (ref), useCurrentSquadIdModule (ref), useScreenSize (ref), eventNamesModule (ref), enableSquadPromptAnalytics (ref), squadPromptTypeModule (ref), universalAppPolicyModule (ref), useLocalization (ref), buttonType (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), interactiveAlert (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	local var3 = useDispatch()
	local var4 = useCurrentSquadIdModule() or ""
	local var5 = if var1.screenSize then var1.screenSize else useScreenSize()
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), eventNamesModule (copy), var1 (ref), var4 (ref)
		var2.fireSquadAnalytics(eventNamesModule.SquadPromptResponded, {
			promptType = var1.promptType,
			squadId = var4 or "",
			responseType = p2
		})
	end, { var1.promptType, var4, var2.fireSquadAnalytics })
	local var7 = reactModule.useCallback(function()
		-- upvalues: enableSquadPromptAnalytics (copy), var6 (ref), var3 (ref), var2 (ref), var1 (ref)
		if enableSquadPromptAnalytics then
			var6("cancel")
		end
		var3(var2.closeSquadPrompt())
		
		if var1.onCancel then
			var1.onCancel()
		end
	end, { var3, var1.onCancel, var2.closeSquadPrompt, var6 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: enableSquadPromptAnalytics (copy), var6 (ref), var3 (ref), var2 (ref), var1 (ref)
		if enableSquadPromptAnalytics then
			var6("confirm")
		end
		var3(var2.closeSquadPrompt())
		
		if var1.onConfirm then
			var1.onConfirm()
		end
	end, { var3, var1.onConfirm, var2.closeSquadPrompt, var6 })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: squadPromptTypeModule (copy), universalAppPolicyModule (copy), var1 (ref)
		local var10, var11, var12
		local _ = nil
		local _ = nil
		local _ = nil
		local var13 = "CommonUI.Controls.Action.Cancel"
		
		if p2 == squadPromptTypeModule.AlreadyJoined then
			var10 = "Feature.Squads.Label.Error"
			var11 = "Feature.Squads.Description.AlreadyJoined"
			var12 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.ConfirmInviteToSquad then
			var10 = if universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Squads.Label.InviteConnectionsConfirmation" else "Feature.Squads.Label.InviteFriendsConfirmation"
			var11 = if universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections() then "Feature.Squads.Description.InviteConnectionsToParty" else "Feature.Squads.Description.InviteFriendsToParty"
			var12 = "Feature.Squads.Action.Yes"
		elseif p2 == squadPromptTypeModule.AddFriends then
			var10 = "Feature.Squads.Label.AddFriends"
			var11 = "Feature.Squads.Description.AddFriends"
			var12 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.FailedToJoin then
			var10 = "Feature.Squads.Label.FailedToJoin"
			var11 = "Feature.Squads.Description.FailedToJoin"
			var12 = "Feature.Squads.Action.Join"
		elseif p2 == squadPromptTypeModule.JoinAnotherSquad then
			var10 = "Feature.Squads.Label.JoinAnotherParty"
			var11 = "Feature.Squads.Description.JoinAnotherParty"
			var12 = "Feature.Squads.Action.Switch"
		elseif p2 == squadPromptTypeModule.SquadEnded then
			var10 = "Feature.Squads.Label.PartyEnded"
			var11 = "Feature.Squads.Description.PartyEnded"
			var12 = "Feature.Squads.Action.Start"
		elseif p2 == squadPromptTypeModule.SquadFull then
			var10 = "Feature.Squads.Label.PartyFull"
			var11 = "Feature.Squads.Description.PartyFull"
			var12 = "Feature.Squads.Action.Join"
		elseif p2 == squadPromptTypeModule.InvitedToExperience then
			var10 = "Feature.Squads.Label.InvitedToExperience"
			var11 = "Feature.Squads.Description.InvitedToExperience"
			var12 = "Feature.Squads.Action.Retry"
		elseif p2 == squadPromptTypeModule.RemoveFromChat then
			var10 = "Feature.Squads.Label.RemoveFromChat"
			var11 = "Feature.Squads.Description.RemoveFromChat"
			var12 = "Feature.Squads.Action.Remove"
		elseif p2 == squadPromptTypeModule.RemoveFromParty then
			var10 = "Feature.Squads.Label.RemoveFromParty"
			var11 = "Feature.Squads.Description.RemoveFromParty"
			var12 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.JoinWithLowMemory then
			var10 = "Feature.Squads.Label.LowMemory"
			var11 = "Feature.Squads.Description.JoinWithLowMemory"
			var12 = "Feature.Squads.Action.ContinueWithoutVoice"
			var13 = "Feature.Squads.Action.ConnectToVoice"
		elseif p2 == squadPromptTypeModule.ConnectVoiceWithLowMemory then
			var10 = "Feature.Squads.Label.LowMemory"
			var11 = "Feature.Squads.Description.ConnectVoiceWithLowMemory"
			var12 = "Feature.Squads.Action.ContinueWithoutVoice"
			var13 = "Feature.Squads.Action.ConnectToVoice"
		elseif p2 == squadPromptTypeModule.DisconnectVoiceDueToLowMemory then
			var10 = "Feature.Squads.Label.LowMemory"
			var11 = "Feature.Squads.Description.DisconnectVoiceDueToLowMemory"
			var12 = "Feature.Squads.Action.DisconnectFromVoice"
			var13 = "Feature.Chat.Action.Continue"
		elseif p2 == squadPromptTypeModule.ParticipantChatDisabled then
			var10 = "Feature.Squads.Label.Error"
			var11 = "Feature.Chat.Toast.Error.InvalidUserSelected"
			var12 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.EuVoiceConsentPrompt then
			var10 = "Feature.Squads.Label.VoiceRecordedTitle"
			var11 = "Feature.Squads.Description.VoiceRecordedDisclosure"
			var12 = "Feature.Chat.Action.Continue"
			var13 = "Feature.Squads.Action.JoinWithoutVoice"
		elseif p2 == squadPromptTypeModule.ConfirmDeleteScheduledSquad then
			var10 = "Feature.Squads.Label.DeleteScheduledParty"
			var11 = "Feature.Squads.Description.DeleteScheduledSquad"
			var12 = "CommonUI.Controls.Action.Yes"
		elseif p2 == squadPromptTypeModule.ScheduledSquadConflict then
			var10 = "Feature.Squads.Label.PartyOperationFailed"
			var11 = "Feature.Squads.Description.ScheduledPartyAlreadyExists"
			var12 = "Feature.Squads.Action.Ok"
		elseif p2 == squadPromptTypeModule.CannotExpandToGroupChatActiveParty then
			var10 = "Feature.Squads.Label.PartyOperationFailed"
			var11 = "Feature.Squads.Description.OneOnOneExpandedChatFeaturesActivePartyError"
			var12 = "Feature.Squads.Action.Ok"
		else
			var10 = "Feature.Squads.Label.PartyOperationFailed"
			var11 = "Feature.Squads.Description.PleaseTryAgain"
			var12 = "Feature.Squads.Action.Ok"
		end
		if var1.bodyTextLocalizationProps then
			var11 = { var11 }
			
			for i, v in pairs(var1.bodyTextLocalizationProps) do
				var11[i] = v
			end
		end
		return {
			title = var10,
			bodyText = var11,
			confirmText = var12,
			cancelButtonText = var13
		}
	end, {})
	local var14 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), var1 (ref)
		return var9(var1.promptType)
	end, { var1.promptType })
	local var15 = useLocalization({
		title = var14.title,
		bodyText = var14.bodyText,
		confirmText = var14.confirmText,
		cancelButtonText = var14.cancelButtonText
	})
	
	return reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var7 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p3)
						-- upvalues: var7 (copy)
						var7()
						p3:cancel()
					end)
				}
			}
		end, { var7 }),
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var5,
			title = var15.title,
			bodyText = var15.bodyText,
			buttonStackInfo = {
				buttons = reactModule.useCallback(function()
					-- upvalues: var1 (ref), var7 (ref), var15 (ref), buttonType (copy), var8 (ref)
					local t = {}
					
					if not var1.hideCancelButton then
						table.insert(t, {
							props = { onActivated = var7, text = var15.cancelButtonText }
						})
					end
					table.insert(t, {
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var8, text = var15.confirmText }
					})
					
					return t
				end, {
					var15.cancelButtonText,
					var15.confirmText,
					var1.hideCancelButton,
					var8,
					var7
				})()
			}
		})
	})
end