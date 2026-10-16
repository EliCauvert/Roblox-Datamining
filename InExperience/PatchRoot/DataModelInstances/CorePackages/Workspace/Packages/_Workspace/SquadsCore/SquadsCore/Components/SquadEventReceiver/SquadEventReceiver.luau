local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local SquadAppChatEventReceiverModule = require(script.Parent.SquadAppChatEventReceiver)
local SquadExperienceInviteEventReceiverModule = require(script.Parent.SquadExperienceInviteEventReceiver)
local SquadLifecycleEventReceiverModule = require(script.Parent.SquadLifecycleEventReceiver)
local SquadRccEventReceiverModule = require(script.Parent.SquadRccEventReceiver)
local SquadParentChannelEventReceiverModule = require(script.Parent.SquadParentChannelEventReceiver)
local ScheduledSquadEventReceiverModule = require(script.Parent.ScheduledSquadEventReceiver)
local SquadStorageEventReceiverModule = require(script.Parent.SquadStorageEventReceiver)
local SquadNudgeEventReceiverModule = require(script.Parent.SquadNudgeEventReceiver)
local SquadMemberStatusEventReceiverModule = require(script.Parent.SquadMemberStatusEventReceiver)
local SquadNudgeEventReceiverNudgeV1ExpModule = require(script.Parent.SquadNudgeEventReceiver_NudgeV1Exp)
local SquadRegroupPromptEventReceiverModule = require(script.Parent.SquadRegroupPromptEventReceiver)
local CurrentSquadUpdatedFunction = require(SquadsCore.RoduxSquads).Actions.CurrentSquadUpdated
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadCoplayJoinModule = require(SquadsCore.Enums.SquadCoplayJoin)
local SquadLocationEnumModule = require(SquadsCore.Enums.SquadLocationEnum)
local SquadRootViewTypeModule = require(SquadsCore.Enums.SquadRootViewType)
local SquadToastActionsAndStatesModule = require(SquadsCore.Enums.SquadToastActionsAndStates)
local SquadToastTypeModule = require(SquadsCore.Enums.SquadToastType)
local JoinSquadModule = require(SquadsCore.Thunks.joinSquad)
local LeaveSquadModule = require(SquadsCore.Thunks.leaveSquad)
local LogInExpCoplayTelemetryModule = require(SquadsCore.Analytics.logInExpCoplayTelemetry)
local UseOnSquadEndedModule = require(SquadsCore.Hooks.useOnSquadEnded)
local UseCrossExperienceVoiceConnectorModule = require(SquadsCore.Hooks.useCrossExperienceVoiceConnector)
local RegroupPromptNotificationStateModule = require(SquadsCore.Utils.RegroupPromptNotificationState)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local CrossExperienceVoiceManager = CrossExperienceVoiceModule.CrossExperienceVoiceManager
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local SoundManagerModule = require(Parent.SoundManager)
local ToastNotificationModule = require(Parent.ToastNotification)
local UseCrossExperienceVoiceFunction = CrossExperienceVoiceModule.Hooks.useCrossExperienceVoice
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectOnceFunction = require(Parent.RoactUtils).Hooks.useEffectOnce
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseCurrentSquadSelectorFunction = require(Parent.RoduxSquads).Hooks.useCurrentSquadSelector
local Sounds = SoundManagerModule.Sounds
local SoundManager = SoundManagerModule.SoundManager
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local FFlagPartyVoiceBlockSync = SharedFlagsModule.FFlagPartyVoiceBlockSync
local FFlagSquadAppChatRTNFix = SharedFlagsModule.FFlagSquadAppChatRTNFix
local FIntPartyVoiceJoinRequestPulseCheckTimeout = SharedFlagsModule.FIntPartyVoiceJoinRequestPulseCheckTimeout
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = SharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local FFlagReadAppChatFetchingVariable = SharedFlagsModule.FFlagReadAppChatFetchingVariable
local FFlagEnablePartyNudgeV1DEV = SharedFlagsModule.FFlagEnablePartyNudgeV1_DEV
local FFlagAppChatNavigateBackIfOSAUnacknowledged = SharedFlagsModule.FFlagAppChatNavigateBackIfOSAUnacknowledged
local FFlagAppChatShowOSAOnPageEntry = SharedFlagsModule.FFlagAppChatShowOSAOnPageEntry
local FFlagEnableSquadRegroupExperimentation = SharedFlagsModule.FFlagEnableSquadRegroupExperimentation
local FFlagEnableSquadRegroupServerCapacityCheck = SharedFlagsModule.FFlagEnableSquadRegroupServerCapacityCheck
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local Default1 = ToastNotificationModule.ToastNotificationSnoozeManager.default
local SquadUnifyCoplayExperimentation = require(Parent.SocialExperiments).SquadUnifyCoplayExperimentation
local LeaveSquadIfChatDisabled = game:DefineFastFlag("LeaveSquadIfChatDisabled", false)

return function() --[[ Line: 78 ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), UseCurrentSquadSelectorFunction (copy), UseEffectOnceFunction (copy), LogInExpCoplayTelemetryModule (copy), SquadCoplayJoinModule (copy), LifecycleEvents (copy), NotificationTypeEnum (copy), EventNamesModule (copy), SquadToastActionsAndStatesModule (copy), SquadToastTypeModule (copy), HttpService (copy), Default (copy), JoinSquadModule (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), Default1 (copy), SoundManager (copy), Sounds (copy), GetFFlagEnableCrossExpVoiceFunction (copy), FFlagPartyVoiceBlockSync (copy), UseSelectorFunction (copy), CrossExperienceVoiceManager (copy), FIntPartyVoiceJoinRequestPulseCheckTimeout (copy), UseCrossExperienceVoiceFunction (copy), UseCrossExperienceVoiceConnectorModule (copy), UseOnSquadEndedModule (copy), FFlagReadAppChatFetchingVariable (copy), LeaveSquadIfChatDisabled (copy), LeaveSquadModule (copy), CurrentSquadUpdatedFunction (copy), FFlagAppChatNavigateBackIfOSAUnacknowledged (copy), FFlagAppChatShowOSAOnPageEntry (copy), FFlagEnableSquadRegroupServerCapacityCheck (copy), Players (copy), FFlagEnableSquadRegroupExperimentation (copy), SquadLocationEnumModule (copy), ExperienceService (copy), RegroupPromptNotificationStateModule (copy), SquadLifecycleEventReceiverModule (copy), SquadParentChannelEventReceiverModule (copy), SquadUnifyCoplayExperimentation (copy), SquadMemberStatusEventReceiverModule (copy), FFlagSquadAppChatRTNFix (copy), SquadRootViewTypeModule (copy), SquadAppChatEventReceiverModule (copy), SquadExperienceInviteEventReceiverModule (copy), SquadRccEventReceiverModule (copy), SquadStorageEventReceiverModule (copy), FFlagEnablePartyNudgeV1DEV (copy), SquadNudgeEventReceiverNudgeV1ExpModule (copy), SquadNudgeEventReceiverModule (copy), ScheduledSquadEventReceiverModule (copy), SquadRegroupPromptEventReceiverModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseSquadRootViewResult = UseContextResult.useSquadRootView()
	local UseIsChatEnabledResult = UseContextResult.useIsChatEnabled()
	local UseIsLoadingChatSettingsResult = UseContextResult.useIsLoadingChatSettings()
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local SquadId = if UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.squadId then UseCurrentSquadSelectorResult.squadId else ""
	local ParentChannelId = if UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.parentChannelId then UseCurrentSquadSelectorResult.parentChannelId else ""
	UseEffectOnceFunction(function() --[[ Line: 93 ]]
		-- upvalues: UseCurrentSquadSelectorResult (copy), LogInExpCoplayTelemetryModule (upval), SquadId (copy), UseContextResult (copy), SquadCoplayJoinModule (upval)
		if UseCurrentSquadSelectorResult then
			LogInExpCoplayTelemetryModule(SquadId, UseCurrentSquadSelectorResult.members, UseContextResult.squadLocation, SquadCoplayJoinModule.ExperienceJoin, UseContextResult.fireSquadAnalytics)
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 112 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseContextResult (copy), EventNamesModule (upval), ParentChannelId (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), HttpService (upval), Default (upval), UseDispatchResult (copy), JoinSquadModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), UseIsChatEnabledResult (copy)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadInvitation, function(p1) --[[ Line: 116 ]]
			-- upvalues: UseContextResult (upval), EventNamesModule (upval), ParentChannelId (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), HttpService (upval), Default (upval), UseDispatchResult (upval), JoinSquadModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), UseIsChatEnabledResult (upval)
			if p1 and p1.userActionType == "click" and p1.notificationData and p1.visualItem and p1.visualItem.eventName == "JoinSquad" and p1.visualItem.actionEventParams then
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
					parentChannelId = ParentChannelId,
					toastAction = SquadToastActionsAndStatesModule.SquadInviteAccept,
					toastType = SquadToastTypeModule.SquadInvite
				})
				local Data = HttpService:JSONDecode(p1.visualItem.actionEventParams)
				Default:dismissNotification(p1.notificationData.id)
				UseDispatchResult(JoinSquadModule(Data.squadId, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseIsChatEnabledResult))
			end
		end)
		
		return function() --[[ Line: 146 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, {
		ParentChannelId, UseDispatchResult, JoinSquadModule,
		UseContextResult.fireSquadAnalytics, UseContextResult.setSquadPrompt,
		UseContextResult.squadLocation,
		if FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then UseIsChatEnabledResult else nil
	})
	ReactModule.useEffect(function() --[[ Line: 158 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), UseContextResult (copy), Default (upval), EventNamesModule (upval), ParentChannelId (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseDispatchResult (copy), JoinSquadModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), UseIsChatEnabledResult (copy)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadInvitationV2, function(p1) --[[ Line: 162 ]]
			-- upvalues: HttpService (upval), UseContextResult (upval), Default (upval), EventNamesModule (upval), ParentChannelId (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseDispatchResult (upval), JoinSquadModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), UseIsChatEnabledResult (upval)
			if p1 and p1.userActionType == "click" and p1.notificationData and p1.visualItem and p1.visualItem.actionEventParams then
				local Data = HttpService:JSONDecode(p1.visualItem.actionEventParams)
				
				if p1.visualItem.visualItemName == "view" and UseContextResult.showGroupOSADialog then
					Default:dismissNotification(p1.notificationData.id)
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
						parentChannelId = ParentChannelId,
						toastAction = SquadToastActionsAndStatesModule.SquadInviteViewOsa,
						toastType = SquadToastTypeModule.SquadInviteV2
					})
					UseContextResult.showGroupOSADialog(Data.chatId, function() --[[ Line: 180 ]]
						-- upvalues: UseDispatchResult (upval), JoinSquadModule (upval), Data (copy), UseContextResult (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), UseIsChatEnabledResult (upval)
						UseDispatchResult(JoinSquadModule(Data.squadId, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseIsChatEnabledResult))
					end, function() --[[ Line: 190 ]] end)
					
					return
				end
				if p1.visualItem.visualItemName == "join" then
					Default:dismissNotification(p1.notificationData.id)
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
						parentChannelId = ParentChannelId,
						toastAction = SquadToastActionsAndStatesModule.SquadInviteAccept,
						toastType = SquadToastTypeModule.SquadInviteV2
					})
					UseDispatchResult(JoinSquadModule(Data.squadId, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseIsChatEnabledResult))
				end
			end
		end)
		
		return function() --[[ Line: 213 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, {
		ParentChannelId, UseDispatchResult, JoinSquadModule,
		UseContextResult.fireSquadAnalytics, UseContextResult.setSquadPrompt,
		UseContextResult.showGroupOSADialog, UseContextResult.squadLocation,
		if FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then UseIsChatEnabledResult else nil
	})
	ReactModule.useEffect(function() --[[ Line: 228 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseIsChatEnabledResult (copy), Default1 (upval), SoundManager (upval), Sounds (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadInvitation, function(p1) --[[ Line: 232 ]]
			-- upvalues: UseIsChatEnabledResult (upval), Default1 (upval), SoundManager (upval), Sounds (upval)
			if UseIsChatEnabledResult and not Default1:isSnoozedNotificationType(p1.notificationType) then
				SoundManager:PlaySound(Sounds.PartyToast.Name)
			end
		end)
		
		return function() --[[ Line: 242 ]]
			-- upvalues: RegisterResult (copy)
			if RegisterResult then
				RegisterResult()
			end
		end
	end, { UseIsChatEnabledResult })
	ReactModule.useEffect(function() --[[ Line: 248 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseIsChatEnabledResult (copy), Default1 (upval), SoundManager (upval), Sounds (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadInvitationV2, function(p1) --[[ Line: 252 ]]
			-- upvalues: UseIsChatEnabledResult (upval), Default1 (upval), SoundManager (upval), Sounds (upval)
			if UseIsChatEnabledResult and not Default1:isSnoozedNotificationType(p1.notificationType) then
				SoundManager:PlaySound(Sounds.PartyToast.Name)
			end
		end)
		
		return function() --[[ Line: 262 ]]
			-- upvalues: RegisterResult (copy)
			if RegisterResult then
				RegisterResult()
			end
		end
	end, { UseIsChatEnabledResult })
	ReactModule.useEffect(function() --[[ Line: 270 ]]
		-- upvalues: Default (upval), NotificationTypeEnum (upval), UseIsChatEnabledResult (copy), Number (copy), HttpService (upval), SquadId (copy)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p1) --[[ Line: 272 ]]
			-- upvalues: NotificationTypeEnum (upval), UseIsChatEnabledResult (upval), Default (upval), Number (upval), HttpService (upval), SquadId (upval)
			if not p1 then return end
			if (p1.notificationType == NotificationTypeEnum.SquadInvitation or p1.notificationType == NotificationTypeEnum.SquadInvitationV2 or p1.notificationType == NotificationTypeEnum.SquadExperienceInvitation or p1.notificationType == NotificationTypeEnum.SquadJoinRequestPrompt or p1.notificationType == NotificationTypeEnum.SquadAcceptJoinRequest) and not UseIsChatEnabledResult then
				Default:dismissNotification(p1.notificationId)
				
				return
			end
			if Number <= 0 then
				if p1.notificationId and (p1.notificationType == NotificationTypeEnum.SquadInvitation or p1.notificationType == NotificationTypeEnum.SquadInvitationV2 or p1.notificationType == NotificationTypeEnum.SquadExperienceInvitation) then
					Default:dismissNotification(p1.notificationId)
				end
				return
			elseif (p1.notificationType == NotificationTypeEnum.SquadInvitation or p1.notificationType == NotificationTypeEnum.SquadInvitationV2) and SquadId == HttpService:JSONDecode(p1.lifecycleData).squadId then
				Default:dismissNotification(p1.notificationId)
			end
		end)
		
		return function() --[[ Line: 322 ]]
			-- upvalues: ListenToDisplayNotificationResult (copy)
			ListenToDisplayNotificationResult:Disconnect()
		end
	end, { SquadId, Number, UseIsChatEnabledResult })
	ReactModule.useEffect(function() --[[ Line: 328 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseContextResult (copy), EventNamesModule (upval), ParentChannelId (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), Default (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadJoinRequestPrompt, function(p1) --[[ Line: 332 ]]
			-- upvalues: UseContextResult (upval), EventNamesModule (upval), ParentChannelId (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), Default (upval)
			if p1 and p1.userActionType == "click" and p1.notificationData and p1.visualItem and p1.visualItem.eventName == "RequestToJoinParty" and p1.visualItem.actionEventParams then
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
					parentChannelId = ParentChannelId,
					toastAction = SquadToastActionsAndStatesModule.RequestToJoinPartyAccept,
					toastType = SquadToastTypeModule.RequestToJoinParty
				})
				Default:dismissNotification(p1.notificationData.id)
			end
		end)
		
		return function() --[[ Line: 356 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { ParentChannelId, UseContextResult.fireSquadAnalytics })
	ReactModule.useEffect(function() --[[ Line: 362 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseContextResult (copy), EventNamesModule (upval), ParentChannelId (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), Default (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadAcceptJoinRequest, function(p1) --[[ Line: 366 ]]
			-- upvalues: UseContextResult (upval), EventNamesModule (upval), ParentChannelId (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), Default (upval)
			if p1 and p1.userActionType == "click" and p1.notificationData and p1.visualItem and p1.visualItem.eventName == "AcceptPartyJoinRequest" and p1.visualItem.actionEventParams then
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
					parentChannelId = ParentChannelId,
					toastAction = SquadToastActionsAndStatesModule.AcceptPartyJoinRequestAccept,
					toastType = SquadToastTypeModule.AcceptPartyJoinRequest
				})
				Default:dismissNotification(p1.notificationData.id)
			end
		end)
		
		return function() --[[ Line: 390 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { ParentChannelId, UseContextResult.fireSquadAnalytics })
	
	if GetFFlagEnableCrossExpVoiceFunction() and FFlagPartyVoiceBlockSync then
		local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 398 ]]
			return p1.Squad.UserBlocking.isBlockedByMe
		end, {})))
		local UseRefResult = ReactModule.useRef({})
		ReactModule.useEffect(function() --[[ Line: 405 ]]
			-- upvalues: UseRefResult (copy), UseSelectorResult (copy), CrossExperienceVoiceManager (upval)
			if UseRefResult.current == UseSelectorResult then return end
			for i, value in pairs(UseSelectorResult) do
				local CurrentEntry = UseRefResult.current[i] or false
				
				if value and not CurrentEntry then
					CrossExperienceVoiceManager.default:blockVoiceParticipant(i)
				elseif not value and CurrentEntry then
					CrossExperienceVoiceManager.default:unblockVoiceParticipant(i)
				end
			end
			UseRefResult.current = UseSelectorResult
		end, { UseSelectorResult })
	end
	if GetFFlagEnableCrossExpVoiceFunction() then
		if FIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
			UseCrossExperienceVoiceFunction({ handleRCCConnectionTimeout = true })
		else
			UseCrossExperienceVoiceFunction()
		end
		local UseCrossExperienceVoiceConnectorModuleResult = UseCrossExperienceVoiceConnectorModule()
		UseOnSquadEndedModule(function() --[[ Line: 434 ]]
			-- upvalues: UseCrossExperienceVoiceConnectorModuleResult (copy)
			UseCrossExperienceVoiceConnectorModuleResult()
		end)
	end
	ReactModule.useEffect(function() --[[ Line: 439 ]]
		-- upvalues: FFlagReadAppChatFetchingVariable (upval), UseIsLoadingChatSettingsResult (copy), UseIsChatEnabledResult (copy), SquadId (copy), LeaveSquadIfChatDisabled (upval), UseDispatchResult (copy), LeaveSquadModule (upval), UseContextResult (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), CurrentSquadUpdatedFunction (upval)
		if (not FFlagReadAppChatFetchingVariable or not UseIsLoadingChatSettingsResult) and (not UseIsChatEnabledResult and SquadId ~= "") then
			if LeaveSquadIfChatDisabled then
				UseDispatchResult(LeaveSquadModule(nil, UseContextResult.setSquadPrompt, nil, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseIsChatEnabledResult))
				
				return
			end
			UseDispatchResult(CurrentSquadUpdatedFunction(nil))
		end
	end, {
		UseIsChatEnabledResult,
		SquadId,
		if FFlagReadAppChatFetchingVariable then UseIsLoadingChatSettingsResult else nil,
		if LeaveSquadIfChatDisabled then UseContextResult.setSquadPrompt else nil,
		if LeaveSquadIfChatDisabled then UseContextResult.squadLocation else nil
	})
	
	if FFlagAppChatNavigateBackIfOSAUnacknowledged and not FFlagAppChatShowOSAOnPageEntry then
		local ShouldShowOSAForConversation = UseContextResult.shouldShowOSAForConversation((UseContextResult.useGetConversationFromId(ParentChannelId)))
		ReactModule.useEffect(function() --[[ Line: 472 ]]
			-- upvalues: ShouldShowOSAForConversation (copy), SquadId (copy), UseDispatchResult (copy), LeaveSquadModule (upval), UseContextResult (copy)
			if ShouldShowOSAForConversation and SquadId ~= "" then
				UseDispatchResult(LeaveSquadModule(nil, UseContextResult.setSquadPrompt, nil, UseContextResult.squadLocation, true))
			end
		end, {
			ShouldShowOSAForConversation,
			SquadId,
			UseContextResult.setSquadPrompt,
			UseContextResult.squadLocation
		})
	end
	local NoFFlagEnableSquadRegroupServerCapacityCheck: boolean = not FFlagEnableSquadRegroupServerCapacityCheck or Players.MaxPlayers > 1
	local v1: boolean = FFlagEnableSquadRegroupExperimentation and (UseContextResult.squadLocation == SquadLocationEnumModule.InExperience and (NoFFlagEnableSquadRegroupServerCapacityCheck and (UseCurrentSquadSelectorResult and (UseCurrentSquadSelectorResult.selfPermissions and (UseCurrentSquadSelectorResult.selfPermissions.canSeeRegroupPromptToast and #UseCurrentSquadSelectorResult.members > 1)))))
	ReactModule.useEffect(function() --[[ Line: 496 ]]
		-- upvalues: FFlagEnableSquadRegroupExperimentation (upval), ExperienceService (upval), RegroupPromptNotificationStateModule (upval)
		if FFlagEnableSquadRegroupExperimentation then
			local RegisterForExperienceLeaveResult = ExperienceService:RegisterForExperienceLeave(function() --[[ Line: 501 ]]
				-- upvalues: RegroupPromptNotificationStateModule (upval)
				RegroupPromptNotificationStateModule.dismissNotification((RegroupPromptNotificationStateModule.getActiveNotifId()))
			end)
			
			return function() --[[ Line: 506 ]]
				-- upvalues: RegisterForExperienceLeaveResult (copy)
				if RegisterForExperienceLeaveResult and RegisterForExperienceLeaveResult.Disconnect then
					RegisterForExperienceLeaveResult:Disconnect()
				end
			end
		else
			return function() --[[ Line: 498 ]] end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 513 ]]
		-- upvalues: FFlagEnableSquadRegroupExperimentation (upval), RegroupPromptNotificationStateModule (upval), SquadId (copy)
		if FFlagEnableSquadRegroupExperimentation then
			local ActiveNotifId = RegroupPromptNotificationStateModule.getActiveNotifId()
			local ActiveSquadId = RegroupPromptNotificationStateModule.getActiveSquadId()
			
			if ActiveNotifId ~= nil and SquadId ~= ActiveSquadId then
				RegroupPromptNotificationStateModule.dismissNotification(ActiveNotifId)
			end
		end
	end, { SquadId })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		SquadLifecycleEventReceiver = ReactModule.createElement(SquadLifecycleEventReceiverModule, { currentSquadId = SquadId }),
		SquadParentChannelEventReceiver = if UseCurrentSquadSelectorResult then ReactModule.createElement(SquadParentChannelEventReceiverModule, {
			currentParentChannelId = UseCurrentSquadSelectorResult.parentChannelId
		}) else nil,
		SquadMemberStatusEventReceiver = if (SquadUnifyCoplayExperimentation.getOneOnOnePartyCreationEnabled() or SquadUnifyCoplayExperimentation.getMultiInvitePartyCreationEnabled()) and UseContextResult.squadLocation == SquadLocationEnumModule.InExperience then ReactModule.createElement(SquadMemberStatusEventReceiverModule) else nil,
		SquadAppChatEventReceiver = if FFlagSquadAppChatRTNFix or UseSquadRootViewResult == SquadRootViewTypeModule.None then nil else ReactModule.createElement(SquadAppChatEventReceiverModule, {
			conversationId = if UseCurrentSquadSelectorResult then UseCurrentSquadSelectorResult.parentChannelId else nil
		}),
		SquadExperienceInviteEventReceiver = ReactModule.createElement(SquadExperienceInviteEventReceiverModule, { currentSquadId = SquadId }),
		SquadRccEventReceiver = if UseContextResult.squadLocation == SquadLocationEnumModule.InExperience then ReactModule.createElement(SquadRccEventReceiverModule, { currentSquadId = SquadId }) else nil,
		SquadStorageEventReceiver = ReactModule.createElement(SquadStorageEventReceiverModule),
		SquadNudgeEventReceiver = ReactModule.createElement(if FFlagEnablePartyNudgeV1DEV then SquadNudgeEventReceiverNudgeV1ExpModule else SquadNudgeEventReceiverModule, {
			currentSquadId = SquadId,
			currentParentChannelId = ParentChannelId
		}),
		ScheduledSquadEventReceiver = ReactModule.createElement(ScheduledSquadEventReceiverModule),
		SquadRegroupPromptEventReceiver = if v1 then ReactModule.createElement(SquadRegroupPromptEventReceiverModule, {
			currentSquadMembers = UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.members or {},
			currentSquadId = SquadId
		}) else nil
	})
end