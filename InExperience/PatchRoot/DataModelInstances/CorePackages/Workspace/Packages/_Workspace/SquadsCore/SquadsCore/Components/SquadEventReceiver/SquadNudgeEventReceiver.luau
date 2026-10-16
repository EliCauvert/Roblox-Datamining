local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local ConstantsModule = require(SquadsCore.Common.Constants)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local SquadToastActionsAndStatesModule = require(SquadsCore.Enums.SquadToastActionsAndStates)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local ActOnPartyNudgeModule = require(SquadsCore.Thunks.actOnPartyNudge)
local CreateConversationModule = require(SquadsCore.Thunks.createConversation)
local ReactModule = require(Parent.React)
local ToastNotificationModule = require(Parent.ToastNotification)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local ShowNotificationSnoozeMenuSignal = ToastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local NotificationGroups = ToastNotificationModule.NotificationGroups
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore

return function(p1) --[[ Line: 39 ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), UseLocalUserIdFunction (copy), UseLocalizationFunction (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), UserProfileStore (copy), GuiService (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy), EventNamesModule (copy), Default (copy), SquadToastActionsAndStatesModule (copy), NotificationTypeEnum (copy), ActOnPartyNudgeModule (copy), LifecycleEvents (copy), ShowNotificationSnoozeMenuSignal (copy), NotificationGroups (copy), HttpService (copy), CreateConversationModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseIsChatEnabledResult = UseContextResult.useIsChatEnabled()
	local UseIsLoadingChatSettingsResult = UseContextResult.useIsLoadingChatSettings()
	local UseLocalizationResult = UseLocalizationFunction({
		YouJoinedFriendParty = "Feature.Squads.Label.YouJoinedFriendParty",
		FriendJoinedYourParty = "Feature.Squads.Label.FriendJoinedYourParty",
		snoozeTitle = "Feature.Chat.Label.SnoozePartyNotifications",
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription"
	})
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(Number1, Number2) --[[ Line: 56 ]]
		-- upvalues: Number (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), UserProfileStore (upval), GuiService (upval), UseLocalizationResult (copy)
		if Number1 == 0 or Number2 == 0 then return end
		local v1 = nil
		
		if Number1 == Number then
			v1 = Number2
		elseif Number2 == Number then
			v1 = Number1
		end
		if v1 then
			local StandardSizeAvatarHeadShotRbxthumb = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(v1)))
			UserProfileStore.get().fetchNamesByUserIds({ (tostring(v1)) }, function(p2) --[[ Line: 70 ]]
				-- upvalues: Number1 (copy), Number (upval), GuiService (upval), UseLocalizationResult (upval), StandardSizeAvatarHeadShotRbxthumb (copy)
				if #p2.data > 0 and p2.data[1] and p2.data[1].names then
					local CombinedName = p2.data[1].names.getCombinedName(false)
					
					if Number1 == Number then
						GuiService:SendNotification({
							Title = UseLocalizationResult.FriendJoinedYourParty:gsub("{(.-)}", { combinedName = CombinedName }),
							Icon = StandardSizeAvatarHeadShotRbxthumb
						})
						
						return
					end
					GuiService:SendNotification({
						Title = UseLocalizationResult.YouJoinedFriendParty:gsub("{(.-)}", { combinedName = CombinedName }),
						Icon = StandardSizeAvatarHeadShotRbxthumb
					})
				end
			end)
		end
	end, {
		Number,
		UseLocalizationResult.FriendJoinedYourParty,
		UseLocalizationResult.YouJoinedFriendParty
	})
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.PARTY_NUDGE_RTN_NAMESPACE, function(p2) --[[ Line: 90 ]]
		-- upvalues: ConstantsModule (upval), Number (copy), p1 (copy), UseResult (copy)
		if p2.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p2.status == ConstantsModule.PARTY_INVITE_ACCEPTED_STATUS and p2.inviterId == Number and p1.currentSquadId ~= "" and p2.groupUpId == p1.currentSquadId then
			UseResult(p2.inviterId, p2.inviteeId)
		end
	end, { Number, p1.currentSquadId, UseResult })
	local UseResult1 = ReactModule.useCallback(function(p2, ToastAction) --[[ Line: 103 ]]
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
	ReactModule.useEffect(function() --[[ Line: 122 ]]
		-- upvalues: Default (upval), UseRefResult (copy), UseResult1 (copy), SquadToastActionsAndStatesModule (upval), ConstantsModule (upval), NotificationTypeEnum (upval), UseDispatchResult (copy), ActOnPartyNudgeModule (upval), UseContextResult (copy), UseIsChatEnabledResult (copy)
		local ListenToDismissNotificationResult = Default:listenToDismissNotification(function(p2) --[[ Line: 124 ]]
			-- upvalues: UseRefResult (upval), UseResult1 (upval), SquadToastActionsAndStatesModule (upval), ConstantsModule (upval), NotificationTypeEnum (upval), UseDispatchResult (upval), ActOnPartyNudgeModule (upval), UseContextResult (upval), UseIsChatEnabledResult (upval)
			if p2.notificationId and UseRefResult.current[p2.notificationId] then
				UseResult1(p2.notificationId, SquadToastActionsAndStatesModule.PartyNudgeGeneralDismiss)
				
				if UseRefResult.current[p2.notificationId].shouldActWhenDismiss then
					local CurrentEntry = UseRefResult.current[p2.notificationId]
					local ToastType = CurrentEntry.toastType
					
					if CurrentEntry.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
						local REJECTPARTYINVITEACTION = nil
						
						if ToastType == NotificationTypeEnum.SquadNudgeInvite then
							REJECTPARTYINVITEACTION = ConstantsModule.REJECT_PARTY_INVITE_ACTION
						elseif ToastType == NotificationTypeEnum.SquadStartPartyPrompt then
							REJECTPARTYINVITEACTION = ConstantsModule.REJECT_START_PARTY_REQUEST_ACTION
						end
						if REJECTPARTYINVITEACTION then
							UseDispatchResult(ActOnPartyNudgeModule(REJECTPARTYINVITEACTION, CurrentEntry.nudgeId, false, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult))
						end
					end
				end
			end
			UseRefResult.current[p2.notificationId] = nil
		end)
		
		return function() --[[ Line: 162 ]]
			-- upvalues: ListenToDismissNotificationResult (copy)
			if ListenToDismissNotificationResult then
				ListenToDismissNotificationResult:Disconnect()
			end
		end
	end, {
		UseResult1,
		UseIsChatEnabledResult,
		UseContextResult.setSquadPrompt,
		UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	ReactModule.useEffect(function() --[[ Line: 175 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), ShowNotificationSnoozeMenuSignal (upval), UseLocalizationResult (copy), NotificationGroups (upval), ConstantsModule (upval), UseRefResult (copy), UseIsLoadingChatSettingsResult (copy), UseIsChatEnabledResult (copy), Default (upval), HttpService (upval), UseResult1 (copy), SquadToastActionsAndStatesModule (upval), UseDispatchResult (copy), CreateConversationModule (upval), UseContextResult (copy), ActOnPartyNudgeModule (upval), p1 (copy), UseResult (copy)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadStartPartyPrompt, function(p2) --[[ Line: 179 ]]
			-- upvalues: ShowNotificationSnoozeMenuSignal (upval), UseLocalizationResult (upval), NotificationGroups (upval), ConstantsModule (upval), UseRefResult (upval), UseIsLoadingChatSettingsResult (upval), UseIsChatEnabledResult (upval), Default (upval), HttpService (upval), UseResult1 (upval), SquadToastActionsAndStatesModule (upval), UseDispatchResult (upval), CreateConversationModule (upval), UseContextResult (upval), ActOnPartyNudgeModule (upval), p1 (upval)
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.visualItemName == "SnoozeSingleMetaAction" then
				ShowNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = UseLocalizationResult.snoozeDescription,
					notificationType = NotificationGroups.SquadStartPartyPromptGroup,
					title = UseLocalizationResult.snoozeTitle
				})
			end
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.actionEventParams and p2.visualItem.visualItemName and (p2.visualItem.visualItemName == ConstantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE or p2.visualItem.visualItemName == ConstantsModule.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE) then
				local Id = p2.notificationData.id
				
				if UseRefResult.current[Id] then
					UseRefResult.current[Id].shouldActWhenDismiss = false
				end
				if not UseIsLoadingChatSettingsResult and not UseIsChatEnabledResult then
					Default:dismissNotification(Id)
					
					return
				end
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if Data.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and game.JobId ~= "" and Data.gameInstanceId == game.JobId then
					if p2.visualItem.visualItemName == ConstantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE then
						Default:dismissNotification(Id)
						UseResult1(Id, SquadToastActionsAndStatesModule.PartyNudgeAccept)
						UseDispatchResult(CreateConversationModule({
							conversationType = "one_to_one",
							userIds = { (tostring(Data.inviteeUserId)) },
							source = ConstantsModule.START_PARTY_FROM_PROMPT_BUTTON_TYPE,
							squadContext = UseContextResult,
							onSuccessCallback = function(CurrentParentChannelId) --[[ Line: 229 ]]
								-- upvalues: UseDispatchResult (upval), ActOnPartyNudgeModule (upval), ConstantsModule (upval), Data (copy), p1 (upval), UseContextResult (upval), UseIsChatEnabledResult (upval), UseRefResult (upval), Id (copy)
								UseDispatchResult(ActOnPartyNudgeModule(ConstantsModule.ACCEPT_START_PARTY_REQUEST_ACTION, Data.nudgeId, p1.currentParentChannelId ~= "" and p1.currentParentChannelId ~= CurrentParentChannelId, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult, if UseRefResult.current[Id] then UseRefResult.current[Id].partyAttemptId else nil, CurrentParentChannelId))
							end,
							onErrorCallback = function() --[[ Line: 247 ]]
								-- upvalues: UseDispatchResult (upval), ActOnPartyNudgeModule (upval), ConstantsModule (upval), Data (copy), UseContextResult (upval), UseIsChatEnabledResult (upval)
								UseDispatchResult(ActOnPartyNudgeModule(ConstantsModule.REJECT_START_PARTY_REQUEST_ACTION, Data.nudgeId, false, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult))
							end
						}))
						
						return
					end
					if p2.visualItem.visualItemName == ConstantsModule.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE then
						UseResult1(Id, SquadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
						UseDispatchResult(ActOnPartyNudgeModule(ConstantsModule.REJECT_START_PARTY_REQUEST_ACTION, Data.nudgeId, false, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult))
					end
				end
			end
		end)
		local RegisterResult1 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadNudgeInvite, function(p2) --[[ Line: 286 ]]
			-- upvalues: ShowNotificationSnoozeMenuSignal (upval), UseLocalizationResult (upval), NotificationGroups (upval), ConstantsModule (upval), UseRefResult (upval), UseIsLoadingChatSettingsResult (upval), UseIsChatEnabledResult (upval), Default (upval), HttpService (upval), UseResult1 (upval), SquadToastActionsAndStatesModule (upval), p1 (upval), UseDispatchResult (upval), ActOnPartyNudgeModule (upval), UseContextResult (upval), UseResult (upval)
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.visualItemName == "SnoozeSingleMetaAction" then
				ShowNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = UseLocalizationResult.snoozeDescription,
					notificationType = NotificationGroups.SquadNudgeInviteGroup,
					title = UseLocalizationResult.snoozeTitle
				})
			end
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.actionEventParams and p2.visualItem.visualItemName and (p2.visualItem.visualItemName == ConstantsModule.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE or p2.visualItem.visualItemName == ConstantsModule.DISMISS_SQUAD_NUDGE_BUTTON_TYPE) then
				local Id = p2.notificationData.id
				
				if UseRefResult.current[Id] then
					UseRefResult.current[Id].shouldActWhenDismiss = false
				end
				if not UseIsLoadingChatSettingsResult and not UseIsChatEnabledResult then
					Default:dismissNotification(Id)
					
					return
				end
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				
				if Data.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
					local ACCEPTPARTYINVITEACTION = nil
					local IsNotSquadIdMatch = false
					
					if p2.visualItem.visualItemName == ConstantsModule.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE then
						ACCEPTPARTYINVITEACTION = ConstantsModule.ACCEPT_PARTY_INVITE_ACTION
						Default:dismissNotification(Id)
						UseResult1(Id, SquadToastActionsAndStatesModule.PartyNudgeAccept)
						IsNotSquadIdMatch = p1.currentSquadId ~= "" and Data.squadId ~= p1.currentSquadId
					elseif p2.visualItem.visualItemName == ConstantsModule.DISMISS_SQUAD_NUDGE_BUTTON_TYPE then
						ACCEPTPARTYINVITEACTION = ConstantsModule.REJECT_PARTY_INVITE_ACTION
						UseResult1(Id, SquadToastActionsAndStatesModule.PartyNudgeButtonDismiss)
					end
					if ACCEPTPARTYINVITEACTION then
						UseDispatchResult(ActOnPartyNudgeModule(ACCEPTPARTYINVITEACTION, Data.nudgeId, IsNotSquadIdMatch, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, UseIsChatEnabledResult, if UseRefResult.current[Id] then UseRefResult.current[Id].partyAttemptId else nil)):andThen(function() --[[ Line: 354 ]]
							-- upvalues: ACCEPTPARTYINVITEACTION (ref), ConstantsModule (upval), UseResult (upval), Data (copy)
							if ACCEPTPARTYINVITEACTION == ConstantsModule.ACCEPT_PARTY_INVITE_ACTION then
								UseResult(tonumber(Data.inviterUserId) or 0, tonumber(Data.inviteeUserId) or 0)
							end
						end)
					end
				end
			end
		end)
		
		return function() --[[ Line: 368 ]]
			-- upvalues: RegisterResult (copy), RegisterResult1 (copy)
			if RegisterResult then
				RegisterResult()
			end
			if RegisterResult1 then
				RegisterResult1()
			end
		end
	end, {
		UseResult1, UseIsChatEnabledResult, UseContextResult,
		UseIsLoadingChatSettingsResult, UseContextResult.setSquadPrompt,
		UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation,
		p1.currentSquadId, p1.currentParentChannelId, UseResult,
		UseLocalizationResult.snoozeTitle, UseLocalizationResult.snoozeDescription
	})
	ReactModule.useEffect(function() --[[ Line: 392 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), UseIsLoadingChatSettingsResult (copy), UseIsChatEnabledResult (copy), Default (upval), HttpService (upval), ConstantsModule (upval), p1 (copy), UseRefResult (copy), UseResult1 (copy), SquadToastActionsAndStatesModule (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadStartPartyPrompt, function(p2) --[[ Line: 396 ]]
			-- upvalues: UseIsLoadingChatSettingsResult (upval), UseIsChatEnabledResult (upval), Default (upval), HttpService (upval), ConstantsModule (upval), p1 (upval), UseRefResult (upval), UseResult1 (upval), SquadToastActionsAndStatesModule (upval)
			local ActionEventParams = p2.state.visualItems.button[1].actionEventParams
			local Id = p2.id
			
			if not UseIsLoadingChatSettingsResult and not UseIsChatEnabledResult then
				Default:dismissNotification(Id)
				
				return
			end
			local Flag = false
			local Flag1 = true
			local ShouldActWhenDismiss = true
			local Data = HttpService:JSONDecode(ActionEventParams)
			
			if Data.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
				if p1.currentSquadId == "" then
					if game.JobId == "" or Data.gameInstanceId ~= game.JobId then
						Flag = true
						Flag1 = false
						ShouldActWhenDismiss = false
					end
				else
					Flag = true
				end
			end
			if Flag1 then
				UseRefResult.current[Id] = {
					toastType = p2.notificationType,
					partyAttemptId = HttpService:GenerateGUID(false),
					shouldActWhenDismiss = ShouldActWhenDismiss,
					nudgeId = Data.nudgeId,
					nudgeType = Data.nudgeType
				}
				UseResult1(Id, SquadToastActionsAndStatesModule.PartyNudgeDisplay)
			end
			if Flag then
				Default:dismissNotification(Id)
			end
		end)
		local RegisterResult1 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadNudgeInvite, function(p2) --[[ Line: 445 ]]
			-- upvalues: UseIsLoadingChatSettingsResult (upval), UseIsChatEnabledResult (upval), Default (upval), HttpService (upval), ConstantsModule (upval), p1 (upval), UseRefResult (upval), UseResult1 (upval), SquadToastActionsAndStatesModule (upval)
			local ActionEventParams = p2.state.visualItems.button[1].actionEventParams
			local Id = p2.id
			
			if not UseIsLoadingChatSettingsResult and not UseIsChatEnabledResult then
				Default:dismissNotification(Id)
				
				return
			end
			local Data = HttpService:JSONDecode(ActionEventParams)
			
			if Data.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p1.currentSquadId ~= "" and p1.currentSquadId == Data.squadId then
				Default:dismissNotification(Id)
				
				return
			else
				UseRefResult.current[Id] = {
					shouldActWhenDismiss = true,
					toastType = p2.notificationType,
					partyAttemptId = HttpService:GenerateGUID(false),
					nudgeId = Data.nudgeId,
					nudgeType = Data.nudgeType
				}
				UseResult1(Id, SquadToastActionsAndStatesModule.PartyNudgeDisplay)
			end
		end)
		
		return function() --[[ Line: 473 ]]
			-- upvalues: RegisterResult (copy), RegisterResult1 (copy)
			if RegisterResult then
				RegisterResult()
			end
			if RegisterResult1 then
				RegisterResult1()
			end
		end
	end, {
		UseIsChatEnabledResult,
		UseResult1,
		UseIsLoadingChatSettingsResult,
		p1.currentSquadId
	})
	ReactModule.useEffect(function() --[[ Line: 484 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), ConstantsModule (upval), NotificationTypeEnum (upval), Default (upval)
		if p1.currentSquadId ~= "" then
			for i, value in UseRefResult.current do
				if value and value.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and value.toastType == NotificationTypeEnum.SquadStartPartyPrompt then
					Default:dismissNotification(i)
				end
			end
		end
	end, { p1.currentSquadId })
	
	return nil
end