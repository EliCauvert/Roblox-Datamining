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

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), useLocalUserId (ref), useLocalization (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), userProfileStore (ref), guiService (ref), realtimeDeliveryModule (ref), constantsModule (ref), eventNamesModule (ref), default (ref), squadToastActionsAndStatesModule (ref), notificationTypeEnum (ref), actOnPartyNudgeModule (ref), lifecycleEvents (ref), showNotificationSnoozeMenuSignal (ref), notificationGroups (ref), httpService (ref), createConversationModule (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	local var3 = tonumber(useLocalUserId()) or 0
	local var4 = var2.useIsChatEnabled()
	local var5 = var2.useIsLoadingChatSettings()
	local var6 = useLocalization({
		YouJoinedFriendParty = "Feature.Squads.Label.YouJoinedFriendParty",
		FriendJoinedYourParty = "Feature.Squads.Label.FriendJoinedYourParty",
		snoozeTitle = "Feature.Chat.Label.SnoozePartyNotifications",
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription"
	})
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref), getStandardSizeAvatarHeadShotRbxthumb (copy), userProfileStore (copy), guiService (copy), var6 (ref)
		if p2 == 0 or p3 == 0 then return end
		local var9 = nil
		
		if p2 == var3 then
			var9 = p3
		elseif p3 == var3 then
			var9 = p2
		end
		if var9 then
			local var10 = getStandardSizeAvatarHeadShotRbxthumb(tostring(var9))
			userProfileStore.get().fetchNamesByUserIds({ tostring(var9) }, function(p4)
				-- upvalues: p2 (ref), var3 (copy), guiService (copy), var6 (copy), var10 (ref)
				if #p4.data > 0 and p4.data[1] and p4.data[1].names then
					local combinedName = p4.data[1].names.getCombinedName(false)
					
					if p2 == var3 then
						guiService:SendNotification({
							Title = var6.FriendJoinedYourParty:gsub("{(.-)}", { combinedName = combinedName }),
							Icon = var10
						})
						
						return
					end
					guiService:SendNotification({
						Title = var6.YouJoinedFriendParty:gsub("{(.-)}", { combinedName = combinedName }),
						Icon = var10
					})
				end
			end)
		end
	end, {
		var3,
		var6.FriendJoinedYourParty,
		var6.YouJoinedFriendParty
	})
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PARTY_NUDGE_RTN_NAMESPACE, function(p2)
		-- upvalues: constantsModule (copy), var3 (ref), p1 (ref), var8 (ref)
		if p2.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p2.status == constantsModule.PARTY_INVITE_ACCEPTED_STATUS and (p2.inviterId == var3 and p1.currentSquadId ~= "") and p2.groupUpId == p1.currentSquadId then
			var8(p2.inviterId, p2.inviteeId)
		end
	end, { var3, p1.currentSquadId, var8 })
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), eventNamesModule (copy), var7 (ref)
		var2.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
			toastAction = p3,
			toastType = if var7.current[p2] then var7.current[p2].toastType else nil,
			nudgeId = if var7.current[p2] then var7.current[p2].nudgeId else nil,
			nudgeType = if var7.current[p2] then var7.current[p2].nudgeType else nil,
			partyAttemptId = if var7.current[p2] then var7.current[p2].partyAttemptId else nil,
			squadLocation = var2.squadLocation
		})
	end, { var2.fireSquadAnalytics, var2.squadLocation })
	reactModule.useEffect(function()
		-- upvalues: default (copy), var7 (ref), var9 (ref), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var1 (ref), actOnPartyNudgeModule (copy), var2 (ref), var4 (ref)
		local var10 = default:listenToDismissNotification(function(p2)
			-- upvalues: var7 (copy), var9 (copy), squadToastActionsAndStatesModule (copy), constantsModule (copy), notificationTypeEnum (copy), var1 (copy), actOnPartyNudgeModule (copy), var2 (copy), var4 (copy)
			if p2.notificationId and var7.current[p2.notificationId] then
				var9(p2.notificationId, squadToastActionsAndStatesModule.PartyNudgeGeneralDismiss)
				
				if var7.current[p2.notificationId].shouldActWhenDismiss then
					local notificationId = var7.current[p2.notificationId]
					local toastType = notificationId.toastType
					
					if notificationId.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
						local REJECT_START_PARTY_REQUEST_ACTION = nil
						
						if toastType == notificationTypeEnum.SquadNudgeInvite then
							REJECT_START_PARTY_REQUEST_ACTION = constantsModule.REJECT_PARTY_INVITE_ACTION
						elseif toastType == notificationTypeEnum.SquadStartPartyPrompt then
							REJECT_START_PARTY_REQUEST_ACTION = constantsModule.REJECT_START_PARTY_REQUEST_ACTION
						end
						if REJECT_START_PARTY_REQUEST_ACTION then
							var1(actOnPartyNudgeModule(REJECT_START_PARTY_REQUEST_ACTION, notificationId.nudgeId, false, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, var4))
						end
					end
				end
			end
			var7.current[p2.notificationId] = nil
		end)
		
		return function()
			-- upvalues: var10 (ref)
			if var10 then
				var10:Disconnect()
			end
		end
	end, {
		var9,
		var4,
		var2.setSquadPrompt,
		var2.fireSquadAnalytics,
		var2.squadLocation
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), showNotificationSnoozeMenuSignal (copy), var6 (ref), notificationGroups (copy), constantsModule (copy), var7 (ref), var5 (ref), var4 (ref), default (copy), httpService (copy), var9 (ref), squadToastActionsAndStatesModule (copy), var1 (ref), createConversationModule (copy), var2 (ref), actOnPartyNudgeModule (copy), p1 (ref), var8 (ref)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadStartPartyPrompt, function(p2)
			-- upvalues: showNotificationSnoozeMenuSignal (copy), var6 (copy), notificationGroups (copy), constantsModule (copy), var7 (copy), var5 (copy), var4 (copy), default (copy), httpService (copy), var9 (copy), squadToastActionsAndStatesModule (copy), var1 (copy), createConversationModule (copy), var2 (copy), actOnPartyNudgeModule (copy), p1 (copy)
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and p2.visualItem.visualItemName == "SnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var6.snoozeDescription,
					notificationType = notificationGroups.SquadStartPartyPromptGroup,
					title = var6.snoozeTitle
				})
			end
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and (p2.visualItem.actionEventParams and p2.visualItem.visualItemName and (p2.visualItem.visualItemName == constantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE or p2.visualItem.visualItemName == constantsModule.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE)) then
				local id = p2.notificationData.id
				
				if var7.current[id] then
					var7.current[id].shouldActWhenDismiss = false
				end
				if not var5 and not var4 then
					default:dismissNotification(id)
					
					return
				end
				local actionEventParams = httpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if actionEventParams.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and game.JobId ~= "" and actionEventParams.gameInstanceId == game.JobId then
					if p2.visualItem.visualItemName == constantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE then
						default:dismissNotification(id)
						var9(id, squadToastActionsAndStatesModule.PartyNudgeAccept)
						var1(createConversationModule({
							conversationType = "one_to_one",
							userIds = { tostring(actionEventParams.inviteeUserId) },
							source = constantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE,
							squadContext = var2,
							onSuccessCallback = function(p3)
								-- upvalues: var1 (copy), actOnPartyNudgeModule (copy), constantsModule (copy), actionEventParams (ref), p1 (copy), var2 (copy), var4 (copy), var7 (copy), id (ref)
								var1(actOnPartyNudgeModule(constantsModule.ACCEPT_START_PARTY_REQUEST_ACTION, actionEventParams.nudgeId, p1.currentParentChannelId ~= "" and p1.currentParentChannelId ~= p3, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, var4, if var7.current[id] then var7.current[id].partyAttemptId else nil, p3))
							end,
							onErrorCallback = function()
								-- upvalues: var1 (copy), actOnPartyNudgeModule (copy), constantsModule (copy), actionEventParams (ref), var2 (copy), var4 (copy)
								var1(actOnPartyNudgeModule(constantsModule.REJECT_START_PARTY_REQUEST_ACTION, actionEventParams.nudgeId, false, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, var4))
							end
						}))
						
						return
					elseif p2.visualItem.visualItemName == constantsModule.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE then
						var9(id, squadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
						var1(actOnPartyNudgeModule(constantsModule.REJECT_START_PARTY_REQUEST_ACTION, actionEventParams.nudgeId, false, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, var4))
					end
				end
			end
		end)
		local userAction_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadNudgeInvite, function(p2)
			-- upvalues: showNotificationSnoozeMenuSignal (copy), var6 (copy), notificationGroups (copy), constantsModule (copy), var7 (copy), var5 (copy), var4 (copy), default (copy), httpService (copy), var9 (copy), squadToastActionsAndStatesModule (copy), p1 (copy), var1 (copy), actOnPartyNudgeModule (copy), var2 (copy), var8 (copy)
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and p2.visualItem.visualItemName == "SnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var6.snoozeDescription,
					notificationType = notificationGroups.SquadNudgeInviteGroup,
					title = var6.snoozeTitle
				})
			end
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and (p2.visualItem.actionEventParams and p2.visualItem.visualItemName and (p2.visualItem.visualItemName == constantsModule.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE or p2.visualItem.visualItemName == constantsModule.DISMISS_SQUAD_NUDGE_BUTTON_TYPE)) then
				local id = p2.notificationData.id
				
				if var7.current[id] then
					var7.current[id].shouldActWhenDismiss = false
				end
				if not var5 and not var4 then
					default:dismissNotification(id)
					
					return
				end
				local actionEventParams = httpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if actionEventParams.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
					local REJECT_PARTY_INVITE_ACTION = nil
					local var10 = false
					
					if p2.visualItem.visualItemName == constantsModule.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE then
						REJECT_PARTY_INVITE_ACTION = constantsModule.ACCEPT_PARTY_INVITE_ACTION
						default:dismissNotification(id)
						var9(id, squadToastActionsAndStatesModule.PartyNudgeAccept)
						var10 = p1.currentSquadId ~= "" and actionEventParams.squadId ~= p1.currentSquadId
					elseif p2.visualItem.visualItemName == constantsModule.DISMISS_SQUAD_NUDGE_BUTTON_TYPE then
						REJECT_PARTY_INVITE_ACTION = constantsModule.REJECT_PARTY_INVITE_ACTION
						var9(id, squadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
					end
					if REJECT_PARTY_INVITE_ACTION then
						var1(actOnPartyNudgeModule(REJECT_PARTY_INVITE_ACTION, actionEventParams.nudgeId, var10, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, var4, if var7.current[id] then var7.current[id].partyAttemptId else nil)):andThen(function()
							-- upvalues: REJECT_PARTY_INVITE_ACTION (write), constantsModule (copy), var8 (copy), actionEventParams (ref)
							if REJECT_PARTY_INVITE_ACTION == constantsModule.ACCEPT_PARTY_INVITE_ACTION then
								var8(tonumber(actionEventParams.inviterUserId) or 0, tonumber(actionEventParams.inviteeUserId) or 0)
							end
						end)
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
		var9, var4, var2, var5, var2.setSquadPrompt, var2.fireSquadAnalytics,
		var2.squadLocation, p1.currentSquadId, p1.currentParentChannelId, var8,
		var6.snoozeTitle, var6.snoozeDescription
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), var5 (ref), var4 (ref), default (copy), httpService (copy), constantsModule (copy), p1 (ref), var7 (ref), var9 (ref), squadToastActionsAndStatesModule (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadStartPartyPrompt, function(p2)
			-- upvalues: var5 (copy), var4 (copy), default (copy), httpService (copy), constantsModule (copy), p1 (copy), var7 (copy), var9 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p2.state.visualItems.button[1].actionEventParams
			local id = p2.id
			
			if not var5 and not var4 then
				default:dismissNotification(id)
				
				return
			end
			local var10 = false
			local var11 = true
			local var12 = true
			local var13 = httpService:JSONDecode(actionEventParams)
			
			if var13.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
				if p1.currentSquadId ~= "" then
					var10 = true
				elseif game.JobId == "" or var13.gameInstanceId ~= game.JobId then
					var10 = true
					var11 = false
					var12 = false
				end
			end
			if var11 then
				var7.current[id] = {
					toastType = p2.notificationType,
					partyAttemptId = httpService:GenerateGUID(false),
					shouldActWhenDismiss = var12,
					nudgeId = var13.nudgeId,
					nudgeType = var13.nudgeType
				}
				var9(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
			end
			if var10 then
				default:dismissNotification(id)
			end
		end)
		local display_1 = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadNudgeInvite, function(p2)
			-- upvalues: var5 (copy), var4 (copy), default (copy), httpService (copy), constantsModule (copy), p1 (copy), var7 (copy), var9 (copy), squadToastActionsAndStatesModule (copy)
			local actionEventParams = p2.state.visualItems.button[1].actionEventParams
			local id = p2.id
			
			if not var5 and not var4 then
				default:dismissNotification(id)
				
				return
			end
			local var10 = httpService:JSONDecode(actionEventParams)
			
			if var10.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p1.currentSquadId ~= "" and p1.currentSquadId == var10.squadId then
				default:dismissNotification(id)
				
				return
			end
			var7.current[id] = {
				shouldActWhenDismiss = true,
				toastType = p2.notificationType,
				partyAttemptId = httpService:GenerateGUID(false),
				nudgeId = var10.nudgeId,
				nudgeType = var10.nudgeType
			}
			var9(id, squadToastActionsAndStatesModule.PartyNudgeDisplay)
		end)
		
		return function()
			-- upvalues: display (ref), display_1 (ref)
			if display then
				display()
			end
			if display_1 then
				display_1()
			end
		end
	end, { var4, var9, var5, p1.currentSquadId })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var7 (ref), constantsModule (copy), notificationTypeEnum (copy), default (copy)
		if p1.currentSquadId ~= "" then
			for i, v in var7.current do
				if v and v.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v.toastType == notificationTypeEnum.SquadStartPartyPrompt then
					default:dismissNotification(i)
				end
			end
		end
	end, { p1.currentSquadId })
	
	return nil
end