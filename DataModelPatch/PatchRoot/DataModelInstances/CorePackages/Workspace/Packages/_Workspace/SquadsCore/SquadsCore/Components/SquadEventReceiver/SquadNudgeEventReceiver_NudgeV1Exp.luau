local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local HttpService = game:GetService("HttpService")
local ConstantsModule = require(SquadsCore.Common.Constants)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local SquadGameJoinOriginModule = require(SquadsCore.Enums.SquadGameJoinOrigin)
local SquadToastActionsAndStatesModule = require(SquadsCore.Enums.SquadToastActionsAndStates)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local ActOnPartyNudgeModule = require(SquadsCore.Thunks.actOnPartyNudge)
local ExperienceServiceModule = require(Parent.ExperienceService)
local ReactModule = require(Parent.React)
local ToastNotificationModule = require(Parent.ToastNotification)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ExperienceService = ExperienceServiceModule.ExperienceService
local GameParams = ExperienceServiceModule.GameParams
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), Default (copy), HttpService (copy), EventNamesModule (copy), SquadToastActionsAndStatesModule (copy), ConstantsModule (copy), NotificationTypeEnum (copy), ActOnPartyNudgeModule (copy), LifecycleEvents (copy), GameParams (copy), ExperienceService (copy), SquadGameJoinOriginModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseIsChatEnabledResult = UseContextResult.useIsChatEnabled()
	local UseIsLoadingChatSettingsResult = UseContextResult.useIsLoadingChatSettings()
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseIsLoadingChatSettingsResult (copy), UseIsChatEnabledResult (copy), Default (upval)
		if UseIsLoadingChatSettingsResult or UseIsChatEnabledResult then
			return false
		else
			Default:dismissNotification(p2)
			
			return true
		end
	end, { UseIsLoadingChatSettingsResult, UseIsChatEnabledResult })
	local UseResult1 = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: UseRefResult (copy), HttpService (upval)
		UseRefResult.current[p2] = {
			shouldActWhenDismiss = true,
			toastType = p3.notificationType,
			partyAttemptId = HttpService:GenerateGUID(false),
			nudgeId = p4.nudgeId,
			nudgeType = p4.nudgeType
		}
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2, ToastAction)
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseRefResult (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
			toastAction = ToastAction,
			toastType = if UseRefResult.current[p2] then UseRefResult.current[p2].toastType else nil,
			nudgeId = if UseRefResult.current[p2] then UseRefResult.current[p2].nudgeId else nil,
			nudgeType = if UseRefResult.current[p2] then UseRefResult.current[p2].nudgeType else nil,
			partyAttemptId = if UseRefResult.current[p2] then UseRefResult.current[p2].partyAttemptId else nil,
			squadLocation = UseContextResult.squadLocation
		})
	end, {
		UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), UseRefResult (copy), UseResult2 (copy), SquadToastActionsAndStatesModule (upval), ConstantsModule (upval), NotificationTypeEnum (upval), UseDispatchResult (copy), ActOnPartyNudgeModule (upval), UseContextResult (copy), UseIsChatEnabledResult (copy)
		local ListenToDismissNotificationResult = Default:listenToDismissNotification(function(p2)
			-- upvalues: UseRefResult (upval), UseResult2 (upval), SquadToastActionsAndStatesModule (upval), ConstantsModule (upval), NotificationTypeEnum (upval), UseDispatchResult (upval), ActOnPartyNudgeModule (upval), UseContextResult (upval), UseIsChatEnabledResult (upval)
			if p2.notificationId and UseRefResult.current[p2.notificationId] then
				UseResult2(p2.notificationId, SquadToastActionsAndStatesModule.PartyNudgeGeneralDismiss)
				
				if UseRefResult.current[p2.notificationId].shouldActWhenDismiss then
					local CurrentEntry = UseRefResult.current[p2.notificationId]
					local NudgeType = CurrentEntry.nudgeType
					local ToastType = CurrentEntry.toastType
					
					if (NudgeType == ConstantsModule.PARTY_TO_ONE_NUDGE_TYPE or NudgeType == ConstantsModule.PARTY_TO_PARTY_NUDGE_TYPE) and ToastType == NotificationTypeEnum.SquadNudgeInvite then
						UseDispatchResult(ActOnPartyNudgeModule(ConstantsModule.REJECT_PARTY_INVITE_ACTION, CurrentEntry.nudgeId, false, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult))
					end
				end
			end
			UseRefResult.current[p2.notificationId] = nil
		end)
		
		return function()
			-- upvalues: ListenToDismissNotificationResult (copy)
			if ListenToDismissNotificationResult then
				ListenToDismissNotificationResult:Disconnect()
			end
		end
	end, {
		UseResult2,
		UseIsChatEnabledResult,
		UseContextResult.setSquadPrompt,
		UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseRefResult (copy), UseResult (copy), HttpService (upval), ConstantsModule (upval), Default (upval), UseResult2 (copy), SquadToastActionsAndStatesModule (upval), GameParams (upval), ExperienceService (upval), SquadGameJoinOriginModule (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadNudgeInvite, function(p2)
			-- upvalues: UseRefResult (upval), UseResult (upval), HttpService (upval), ConstantsModule (upval)
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.actionEventParams and p2.visualItem.visualItemName then
				local Id = p2.notificationData.id
				
				if UseRefResult.current[Id] then
					UseRefResult.current[Id].shouldActWhenDismiss = false
				end
				if UseResult(Id) then return end
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if Data.nudgeType ~= ConstantsModule.PARTY_TO_ONE_NUDGE_TYPE then
					local _ = Data.nudgeType
					local _ = ConstantsModule.PARTY_TO_PARTY_NUDGE_TYPE
				end
			end
		end)
		local RegisterResult1 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.NudgeForInviterSquad, function(p2)
			-- upvalues: UseRefResult (upval), UseResult (upval), HttpService (upval), ConstantsModule (upval), Default (upval), UseResult2 (upval), SquadToastActionsAndStatesModule (upval), GameParams (upval), ExperienceService (upval), SquadGameJoinOriginModule (upval)
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.actionEventParams and p2.visualItem.visualItemName then
				local Id = p2.notificationData.id
				
				if UseRefResult.current[Id] then
					UseRefResult.current[Id].shouldActWhenDismiss = false
				end
				if UseResult(Id) then return end
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if Data.nudgeType == ConstantsModule.PARTY_TO_ONE_NUDGE_TYPE or Data.nudgeType == ConstantsModule.PARTY_TO_PARTY_NUDGE_TYPE then
					if p2.visualItem.visualItemName == ConstantsModule.JOIN_EXPERIENCE_FROM_NUDGE_BUTTON_TYPE then
						Default:dismissNotification(Id)
						UseResult2(Id, SquadToastActionsAndStatesModule.PartyNudgeAccept)
						ExperienceService:LaunchExperience(GameParams.fromPlaceId(Data.placeId), SquadGameJoinOriginModule.NudgeForInviterSquad, nil)
						
						return
					elseif p2.visualItem.visualItemName == ConstantsModule.DISMISS_INVITER_SQUAD_NUDGE_BUTTON_TYPE then
						UseResult2(Id, SquadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
					end
				end
			end
		end)
		
		return function()
			-- upvalues: RegisterResult (copy), RegisterResult1 (copy)
			if RegisterResult then
				RegisterResult()
			end
			if RegisterResult1 then
				RegisterResult1()
			end
		end
	end, {
		UseResult, UseResult2, UseContextResult, UseContextResult.setSquadPrompt,
		UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation,
		p1.currentSquadId
	})
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseResult (copy), HttpService (upval), ConstantsModule (upval), p1 (copy), Default (upval), UseResult1 (copy), UseResult2 (copy), SquadToastActionsAndStatesModule (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadNudgeInvite, function(p2)
			-- upvalues: UseResult (upval), HttpService (upval), ConstantsModule (upval), p1 (upval), Default (upval), UseResult1 (upval), UseResult2 (upval), SquadToastActionsAndStatesModule (upval)
			local ActionEventParams = p2.state.visualItems.button[1].actionEventParams
			local Id = p2.id
			
			if UseResult(Id) then return end
			local Data = HttpService:JSONDecode(ActionEventParams)
			
			if (Data.nudgeType == ConstantsModule.PARTY_TO_ONE_NUDGE_TYPE or Data.nudgeType == ConstantsModule.PARTY_TO_PARTY_NUDGE_TYPE) and p1.currentSquadId ~= "" and p1.currentSquadId == Data.squadId then
				Default:dismissNotification(Id)
				
				return
			else
				UseResult1(Id, p2, Data)
				UseResult2(Id, SquadToastActionsAndStatesModule.PartyNudgeDisplay)
			end
		end)
		local RegisterResult1 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.NudgeForInviterSquad, function(p2)
			-- upvalues: UseResult (upval), HttpService (upval), ConstantsModule (upval), Default (upval), p1 (upval), UseResult1 (upval), UseResult2 (upval), SquadToastActionsAndStatesModule (upval)
			local ActionEventParams = p2.state.visualItems.button[1].actionEventParams
			local Id = p2.id
			
			if UseResult(Id) then return end
			local Data = HttpService:JSONDecode(ActionEventParams)
			
			if Data.nudgeType == ConstantsModule.PARTY_TO_ONE_NUDGE_TYPE or Data.nudgeType == ConstantsModule.PARTY_TO_PARTY_NUDGE_TYPE then
				if Data.gameInstanceId == game.JobId then
					Default:dismissNotification(Id)
					
					return
				end
				if p1.currentSquadId == "" or p1.currentSquadId ~= Data.squadId then
					Default:dismissNotification(Id)
					
					return
				end
			end
			UseResult1(Id, p2, Data)
			UseResult2(Id, SquadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local RegisterResult2 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadJoinRequestPrompt, function(p2)
			-- upvalues: UseResult (upval), HttpService (upval), UseResult1 (upval), UseResult2 (upval), SquadToastActionsAndStatesModule (upval)
			local ActionEventParams = p2.state.visualItems.button[1].actionEventParams
			local Id = p2.id
			
			if not UseResult(Id) then
				UseResult1(Id, p2, (HttpService:JSONDecode(ActionEventParams)))
				UseResult2(Id, SquadToastActionsAndStatesModule.PartyNudgeDisplay)
				
				return
			end
		end)
		local RegisterResult3 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadAcceptJoinRequest, function(p2)
			-- upvalues: UseResult (upval), HttpService (upval), UseResult1 (upval), UseResult2 (upval), SquadToastActionsAndStatesModule (upval)
			local ActionEventParams = p2.state.visualItems.button[1].actionEventParams
			local Id = p2.id
			
			if not UseResult(Id) then
				UseResult1(Id, p2, (HttpService:JSONDecode(ActionEventParams)))
				UseResult2(Id, SquadToastActionsAndStatesModule.PartyNudgeDisplay)
				
				return
			end
		end)
		
		return function()
			-- upvalues: RegisterResult (copy), RegisterResult1 (copy), RegisterResult2 (copy), RegisterResult3 (copy)
			if RegisterResult then
				RegisterResult()
			end
			if RegisterResult1 then
				RegisterResult1()
			end
			if RegisterResult2 then
				RegisterResult2()
			end
			if RegisterResult3 then
				RegisterResult3()
			end
		end
	end, { UseResult, UseResult1, UseResult2, p1.currentSquadId })
	
	return nil
end