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

return function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), default (ref), httpService (ref), eventNamesModule (ref), squadToastActionsAndStatesModule (ref), constantsModule (ref), notificationTypeEnum (ref), actOnPartyNudgeModule (ref), lifecycleEvents (ref), gameParams (ref), experienceService (ref), squadGameJoinOriginModule (ref)
	local var12 = useDispatch()
	local var13 = reactModule.useContext(squadExternalContractContextModule)
	local var14 = var13.useIsChatEnabled()
	local var15 = var13.useIsLoadingChatSettings()
	local var16 = reactModule.useRef({})
	local var17 = reactModule.useCallback(function(p1)
		-- upvalues: var15 (ref), var14 (ref), default (copy)
		if var15 or var14 then
			return false
		end
		default:dismissNotification(p1)
		
		return true
	end, { var15, var14 })
	local var18 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var16 (ref), httpService (copy)
		var16.current[p2] = {
			shouldActWhenDismiss = true,
			toastType = p3.notificationType,
			partyAttemptId = httpService:GenerateGUID(false),
			nudgeId = p4.nudgeId,
			nudgeType = p4.nudgeType
		}
	end, {})
	local var19 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var13 (ref), eventNamesModule (copy), var16 (ref)
		var13.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
			toastAction = p6,
			toastType = if var16.current[p5] then var16.current[p5].toastType else nil,
			nudgeId = if var16.current[p5] then var16.current[p5].nudgeId else nil,
			nudgeType = if var16.current[p5] then var16.current[p5].nudgeType else nil,
			partyAttemptId = if var16.current[p5] then var16.current[p5].partyAttemptId else nil,
			squadLocation = var13.squadLocation
		})
	end, { var13.fireSquadAnalytics, var13.squadLocation })
	reactModule.useEffect(function()
		-- upvalues: default (copy), var16 (ref), var19 (ref), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var12 (ref), actOnPartyNudgeModule (copy), var13 (ref), var14 (ref)
		local var20 = default:listenToDismissNotification(function(p7)
			-- upvalues: var16 (copy), var19 (copy), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var12 (copy), actOnPartyNudgeModule (copy), var13 (copy), var14 (copy)
			if p7.notificationId and var16.current[p7.notificationId] then
				var19(p7.notificationId, squadToastActionsAndStatesModule.PartyNudgeGeneralDismiss)
				
				if var16.current[p7.notificationId].shouldActWhenDismiss then
					local notificationId = var16.current[p7.notificationId]
					local nudgeType = notificationId.nudgeType
					
					if (nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE) and notificationId.toastType == notificationTypeEnum.SquadNudgeInvite then
						var12(actOnPartyNudgeModule(constantsModule.REJECT_PARTY_INVITE_ACTION, notificationId.nudgeId, false, var13.setSquadPrompt, var13.fireSquadAnalytics, var13.squadLocation, var14))
					end
				end
			end
			var16.current[p7.notificationId] = nil
		end)
		
		return function()
			-- upvalues: var20 (ref)
			if var20 then
				var20:Disconnect()
			end
		end
	end, {
		var19,
		var14,
		var13.setSquadPrompt,
		var13.fireSquadAnalytics,
		var13.squadLocation
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var16 (ref), var17 (ref), httpService (copy), constantsModule (copy), default (copy), var19 (ref), squadToastActionsAndStatesModule (copy), gameParams (copy), experienceService (copy), squadGameJoinOriginModule (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadNudgeInvite, function(p8)
			-- upvalues: var16 (copy), var17 (copy), httpService (copy), constantsModule (copy)
			if p8 and p8.userActionType == "click" and (p8.notificationData and p8.visualItem) and (p8.visualItem.actionEventParams and p8.visualItem.visualItemName) then
				local id = p8.notificationData.id
				
				if var16.current[id] then
					var16.current[id].shouldActWhenDismiss = false
				end
				if var17(id) then return end
				if httpService:JSONDecode(p8.visualItem.actionEventParams).nudgeType ~= constantsModule.PARTY_TO_ONE_NUDGE_TYPE then return end
			end
		end)
		local userAction_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.NudgeForInviterSquad, function(p9)
			-- upvalues: var16 (copy), var17 (copy), httpService (copy), constantsModule (copy), default (copy), var19 (copy), squadToastActionsAndStatesModule (copy), gameParams (copy), experienceService (copy), squadGameJoinOriginModule (copy)
			if p9 and p9.userActionType == "click" and (p9.notificationData and p9.visualItem) and (p9.visualItem.actionEventParams and p9.visualItem.visualItemName) then
				local id = p9.notificationData.id
				
				if var16.current[id] then
					var16.current[id].shouldActWhenDismiss = false
				end
				if var17(id) then return end
				local actionEventParams = httpService:JSONDecode(p9.visualItem.actionEventParams)
				
				if actionEventParams.nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or actionEventParams.nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE then
					if p9.visualItem.visualItemName == constantsModule.JOIN_EXPERIENCE_FROM_NUDGE_BUTTON_TYPE then
						default:dismissNotification(id)
						var19(id, squadToastActionsAndStatesModule.PartyNudgeAccept)
						experienceService:LaunchExperience(gameParams.fromPlaceId(actionEventParams.placeId), squadGameJoinOriginModule.NudgeForInviterSquad, nil)
						
						return
					elseif p9.visualItem.visualItemName == constantsModule.DISMISS_INVITER_SQUAD_NUDGE_BUTTON_TYPE then
						var19(id, squadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
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
		var17, var19, var13, var13.setSquadPrompt, var13.fireSquadAnalytics,
		var13.squadLocation, p0.currentSquadId
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var17 (ref), httpService (copy), constantsModule (copy), p0 (ref), default (copy), var18 (ref), var19 (ref), squadToastActionsAndStatesModule (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadNudgeInvite, function(p10)
			-- upvalues: var17 (copy), httpService (copy), constantsModule (copy), p0 (copy), default (copy), var18 (copy), var19 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p10.state.visualItems.button[1].actionEventParams
			local id = p10.id
			
			if var17(id) then return end
			local var28 = httpService:JSONDecode(actionEventParams)
			
			if (var28.nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or var28.nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE) and (p0.currentSquadId ~= "" and p0.currentSquadId == var28.squadId) then
				default:dismissNotification(id)
				
				return
			end
			var18(id, p10, var28)
			var19(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local display_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.NudgeForInviterSquad, function(p11)
			-- upvalues: var17 (copy), httpService (copy), constantsModule (copy), default (copy), p0 (copy), var18 (copy), var19 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p11.state.visualItems.button[1].actionEventParams
			local id = p11.id
			
			if var17(id) then return end
			local var29 = httpService:JSONDecode(actionEventParams)
			
			if var29.nudgeType == constantsModule.PARTY_TO_ONE_NUDGE_TYPE or var29.nudgeType == constantsModule.PARTY_TO_PARTY_NUDGE_TYPE then
				if var29.gameInstanceId == game.JobId then
					default:dismissNotification(id)
					
					return
				elseif p0.currentSquadId == "" or p0.currentSquadId ~= var29.squadId then
					default:dismissNotification(id)
					
					return
				end
			end
			var18(id, p11, var29)
			var19(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local display_2 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadJoinRequestPrompt, function(p12)
			-- upvalues: var17 (copy), httpService (copy), var18 (copy), var19 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p12.state.visualItems.button[1].actionEventParams
			local id = p12.id
			
			if var17(id) then
				return
			end
			var18(id, p12, httpService:JSONDecode(actionEventParams))
			var19(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		local display_3 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadAcceptJoinRequest, function(p13)
			-- upvalues: var17 (copy), httpService (copy), var18 (copy), var19 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p13.state.visualItems.button[1].actionEventParams
			local id = p13.id
			
			if var17(id) then
				return
			end
			var18(id, p13, httpService:JSONDecode(actionEventParams))
			var19(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
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
	end, { var17, var18, var19, p0.currentSquadId })
	
	return nil
end