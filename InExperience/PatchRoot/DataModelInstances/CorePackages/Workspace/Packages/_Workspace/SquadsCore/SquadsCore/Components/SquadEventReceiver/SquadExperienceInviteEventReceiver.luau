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

local _ = function(p0)
	-- upvalues: fFlagDebugSquadLogsEnabled (ref), httpService (ref)
	return if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p0) elseif p0.StatusCode then p0.StatusCode else -1
end

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), squadExternalContractContextModule (ref), appStorageService (ref), localStorageKey (ref), toastNotificationsProtocolModule (ref), useSelector (ref), useCurrentSquadParentChannelIdModule (ref), experienceInviteVoteType (ref), roduxSquadsModule (ref), networkingSquadsModule (ref), loggerModule (ref), fFlagDebugSquadLogsEnabled (ref), httpService (ref), eventNamesModule (ref), cryoModule (ref), squadCoordinationExperienceJoinExperimentation (ref), squadExperienceInviteTimeoutSeconds (ref), experienceInviteState (ref), fFlagEnablePrivatePartyAcceptInvite (ref), experienceInviteType (ref), squadLocationEnumModule (ref), fFlagSquadLaunchExperienceMobileFix (ref), gameParams (ref), experienceService (ref), squadExperienceInvitePollingIntervalSeconds (ref), setInterval (ref), clearInterval (ref), serializeTableModule (ref), squadToastActionsAndStatesModule (ref), squadToastTypeModule (ref), realtimeDeliveryModule (ref), notificationTypeEnum (ref), messageBusService (ref), toastNotificationsMessageId (ref), lifecycleEvents (ref), soundManager (ref), sounds (ref)
	local var26 = useDispatch()
	local var27 = tonumber(useLocalUserId()) or 0
	local var28 = reactModule.useContext(squadExternalContractContextModule)
	local var29, var30 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: appStorageService (copy), localStorageKey (copy), var30 (ref)
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), localStorageKey (copy)
			return appStorageService:GetItem(localStorageKey.BrowserTrackerId)
		end)
		
		if ok then
			var30(status)
		end
		local itemWasSetConnection = appStorageService.ItemWasSet:Connect(function(p2, p3)
			-- upvalues: localStorageKey (copy), var30 (copy)
			if p2 == localStorageKey.BrowserTrackerId then
				var30(p3)
			end
		end)
		
		return function()
			-- upvalues: itemWasSetConnection (ref)
			itemWasSetConnection:Disconnect()
		end
	end, { var30 })
	local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default
	local var31 = reactModule.useRef(false)
	local var32 = useSelector(reactModule.useCallback(function(p4)
		return if p4.Squad and p4.Squad.Squad then p4.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var33 = useCurrentSquadParentChannelIdModule()
	local model = var32 and var32.model
	local var35 = if model then model.experienceInviteId else ""
	local var36 = if model then model.state else ""
	local var37 = if model then model.experienceDetail.gameInstanceId else ""
	local var38 = if model then model.experienceDetail.placeId else 0
	local var39 = if model then model.inviterId else 0
	local var40, var41 = reactModule.useMemo(function()
		-- upvalues: var32 (ref), experienceInviteVoteType (copy), var27 (ref), var29 (ref)
		if var32 and var32.model then
			for i, v in ipairs(var32.model.votes) do
				if v.userId == var27 then
					return v.voteType, if v.voteIdentifier and v.voteIdentifier ~= "" then v.voteIdentifier ~= var29 else false
				end
			end
			return experienceInviteVoteType.NoVote, false
		elseif var32 and var32.notification.isInviter then
			return experienceInviteVoteType.Accept, false
		end
		return experienceInviteVoteType.Invalid, false
	end, { var32, var27, var29 })
	local var42 = reactModule.useCallback(function(p5, p6)
		-- upvalues: default (ref), var26 (ref), roduxSquadsModule (copy), var31 (ref)
		if p6 then
			default:dismissNotification(p5)
		end
		var26(roduxSquadsModule.Actions.CurrentExperienceInviteDismissed(p5))
		var31.current = false
	end, { var26 })
	local var43 = reactModule.useCallback(function(p7, p8)
		-- upvalues: var26 (ref), networkingSquadsModule (copy), loggerModule (copy), fFlagDebugSquadLogsEnabled (copy), httpService (copy)
		return var26(networkingSquadsModule.GetExperienceInvite.API({ experienceInviteId = p7, membershipEntityId = p8 })):catch(function(p9)
			-- upvalues: loggerModule (copy), fFlagDebugSquadLogsEnabled (copy), httpService (copy), p7 (ref), p8 (ref)
			loggerModule:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p9) elseif p9.StatusCode then p9.StatusCode else -1, p7, p8)
		end)
	end, { var26 })
	local var44 = reactModule.useCallback(function(p10, p11, p12)
		-- upvalues: var33 (ref), var26 (ref), networkingSquadsModule (copy), var29 (ref), var28 (ref), eventNamesModule (copy), cryoModule (copy), httpService (copy), loggerModule (copy), fFlagDebugSquadLogsEnabled (copy)
		local t = {
			parentChannelId = var33,
			experienceInviteId = p10,
			voteType = p11
		}
		
		return var26(networkingSquadsModule.VoteForExperienceInvite.API({
			experienceInviteId = p10,
			membershipEntityId = p12,
			voteIdentifier = var29,
			voteType = p11
		})):andThen(function()
			-- upvalues: var28 (copy), eventNamesModule (copy), cryoModule (copy), t (ref)
			var28.fireSquadAnalytics(eventNamesModule.SquadVoteApiCall, cryoModule.Dictionary.union(t, { isSuccess = true }))
		end):catch(function(p13)
			-- upvalues: httpService (copy), var28 (copy), eventNamesModule (copy), cryoModule (copy), t (ref), loggerModule (copy), fFlagDebugSquadLogsEnabled (copy), p10 (ref), p12 (ref), p11 (ref)
			local body = p13.Body
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), body (ref)
				return httpService:JSONDecode(body)
			end)
			var28.fireSquadAnalytics(eventNamesModule.SquadVoteApiCall, cryoModule.Dictionary.union(t, {
				isSuccess = false,
				errorMessage = if ok then status.errorType else nil,
				errorType = if p13.StatusCode then tostring(p13.StatusCode) else nil
			}))
			loggerModule:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p13) elseif p13.StatusCode then p13.StatusCode else -1, p10, p12, p11)
		end)
	end, { var26, var29 })
	local var45 = reactModule.useCallback(function(p14)
		-- upvalues: var28 (ref), eventNamesModule (copy), var35 (ref), var37 (ref), var38 (ref), var39 (ref), var36 (ref), var33 (ref)
		var28.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteStateChange, {
			experienceInviteId = var35,
			invitationGameInstanceId = var37,
			invitationPlaceId = var38,
			inviterId = var39,
			inviteState = var36,
			parentChannelId = var33,
			joinAttemptId = p14
		})
	end, {
		var37, var35, var39, var38, var36, var33,
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then var28.fireSquadAnalytics else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), squadExperienceInviteTimeoutSeconds (copy), var42 (ref)
		local var48 = if var32 then task.delay(squadExperienceInviteTimeoutSeconds, function()
			-- upvalues: var42 (copy), var32 (copy)
			var42(var32.notification.notificationId, true)
		end) else nil
		
		return function()
			-- upvalues: var48 (write)
			if var48 then
				task.cancel(var48)
			end
		end
	end, { var42, var32 })
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), var40 (ref), experienceInviteVoteType (copy), var31 (ref), experienceInviteState (copy), fFlagEnablePrivatePartyAcceptInvite (copy), experienceInviteType (copy), loggerModule (copy), var42 (ref), var28 (ref), squadLocationEnumModule (copy), fFlagSquadLaunchExperienceMobileFix (copy), squadCoordinationExperienceJoinExperimentation (copy), httpService (copy), var45 (ref), gameParams (copy), experienceService (copy)
		if not var32 or var40 ~= experienceInviteVoteType.Accept or var31.current then return end
		local model = var32.model
		local notification = var32.notification
		
		if not model or model.state ~= experienceInviteState.ReservationSuccessful then return end
		local gameInstanceId = model.experienceDetail.gameInstanceId
		local placeId = model.experienceDetail.placeId
		
		if not fFlagEnablePrivatePartyAcceptInvite or var32.model.inviteType ~= experienceInviteType.PlayWithPartyInPrivatePartyServer then
			assert(gameInstanceId, "Game instance id should exist.")
		end
		var31.current = true
		loggerModule:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", gameInstanceId, placeId)
		local delayedThread = task.delay(1, function()
			-- upvalues: var42 (copy), notification (ref), var28 (copy), squadLocationEnumModule (copy), fFlagSquadLaunchExperienceMobileFix (copy), squadCoordinationExperienceJoinExperimentation (copy), httpService (copy), var45 (copy), gameParams (copy), placeId (ref), gameInstanceId (ref), fFlagEnablePrivatePartyAcceptInvite (copy), var32 (copy), experienceInviteType (copy), experienceService (copy)
			var42(notification.notificationId, true)
			
			if var28.squadLocation == squadLocationEnumModule.InExperience and fFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local var50 = "SquadExperienceInvite"
			
			if var28.squadLocation == squadLocationEnumModule.UniversalApp then
				var50 = "SquadExperienceInviteFromUA"
			elseif var28.squadLocation == squadLocationEnumModule.InExperience then
				var50 = "SquadExperienceInviteFromInExp"
			end
			local var51 = nil
			
			if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				var51 = httpService:GenerateGUID(false)
				var45(var51)
			end
			local var52 = gameParams.fromPlaceInstance(placeId, gameInstanceId)
			
			if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				var52.joinAttemptId = var51
			end
			if fFlagEnablePrivatePartyAcceptInvite and var32.model.inviteType == experienceInviteType.PlayWithPartyInPrivatePartyServer then
				var52.isPrivateParty = true
			end
			experienceService:LaunchExperience(var52, var50, nil)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {
		var28.squadLocation,
		var32,
		var42,
		var40,
		if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then var45 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: squadExperienceInvitePollingIntervalSeconds (copy), var32 (ref), experienceInviteState (copy), setInterval (copy), var43 (ref), clearInterval (copy)
		local var53 = if var32 and (not var32.model or var32.model.state == experienceInviteState.Active or var32.model.state == experienceInviteState.Reserving) then setInterval(function()
			-- upvalues: var43 (copy), var32 (copy)
			var43(var32.notification.experienceInviteId, var32.notification.membershipEntityId)
		end, squadExperienceInvitePollingIntervalSeconds * 1000) else nil
		
		return function()
			-- upvalues: var53 (write), clearInterval (copy)
			if var53 then
				clearInterval(var53)
			end
		end
	end, { var32, var43 })
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), p1 (ref), var41 (ref), var42 (ref)
		if var32 and (p1.currentSquadId ~= var32.notification.membershipEntityId or var41) then
			var42(var32.notification.notificationId, true)
		end
	end, { var32, var42, p1.currentSquadId, var41 })
	reactModule.useEffect(function()
		-- upvalues: experienceInviteState (copy), var36 (ref), squadCoordinationExperienceJoinExperimentation (copy), var45 (ref)
		if experienceInviteState[var36] then
			if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				if experienceInviteState[var36] == experienceInviteState.ReservationSuccessful then
					return
				else
					var45()
					
					return
				end
			else
				var45()
			end
		end
	end, { var36, var45 })
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), loggerModule (copy), serializeTableModule (copy), var27 (ref), experienceInviteState (copy), default (ref), var42 (ref), var40 (ref), experienceInviteVoteType (copy), var28 (ref), eventNamesModule (copy), var33 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy)
		if not var32 or not var32.model then return end
		loggerModule:debug("Current experience invite updated: {}", serializeTableModule(var32.model))
		local notificationId = var32.notification.notificationId
		local state = var32.model.state
		
		if var32.model.inviterId == var27 then
			if state == experienceInviteState.Active then
				if var32.model.spotsTaken > 1 then
					default:updateNotification(notificationId, var32.model.spotsTaken .. "SpotsFilled")
					
					return
				end
			elseif state == experienceInviteState.Reserving or state == experienceInviteState.ReservationSuccessful then
				default:updateNotification(notificationId, "launching")
				
				return
			end
			var42(notificationId, true)
			
			if state == experienceInviteState.Cancelled or state == experienceInviteState.ReservationFailed then
				return
			else
				loggerModule:warning("Invitee unexpected squad experience invite state: {}", state)
				
				return
			end
		elseif state == experienceInviteState.Active then
			if var40 == experienceInviteVoteType.Invalid or var40 == experienceInviteVoteType.NoVote then
				if var32.model.totalSpots <= var32.model.spotsTaken then
					var28.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
						parentChannelId = var33,
						experienceInviteId = var32.model.experienceInviteId,
						toastAction = squadToastActionsAndStatesModule.ExpInvSlotsFull,
						toastType = squadToastTypeModule.ExperienceInvite
					})
					default:updateNotification(notificationId, "slotsFull")
					
					return
				end
			elseif var40 == experienceInviteVoteType.Accept then
				default:updateNotification(notificationId, "waiting")
				
				return
			elseif var40 == experienceInviteVoteType.Decline or var40 == experienceInviteVoteType.Dismiss then
				var42(notificationId, true)
				
				return
			end
		elseif state == experienceInviteState.Reserving or state == experienceInviteState.ReservationSuccessful then
			if var40 == experienceInviteVoteType.Invalid or var40 == experienceInviteVoteType.NoVote then
				var28.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = var33,
					experienceInviteId = var32.model.experienceInviteId,
					toastAction = squadToastActionsAndStatesModule.ExpInvExpired,
					toastType = squadToastTypeModule.ExperienceInvite
				})
				default:updateNotification(notificationId, "expired")
				
				return
			elseif var40 == experienceInviteVoteType.Accept then
				default:updateNotification(notificationId, "waiting")
				
				return
			elseif var40 == experienceInviteVoteType.Decline or var40 == experienceInviteVoteType.Dismiss then
				var42(notificationId, true)
				
				return
			end
		elseif state == experienceInviteState.Cancelled then
			default:updateNotification(notificationId, "cancelled")
			
			return
		end
		var42(notificationId, true)
		
		if state ~= experienceInviteState.ReservationFailed then
			loggerModule:warning("Inviter unexpected squad experience invite state: {}", state)
		end
	end, {
		var32, var33, var42, var27, var28.fireSquadAnalytics, var40
	})
	realtimeDeliveryModule.useRealtimeNamespace("ExperienceInviteUpdate", function(p15)
		-- upvalues: loggerModule (copy), serializeTableModule (copy), var26 (ref), roduxSquadsModule (copy)
		loggerModule:debug("Experience invite RTN received. Detail: {}", serializeTableModule(p15))
		var26(roduxSquadsModule.Actions.CurrentExperienceInviteUpdated(p15))
	end, { var26 })
	reactModule.useEffect(function()
		-- upvalues: default (ref), var32 (ref), var40 (ref), experienceInviteVoteType (copy), var42 (ref), experienceInviteState (copy), var28 (ref), eventNamesModule (copy), var33 (ref), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var44 (ref)
		local var54 = default:listenToDismissNotification(function(p16)
			-- upvalues: var32 (copy), var40 (copy), experienceInviteVoteType (copy), var42 (copy), experienceInviteState (copy), var28 (copy), eventNamesModule (copy), var33 (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var44 (copy)
			if var32 and var32.notification.notificationId == p16.notificationId then
				if var40 ~= experienceInviteVoteType.Accept then
					var42(p16.notificationId, false)
				end
				if (not var32.model or var32.model.state == experienceInviteState.Active) and (var40 == experienceInviteVoteType.Invalid or var40 == experienceInviteVoteType.NoVote) then
					var28.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
						parentChannelId = var33,
						experienceInviteId = var32.notification.experienceInviteId,
						toastAction = squadToastActionsAndStatesModule.ExpInvDismiss,
						toastType = squadToastTypeModule.ExperienceInvite
					})
					var44(var32.notification.experienceInviteId, experienceInviteVoteType.Dismiss, var32.notification.membershipEntityId)
				end
			end
		end)
		
		return function()
			-- upvalues: var54 (ref)
			if var54 then
				var54:Disconnect()
			end
		end
	end, {
		var32, var33, var42, var26, var28.fireSquadAnalytics, var40, var44
	})
	reactModule.useEffect(function()
		-- upvalues: default (ref), var27 (ref), notificationTypeEnum (copy), httpService (copy), var26 (ref), roduxSquadsModule (copy)
		local var55 = default:listenToDisplayNotification(function(p17)
			-- upvalues: var27 (copy), notificationTypeEnum (copy), httpService (copy), var26 (copy), roduxSquadsModule (copy)
			if not p17 then return end
			if var27 <= 0 then return end
			if p17.notificationType == notificationTypeEnum.SquadExperienceInvitation then
				local lifecycleData = httpService:JSONDecode(p17.lifecycleData)
				var26(roduxSquadsModule.Actions.CurrentExperienceInviteReceived(lifecycleData.experienceInviteId, lifecycleData.membershipEntityId, p17.notificationId, lifecycleData.isInviter))
			end
		end)
		
		return function()
			-- upvalues: var55 (ref)
			if var55 then
				var55:Disconnect()
			end
		end
	end, { var27 })
	reactModule.useEffect(function()
		-- upvalues: messageBusService (copy), toastNotificationsMessageId (copy), notificationTypeEnum (copy), var32 (ref), httpService (copy), var26 (ref), roduxSquadsModule (copy), default (ref), experienceInviteState (copy), var40 (ref), experienceInviteVoteType (copy)
		local var57 = messageBusService:Subscribe(toastNotificationsMessageId, function(p18)
			-- upvalues: notificationTypeEnum (copy), var32 (copy), httpService (copy), var26 (copy), roduxSquadsModule (copy), default (copy), experienceInviteState (copy), var40 (copy), experienceInviteVoteType (copy)
			if p18.notificationType == notificationTypeEnum.SquadExperienceInvitation and p18.userActionType == "timerElapsed" then
				if not var32 then
					local parameters = httpService:JSONDecode(p18.parameters)
					var26(roduxSquadsModule.Actions.CurrentExperienceInviteReceived(parameters.experienceInviteId, parameters.membershipEntityId, p18.notificationId, parameters.isInviter))
					var26(function()
						-- upvalues: default (copy), p18 (ref)
						default:updateNotification(p18.notificationId, "expired")
					end)
					
					return
				end
				assert(var32, "Experience invite must exist to perform actions.")
				
				if (not var32.model or var32.model.state == experienceInviteState.Active) and (var40 == experienceInviteVoteType.Invalid or var40 == experienceInviteVoteType.NoVote) then
					default:updateNotification(p18.notificationId, "expired")
				end
			end
		end, false, true)
		
		return function()
			-- upvalues: var57 (ref)
			if var57 then
				var57:Disconnect()
			end
		end
	end, { var32, var40, var44 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), var33 (ref), squadToastTypeModule (copy), var32 (ref), var26 (ref), roduxSquadsModule (copy), var28 (ref), eventNamesModule (copy), cryoModule (copy), squadToastActionsAndStatesModule (copy), var44 (ref), experienceInviteVoteType (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.SquadExperienceInvitation, function(p19)
			-- upvalues: httpService (copy), var33 (copy), squadToastTypeModule (copy), var32 (copy), var26 (copy), roduxSquadsModule (copy), var28 (copy), eventNamesModule (copy), cryoModule (copy), squadToastActionsAndStatesModule (copy), var44 (copy), experienceInviteVoteType (copy)
			if p19 and p19.userActionType == "click" and (p19.visualItem and p19.visualItem.actionEventParams) then
				local actionEventParams = httpService:JSONDecode(p19.visualItem.actionEventParams)
				local t = {
					parentChannelId = var33,
					experienceInviteId = actionEventParams.experienceInviteId,
					toastType = squadToastTypeModule.ExperienceInvite
				}
				
				if not var32 then
					var26(roduxSquadsModule.Actions.CurrentExperienceInviteReceived(actionEventParams.experienceInviteId, actionEventParams.membershipEntityId, p19.notificationData.id, actionEventParams.isInviter))
				end
				if p19.visualItem.eventName == "GroupUpSquadExperience" then
					var28.fireSquadAnalytics(eventNamesModule.SquadToastActions, cryoModule.Dictionary.union(t, {
						toastAction = squadToastActionsAndStatesModule.ExpInvAccept
					}))
					var44(actionEventParams.experienceInviteId, experienceInviteVoteType.Accept, actionEventParams.membershipEntityId)
					
					return
				elseif p19.visualItem.eventName == "DismissSquadExperienceInvited" then
					var28.fireSquadAnalytics(eventNamesModule.SquadToastActions, cryoModule.Dictionary.union(t, {
						toastAction = squadToastActionsAndStatesModule.ExpInvDecline
					}))
					var44(actionEventParams.experienceInviteId, experienceInviteVoteType.Decline, actionEventParams.membershipEntityId)
					
					return
				elseif p19.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
					var28.fireSquadAnalytics(eventNamesModule.SquadToastActions, cryoModule.Dictionary.union(t, {
						toastAction = squadToastActionsAndStatesModule.ExpInvCancel
					}))
					var44(actionEventParams.experienceInviteId, experienceInviteVoteType.Cancel, actionEventParams.membershipEntityId)
				end
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {
		var32,
		var33,
		var26,
		var28.fireSquadAnalytics,
		var44
	})
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), var28 (ref), eventNamesModule (copy)
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadExperienceInvitation, function(p20)
			-- upvalues: httpService (copy), var28 (copy), eventNamesModule (copy)
			local actionEventParams = p20 and (p20.state and (p20.state.visualItems and (p20.state.visualItems.button and (p20.state.visualItems.button[1] and p20.state.visualItems.button[1].actionEventParams))))
			
			if actionEventParams then
				var28.fireSquadAnalytics(eventNamesModule.SquadExperienceInviteImpression, {
					experienceInviteId = httpService:JSONDecode(actionEventParams).experienceInviteId,
					notificationId = p20.id,
					clientTimestamp = os.time()
				})
			end
		end)
		
		return function()
			-- upvalues: display (ref)
			display()
		end
	end, { var28.fireSquadAnalytics })
	reactModule.useEffect(function()
		-- upvalues: soundManager (copy), sounds (copy), lifecycleEvents (copy), notificationTypeEnum (copy)
		local var64 = function(p21)
			-- upvalues: soundManager (copy), sounds (copy)
			if p21.currentState == "invited" then
				soundManager:PlaySound(sounds.PartyToast.Name)
			end
		end
		
		local display = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Display, notificationTypeEnum.SquadExperienceInvitation, var64)
		local update = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.Update, notificationTypeEnum.SquadExperienceInvitation, var64)
		
		return function()
			-- upvalues: display (ref), update (ref)
			display()
			update()
		end
	end, {})
	
	return nil
end