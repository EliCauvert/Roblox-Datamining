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
	local var35 = useDispatch()
	local var36 = tonumber(useLocalUserId()) or 0
	local var37 = reactModule.useContext(squadExternalContractContextModule)
	local var38 = var37.useSquadRootView()
	local var39 = var37.useIsChatEnabled()
	local var40 = var37.useIsLoadingChatSettings()
	local var41 = useCurrentSquadSelector()
	local var42 = if var41 and var41.squadId then var41.squadId else ""
	local var43 = if var41 and var41.parentChannelId then var41.parentChannelId else ""
	
	if fFlagEnableSquadCoplayAnalytic then
		useEffectOnce(function()
			-- upvalues: var41 (ref), logInExpCoplayTelemetryModule (copy), var42 (ref), var37 (ref), squadCoplayJoinModule (copy)
			if var41 then
				logInExpCoplayTelemetryModule(var42, var41.members, var37.squadLocation, squadCoplayJoinModule.ExperienceJoin, var37.fireSquadAnalytics)
			end
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var37 (ref), eventNamesModule (copy), var43 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), httpService (copy), default (copy), var35 (ref), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var39 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadInvitation, function(p0)
			-- upvalues: var37 (copy), eventNamesModule (copy), var43 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), httpService (copy), default (copy), var35 (copy), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var39 (copy)
			if p0 and p0.userActionType == "click" and (p0.notificationData and p0.visualItem) and (p0.visualItem.eventName == "JoinSquad" and p0.visualItem.actionEventParams) then
				var37.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var43,
					toastAction = squadToastActionsAndStatesModule.SquadInviteAccept,
					toastType = squadToastTypeModule.SquadInvite
				})
				local actionEventParams = httpService:JSONDecode(p0.visualItem.actionEventParams)
				default:dismissNotification(p0.notificationData.id)
				var35(joinSquadModule(actionEventParams.squadId, var37.setSquadPrompt, if fFlagEnableSquadCoplayAnalytic then var37.fireSquadAnalytics else nil, if fFlagEnableSquadCoplayAnalytic then var37.squadLocation else nil, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var39 else true))
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {
		var43, var35, joinSquadModule, var37.fireSquadAnalytics, var37.setSquadPrompt,
		var37.squadLocation,
		if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var39 else nil
	})
	
	if fFlagEnableDialogAfterSquadJoin then
		reactModule.useEffect(function()
			-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), var37 (ref), default (copy), eventNamesModule (copy), var43 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var35 (ref), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var39 (ref)
			local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadInvitationV2, function(p1)
				-- upvalues: httpService (copy), var37 (copy), default (copy), eventNamesModule (copy), var43 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var35 (copy), joinSquadModule (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var39 (copy)
				if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and p1.visualItem.actionEventParams then
					local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
					
					if p1.visualItem.visualItemName == "view" and var37.showGroupOSADialog then
						default:dismissNotification(p1.notificationData.id)
						var37.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
							parentChannelId = var43,
							toastAction = squadToastActionsAndStatesModule.SquadInviteViewOsa,
							toastType = squadToastTypeModule.SquadInviteV2
						})
						var37.showGroupOSADialog(actionEventParams.chatId, function()
							-- upvalues: var35 (copy), joinSquadModule (copy), actionEventParams (ref), var37 (copy), fFlagEnableSquadCoplayAnalytic (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var39 (copy)
							var35(joinSquadModule(actionEventParams.squadId, var37.setSquadPrompt, if fFlagEnableSquadCoplayAnalytic then var37.fireSquadAnalytics else nil, if fFlagEnableSquadCoplayAnalytic then var37.squadLocation else nil, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var39 else true))
						end, function() end)
						
						return
					elseif p1.visualItem.visualItemName == "join" then
						default:dismissNotification(p1.notificationData.id)
						var37.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
							parentChannelId = var43,
							toastAction = squadToastActionsAndStatesModule.SquadInviteAccept,
							toastType = squadToastTypeModule.SquadInviteV2
						})
						var35(joinSquadModule(actionEventParams.squadId, var37.setSquadPrompt, if fFlagEnableSquadCoplayAnalytic then var37.fireSquadAnalytics else nil, if fFlagEnableSquadCoplayAnalytic then var37.squadLocation else nil, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var39 else true))
					end
				end
			end)
			
			return function()
				-- upvalues: userAction (ref)
				userAction()
			end
		end, {
			var43, var35, joinSquadModule, var37.fireSquadAnalytics, var37.setSquadPrompt,
			var37.showGroupOSADialog, var37.squadLocation,
			if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var39 else nil
		})
	end
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var39 (ref), default_1 (copy), soundManager (copy), sounds (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadInvitation, function(p2)
			-- upvalues: var39 (copy), default_1 (copy), soundManager (copy), sounds (copy)
			if var39 and not default_1:isSnoozedNotificationType(p2.notificationType) then
				soundManager:PlaySound(sounds.PartyToast.Name)
			end
		end)
		
		return function()
			-- upvalues: display (ref)
			if display then
				display()
			end
		end
	end, { var39 })
	
	if fFlagEnableDialogAfterSquadJoin then
		reactModule.useEffect(function()
			-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var39 (ref), default_1 (copy), soundManager (copy), sounds (copy)
			local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadInvitationV2, function(p3)
				-- upvalues: var39 (copy), default_1 (copy), soundManager (copy), sounds (copy)
				if var39 and not default_1:isSnoozedNotificationType(p3.notificationType) then
					soundManager:PlaySound(sounds.PartyToast.Name)
				end
			end)
			
			return function()
				-- upvalues: display (ref)
				if display then
					display()
				end
			end
		end, { var39 })
	end
	reactModule.useEffect(function()
		-- upvalues: default (copy), notificationTypeEnum (copy), fFlagEnableDialogAfterSquadJoin (copy), var39 (ref), var36 (ref), httpService (copy), var42 (ref)
		local var56 = default:listenToDisplayNotification(function(p4)
			-- upvalues: notificationTypeEnum (copy), fFlagEnableDialogAfterSquadJoin (copy), var39 (copy), default (copy), var36 (copy), httpService (copy), var42 (copy)
			if not p4 then return end
			if (p4.notificationType == notificationTypeEnum.SquadInvitation or fFlagEnableDialogAfterSquadJoin and p4.notificationType == notificationTypeEnum.SquadInvitationV2 or (p4.notificationType == notificationTypeEnum.SquadExperienceInvitation or p4.notificationType == notificationTypeEnum.SquadJoinRequestPrompt or p4.notificationType == notificationTypeEnum.SquadAcceptJoinRequest)) and not var39 then
				default:dismissNotification(p4.notificationId)
				
				return
			elseif var36 <= 0 then
				if p4.notificationId and (p4.notificationType == notificationTypeEnum.SquadInvitation or fFlagEnableDialogAfterSquadJoin and p4.notificationType == notificationTypeEnum.SquadInvitationV2 or p4.notificationType == notificationTypeEnum.SquadExperienceInvitation) then
					default:dismissNotification(p4.notificationId)
				end
				return
			elseif (p4.notificationType == notificationTypeEnum.SquadInvitation or fFlagEnableDialogAfterSquadJoin and p4.notificationType == notificationTypeEnum.SquadInvitationV2) and var42 == httpService:JSONDecode(p4.lifecycleData).squadId then
				default:dismissNotification(p4.notificationId)
			end
		end)
		
		return function()
			-- upvalues: var56 (ref)
			var56:Disconnect()
		end
	end, { var42, var36, var39 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var37 (ref), eventNamesModule (copy), var43 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadJoinRequestPrompt, function(p5)
			-- upvalues: var37 (copy), eventNamesModule (copy), var43 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
			if p5 and p5.userActionType == "click" and (p5.notificationData and p5.visualItem) and (p5.visualItem.eventName == "RequestToJoinParty" and p5.visualItem.actionEventParams) then
				var37.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var43,
					toastAction = squadToastActionsAndStatesModule.RequestToJoinPartyAccept,
					toastType = squadToastTypeModule.RequestToJoinParty
				})
				default:dismissNotification(p5.notificationData.id)
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var43, var37.fireSquadAnalytics })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var37 (ref), eventNamesModule (copy), var43 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadAcceptJoinRequest, function(p6)
			-- upvalues: var37 (copy), eventNamesModule (copy), var43 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), default (copy)
			if p6 and p6.userActionType == "click" and (p6.notificationData and p6.visualItem) and (p6.visualItem.eventName == "AcceptPartyJoinRequest" and p6.visualItem.actionEventParams) then
				var37.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var43,
					toastAction = squadToastActionsAndStatesModule.AcceptPartyJoinRequestAccept,
					toastType = squadToastTypeModule.AcceptPartyJoinRequest
				})
				default:dismissNotification(p6.notificationData.id)
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var43, var37.fireSquadAnalytics })
	
	if getFFlagEnableCrossExpVoice() and fFlagPartyVoiceBlockSync then
		local var44 = useSelector(reactModule.useCallback(function(p7)
			return p7.Squad.UserBlocking.isBlockedByMe
		end, {}))
		local var45 = reactModule.useRef({})
		reactModule.useEffect(function()
			-- upvalues: var45 (ref), var44 (ref), crossExperienceVoiceManager (copy)
			if var45.current == var44 then return end
			for i, v in pairs(var44) do
				local var59 = var45.current[i] or false
				
				if v and not var59 then
					crossExperienceVoiceManager.default:blockVoiceParticipant(i)
				elseif not v and var59 then
					crossExperienceVoiceManager.default:unblockVoiceParticipant(i)
				end
			end
			var45.current = var44
		end, { var44 })
	end
	if getFFlagEnableCrossExpVoice() then
		if fIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
			useCrossExperienceVoice({ handleRCCConnectionTimeout = true })
		else
			useCrossExperienceVoice()
		end
		local var46 = useCrossExperienceVoiceConnectorModule()
		useOnSquadEndedModule(function()
			-- upvalues: var46 (ref)
			var46()
		end)
	end
	local var48
	reactModule.useEffect(function()
		-- upvalues: fFlagReadAppChatFetchingVariable (copy), var40 (ref), var39 (ref), var42 (ref), leaveSquadIfChatDisabled (copy), var35 (ref), leaveSquadModule (copy), var37 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), currentSquadUpdated (copy)
		if (not fFlagReadAppChatFetchingVariable or not var40) and (not var39 and var42 ~= "") then
			if leaveSquadIfChatDisabled then
				var35(leaveSquadModule(nil, var37.setSquadPrompt, nil, var37.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var39 else true))
				
				return
			end
			var35(currentSquadUpdated(nil))
		end
	end, {
		var39,
		var42,
		if fFlagReadAppChatFetchingVariable then var40 else nil,
		if leaveSquadIfChatDisabled then var37.setSquadPrompt else nil,
		if leaveSquadIfChatDisabled then var37.squadLocation else nil
	})
	
	if fFlagAppChatNavigateBackIfOSAUnacknowledged and not fFlagAppChatShowOSAOnPageEntry then
		local var47 = var37.shouldShowOSAForConversation(var37.useGetConversationFromId(var43))
		reactModule.useEffect(function()
			-- upvalues: var47 (ref), var42 (ref), var35 (ref), leaveSquadModule (copy), var37 (ref)
			if var47 and var42 ~= "" then
				var35(leaveSquadModule(nil, var37.setSquadPrompt, nil, var37.squadLocation, true))
			end
		end, { var47, var42, var37.setSquadPrompt, var37.squadLocation })
	end
	if fFlagEnableSquadRegroupServerCapacityCheck then
		var48 = playersService.MaxPlayers > 1
		var48 = nil
	else
		var48 = true
	end
	local var49 = fFlagEnableSquadRegroupExperimentation and (var37.squadLocation == squadLocationEnumModule.InExperience and (var48 and (var41 and (var41.selfPermissions and (var41.selfPermissions.canSeeRegroupPromptToast and #var41.members > 1)))))
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), experienceService (copy), regroupPromptNotificationStateModule (copy)
		if fFlagEnableSquadRegroupExperimentation then
			local var60 = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: regroupPromptNotificationStateModule (copy)
				regroupPromptNotificationStateModule.dismissNotification(regroupPromptNotificationStateModule.getActiveNotifId())
			end)
			
			return function()
				-- upvalues: var60 (ref)
				if var60 and var60.Disconnect then
					var60:Disconnect()
				end
			end
		end
		return function() end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), regroupPromptNotificationStateModule (copy), var42 (ref)
		if fFlagEnableSquadRegroupExperimentation then
			local activeNotifId = regroupPromptNotificationStateModule.getActiveNotifId()
			
			if activeNotifId ~= nil and var42 ~= regroupPromptNotificationStateModule.getActiveSquadId() then
				regroupPromptNotificationStateModule.dismissNotification(activeNotifId)
			end
		end
	end, { var42 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		SquadLifecycleEventReceiver = reactModule.createElement(squadLifecycleEventReceiverModule, { currentSquadId = var42 }),
		SquadParentChannelEventReceiver = if var41 then reactModule.createElement(squadParentChannelEventReceiverModule, { currentParentChannelId = var41.parentChannelId }) else nil,
		SquadMemberStatusEventReceiver = if (squadUnifyCoplayExperimentation.getOneOnOnePartyCreationEnabled() or squadUnifyCoplayExperimentation.getMultiInvitePartyCreationEnabled()) and var37.squadLocation == squadLocationEnumModule.InExperience then reactModule.createElement(squadMemberStatusEventReceiverModule) else nil,
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix or var38 == squadRootViewTypeModule.None then nil else reactModule.createElement(squadAppChatEventReceiverModule, {
			conversationId = if var41 then var41.parentChannelId else nil
		}),
		SquadExperienceInviteEventReceiver = reactModule.createElement(squadExperienceInviteEventReceiverModule, { currentSquadId = var42 }),
		SquadRccEventReceiver = if var37.squadLocation == squadLocationEnumModule.InExperience then reactModule.createElement(squadRccEventReceiverModule, { currentSquadId = var42 }) else nil,
		SquadStorageEventReceiver = reactModule.createElement(squadStorageEventReceiverModule),
		SquadNudgeEventReceiver = reactModule.createElement(if fFlagEnablePartyNudgeV1DEV then squadNudgeEventReceiverNudgeV1ExpModule else squadNudgeEventReceiverModule, { currentSquadId = var42, currentParentChannelId = var43 }),
		ScheduledSquadEventReceiver = reactModule.createElement(scheduledSquadEventReceiverModule),
		SquadRegroupPromptEventReceiver = if var49 then reactModule.createElement(squadRegroupPromptEventReceiverModule, {
			currentSquadMembers = if var41 then var41.members else {},
			currentSquadId = var42
		}) else nil
	})
end