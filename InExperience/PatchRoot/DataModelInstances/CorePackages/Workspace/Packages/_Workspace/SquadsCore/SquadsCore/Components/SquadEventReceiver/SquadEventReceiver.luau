local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local experienceService = require(parent.ExperienceService).ExperienceService
local squadAppChatEventReceiverModule = require(script.Parent.SquadAppChatEventReceiver)
local squadExperienceInviteEventReceiverModule = require(script.Parent.SquadExperienceInviteEventReceiver)
local squadLifecycleEventReceiverModule = require(script.Parent.SquadLifecycleEventReceiver)
local squadRccEventReceiverModule = require(script.Parent.SquadRccEventReceiver)
local squadParentChannelEventReceiverModule = require(script.Parent.SquadParentChannelEventReceiver)
local scheduledSquadEventReceiverModule = require(script.Parent.ScheduledSquadEventReceiver)
local squadStorageEventReceiverModule = require(script.Parent.SquadStorageEventReceiver)
local squadNudgeEventReceiverModule = require(script.Parent.SquadNudgeEventReceiver)
local squadMemberStatusEventReceiverModule = require(script.Parent.SquadMemberStatusEventReceiver)
local squadNudgeEventReceiverNudgeV1ExpModule = require(script.Parent.SquadNudgeEventReceiver_NudgeV1Exp)
local squadRegroupPromptEventReceiverModule = require(script.Parent.SquadRegroupPromptEventReceiver)
local currentSquadUpdated = require(squadsCore.RoduxSquads).Actions.CurrentSquadUpdated
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadCoplayJoinModule = require(squadsCore.Enums.SquadCoplayJoin)
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local squadRootViewTypeModule = require(squadsCore.Enums.SquadRootViewType)
local squadToastActionsAndStatesModule = require(squadsCore.Enums.SquadToastActionsAndStates)
local squadToastTypeModule = require(squadsCore.Enums.SquadToastType)
local joinSquadModule = require(squadsCore.Thunks.joinSquad)
local leaveSquadModule = require(squadsCore.Thunks.leaveSquad)
local logInExpCoplayTelemetryModule = require(squadsCore.Analytics.logInExpCoplayTelemetry)
local useOnSquadEndedModule = require(squadsCore.Hooks.useOnSquadEnded)
local useCrossExperienceVoiceConnectorModule = require(squadsCore.Hooks.useCrossExperienceVoiceConnector)
local regroupPromptNotificationStateModule = require(squadsCore.Utils.RegroupPromptNotificationState)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local crossExperienceVoiceManager = crossExperienceVoiceModule.CrossExperienceVoiceManager
local reactModule = require(parent.React)
local roduxSquadsModule = require(parent.RoduxSquads)
local sharedFlagsModule = require(parent.SharedFlags)
local soundManagerModule = require(parent.SoundManager)
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local useCrossExperienceVoice = crossExperienceVoiceModule.Hooks.useCrossExperienceVoice
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffectOnce = require(parent.RoactUtils).Hooks.useEffectOnce
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useCurrentSquadSelector = roduxSquadsModule.Hooks.useCurrentSquadSelector
local sounds = soundManagerModule.Sounds
local soundManager = soundManagerModule.SoundManager
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local fFlagPartyVoiceBlockSync = sharedFlagsModule.FFlagPartyVoiceBlockSync
local fFlagSquadAppChatRTNFix = sharedFlagsModule.FFlagSquadAppChatRTNFix
local fFlagEnableSquadCoplayAnalytic = sharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local fIntPartyVoiceJoinRequestPulseCheckTimeout = sharedFlagsModule.FIntPartyVoiceJoinRequestPulseCheckTimeout
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local fFlagReadAppChatFetchingVariable = sharedFlagsModule.FFlagReadAppChatFetchingVariable
local fFlagEnablePartyNudgeV1DEV = sharedFlagsModule.FFlagEnablePartyNudgeV1_DEV
local fFlagAppChatNavigateBackIfOSAUnacknowledged = sharedFlagsModule.FFlagAppChatNavigateBackIfOSAUnacknowledged
local fFlagAppChatShowOSAOnPageEntry = sharedFlagsModule.FFlagAppChatShowOSAOnPageEntry
local fFlagEnableSquadRegroupExperimentation = sharedFlagsModule.FFlagEnableSquadRegroupExperimentation
local fFlagEnableSquadRegroupServerCapacityCheck = sharedFlagsModule.FFlagEnableSquadRegroupServerCapacityCheck
local fFlagEnableDialogAfterSquadJoin = sharedFlagsModule.FFlagEnableDialogAfterSquadJoin
local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local default_1 = toastNotificationModule.ToastNotificationSnoozeManager.default
local squadUnifyCoplayExperimentation = require(parent.SocialExperiments).SquadUnifyCoplayExperimentation
local leaveSquadIfChatDisabled = game:DefineFastFlag("LeaveSquadIfChatDisabled", false)

return function()
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContextModule (ref), useCurrentSquadSelector (ref), fFlagEnableSquadCoplayAnalytic (ref), useEffectOnce (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), lifecycleEvents (ref), notificationTypeEnum (ref), eventNamesModule (ref), squadToastActionsAndStatesModule (ref), squadToastTypeModule (ref), httpService (ref), default (ref), joinSquadModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), fFlagEnableDialogAfterSquadJoin (ref), default_1 (ref), soundManager (ref), sounds (ref), getFFlagEnableCrossExpVoice (ref), fFlagPartyVoiceBlockSync (ref), useSelector (ref), crossExperienceVoiceManager (ref), fIntPartyVoiceJoinRequestPulseCheckTimeout (ref), useCrossExperienceVoice (ref), useCrossExperienceVoiceConnectorModule (ref), useOnSquadEndedModule (ref), fFlagReadAppChatFetchingVariable (ref), leaveSquadIfChatDisabled (ref), leaveSquadModule (ref), currentSquadUpdated (ref), fFlagAppChatNavigateBackIfOSAUnacknowledged (ref), fFlagAppChatShowOSAOnPageEntry (ref), fFlagEnableSquadRegroupServerCapacityCheck (ref), playersService (ref), fFlagEnableSquadRegroupExperimentation (ref), squadLocationEnumModule (ref), experienceService (ref), regroupPromptNotificationStateModule (ref), squadLifecycleEventReceiverModule (ref), squadParentChannelEventReceiverModule (ref), squadUnifyCoplayExperimentation (ref), squadMemberStatusEventReceiverModule (ref), fFlagSquadAppChatRTNFix (ref), squadRootViewTypeModule (ref), squadAppChatEventReceiverModule (ref), squadExperienceInviteEventReceiverModule (ref), squadRccEventReceiverModule (ref), squadStorageEventReceiverModule (ref), fFlagEnablePartyNudgeV1DEV (ref), squadNudgeEventReceiverNudgeV1ExpModule (ref), squadNudgeEventReceiverModule (ref), scheduledSquadEventReceiverModule (ref), squadRegroupPromptEventReceiverModule (ref)
	local var1 = useDispatch()
	local var2 = tonumber(useLocalUserId()) or 0
	local var3 = reactModule.useContext(squadExternalContractContextModule)
	local var4 = var3.useSquadRootView()
	local var5 = var3.useIsChatEnabled()
	local var6 = var3.useIsLoadingChatSettings()
	local var7 = useCurrentSquadSelector()
	local var8 = if var7 and var7.squadId then var7.squadId else ""
	local var9 = if var7 and var7.parentChannelId then var7.parentChannelId else ""
	
	if fFlagEnableSquadCoplayAnalytic then
		useEffectOnce(function()
			-- upvalues: var7 (ref), logInExpCoplayTelemetryModule (copy), var8 (ref), var3 (ref), squadCoplayJoinModule (copy)
			if var7 then
				logInExpCoplayTelemetryModule(var8, var7.members, var3.squadLocation, squadCoplayJoinModule.ExperienceJoin, var3.fireSquadAnalytics)
			end
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var3 (ref), eventNamesModule (copy), var9 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), httpService (copy), default (copy), var1 (ref), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var5 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadInvitation, function(p1)
			-- upvalues: var3 (copy), eventNamesModule (copy), var9 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), httpService (copy), default (copy), var1 (copy), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var5 (copy)
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and (p1.visualItem.eventName == "JoinSquad" and p1.visualItem.actionEventParams) then
				var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var9,
					toastAction = squadToastActionsAndStatesModule.SquadInviteAccept,
					toastType = squadToastTypeModule.SquadInvite
				})
				local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
				default:dismissNotification(p1.notificationData.id)
				var1(joinSquadModule(actionEventParams.squadId, var3.setSquadPrompt, if fFlagEnableSquadCoplayAnalytic then var3.fireSquadAnalytics else nil, if fFlagEnableSquadCoplayAnalytic then var3.squadLocation else nil, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var5 else true))
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {
		var9, var1, joinSquadModule, var3.fireSquadAnalytics, var3.setSquadPrompt,
		var3.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var5 else nil
	})
	
	if fFlagEnableDialogAfterSquadJoin then
		reactModule.useEffect(function()
			-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), var3 (ref), default (copy), eventNamesModule (copy), var9 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var1 (ref), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var5 (ref)
			local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadInvitationV2, function(p1)
				-- upvalues: httpService (copy), var3 (copy), default (copy), eventNamesModule (copy), var9 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var1 (copy), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var5 (copy)
				if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and p1.visualItem.actionEventParams then
					local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
					
					if p1.visualItem.visualItemName == "view" and var3.showGroupOSADialog then
						default:dismissNotification(p1.notificationData.id)
						var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
							parentChannelId = var9,
							toastAction = squadToastActionsAndStatesModule.SquadInviteViewOsa,
							toastType = squadToastTypeModule.SquadInviteV2
						})
						var3.showGroupOSADialog(actionEventParams.chatId, function()
							-- upvalues: var1 (copy), joinSquadModule (copy), actionEventParams (ref), var3 (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var5 (copy)
							var1(joinSquadModule(actionEventParams.squadId, var3.setSquadPrompt, if fFlagEnableSquadCoplayAnalytic then var3.fireSquadAnalytics else nil, if fFlagEnableSquadCoplayAnalytic then var3.squadLocation else nil, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var5 else true))
						end, function() end)
						
						return
					elseif p1.visualItem.visualItemName == "join" then
						default:dismissNotification(p1.notificationData.id)
						var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
							parentChannelId = var9,
							toastAction = squadToastActionsAndStatesModule.SquadInviteAccept,
							toastType = squadToastTypeModule.SquadInviteV2
						})
						var1(joinSquadModule(actionEventParams.squadId, var3.setSquadPrompt, if fFlagEnableSquadCoplayAnalytic then var3.fireSquadAnalytics else nil, if fFlagEnableSquadCoplayAnalytic then var3.squadLocation else nil, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var5 else true))
					end
				end
			end)
			
			return function()
				-- upvalues: userAction (ref)
				userAction()
			end
		end, {
			var9, var1, joinSquadModule, var3.fireSquadAnalytics, var3.setSquadPrompt,
			var3.showGroupOSADialog, var3.squadLocation,
			if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var5 else nil
		})
	end
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var5 (ref), default_1 (copy), soundManager (copy), sounds (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadInvitation, function(p1)
			-- upvalues: var5 (copy), default_1 (copy), soundManager (copy), sounds (copy)
			if var5 and not default_1:isSnoozedNotificationType(p1.notificationType) then
				soundManager:PlaySound(sounds.PartyToast.Name)
			end
		end)
		
		return function()
			-- upvalues: display (ref)
			if display then
				display()
			end
		end
	end, { var5 })
	
	if fFlagEnableDialogAfterSquadJoin then
		reactModule.useEffect(function()
			-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var5 (ref), default_1 (copy), soundManager (copy), sounds (copy)
			local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadInvitationV2, function(p1)
				-- upvalues: var5 (copy), default_1 (copy), soundManager (copy), sounds (copy)
				if var5 and not default_1:isSnoozedNotificationType(p1.notificationType) then
					soundManager:PlaySound(sounds.PartyToast.Name)
				end
			end)
			
			return function()
				-- upvalues: display (ref)
				if display then
					display()
				end
			end
		end, { var5 })
	end
	reactModule.useEffect(function()
		-- upvalues: default (copy), notificationTypeEnum (copy), fFlagEnableDialogAfterSquadJoin (copy), var5 (ref), var2 (ref), httpService (copy), var8 (ref)
		local var10 = default:listenToDisplayNotification(function(p1)
			-- upvalues: notificationTypeEnum (copy), fFlagEnableDialogAfterSquadJoin (copy), var5 (copy), default (copy), var2 (copy), httpService (copy), var8 (copy)
			if not p1 then return end
			if (p1.notificationType == notificationTypeEnum.SquadInvitation or fFlagEnableDialogAfterSquadJoin and p1.notificationType == notificationTypeEnum.SquadInvitationV2 or (p1.notificationType == notificationTypeEnum.SquadExperienceInvitation or p1.notificationType == notificationTypeEnum.SquadJoinRequestPrompt or p1.notificationType == notificationTypeEnum.SquadAcceptJoinRequest)) and not var5 then
				default:dismissNotification(p1.notificationId)
				
				return
			elseif var2 <= 0 then
				if p1.notificationId and (p1.notificationType == notificationTypeEnum.SquadInvitation or fFlagEnableDialogAfterSquadJoin and p1.notificationType == notificationTypeEnum.SquadInvitationV2 or p1.notificationType == notificationTypeEnum.SquadExperienceInvitation) then
					default:dismissNotification(p1.notificationId)
				end
				return
			elseif (p1.notificationType == notificationTypeEnum.SquadInvitation or fFlagEnableDialogAfterSquadJoin and p1.notificationType == notificationTypeEnum.SquadInvitationV2) and var8 == httpService:JSONDecode(p1.lifecycleData).squadId then
				default:dismissNotification(p1.notificationId)
			end
		end)
		
		return function()
			-- upvalues: var10 (ref)
			var10:Disconnect()
		end
	end, { var8, var2, var5 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var3 (ref), eventNamesModule (copy), var9 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadJoinRequestPrompt, function(p1)
			-- upvalues: var3 (copy), eventNamesModule (copy), var9 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and (p1.visualItem.eventName == "RequestToJoinParty" and p1.visualItem.actionEventParams) then
				var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var9,
					toastAction = squadToastActionsAndStatesModule.RequestToJoinPartyAccept,
					toastType = squadToastTypeModule.RequestToJoinParty
				})
				default:dismissNotification(p1.notificationData.id)
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var9, var3.fireSquadAnalytics })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var3 (ref), eventNamesModule (copy), var9 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadAcceptJoinRequest, function(p1)
			-- upvalues: var3 (copy), eventNamesModule (copy), var9 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and (p1.visualItem.eventName == "AcceptPartyJoinRequest" and p1.visualItem.actionEventParams) then
				var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var9,
					toastAction = squadToastActionsAndStatesModule.AcceptPartyJoinRequestAccept,
					toastType = squadToastTypeModule.AcceptPartyJoinRequest
				})
				default:dismissNotification(p1.notificationData.id)
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var9, var3.fireSquadAnalytics })
	
	if getFFlagEnableCrossExpVoice() and fFlagPartyVoiceBlockSync then
		local var10 = useSelector(reactModule.useCallback(function(p1)
			return p1.Squad.UserBlocking.isBlockedByMe
		end, {}))
		local var11 = reactModule.useRef({})
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var10 (ref), crossExperienceVoiceManager (copy)
			if var11.current == var10 then return end
			for i, v in pairs(var10) do
				local var12 = var11.current[i] or false
				
				if v and not var12 then
					crossExperienceVoiceManager.default:blockVoiceParticipant(i)
				elseif not v and var12 then
					crossExperienceVoiceManager.default:unblockVoiceParticipant(i)
				end
			end
			var11.current = var10
		end, { var10 })
	end
	if getFFlagEnableCrossExpVoice() then
		if fIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
			useCrossExperienceVoice({ handleRCCConnectionTimeout = true })
		else
			useCrossExperienceVoice()
		end
		local var12 = useCrossExperienceVoiceConnectorModule()
		useOnSquadEndedModule(function()
			-- upvalues: var12 (ref)
			var12()
		end)
	end
	local var13
	reactModule.useEffect(function()
		-- upvalues: fFlagReadAppChatFetchingVariable (copy), var6 (ref), var5 (ref), var8 (ref), leaveSquadIfChatDisabled (copy), var1 (ref), leaveSquadModule (copy), var3 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), currentSquadUpdated (copy)
		if (not fFlagReadAppChatFetchingVariable or not var6) and (not var5 and var8 ~= "") then
			if leaveSquadIfChatDisabled then
				var1(leaveSquadModule(nil, var3.setSquadPrompt, nil, var3.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var5 else true))
				
				return
			end
			var1(currentSquadUpdated(nil))
		end
	end, {
		var5,
		var8,
		if fFlagReadAppChatFetchingVariable then var6 else nil,
		if leaveSquadIfChatDisabled then var3.setSquadPrompt else nil,
		if leaveSquadIfChatDisabled then var3.squadLocation else nil
	})
	
	if fFlagAppChatNavigateBackIfOSAUnacknowledged and not fFlagAppChatShowOSAOnPageEntry then
		local var14 = var3.shouldShowOSAForConversation(var3.useGetConversationFromId(var9))
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), var8 (ref), var1 (ref), leaveSquadModule (copy), var3 (ref)
			if var14 and var8 ~= "" then
				var1(leaveSquadModule(nil, var3.setSquadPrompt, nil, var3.squadLocation, true))
			end
		end, { var14, var8, var3.setSquadPrompt, var3.squadLocation })
	end
	if fFlagEnableSquadRegroupServerCapacityCheck then
		var13 = playersService.MaxPlayers > 1
		var13 = nil
	else
		var13 = true
	end
	local var15 = fFlagEnableSquadRegroupExperimentation and (var3.squadLocation == squadLocationEnumModule.InExperience and (var13 and (var7 and (var7.selfPermissions and (var7.selfPermissions.canSeeRegroupPromptToast and #var7.members > 1)))))
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), experienceService (copy), regroupPromptNotificationStateModule (copy)
		if fFlagEnableSquadRegroupExperimentation then
			local var16 = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: regroupPromptNotificationStateModule (copy)
				regroupPromptNotificationStateModule.dismissNotification(regroupPromptNotificationStateModule.getActiveNotifId())
			end)
			
			return function()
				-- upvalues: var16 (ref)
				if var16 and var16.Disconnect then
					var16:Disconnect()
				end
			end
		end
		return function() end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), regroupPromptNotificationStateModule (copy), var8 (ref)
		if fFlagEnableSquadRegroupExperimentation then
			local activeNotifId = regroupPromptNotificationStateModule.getActiveNotifId()
			
			if activeNotifId ~= nil and var8 ~= regroupPromptNotificationStateModule.getActiveSquadId() then
				regroupPromptNotificationStateModule.dismissNotification(activeNotifId)
			end
		end
	end, { var8 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		SquadLifecycleEventReceiver = reactModule.createElement(squadLifecycleEventReceiverModule, { currentSquadId = var8 }),
		SquadParentChannelEventReceiver = if var7 then reactModule.createElement(squadParentChannelEventReceiverModule, { currentParentChannelId = var7.parentChannelId }) else nil,
		SquadMemberStatusEventReceiver = if (squadUnifyCoplayExperimentation.getOneOnOnePartyCreationEnabled() or squadUnifyCoplayExperimentation.getMultiInvitePartyCreationEnabled()) and var3.squadLocation == squadLocationEnumModule.InExperience then reactModule.createElement(squadMemberStatusEventReceiverModule) else nil,
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix or var4 == squadRootViewTypeModule.None then nil else reactModule.createElement(squadAppChatEventReceiverModule, {
			conversationId = if var7 then var7.parentChannelId else nil
		}),
		SquadExperienceInviteEventReceiver = reactModule.createElement(squadExperienceInviteEventReceiverModule, { currentSquadId = var8 }),
		SquadRccEventReceiver = if var3.squadLocation == squadLocationEnumModule.InExperience then reactModule.createElement(squadRccEventReceiverModule, { currentSquadId = var8 }) else nil,
		SquadStorageEventReceiver = reactModule.createElement(squadStorageEventReceiverModule),
		SquadNudgeEventReceiver = reactModule.createElement(if fFlagEnablePartyNudgeV1DEV then squadNudgeEventReceiverNudgeV1ExpModule else squadNudgeEventReceiverModule, { currentSquadId = var8, currentParentChannelId = var9 }),
		ScheduledSquadEventReceiver = reactModule.createElement(scheduledSquadEventReceiverModule),
		SquadRegroupPromptEventReceiver = if var15 then reactModule.createElement(squadRegroupPromptEventReceiverModule, {
			currentSquadMembers = if var7 then var7.members else {},
			currentSquadId = var8
		}) else nil
	})
end