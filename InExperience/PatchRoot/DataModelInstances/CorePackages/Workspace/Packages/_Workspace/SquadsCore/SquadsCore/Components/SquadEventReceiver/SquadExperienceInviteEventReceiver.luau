local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local messageBusService = game:GetService("MessageBusService")
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local squadToastActionsAndStatesModule = require(squadsCore.Enums.SquadToastActionsAndStates)
local squadToastTypeModule = require(squadsCore.Enums.SquadToastType)
local loggerModule = require(squadsCore.Logger)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local useCurrentSquadParentChannelIdModule = require(squadsCore.Hooks.useCurrentSquadParentChannelId)
local cryoModule = require(parent.Cryo)
local experienceServiceModule = require(parent.ExperienceService)
local localStorageKey = require(parent.LocalStorage).Enums.LocalStorageKey
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local sharedFlagsModule = require(parent.SharedFlags)
local soundManagerModule = require(parent.SoundManager)
local squadCoordinationExperienceJoinExperimentation = require(parent.SocialExperiments).SquadCoordinationExperienceJoinExperimentation
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local luauPolyfillModule = require(parent.LuauPolyfill)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local gameParams = experienceServiceModule.GameParams
local experienceService = experienceServiceModule.ExperienceService
local clearInterval = luauPolyfillModule.clearInterval
local setInterval = luauPolyfillModule.setInterval
local experienceInviteState = roduxSquadsModule.Enums.ExperienceInviteState
local experienceInviteVoteType = roduxSquadsModule.Enums.ExperienceInviteVoteType
local experienceInviteType = roduxSquadsModule.Enums.ExperienceInviteType
local sounds = soundManagerModule.Sounds
local soundManager = soundManagerModule.SoundManager
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local squadExperienceInvitePollingIntervalSeconds = game:DefineFastInt("SquadExperienceInvitePollingIntervalSeconds", 4)
local squadExperienceInviteTimeoutSeconds = game:DefineFastInt("SquadExperienceInviteTimeoutSeconds", 30)
local fFlagDebugSquadLogsEnabled = sharedFlagsModule.FFlagDebugSquadLogsEnabled
local fFlagSquadLaunchExperienceMobileFix = sharedFlagsModule.FFlagSquadLaunchExperienceMobileFix
local fFlagEnablePrivatePartyAcceptInvite = sharedFlagsModule.FFlagEnablePrivatePartyAcceptInvite
local toastNotificationsMessageId = messageBusService:GetMessageId("ToastNotifications", "userActionOnToastNotification")

local _ = function(p1)
	-- upvalues: fFlagDebugSquadLogsEnabled (ref), httpService (ref)
	return if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p1) elseif p1.StatusCode then p1.StatusCode else -1
end

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContextModule (ref), appStorageService (ref), localStorageKey (ref), toastNotificationsProtocolModule (ref), useSelector (ref), useCurrentSquadParentChannelIdModule (ref), experienceInviteVoteType (ref), roduxSquadsModule (ref), networkingSquadsModule (ref), loggerModule (ref), fFlagDebugSquadLogsEnabled (ref), httpService (ref), eventNamesModule (ref), cryoModule (ref), squadCoordinationExperienceJoinExperimentation (ref), squadExperienceInviteTimeoutSeconds (ref), experienceInviteState (ref), fFlagEnablePrivatePartyAcceptInvite (ref), experienceInviteType (ref), squadLocationEnumModule (ref), fFlagSquadLaunchExperienceMobileFix (ref), gameParams (ref), experienceService (ref), squadExperienceInvitePollingIntervalSeconds (ref), setInterval (ref), clearInterval (ref), serializeTableModule (ref), squadToastActionsAndStatesModule (ref), squadToastTypeModule (ref), realtimeDeliveryModule (ref), notificationTypeEnum (ref), messageBusService (ref), toastNotificationsMessageId (ref), lifecycleEvents (ref), soundManager (ref), sounds (ref)
	local var1 = useDispatch()
	local var2 = tonumber(useLocalUserId()) or 0
	local var3 = reactModule.useContext(squadExternalContractContextModule)
	local var4, var5 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: appStorageService (copy), localStorageKey (copy), var5 (ref)
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), localStorageKey (copy)
			return appStorageService:GetItem(localStorageKey.BrowserTrackerId)
		end)
		
		if ok then
			var5(status)
		end
		local itemWasSetConnection = appStorageService.ItemWasSet:Connect(function(p2, p3)
			-- upvalues: localStorageKey (copy), var5 (copy)
			if p2 == localStorageKey.BrowserTrackerId then
				var5(p3)
			end
		end)
		
		return function()
			-- upvalues: itemWasSetConnection (ref)
			itemWasSetConnection:Disconnect()
		end
	end, { var5 })
	local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default
	local var6 = reactModule.useRef(false)
	local var7 = useSelector(reactModule.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var8 = useCurrentSquadParentChannelIdModule()
	local model = var7 and var7.model
	local var9 = if model then model.experienceInviteId else ""
	local var10 = if model then model.state else ""
	local var11 = if model then model.experienceDetail.gameInstanceId else ""
	local var12 = if model then model.experienceDetail.placeId else 0
	local var13 = if model then model.inviterId else 0
	local var14, var15 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), experienceInviteVoteType (copy), var2 (ref), var4 (ref)
		if var7 and var7.model then
			for i, v in ipairs(var7.model.votes) do
				if v.userId == var2 then
					return v.voteType, if v.voteIdentifier and v.voteIdentifier ~= "" then v.voteIdentifier ~= var4 else false
				end
			end
			return experienceInviteVoteType.NoVote, false
		elseif var7 and var7.notification.isInviter then
			return experienceInviteVoteType.Accept, false
		end
		return experienceInviteVoteType.Invalid, false
	end, { var7, var2, var4 })
	local var16 = reactModule.useCallback(function(p2, p3)
		-- upvalues: default (ref), var1 (ref), roduxSquadsModule (copy), var6 (ref)
		if p3 then
			default:dismissNotification(p2)
		end
		var1(roduxSquadsModule.Actions.CurrentExperienceInviteDismissed(p2))
		var6.current = false
	end, { var1 })
	local var17 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), networkingSquadsModule (copy), loggerModule (copy), fFlagDebugSquadLogsEnabled (copy), httpService (copy)
		return var1(networkingSquadsModule.GetExperienceInvite.API({ experienceInviteId = p2, membershipEntityId = p3 })):catch(function(p4)
			-- upvalues: loggerModule (copy), fFlagDebugSquadLogsEnabled (copy), httpService (copy), p2 (ref), p3 (ref)
			loggerModule:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p4) elseif p4.StatusCode then p4.StatusCode else -1, p2, p3)
		end)
	end, { var1 })
	local var18 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var8 (ref), var1 (ref), networkingSquadsModule (copy), var4 (ref), var3 (ref), eventNamesModule (copy), cryoModule (copy), httpService (copy), loggerModule (copy), fFlagDebugSquadLogsEnabled (copy)
		local t = {
			parentChannelId = var8,
			experienceInviteId = p2,
			voteType = p3
		}
		
		return var1(networkingSquadsModule.VoteForExperienceInvite.API({
			experienceInviteId = p2,
			membershipEntityId = p4,
			voteIdentifier = var4,
			voteType = p3
		})):andThen(function()
			-- upvalues: var3 (copy), eventNamesModule (copy), cryoModule (copy), t (ref)
			var3.fireSquadAnalytics(eventNamesModule.SquadVoteApiCall, cryoModule.Dictionary.union(t, { isSuccess = true }))
		end):catch(function(p5)
			-- upvalues: httpService (copy), var3 (copy), eventNamesModule (copy), cryoModule (copy), t (ref), loggerModule (copy), fFlagDebugSquadLogsEnabled (copy), p2 (ref), p4 (ref), p3 (ref)
			local body = p5.Body
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), body (ref)
				return httpService:JSONDecode(body)
			end)
			var3.fireSquadAnalytics(eventNamesModule.SquadVoteApiCall, cryoModule.Dictionary.union(t, {
				isSuccess = false,
				errorMessage = if ok then status.errorType else nil,
				errorType = if p5.StatusCode then tostring(p5.StatusCode) else nil
			}))
			loggerModule:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p5) elseif p5.StatusCode then p5.StatusCode else -1, p2, p4, p3)
		end)
	end, { var1, var4 })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), eventNamesModule (copy), var9 (ref), var11 (ref), var12 (ref), var13 (ref), var10 (ref), var8 (ref)
		var3.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteStateChange, {
			experienceInviteId = var9,
			invitationGameInstanceId = var11,
			invitationPlaceId = var12,
			inviterId = var13,
			inviteState = var10,
			parentChannelId = var8,
			joinAttemptId = p2
		})
	end, {
		var11, var9, var13, var12, var10, var8,
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then var3.fireSquadAnalytics else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), squadExperienceInviteTimeoutSeconds (copy), var16 (ref)
		local var20 = if var7 then task.delay(squadExperienceInviteTimeoutSeconds, function()
			-- upvalues: var16 (copy), var7 (copy)
			var16(var7.notification.notificationId, true)
		end) else nil
		
		return function()
			-- upvalues: var20 (write)
			if var20 then
				task.cancel(var20)
			end
		end
	end, { var16, var7 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var14 (ref), experienceInviteVoteType (copy), var6 (ref), experienceInviteState (copy), fFlagEnablePrivatePartyAcceptInvite (copy), experienceInviteType (copy), loggerModule (copy), var16 (ref), var3 (ref), squadLocationEnumModule (copy), fFlagSquadLaunchExperienceMobileFix (copy), squadCoordinationExperienceJoinExperimentation (copy), httpService (copy), var19 (ref), gameParams (copy), experienceService (copy)
		if not var7 or var14 ~= experienceInviteVoteType.Accept or var6.current then return end
		local model = var7.model
		local notification = var7.notification
		
		if not model or model.state ~= experienceInviteState.ReservationSuccessful then return end
		local gameInstanceId = model.experienceDetail.gameInstanceId
		local placeId = model.experienceDetail.placeId
		
		if not fFlagEnablePrivatePartyAcceptInvite or var7.model.inviteType ~= experienceInviteType.PlayWithPartyInPrivatePartyServer then
			assert(gameInstanceId, "Game instance id should exist.")
		end
		var6.current = true
		loggerModule:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", gameInstanceId, placeId)
		local delayedThread = task.delay(1, function()
			-- upvalues: var16 (copy), notification (ref), var3 (copy), squadLocationEnumModule (copy), fFlagSquadLaunchExperienceMobileFix (copy), squadCoordinationExperienceJoinExperimentation (copy), httpService (copy), var19 (copy), gameParams (copy), placeId (ref), gameInstanceId (ref), fFlagEnablePrivatePartyAcceptInvite (copy), var7 (copy), experienceInviteType (copy), experienceService (copy)
			var16(notification.notificationId, true)
			
			if var3.squadLocation == squadLocationEnumModule.InExperience and fFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local var20 = "SquadExperienceInvite"
			
			if var3.squadLocation == squadLocationEnumModule.UniversalApp then
				var20 = "SquadExperienceInviteFromUA"
			elseif var3.squadLocation == squadLocationEnumModule.InExperience then
				var20 = "SquadExperienceInviteFromInExp"
			end
			local var21 = nil
			
			if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				var21 = httpService:GenerateGUID(false)
				var19(var21)
			end
			local var22 = gameParams.fromPlaceInstance(placeId, gameInstanceId)
			
			if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				var22.joinAttemptId = var21
			end
			if fFlagEnablePrivatePartyAcceptInvite and var7.model.inviteType == experienceInviteType.PlayWithPartyInPrivatePartyServer then
				var22.isPrivateParty = true
			end
			experienceService:LaunchExperience(var22, var20, nil)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {
		var3.squadLocation,
		var7,
		var16,
		var14,
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then var19 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: squadExperienceInvitePollingIntervalSeconds (copy), var7 (ref), experienceInviteState (copy), setInterval (copy), var17 (ref), clearInterval (copy)
		local var20 = if var7 and (not var7.model or var7.model.state == experienceInviteState.Active or var7.model.state == experienceInviteState.Reserving) then setInterval(function()
			-- upvalues: var17 (copy), var7 (copy)
			var17(var7.notification.experienceInviteId, var7.notification.membershipEntityId)
		end, squadExperienceInvitePollingIntervalSeconds * 1000) else nil
		
		return function()
			-- upvalues: var20 (write), clearInterval (copy)
			if var20 then
				clearInterval(var20)
			end
		end
	end, { var7, var17 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p1 (ref), var15 (ref), var16 (ref)
		if var7 and (p1.currentSquadId ~= var7.notification.membershipEntityId or var15) then
			var16(var7.notification.notificationId, true)
		end
	end, { var7, var16, p1.currentSquadId, var15 })
	reactModule.useEffect(function()
		-- upvalues: experienceInviteState (copy), var10 (ref), squadCoordinationExperienceJoinExperimentation (copy), var19 (ref)
		if experienceInviteState[var10] then
			if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				if experienceInviteState[var10] == experienceInviteState.ReservationSuccessful then
					return
				else
					var19()
					
					return
				end
			else
				var19()
			end
		end
	end, { var10, var19 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), loggerModule (copy), serializeTableModule (copy), var2 (ref), experienceInviteState (copy), default (ref), var16 (ref), var14 (ref), experienceInviteVoteType (copy), var3 (ref), eventNamesModule (copy), var8 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy)
		if not var7 or not var7.model then return end
		loggerModule:debug("Current experience invite updated: {}", serializeTableModule(var7.model))
		local notificationId = var7.notification.notificationId
		local state = var7.model.state
		
		if var7.model.inviterId == var2 then
			if state == experienceInviteState.Active then
				if var7.model.spotsTaken > 1 then
					default:updateNotification(notificationId, var7.model.spotsTaken .. "SpotsFilled")
					
					return
				end
			elseif state == experienceInviteState.Reserving or state == experienceInviteState.ReservationSuccessful then
				default:updateNotification(notificationId, "launching")
				
				return
			end
			var16(notificationId, true)
			
			if state == experienceInviteState.Cancelled or state == experienceInviteState.ReservationFailed then
				return
			else
				loggerModule:warning("Invitee unexpected squad experience invite state: {}", state)
				
				return
			end
		elseif state == experienceInviteState.Active then
			if var14 == experienceInviteVoteType.Invalid or var14 == experienceInviteVoteType.NoVote then
				if var7.model.totalSpots <= var7.model.spotsTaken then
					var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
						parentChannelId = var8,
						experienceInviteId = var7.model.experienceInviteId,
						toastAction = squadToastActionsAndStatesModule.ExpInvSlotsFull,
						toastType = squadToastTypeModule.ExperienceInvite
					})
					default:updateNotification(notificationId, "slotsFull")
					
					return
				end
			elseif var14 == experienceInviteVoteType.Accept then
				default:updateNotification(notificationId, "waiting")
				
				return
			elseif var14 == experienceInviteVoteType.Decline or var14 == experienceInviteVoteType.Dismiss then
				var16(notificationId, true)
				
				return
			end
		elseif state == experienceInviteState.Reserving or state == experienceInviteState.ReservationSuccessful then
			if var14 == experienceInviteVoteType.Invalid or var14 == experienceInviteVoteType.NoVote then
				var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var8,
					experienceInviteId = var7.model.experienceInviteId,
					toastAction = squadToastActionsAndStatesModule.ExpInvExpired,
					toastType = squadToastTypeModule.ExperienceInvite
				})
				default:updateNotification(notificationId, "expired")
				
				return
			elseif var14 == experienceInviteVoteType.Accept then
				default:updateNotification(notificationId, "waiting")
				
				return
			elseif var14 == experienceInviteVoteType.Decline or var14 == experienceInviteVoteType.Dismiss then
				var16(notificationId, true)
				
				return
			end
		elseif state == experienceInviteState.Cancelled then
			default:updateNotification(notificationId, "cancelled")
			
			return
		end
		var16(notificationId, true)
		
		if state ~= experienceInviteState.ReservationFailed then
			loggerModule:warning("Inviter unexpected squad experience invite state: {}", state)
		end
	end, {
		var7, var8, var16, var2, var3.fireSquadAnalytics, var14
	})
	realtimeDeliveryModule.useRealtimeNamespace("ExperienceInviteUpdate", function(p2)
		-- upvalues: loggerModule (copy), serializeTableModule (copy), var1 (ref), roduxSquadsModule (copy)
		loggerModule:debug("Experience invite RTN received. Detail: {}", serializeTableModule(p2))
		var1(roduxSquadsModule.Actions.CurrentExperienceInviteUpdated(p2))
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: default (ref), var7 (ref), var14 (ref), experienceInviteVoteType (copy), var16 (ref), experienceInviteState (copy), var3 (ref), eventNamesModule (copy), var8 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var18 (ref)
		local var20 = default:listenToDismissNotification(function(p2)
			-- upvalues: var7 (copy), var14 (copy), experienceInviteVoteType (copy), var16 (copy), experienceInviteState (copy), var3 (copy), eventNamesModule (copy), var8 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var18 (copy)
			if var7 and var7.notification.notificationId == p2.notificationId then
				if var14 ~= experienceInviteVoteType.Accept then
					var16(p2.notificationId, false)
				end
				if (not var7.model or var7.model.state == experienceInviteState.Active) and (var14 == experienceInviteVoteType.Invalid or var14 == experienceInviteVoteType.NoVote) then
					var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
						parentChannelId = var8,
						experienceInviteId = var7.notification.experienceInviteId,
						toastAction = squadToastActionsAndStatesModule.ExpInvDismiss,
						toastType = squadToastTypeModule.ExperienceInvite
					})
					var18(var7.notification.experienceInviteId, experienceInviteVoteType.Dismiss, var7.notification.membershipEntityId)
				end
			end
		end)
		
		return function()
			-- upvalues: var20 (ref)
			if var20 then
				var20:Disconnect()
			end
		end
	end, {
		var7, var8, var16, var1, var3.fireSquadAnalytics, var14, var18
	})
	reactModule.useEffect(function()
		-- upvalues: default (ref), var2 (ref), notificationTypeEnum (copy), httpService (copy), var1 (ref), roduxSquadsModule (copy)
		local var20 = default:listenToDisplayNotification(function(p2)
			-- upvalues: var2 (copy), notificationTypeEnum (copy), httpService (copy), var1 (copy), roduxSquadsModule (copy)
			if not p2 then return end
			if var2 <= 0 then return end
			if p2.notificationType == notificationTypeEnum.SquadExperienceInvitation then
				local lifecycleData = httpService:JSONDecode(p2.lifecycleData)
				var1(roduxSquadsModule.Actions.CurrentExperienceInviteReceived(lifecycleData.experienceInviteId, lifecycleData.membershipEntityId, p2.notificationId, lifecycleData.isInviter))
			end
		end)
		
		return function()
			-- upvalues: var20 (ref)
			if var20 then
				var20:Disconnect()
			end
		end
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: messageBusService (copy), toastNotificationsMessageId (copy), notificationTypeEnum (copy), var7 (ref), httpService (copy), var1 (ref), roduxSquadsModule (copy), default (ref), experienceInviteState (copy), var14 (ref), experienceInviteVoteType (copy)
		local var20 = messageBusService:Subscribe(toastNotificationsMessageId, function(p2)
			-- upvalues: notificationTypeEnum (copy), var7 (copy), httpService (copy), var1 (copy), roduxSquadsModule (copy), default (copy), experienceInviteState (copy), var14 (copy), experienceInviteVoteType (copy)
			if p2.notificationType == notificationTypeEnum.SquadExperienceInvitation and p2.userActionType == "timerElapsed" then
				if not var7 then
					local parameters = httpService:JSONDecode(p2.parameters)
					var1(roduxSquadsModule.Actions.CurrentExperienceInviteReceived(parameters.experienceInviteId, parameters.membershipEntityId, p2.notificationId, parameters.isInviter))
					var1(function()
						-- upvalues: default (copy), p2 (ref)
						default:updateNotification(p2.notificationId, "expired")
					end)
					
					return
				end
				assert(var7, "Experience invite must exist to perform actions.")
				
				if (not var7.model or var7.model.state == experienceInviteState.Active) and (var14 == experienceInviteVoteType.Invalid or var14 == experienceInviteVoteType.NoVote) then
					default:updateNotification(p2.notificationId, "expired")
				end
			end
		end, false, true)
		
		return function()
			-- upvalues: var20 (ref)
			if var20 then
				var20:Disconnect()
			end
		end
	end, { var7, var14, var18 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), var8 (ref), squadToastTypeModule (copy), var7 (ref), var1 (ref), roduxSquadsModule (copy), var3 (ref), eventNamesModule (copy), cryoModule (copy), squadToastActionsAndStatesModule (copy), var18 (ref), experienceInviteVoteType (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadExperienceInvitation, function(p2)
			-- upvalues: httpService (copy), var8 (copy), squadToastTypeModule (copy), var7 (copy), var1 (copy), roduxSquadsModule (copy), var3 (copy), eventNamesModule (copy), cryoModule (copy), squadToastActionsAndStatesModule (copy), var18 (copy), experienceInviteVoteType (copy)
			if p2 and p2.userActionType == "click" and (p2.visualItem and p2.visualItem.actionEventParams) then
				local actionEventParams = httpService:JSONDecode(p2.visualItem.actionEventParams)
				local t = {
					parentChannelId = var8,
					experienceInviteId = actionEventParams.experienceInviteId,
					toastType = squadToastTypeModule.ExperienceInvite
				}
				
				if not var7 then
					var1(roduxSquadsModule.Actions.CurrentExperienceInviteReceived(actionEventParams.experienceInviteId, actionEventParams.membershipEntityId, p2.notificationData.id, actionEventParams.isInviter))
				end
				if p2.visualItem.eventName == "GroupUpSquadExperience" then
					var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, cryoModule.Dictionary.union(t, {
						toastAction = squadToastActionsAndStatesModule.ExpInvAccept
					}))
					var18(actionEventParams.experienceInviteId, experienceInviteVoteType.Accept, actionEventParams.membershipEntityId)
					
					return
				elseif p2.visualItem.eventName == "DismissSquadExperienceInvited" then
					var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, cryoModule.Dictionary.union(t, {
						toastAction = squadToastActionsAndStatesModule.ExpInvDecline
					}))
					var18(actionEventParams.experienceInviteId, experienceInviteVoteType.Decline, actionEventParams.membershipEntityId)
					
					return
				elseif p2.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
					var3.fireSquadAnalytics(eventNamesModule.SquadToastActions, cryoModule.Dictionary.union(t, {
						toastAction = squadToastActionsAndStatesModule.ExpInvCancel
					}))
					var18(actionEventParams.experienceInviteId, experienceInviteVoteType.Cancel, actionEventParams.membershipEntityId)
				end
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {
		var7,
		var8,
		var1,
		var3.fireSquadAnalytics,
		var18
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), var3 (ref), eventNamesModule (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadExperienceInvitation, function(p2)
			-- upvalues: httpService (copy), var3 (copy), eventNamesModule (copy)
			local actionEventParams = p2 and (p2.state and (p2.state.visualItems and (p2.state.visualItems.button and (p2.state.visualItems.button[1] and p2.state.visualItems.button[1].actionEventParams))))
			
			if actionEventParams then
				var3.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteImpression, {
					experienceInviteId = httpService:JSONDecode(actionEventParams).experienceInviteId,
					notificationId = p2.id,
					clientTimestamp = os.time()
				})
			end
		end)
		
		return function()
			-- upvalues: display (ref)
			display()
		end
	end, { var3.fireSquadAnalytics })
	reactModule.useEffect(function()
		-- upvalues: soundManager (copy), sounds (copy), lifecycleEvents (copy), notificationTypeEnum (copy)
		local var20 = function(p2)
			-- upvalues: soundManager (copy), sounds (copy)
			if p2.currentState == "invited" then
				soundManager:PlaySound(sounds.PartyToast.Name)
			end
		end
		
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadExperienceInvitation, var20)
		local update = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Update, notificationTypeEnum.SquadExperienceInvitation, var20)
		
		return function()
			-- upvalues: display (ref), update (ref)
			display()
			update()
		end
	end, {})
	
	return nil
end