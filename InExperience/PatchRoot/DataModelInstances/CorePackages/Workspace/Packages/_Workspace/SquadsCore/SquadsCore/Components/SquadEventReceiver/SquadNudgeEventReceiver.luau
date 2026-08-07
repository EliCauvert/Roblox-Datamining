local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local constantsModule = require(squadsCore.Common.Constants)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local squadToastActionsAndStatesModule = require(squadsCore.Enums.SquadToastActionsAndStates)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local actOnPartyNudgeModule = require(squadsCore.Thunks.actOnPartyNudge)
local createConversationModule = require(squadsCore.Thunks.createConversation)
local reactModule = require(parent.React)
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local userProfilesModule = require(parent.UserProfiles)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local showNotificationSnoozeMenuSignal = toastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local notificationGroups = toastNotificationModule.NotificationGroups
local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default
local userProfileStore = userProfilesModule.Stores.UserProfileStore

return function(p0) --[[ line: 39 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), useLocalUserId (ref), useLocalization (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), userProfileStore (ref), guiService (ref), realtimeDeliveryModule (ref), constantsModule (ref), eventNamesModule (ref), default (ref), squadToastActionsAndStatesModule (ref), notificationTypeEnum (ref), actOnPartyNudgeModule (ref), lifecycleEvents (ref), showNotificationSnoozeMenuSignal (ref), notificationGroups (ref), httpService (ref), createConversationModule (ref)
	local var14 = useDispatch()
	local var15 = reactModule.useContext(squadExternalContractContextModule)
	local var16 = tonumber(useLocalUserId()) or 0
	local var17 = var15.useIsChatEnabled()
	local var18 = var15.useIsLoadingChatSettings()
	local var19 = useLocalization({
		YouJoinedFriendParty = "Feature.Squads.Label.YouJoinedFriendParty",
		FriendJoinedYourParty = "Feature.Squads.Label.FriendJoinedYourParty",
		snoozeTitle = "Feature.Chat.Label.SnoozePartyNotifications",
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription"
	})
	local var20 = reactModule.useRef({})
	local var21 = reactModule.useCallback(function(p1, p2) --[[ line: 56 ]]
		-- upvalues: var16 (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), userProfileStore (copy), guiService (copy), var19 (ref)
		if p1 == 0 or p2 == 0 then return end
		local var23 = nil
		
		if p1 == var16 then
			var23 = p2
		elseif p2 == var16 then
			var23 = p1
		end
		if var23 then
			local var24 = getStandardSizeAvatarHeadShotRbxthumb(tostring(var23))
			userProfileStore.get().fetchNamesByUserIds({ tostring(var23) }, function(p3) --[[ line: 70 ]]
				-- upvalues: p1 (ref), var16 (copy), guiService (copy), var19 (copy), var24 (ref)
				if #p3.data > 0 and p3.data[1] and p3.data[1].names then
					local combinedName = p3.data[1].names.getCombinedName(false)
					
					if p1 == var16 then
						guiService:SendNotification({
							Title = var19.FriendJoinedYourParty:gsub("{(.-)}", { combinedName = combinedName }),
							Icon = var24
						})
						
						return
					end
					guiService:SendNotification({
						Title = var19.YouJoinedFriendParty:gsub("{(.-)}", { combinedName = combinedName }),
						Icon = var24
					})
				end
			end)
		end
	end, {
		var16,
		var19.FriendJoinedYourParty,
		var19.YouJoinedFriendParty
	})
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PARTY_NUDGE_RTN_NAMESPACE, function(p4) --[[ line: 90 ]]
		-- upvalues: constantsModule (copy), var16 (ref), p0 (ref), var21 (ref)
		if p4.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p4.status == constantsModule.PARTY_INVITE_ACCEPTED_STATUS and (p4.inviterId == var16 and p0.currentSquadId ~= "") and p4.groupUpId == p0.currentSquadId then
			var21(p4.inviterId, p4.inviteeId)
		end
	end, { var16, p0.currentSquadId, var21 })
	local var22 = reactModule.useCallback(function(p5, p6) --[[ line: 103 ]]
		-- upvalues: var15 (ref), eventNamesModule (copy), var20 (ref)
		var15.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
			toastAction = p6,
			toastType = if var20.current[p5] then var20.current[p5].toastType else nil,
			nudgeId = if var20.current[p5] then var20.current[p5].nudgeId else nil,
			nudgeType = if var20.current[p5] then var20.current[p5].nudgeType else nil,
			partyAttemptId = if var20.current[p5] then var20.current[p5].partyAttemptId else nil,
			squadLocation = var15.squadLocation
		})
	end, { var15.fireSquadAnalytics, var15.squadLocation })
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: default (copy), var20 (ref), var22 (ref), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var14 (ref), actOnPartyNudgeModule (copy), var15 (ref), var17 (ref)
		local var26 = default:listenToDismissNotification(function(p7) --[[ line: 124 ]]
			-- upvalues: var20 (copy), var22 (copy), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var14 (copy), actOnPartyNudgeModule (copy), var15 (copy), var17 (copy)
			if p7.notificationId and var20.current[p7.notificationId] then
				var22(p7.notificationId, squadToastActionsAndStatesModule.PartyNudgeGeneralDismiss)
				
				if var20.current[p7.notificationId].shouldActWhenDismiss then
					local notificationId = var20.current[p7.notificationId]
					local toastType = notificationId.toastType
					
					if notificationId.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
						local REJECT_START_PARTY_REQUEST_ACTION = nil
						
						if toastType == notificationTypeEnum.SquadNudgeInvite then
							REJECT_START_PARTY_REQUEST_ACTION = constantsModule.REJECT_PARTY_INVITE_ACTION
						elseif toastType == notificationTypeEnum.SquadStartPartyPrompt then
							REJECT_START_PARTY_REQUEST_ACTION = constantsModule.REJECT_START_PARTY_REQUEST_ACTION
						end
						if REJECT_START_PARTY_REQUEST_ACTION then
							var14(actOnPartyNudgeModule(REJECT_START_PARTY_REQUEST_ACTION, notificationId.nudgeId, false, var15.setSquadPrompt, var15.fireSquadAnalytics, var15.squadLocation, var17))
						end
					end
				end
			end
			var20.current[p7.notificationId] = nil
		end)
		
		return function() --[[ line: 162 ]]
			-- upvalues: var26 (ref)
			if var26 then
				var26:Disconnect()
			end
		end
	end, {
		var22,
		var17,
		var15.setSquadPrompt,
		var15.fireSquadAnalytics,
		var15.squadLocation
	})
	reactModule.useEffect(function() --[[ line: 175 ]]
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), showNotificationSnoozeMenuSignal (copy), var19 (ref), notificationGroups (copy), constantsModule (copy), var20 (ref), var18 (ref), var17 (ref), default (copy), httpService (copy), var22 (ref), squadToastActionsAndStatesModule (copy), var14 (ref), createConversationModule (copy), var15 (ref), actOnPartyNudgeModule (copy), p0 (ref), var21 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadStartPartyPrompt, function(p8) --[[ line: 179 ]]
			-- upvalues: showNotificationSnoozeMenuSignal (copy), var19 (copy), notificationGroups (copy), constantsModule (copy), var20 (copy), var18 (copy), var17 (copy), default (copy), httpService (copy), var22 (copy), squadToastActionsAndStatesModule (copy), var14 (copy), createConversationModule (copy), var15 (copy), actOnPartyNudgeModule (copy), p0 (copy)
			if p8 and p8.userActionType == "click" and (p8.notificationData and p8.visualItem) and p8.visualItem.visualItemName == "SnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var19.snoozeDescription,
					notificationType = notificationGroups.SquadStartPartyPromptGroup,
					title = var19.snoozeTitle
				})
			end
			if p8 and p8.userActionType == "click" and (p8.notificationData and p8.visualItem) and (p8.visualItem.actionEventParams and p8.visualItem.visualItemName and (p8.visualItem.visualItemName == constantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE or p8.visualItem.visualItemName == constantsModule.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE)) then
				local id = p8.notificationData.id
				
				if var20.current[id] then
					var20.current[id].shouldActWhenDismiss = false
				end
				if not var18 and not var17 then
					default:dismissNotification(id)
					
					return
				end
				local actionEventParams = httpService:JSONDecode(p8.visualItem.actionEventParams)
				
				if actionEventParams.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and game.JobId ~= "" and actionEventParams.gameInstanceId == game.JobId then
					if p8.visualItem.visualItemName == constantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE then
						default:dismissNotification(id)
						var22(id, squadToastActionsAndStatesModule.PartyNudgeAccept)
						var14(createConversationModule({
							conversationType = "one_to_one",
							userIds = { tostring(actionEventParams.inviteeUserId) },
							source = constantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE,
							squadContext = var15,
							onSuccessCallback = function(p9) --[[ line: 229 ]]
								-- upvalues: var14 (copy), actOnPartyNudgeModule (copy), constantsModule (copy), actionEventParams (ref), p0 (copy), var15 (copy), var17 (copy), var20 (copy), id (ref)
								var14(actOnPartyNudgeModule(constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION, actionEventParams.nudgeId, p0.currentParentChannelId ~= "" and p0.currentParentChannelId ~= p9, var15.setSquadPrompt, var15.fireSquadAnalytics, var15.squadLocation, var17, if var20.current[id] then var20.current[id].partyAttemptId else nil, p9))
							end,
							onErrorCallback = function() --[[ line: 247 ]]
								-- upvalues: var14 (copy), actOnPartyNudgeModule (copy), constantsModule (copy), actionEventParams (ref), var15 (copy), var17 (copy)
								var14(actOnPartyNudgeModule(constantsModule.REJECT_START_PARTY_REQUEST_ACTION, actionEventParams.nudgeId, false, var15.setSquadPrompt, var15.fireSquadAnalytics, var15.squadLocation, var17))
							end
						}))
						
						return
					elseif p8.visualItem.visualItemName == constantsModule.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE then
						var22(id, squadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
						var14(actOnPartyNudgeModule(constantsModule.REJECT_START_PARTY_REQUEST_ACTION, actionEventParams.nudgeId, false, var15.setSquadPrompt, var15.fireSquadAnalytics, var15.squadLocation, var17))
					end
				end
			end
		end)
		local userAction_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadNudgeInvite, function(p10) --[[ line: 286 ]]
			-- upvalues: showNotificationSnoozeMenuSignal (copy), var19 (copy), notificationGroups (copy), constantsModule (copy), var20 (copy), var18 (copy), var17 (copy), default (copy), httpService (copy), var22 (copy), squadToastActionsAndStatesModule (copy), p0 (copy), var14 (copy), actOnPartyNudgeModule (copy), var15 (copy), var21 (copy)
			if p10 and p10.userActionType == "click" and (p10.notificationData and p10.visualItem) and p10.visualItem.visualItemName == "SnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var19.snoozeDescription,
					notificationType = notificationGroups.SquadNudgeInviteGroup,
					title = var19.snoozeTitle
				})
			end
			if p10 and p10.userActionType == "click" and (p10.notificationData and p10.visualItem) and (p10.visualItem.actionEventParams and p10.visualItem.visualItemName and (p10.visualItem.visualItemName == constantsModule.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE or p10.visualItem.visualItemName == constantsModule.DISMISS_SQUAD_NUDGE_BUTTON_TYPE)) then
				local id = p10.notificationData.id
				
				if var20.current[id] then
					var20.current[id].shouldActWhenDismiss = false
				end
				if not var18 and not var17 then
					default:dismissNotification(id)
					
					return
				end
				local actionEventParams = httpService:JSONDecode(p10.visualItem.actionEventParams)
				
				if actionEventParams.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
					local REJECT_PARTY_INVITE_ACTION = nil
					local var31 = false
					
					if p10.visualItem.visualItemName == constantsModule.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE then
						REJECT_PARTY_INVITE_ACTION = constantsModule.ACCEPT_PARTY_INVITE_ACTION
						default:dismissNotification(id)
						var22(id, squadToastActionsAndStatesModule.PartyNudgeAccept)
						var31 = p0.currentSquadId ~= "" and actionEventParams.squadId ~= p0.currentSquadId
					elseif p10.visualItem.visualItemName == constantsModule.DISMISS_SQUAD_NUDGE_BUTTON_TYPE then
						REJECT_PARTY_INVITE_ACTION = constantsModule.REJECT_PARTY_INVITE_ACTION
						var22(id, squadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
					end
					if REJECT_PARTY_INVITE_ACTION then
						var14(actOnPartyNudgeModule(REJECT_PARTY_INVITE_ACTION, actionEventParams.nudgeId, var31, var15.setSquadPrompt, var15.fireSquadAnalytics, var15.squadLocation, var17, if var20.current[id] then var20.current[id].partyAttemptId else nil)):andThen(function() --[[ line: 354 ]]
							-- upvalues: REJECT_PARTY_INVITE_ACTION (write), constantsModule (copy), var21 (copy), actionEventParams (ref)
							if REJECT_PARTY_INVITE_ACTION == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
								var21(tonumber(actionEventParams.inviterUserId) or 0, tonumber(actionEventParams.inviteeUserId) or 0)
							end
						end)
					end
				end
			end
		end)
		
		return function() --[[ line: 368 ]]
			-- upvalues: userAction (ref), userAction_1 (ref)
			if userAction then
				userAction()
			end
			if userAction_1 then
				userAction_1()
			end
		end
	end, {
		var22, var17, var15, var18, var15.setSquadPrompt, var15.fireSquadAnalytics,
		var15.squadLocation, p0.currentSquadId, p0.currentParentChannelId, var21,
		var19.snoozeTitle, var19.snoozeDescription
	})
	reactModule.useEffect(function() --[[ line: 392 ]]
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var18 (ref), var17 (ref), default (copy), httpService (copy), constantsModule (copy), p0 (ref), var20 (ref), var22 (ref), squadToastActionsAndStatesModule (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadStartPartyPrompt, function(p11) --[[ line: 396 ]]
			-- upvalues: var18 (copy), var17 (copy), default (copy), httpService (copy), constantsModule (copy), p0 (copy), var20 (copy), var22 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p11.state.visualItems.button[1].actionEventParams
			local id = p11.id
			
			if not var18 and not var17 then
				default:dismissNotification(id)
				
				return
			end
			local var34 = false
			local var35 = true
			local var36 = true
			local var37 = httpService:JSONDecode(actionEventParams)
			
			if var37.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
				if p0.currentSquadId ~= "" then
					var34 = true
				elseif game.JobId == "" or var37.gameInstanceId ~= game.JobId then
					var34 = true
					var35 = false
					var36 = false
				end
			end
			if var35 then
				var20.current[id] = {
					toastType = p11.notificationType,
					partyAttemptId = httpService:GenerateGUID(false),
					shouldActWhenDismiss = var36,
					nudgeId = var37.nudgeId,
					nudgeType = var37.nudgeType
				}
				var22(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
			end
			if var34 then
				default:dismissNotification(id)
			end
		end)
		local display_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadNudgeInvite, function(p12) --[[ line: 445 ]]
			-- upvalues: var18 (copy), var17 (copy), default (copy), httpService (copy), constantsModule (copy), p0 (copy), var20 (copy), var22 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p12.state.visualItems.button[1].actionEventParams
			local id = p12.id
			
			if not var18 and not var17 then
				default:dismissNotification(id)
				
				return
			end
			local var38 = httpService:JSONDecode(actionEventParams)
			
			if var38.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p0.currentSquadId ~= "" and p0.currentSquadId == var38.squadId then
				default:dismissNotification(id)
				
				return
			end
			var20.current[id] = {
				shouldActWhenDismiss = true,
				toastType = p12.notificationType,
				partyAttemptId = httpService:GenerateGUID(false),
				nudgeId = var38.nudgeId,
				nudgeType = var38.nudgeType
			}
			var22(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		
		return function() --[[ line: 473 ]]
			-- upvalues: display (ref), display_1 (ref)
			if display then
				display()
			end
			if display_1 then
				display_1()
			end
		end
	end, { var17, var22, var18, p0.currentSquadId })
	reactModule.useEffect(function() --[[ line: 484 ]]
		-- upvalues: p0 (ref), var20 (ref), constantsModule (copy), notificationTypeEnum (copy), default (copy)
		if p0.currentSquadId ~= "" then
			for i, v in var20.current do
				if v and v.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v.toastType == notificationTypeEnum.SquadStartPartyPrompt then
					default:dismissNotification(i)
				end
			end
		end
	end, { p0.currentSquadId })
	
	return nil
end