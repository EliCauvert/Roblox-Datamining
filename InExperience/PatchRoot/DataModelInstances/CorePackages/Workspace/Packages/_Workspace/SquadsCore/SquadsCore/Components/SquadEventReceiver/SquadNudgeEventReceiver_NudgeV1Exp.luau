local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local httpService = game:GetService("HttpService")
local constantsModule = require(squadsCore.Common.Constants)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local squadGameJoinOriginModule = require(squadsCore.Enums.SquadGameJoinOrigin)
local squadToastActionsAndStatesModule = require(squadsCore.Enums.SquadToastActionsAndStates)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local actOnPartyNudgeModule = require(squadsCore.Thunks.actOnPartyNudge)
local experienceServiceModule = require(parent.ExperienceService)
local reactModule = require(parent.React)
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local experienceService = experienceServiceModule.ExperienceService
local gameParams = experienceServiceModule.GameParams
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), default (ref), httpService (ref), eventNamesModule (ref), squadToastActionsAndStatesModule (ref), constantsModule (ref), notificationTypeEnum (ref), actOnPartyNudgeModule (ref), lifecycleEvents (ref), gameParams (ref), experienceService (ref), squadGameJoinOriginModule (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	local var3 = var2.useIsChatEnabled()
	local var4 = var2.useIsLoadingChatSettings()
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var3 (ref), default (copy)
		if var4 or var3 then
			return false
		end
		default:dismissNotification(p2)
		
		return true
	end, { var4, var3 })
	local var7 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var5 (ref), httpService (copy)
		var5.current[p2] = {
			shouldActWhenDismiss = true,
			toastType = p3.notificationType,
			partyAttemptId = httpService:GenerateGUID(false),
			nudgeId = p4.nudgeId,
			nudgeType = p4.nudgeType
		}
	end, {})
	local var8 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), eventNamesModule (copy), var5 (ref)
		var2.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
			toastAction = p3,
			toastType = if var5.current[p2] then var5.current[p2].toastType else nil,
			nudgeId = if var5.current[p2] then var5.current[p2].nudgeId else nil,
			nudgeType = if var5.current[p2] then var5.current[p2].nudgeType else nil,
			partyAttemptId = if var5.current[p2] then var5.current[p2].partyAttemptId else nil,
			squadLocation = var2.squadLocation
		})
	end, { var2.fireSquadAnalytics, var2.squadLocation })
	reactModule.useEffect(function()
		-- upvalues: default (copy), var5 (ref), var8 (ref), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var1 (ref), actOnPartyNudgeModule (copy), var2 (ref), var3 (ref)
		local var9 = default:listenToDismissNotification(function(p2)
			-- upvalues: var5 (copy), var8 (copy), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var1 (copy), actOnPartyNudgeModule (copy), var2 (copy), var3 (copy)
			if p2.notificationId and var5.current[p2.notificationId] then
				var8(p2.notificationId, squadToastActionsAndStatesModule.PartyNudgeGeneralDismiss)
				
				if var5.current[p2.notificationId].shouldActWhenDismiss then
					local notificationId = var5.current[p2.notificationId]
					local nudgeType = notificationId.nudgeType
					
					if (nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE) and notificationId.toastType == notificationTypeEnum.SquadNudgeInvite then
						var1(actOnPartyNudgeModule(constantsModule.REJECT_PARTY_INVITE_ACTION, notificationId.nudgeId, false, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, var3))
					end
				end
			end
			var5.current[p2.notificationId] = nil
		end)
		
		return function()
			-- upvalues: var9 (ref)
			if var9 then
				var9:Disconnect()
			end
		end
	end, {
		var8,
		var3,
		var2.setSquadPrompt,
		var2.fireSquadAnalytics,
		var2.squadLocation
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var5 (ref), var6 (ref), httpService (copy), constantsModule (copy), default (copy), var8 (ref), squadToastActionsAndStatesModule (copy), gameParams (copy), experienceService (copy), squadGameJoinOriginModule (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadNudgeInvite, function(p2)
			-- upvalues: var5 (copy), var6 (copy), httpService (copy), constantsModule (copy)
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and (p2.visualItem.actionEventParams and p2.visualItem.visualItemName) then
				local id = p2.notificationData.id
				
				if var5.current[id] then
					var5.current[id].shouldActWhenDismiss = false
				end
				if var6(id) then return end
				if httpService:JSONDecode(p2.visualItem.actionEventParams).nudgeType ~= constantsModule.PARTY_TO_ONE_NUDGE_TYPE then return end
			end
		end)
		local userAction_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.NudgeForInviterSquad, function(p2)
			-- upvalues: var5 (copy), var6 (copy), httpService (copy), constantsModule (copy), default (copy), var8 (copy), squadToastActionsAndStatesModule (copy), gameParams (copy), experienceService (copy), squadGameJoinOriginModule (copy)
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and (p2.visualItem.actionEventParams and p2.visualItem.visualItemName) then
				local id = p2.notificationData.id
				
				if var5.current[id] then
					var5.current[id].shouldActWhenDismiss = false
				end
				if var6(id) then return end
				local actionEventParams = httpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if actionEventParams.nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or actionEventParams.nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE then
					if p2.visualItem.visualItemName == constantsModule.JOIN_EXPERIENCE_FROM_NUDGE_BUTTON_TYPE then
						default:dismissNotification(id)
						var8(id, squadToastActionsAndStatesModule.PartyNudgeAccept)
						experienceService:LaunchExperience(gameParams.fromPlaceId(actionEventParams.placeId), squadGameJoinOriginModule.NudgeForInviterSquad, nil)
						
						return
					elseif p2.visualItem.visualItemName == constantsModule.DISMISS_INVITER_SQUAD_NUDGE_BUTTON_TYPE then
						var8(id, squadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
					end
				end
			end
		end)
		
		return function()
			-- upvalues: userAction (ref), userAction_1 (ref)
			if userAction then
				userAction()
			end
			if userAction_1 then
				userAction_1()
			end
		end
	end, {
		var6, var8, var2, var2.setSquadPrompt, var2.fireSquadAnalytics,
		var2.squadLocation, p1.currentSquadId
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var6 (ref), httpService (copy), constantsModule (copy), p1 (ref), default (copy), var7 (ref), var8 (ref), squadToastActionsAndStatesModule (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadNudgeInvite, function(p2)
			-- upvalues: var6 (copy), httpService (copy), constantsModule (copy), p1 (copy), default (copy), var7 (copy), var8 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p2.state.visualItems.button[1].actionEventParams
			local id = p2.id
			
			if var6(id) then return end
			local var9 = httpService:JSONDecode(actionEventParams)
			
			if (var9.nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or var9.nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE) and (p1.currentSquadId ~= "" and p1.currentSquadId == var9.squadId) then
				default:dismissNotification(id)
				
				return
			end
			var7(id, p2, var9)
			var8(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local display_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.NudgeForInviterSquad, function(p2)
			-- upvalues: var6 (copy), httpService (copy), constantsModule (copy), default (copy), p1 (copy), var7 (copy), var8 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p2.state.visualItems.button[1].actionEventParams
			local id = p2.id
			
			if var6(id) then return end
			local var9 = httpService:JSONDecode(actionEventParams)
			
			if var9.nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or var9.nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE then
				if var9.gameInstanceId == game.JobId then
					default:dismissNotification(id)
					
					return
				elseif p1.currentSquadId == "" or p1.currentSquadId ~= var9.squadId then
					default:dismissNotification(id)
					
					return
				end
			end
			var7(id, p2, var9)
			var8(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local display_2 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadJoinRequestPrompt, function(p2)
			-- upvalues: var6 (copy), httpService (copy), var7 (copy), var8 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p2.state.visualItems.button[1].actionEventParams
			local id = p2.id
			
			if var6(id) then
				return
			end
			var7(id, p2, httpService:JSONDecode(actionEventParams))
			var8(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local display_3 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadAcceptJoinRequest, function(p2)
			-- upvalues: var6 (copy), httpService (copy), var7 (copy), var8 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p2.state.visualItems.button[1].actionEventParams
			local id = p2.id
			
			if var6(id) then
				return
			end
			var7(id, p2, httpService:JSONDecode(actionEventParams))
			var8(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		
		return function()
			-- upvalues: display (ref), display_1 (ref), display_2 (ref), display_3 (ref)
			if display then
				display()
			end
			if display_1 then
				display_1()
			end
			if display_2 then
				display_2()
			end
			if display_3 then
				display_3()
			end
		end
	end, { var6, var7, var8, p1.currentSquadId })
	
	return nil
end