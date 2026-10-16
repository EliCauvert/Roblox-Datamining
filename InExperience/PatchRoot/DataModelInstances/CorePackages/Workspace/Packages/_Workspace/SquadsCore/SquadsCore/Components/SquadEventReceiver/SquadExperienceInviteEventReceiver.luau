local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local MessageBusService = game:GetService("MessageBusService")
local SquadLocationEnumModule = require(SquadsCore.Enums.SquadLocationEnum)
local SquadToastActionsAndStatesModule = require(SquadsCore.Enums.SquadToastActionsAndStates)
local SquadToastTypeModule = require(SquadsCore.Enums.SquadToastType)
local LoggerModule = require(SquadsCore.Logger)
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)
local SerializeTableModule = require(SquadsCore.Utils.serializeTable)
local UseCurrentSquadParentChannelIdModule = require(SquadsCore.Hooks.useCurrentSquadParentChannelId)
local GetSquadExperienceInviteStoreModule = require(SquadsCore.Stores.GetSquadExperienceInviteStore)
local CryoModule = require(Parent.Cryo)
local ExperienceServiceModule = require(Parent.ExperienceService)
local LocalStorageKey = require(Parent.LocalStorage).Enums.LocalStorageKey
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local SharedFlagsModule = require(Parent.SharedFlags)
local SoundManagerModule = require(Parent.SoundManager)
local SquadCoordinationExperienceJoinExperimentation = require(Parent.SocialExperiments).SquadCoordinationExperienceJoinExperimentation
local ToastNotificationModule = require(Parent.ToastNotification)
local ToastNotificationsProtocolModule = require(Parent.ToastNotificationsProtocol)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GameParams = ExperienceServiceModule.GameParams
local ExperienceService = ExperienceServiceModule.ExperienceService
local ClearIntervalFunction = LuauPolyfillModule.clearInterval
local SetIntervalFunction = LuauPolyfillModule.setInterval
local ExperienceInviteState = RoduxSquadsModule.Enums.ExperienceInviteState
local ExperienceInviteVoteType = RoduxSquadsModule.Enums.ExperienceInviteVoteType
local ExperienceInviteType = RoduxSquadsModule.Enums.ExperienceInviteType
local Sounds = SoundManagerModule.Sounds
local SoundManager = SoundManagerModule.SoundManager
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local SquadExperienceInvitePollingIntervalSeconds = game:DefineFastInt("SquadExperienceInvitePollingIntervalSeconds", 4)
local SquadExperienceInviteTimeoutSeconds = game:DefineFastInt("SquadExperienceInviteTimeoutSeconds", 30)
local FFlagDebugSquadLogsEnabled = SharedFlagsModule.FFlagDebugSquadLogsEnabled
local FFlagSquadLaunchExperienceMobileFix = SharedFlagsModule.FFlagSquadLaunchExperienceMobileFix
local FFlagEnablePrivatePartyAcceptInvite = SharedFlagsModule.FFlagEnablePrivatePartyAcceptInvite
local FFlagUseSignalsForSquadExperienceInvite = SharedFlagsModule.FFlagUseSignalsForSquadExperienceInvite
local ToastNotificationsMessageId = MessageBusService:GetMessageId("ToastNotifications", "userActionOnToastNotification")

local function _(Input) --[[ Line: 76 ]]
	-- upvalues: FFlagDebugSquadLogsEnabled (copy), HttpService (copy)
	return if FFlagDebugSquadLogsEnabled then HttpService:JSONEncode(Input) elseif Input.StatusCode then Input.StatusCode else -1
end

return function(p1) --[[ Line: 84 ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), AppStorageService (copy), LocalStorageKey (copy), ToastNotificationsProtocolModule (copy), FFlagUseSignalsForSquadExperienceInvite (copy), UseSignalStateFunction (copy), GetSquadExperienceInviteStoreModule (copy), UseSelectorFunction (copy), UseCurrentSquadParentChannelIdModule (copy), ExperienceInviteVoteType (copy), RoduxSquadsModule (copy), NetworkingSquadsModule (copy), LoggerModule (copy), FFlagDebugSquadLogsEnabled (copy), HttpService (copy), EventNamesModule (copy), CryoModule (copy), SquadCoordinationExperienceJoinExperimentation (copy), SquadExperienceInviteTimeoutSeconds (copy), ExperienceInviteState (copy), FFlagEnablePrivatePartyAcceptInvite (copy), ExperienceInviteType (copy), SquadLocationEnumModule (copy), FFlagSquadLaunchExperienceMobileFix (copy), GameParams (copy), ExperienceService (copy), SquadExperienceInvitePollingIntervalSeconds (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), SerializeTableModule (copy), SquadToastActionsAndStatesModule (copy), SquadToastTypeModule (copy), RealtimeDeliveryModule (copy), NotificationTypeEnum (copy), MessageBusService (copy), ToastNotificationsMessageId (copy), LifecycleEvents (copy), SoundManager (copy), Sounds (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	ReactModule.useEffect(function() --[[ Line: 92 ]]
		-- upvalues: AppStorageService (upval), LocalStorageKey (upval), UseStateResult2 (copy)
		local Success, Result = pcall(function() --[[ Line: 94 ]]
			-- upvalues: AppStorageService (upval), LocalStorageKey (upval)
			return AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)
		end)
		
		if Success then
			UseStateResult2(Result)
		end
		local ItemWasSetConnection = AppStorageService.ItemWasSet:Connect(function(BrowserTrackerId, Value) --[[ Line: 101 ]]
			-- upvalues: LocalStorageKey (upval), UseStateResult2 (upval)
			if BrowserTrackerId == LocalStorageKey.BrowserTrackerId then
				UseStateResult2(Value)
			end
		end)
		
		return function() --[[ Line: 106 ]]
			-- upvalues: ItemWasSetConnection (copy)
			ItemWasSetConnection:Disconnect()
		end
	end, { UseStateResult2 })
	local Default = ToastNotificationsProtocolModule.ToastNotificationProtocol.default
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 114 ]]
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentExperienceInvite else nil
	end, {})
	local UseSignalStateResult = if FFlagUseSignalsForSquadExperienceInvite then UseSignalStateFunction(GetSquadExperienceInviteStoreModule(false).getCurrentExperienceInvite) else UseSelectorFunction(UseResult)
	local UseCurrentSquadParentChannelIdModuleResult = UseCurrentSquadParentChannelIdModule()
	local Model = UseSignalStateResult and UseSignalStateResult.model
	local ExperienceInviteId = Model and Model.experienceInviteId or ""
	local State = Model and Model.state or ""
	local GameInstanceId = Model and Model.experienceDetail.gameInstanceId or ""
	local PlaceId = Model and Model.experienceDetail.placeId or 0
	local InviterId = Model and Model.inviterId or 0
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 136 ]]
		-- upvalues: UseSignalStateResult (copy), ExperienceInviteVoteType (upval), Number (copy), UseStateResult (copy)
		if UseSignalStateResult and UseSignalStateResult.model then
			for _, vote in ipairs(UseSignalStateResult.model.votes) do
				if vote.userId == Number then
					return vote.voteType, if vote.voteIdentifier and vote.voteIdentifier ~= "" then vote.voteIdentifier ~= UseStateResult else false
				end
			end
			return ExperienceInviteVoteType.NoVote, false
		elseif UseSignalStateResult and UseSignalStateResult.notification.isInviter then
			return ExperienceInviteVoteType.Accept, false
		else
			return ExperienceInviteVoteType.Invalid, false
		end
	end, { UseSignalStateResult, Number, UseStateResult })
	local UseResult1 = ReactModule.useCallback(function(p2, p3) --[[ Line: 163 ]]
		-- upvalues: Default (copy), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval), UseRefResult (copy)
		if p3 then
			Default:dismissNotification(p2)
		end
		if FFlagUseSignalsForSquadExperienceInvite then
			GetSquadExperienceInviteStoreModule(false).currentExperienceInviteDismissed(p2)
		else
			UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteDismissed(p2))
		end
		UseRefResult.current = false
	end, { UseDispatchResult })
	local UseResult11 = ReactModule.useCallback(function(ExperienceInviteId, MembershipEntityId) --[[ Line: 178 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingSquadsModule (upval), LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval), HttpService (upval)
		return UseDispatchResult(NetworkingSquadsModule.GetExperienceInvite.API({
			experienceInviteId = ExperienceInviteId,
			membershipEntityId = MembershipEntityId
		})):catch(function(Err) --[[ Line: 182 ]]
			-- upvalues: LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval), HttpService (upval), ExperienceInviteId (copy), MembershipEntityId (copy)
			LoggerModule:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if FFlagDebugSquadLogsEnabled then HttpService:JSONEncode(Err) elseif Err.StatusCode then Err.StatusCode else -1, ExperienceInviteId, MembershipEntityId)
		end)
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(ExperienceInviteId, VoteType, MembershipEntityId) --[[ Line: 191 ]]
		-- upvalues: UseCurrentSquadParentChannelIdModuleResult (copy), UseDispatchResult (copy), NetworkingSquadsModule (upval), UseStateResult (copy), UseContextResult (copy), EventNamesModule (upval), CryoModule (upval), HttpService (upval), LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval)
		local config = {
			parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
			experienceInviteId = ExperienceInviteId,
			voteType = VoteType
		}
		
		return UseDispatchResult(NetworkingSquadsModule.VoteForExperienceInvite.API({
			experienceInviteId = ExperienceInviteId,
			membershipEntityId = MembershipEntityId,
			voteIdentifier = UseStateResult,
			voteType = VoteType
		})):andThen(function() --[[ Line: 204 ]]
			-- upvalues: UseContextResult (upval), EventNamesModule (upval), CryoModule (upval), config (copy)
			UseContextResult.fireSquadAnalytics(EventNamesModule.SquadVoteApiCall, CryoModule.Dictionary.union(config, { isSuccess = true }))
		end):catch(function(Err) --[[ Line: 212 ]]
			-- upvalues: HttpService (upval), UseContextResult (upval), EventNamesModule (upval), CryoModule (upval), config (copy), LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval), ExperienceInviteId (copy), MembershipEntityId (copy), VoteType (copy)
			local Body = Err.Body
			local Success, Result = pcall(function() --[[ Line: 214 ]]
				-- upvalues: HttpService (upval), Body (copy)
				return HttpService:JSONDecode(Body)
			end)
			UseContextResult.fireSquadAnalytics(EventNamesModule.SquadVoteApiCall, CryoModule.Dictionary.union(config, {
				isSuccess = false,
				errorMessage = if Success then Result.errorType else nil,
				errorType = if Err.StatusCode then tostring(Err.StatusCode) else nil
			}))
			LoggerModule:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if FFlagDebugSquadLogsEnabled then HttpService:JSONEncode(Err) elseif Err.StatusCode then Err.StatusCode else -1, ExperienceInviteId, MembershipEntityId, VoteType)
		end)
	end, { UseDispatchResult, UseStateResult })
	local UseResult3 = ReactModule.useCallback(function(JoinAttemptId) --[[ Line: 239 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), ExperienceInviteId (copy), GameInstanceId (copy), PlaceId (copy), InviterId (copy), State (copy), UseCurrentSquadParentChannelIdModuleResult (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.SquadExperienceInviteStateChange, {
			experienceInviteId = ExperienceInviteId,
			invitationGameInstanceId = GameInstanceId,
			invitationPlaceId = PlaceId,
			inviterId = InviterId,
			inviteState = State,
			parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
			joinAttemptId = JoinAttemptId
		})
	end, {
		GameInstanceId, ExperienceInviteId, InviterId, PlaceId, State,
		UseCurrentSquadParentChannelIdModuleResult,
		if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then UseContextResult.fireSquadAnalytics else nil
	})
	ReactModule.useEffect(function() --[[ Line: 264 ]]
		-- upvalues: UseSignalStateResult (copy), SquadExperienceInviteTimeoutSeconds (upval), UseResult1 (copy)
		local DelayedThread = if UseSignalStateResult then task.delay(SquadExperienceInviteTimeoutSeconds, function() --[[ Line: 267 ]]
			-- upvalues: UseResult1 (upval), UseSignalStateResult (upval)
			UseResult1(UseSignalStateResult.notification.notificationId, true)
		end) else nil
		
		return function() --[[ Line: 271 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { UseResult1, UseSignalStateResult })
	ReactModule.useEffect(function() --[[ Line: 279 ]]
		-- upvalues: UseSignalStateResult (copy), UseMemoResult (copy), ExperienceInviteVoteType (upval), UseRefResult (copy), ExperienceInviteState (upval), FFlagEnablePrivatePartyAcceptInvite (upval), ExperienceInviteType (upval), LoggerModule (upval), UseResult1 (copy), UseContextResult (copy), SquadLocationEnumModule (upval), FFlagSquadLaunchExperienceMobileFix (upval), SquadCoordinationExperienceJoinExperimentation (upval), HttpService (upval), UseResult3 (copy), GameParams (upval), ExperienceService (upval)
		if not UseSignalStateResult or UseMemoResult ~= ExperienceInviteVoteType.Accept or UseRefResult.current then return end
		local Model = UseSignalStateResult.model
		local Notification = UseSignalStateResult.notification
		
		if not Model or Model.state ~= ExperienceInviteState.ReservationSuccessful then return end
		local GameInstanceId = Model.experienceDetail.gameInstanceId
		local PlaceId = Model.experienceDetail.placeId
		
		if not FFlagEnablePrivatePartyAcceptInvite or UseSignalStateResult.model.inviteType ~= ExperienceInviteType.PlayWithPartyInPrivatePartyServer then
			assert(GameInstanceId, "Game instance id should exist.")
		end
		UseRefResult.current = true
		LoggerModule:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", GameInstanceId, PlaceId)
		local DelayedThread = task.delay(1, function() --[[ Line: 306 ]]
			-- upvalues: UseResult1 (upval), Notification (copy), UseContextResult (upval), SquadLocationEnumModule (upval), FFlagSquadLaunchExperienceMobileFix (upval), SquadCoordinationExperienceJoinExperimentation (upval), HttpService (upval), UseResult3 (upval), GameParams (upval), PlaceId (copy), GameInstanceId (copy), FFlagEnablePrivatePartyAcceptInvite (upval), UseSignalStateResult (upval), ExperienceInviteType (upval), ExperienceService (upval)
			UseResult1(Notification.notificationId, true)
			
			if UseContextResult.squadLocation == SquadLocationEnumModule.InExperience and FFlagSquadLaunchExperienceMobileFix then
				game:Shutdown()
			end
			local SquadExperienceInviteFromUA: string = if UseContextResult.squadLocation == SquadLocationEnumModule.UniversalApp then "SquadExperienceInviteFromUA" elseif UseContextResult.squadLocation == SquadLocationEnumModule.InExperience then "SquadExperienceInviteFromInExp" else "SquadExperienceInvite"
			local Guid = nil
			
			if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				Guid = HttpService:GenerateGUID(false)
				UseResult3(Guid)
			end
			local FromPlaceInstanceResult = GameParams.fromPlaceInstance(PlaceId, GameInstanceId)
			
			if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				FromPlaceInstanceResult.joinAttemptId = Guid
			end
			if FFlagEnablePrivatePartyAcceptInvite and UseSignalStateResult.model.inviteType == ExperienceInviteType.PlayWithPartyInPrivatePartyServer then
				FromPlaceInstanceResult.isPrivateParty = true
			end
			ExperienceService:LaunchExperience(FromPlaceInstanceResult, SquadExperienceInviteFromUA, nil)
		end)
		
		return function() --[[ Line: 341 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, {
		UseContextResult.squadLocation,
		UseSignalStateResult,
		UseResult1,
		UseMemoResult,
		if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then UseResult3 else nil
	})
	ReactModule.useEffect(function() --[[ Line: 357 ]]
		-- upvalues: SquadExperienceInvitePollingIntervalSeconds (upval), UseSignalStateResult (copy), ExperienceInviteState (upval), SetIntervalFunction (upval), UseResult11 (copy), ClearIntervalFunction (upval)
		local SetIntervalResult = if UseSignalStateResult and (not UseSignalStateResult.model or UseSignalStateResult.model.state == ExperienceInviteState.Active or UseSignalStateResult.model.state == ExperienceInviteState.Reserving) then SetIntervalFunction(function() --[[ Line: 368 ]]
			-- upvalues: UseResult11 (upval), UseSignalStateResult (upval)
			UseResult11(UseSignalStateResult.notification.experienceInviteId, UseSignalStateResult.notification.membershipEntityId)
		end, SquadExperienceInvitePollingIntervalSeconds * 1000) else nil
		
		return function() --[[ Line: 376 ]]
			-- upvalues: SetIntervalResult (ref), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, { UseSignalStateResult, UseResult11 })
	ReactModule.useEffect(function() --[[ Line: 385 ]]
		-- upvalues: UseSignalStateResult (copy), p1 (copy), UseMemoResult2 (copy), UseResult1 (copy)
		if UseSignalStateResult and (p1.currentSquadId ~= UseSignalStateResult.notification.membershipEntityId or UseMemoResult2) then
			UseResult1(UseSignalStateResult.notification.notificationId, true)
		end
	end, {
		UseSignalStateResult,
		UseResult1,
		p1.currentSquadId,
		UseMemoResult2
	})
	ReactModule.useEffect(function() --[[ Line: 395 ]]
		-- upvalues: ExperienceInviteState (upval), State (copy), SquadCoordinationExperienceJoinExperimentation (upval), UseResult3 (copy)
		if ExperienceInviteState[State] then
			if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				UseResult3()
			elseif ExperienceInviteState[State] ~= ExperienceInviteState.ReservationSuccessful then
				UseResult3()
				
				return
			end
		end
	end, { State, UseResult3 })
	ReactModule.useEffect(function() --[[ Line: 413 ]]
		-- upvalues: UseSignalStateResult (copy), LoggerModule (upval), SerializeTableModule (upval), Number (copy), ExperienceInviteState (upval), Default (copy), UseResult1 (copy), UseMemoResult (copy), ExperienceInviteVoteType (upval), UseContextResult (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdModuleResult (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval)
		if not UseSignalStateResult or not UseSignalStateResult.model then return end
		LoggerModule:debug("Current experience invite updated: {}", SerializeTableModule(UseSignalStateResult.model))
		local NotificationId = UseSignalStateResult.notification.notificationId
		local State = UseSignalStateResult.model.state
		
		if UseSignalStateResult.model.inviterId == Number then
			if State == ExperienceInviteState.Active then
				if UseSignalStateResult.model.spotsTaken > 1 then
					Default:updateNotification(NotificationId, UseSignalStateResult.model.spotsTaken .. "SpotsFilled")
					
					return
				end
			elseif State == ExperienceInviteState.Reserving or State == ExperienceInviteState.ReservationSuccessful then
				Default:updateNotification(NotificationId, "launching")
				
				return
			else
				UseResult1(NotificationId, true)
				
				if State ~= ExperienceInviteState.Cancelled and State ~= ExperienceInviteState.ReservationFailed then
					LoggerModule:warning("Invitee unexpected squad experience invite state: {}", State)
					
					return
				end
			end
		elseif State == ExperienceInviteState.Active then
			if UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote then
				if UseSignalStateResult.model.totalSpots <= UseSignalStateResult.model.spotsTaken then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
						parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
						experienceInviteId = UseSignalStateResult.model.experienceInviteId,
						toastAction = SquadToastActionsAndStatesModule.ExpInvSlotsFull,
						toastType = SquadToastTypeModule.ExperienceInvite
					})
					Default:updateNotification(NotificationId, "slotsFull")
					
					return
				end
			elseif UseMemoResult == ExperienceInviteVoteType.Accept then
				Default:updateNotification(NotificationId, "waiting")
				
				return
			else
				if UseMemoResult == ExperienceInviteVoteType.Decline or UseMemoResult == ExperienceInviteVoteType.Dismiss then
					UseResult1(NotificationId, true)
					
					return
				end
			end
		elseif State == ExperienceInviteState.Reserving or State == ExperienceInviteState.ReservationSuccessful then
			if UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote then
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
					parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
					experienceInviteId = UseSignalStateResult.model.experienceInviteId,
					toastAction = SquadToastActionsAndStatesModule.ExpInvExpired,
					toastType = SquadToastTypeModule.ExperienceInvite
				})
				Default:updateNotification(NotificationId, "expired")
				
				return
			end
			if UseMemoResult == ExperienceInviteVoteType.Accept then
				Default:updateNotification(NotificationId, "waiting")
				
				return
			end
			if UseMemoResult == ExperienceInviteVoteType.Decline or UseMemoResult == ExperienceInviteVoteType.Dismiss then
				UseResult1(NotificationId, true)
				
				return
			end
		elseif State == ExperienceInviteState.Cancelled then
			Default:updateNotification(NotificationId, "cancelled")
			
			return
		else
			UseResult1(NotificationId, true)
			
			if State ~= ExperienceInviteState.ReservationFailed then
				LoggerModule:warning("Inviter unexpected squad experience invite state: {}", State)
			end
		end
	end, {
		UseSignalStateResult, UseCurrentSquadParentChannelIdModuleResult, UseResult1,
		Number, UseContextResult.fireSquadAnalytics, UseMemoResult
	})
	RealtimeDeliveryModule.useRealtimeNamespace("ExperienceInviteUpdate", function(p2) --[[ Line: 505 ]]
		-- upvalues: LoggerModule (upval), SerializeTableModule (upval), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval)
		LoggerModule:debug("Experience invite RTN received. Detail: {}", SerializeTableModule(p2))
		
		if FFlagUseSignalsForSquadExperienceInvite then
			GetSquadExperienceInviteStoreModule(false).currentExperienceInviteUpdated(p2)
			
			return
		else
			UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteUpdated(p2))
		end
	end, { UseDispatchResult })
	ReactModule.useEffect(function() --[[ Line: 521 ]]
		-- upvalues: Default (copy), UseSignalStateResult (copy), UseMemoResult (copy), ExperienceInviteVoteType (upval), UseResult1 (copy), ExperienceInviteState (upval), UseContextResult (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdModuleResult (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseResult2 (copy)
		local ListenToDismissNotificationResult = Default:listenToDismissNotification(function(p2) --[[ Line: 523 ]]
			-- upvalues: UseSignalStateResult (upval), UseMemoResult (upval), ExperienceInviteVoteType (upval), UseResult1 (upval), ExperienceInviteState (upval), UseContextResult (upval), EventNamesModule (upval), UseCurrentSquadParentChannelIdModuleResult (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseResult2 (upval)
			if UseSignalStateResult and UseSignalStateResult.notification.notificationId == p2.notificationId then
				if UseMemoResult ~= ExperienceInviteVoteType.Accept then
					UseResult1(p2.notificationId, false)
				end
				if (not UseSignalStateResult.model or UseSignalStateResult.model.state == ExperienceInviteState.Active) and (UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote) then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
						parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
						experienceInviteId = UseSignalStateResult.notification.experienceInviteId,
						toastAction = SquadToastActionsAndStatesModule.ExpInvDismiss,
						toastType = SquadToastTypeModule.ExperienceInvite
					})
					UseResult2(UseSignalStateResult.notification.experienceInviteId, ExperienceInviteVoteType.Dismiss, UseSignalStateResult.notification.membershipEntityId)
				end
			end
		end)
		
		return function() --[[ Line: 564 ]]
			-- upvalues: ListenToDismissNotificationResult (copy)
			if ListenToDismissNotificationResult then
				ListenToDismissNotificationResult:Disconnect()
			end
		end
	end, {
		UseSignalStateResult, UseCurrentSquadParentChannelIdModuleResult, UseResult1,
		UseDispatchResult, UseContextResult.fireSquadAnalytics, UseMemoResult,
		UseResult2
	})
	ReactModule.useEffect(function() --[[ Line: 580 ]]
		-- upvalues: Default (copy), Number (copy), NotificationTypeEnum (upval), HttpService (upval), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p2) --[[ Line: 582 ]]
			-- upvalues: Number (upval), NotificationTypeEnum (upval), HttpService (upval), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (upval), RoduxSquadsModule (upval)
			if not p2 then return end
			if Number <= 0 then return end
			if p2.notificationType == NotificationTypeEnum.SquadExperienceInvitation then
				local Data = HttpService:JSONDecode(p2.lifecycleData)
				
				if FFlagUseSignalsForSquadExperienceInvite then
					GetSquadExperienceInviteStoreModule(false).currentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationId, Data.isInviter)
					
					return
				end
				UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationId, Data.isInviter))
			end
		end)
		
		return function() --[[ Line: 612 ]]
			-- upvalues: ListenToDisplayNotificationResult (copy)
			if ListenToDisplayNotificationResult then
				ListenToDisplayNotificationResult:Disconnect()
			end
		end
	end, { Number })
	ReactModule.useEffect(function() --[[ Line: 621 ]]
		-- upvalues: MessageBusService (upval), ToastNotificationsMessageId (upval), NotificationTypeEnum (upval), UseSignalStateResult (copy), HttpService (upval), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval), Default (copy), ExperienceInviteState (upval), UseMemoResult (copy), ExperienceInviteVoteType (upval)
		local SubscribeResult = MessageBusService:Subscribe(ToastNotificationsMessageId, function(p2) --[[ Line: 624 ]]
			-- upvalues: NotificationTypeEnum (upval), UseSignalStateResult (upval), HttpService (upval), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (upval), RoduxSquadsModule (upval), Default (upval), ExperienceInviteState (upval), UseMemoResult (upval), ExperienceInviteVoteType (upval)
			if p2.notificationType == NotificationTypeEnum.SquadExperienceInvitation and p2.userActionType == "timerElapsed" then
				if UseSignalStateResult then
					assert(UseSignalStateResult, "Experience invite must exist to perform actions.")
					
					if (not UseSignalStateResult.model or UseSignalStateResult.model.state == ExperienceInviteState.Active) and (UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote) then
						Default:updateNotification(p2.notificationId, "expired")
					end
				else
					local Data = HttpService:JSONDecode(p2.parameters)
					
					if FFlagUseSignalsForSquadExperienceInvite then
						GetSquadExperienceInviteStoreModule(false).currentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationId, Data.isInviter)
					else
						UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationId, Data.isInviter))
					end
					UseDispatchResult(function() --[[ Line: 648 ]]
						-- upvalues: Default (upval), p2 (copy)
						Default:updateNotification(p2.notificationId, "expired")
					end)
					
					return
				end
			end
		end, false, true)
		
		return function() --[[ Line: 678 ]]
			-- upvalues: SubscribeResult (copy)
			if SubscribeResult then
				SubscribeResult:Disconnect()
			end
		end
	end, { UseSignalStateResult, UseMemoResult, UseResult2 })
	ReactModule.useEffect(function() --[[ Line: 686 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), UseCurrentSquadParentChannelIdModuleResult (copy), SquadToastTypeModule (upval), UseSignalStateResult (copy), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval), UseContextResult (copy), EventNamesModule (upval), CryoModule (upval), SquadToastActionsAndStatesModule (upval), UseResult2 (copy), ExperienceInviteVoteType (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadExperienceInvitation, function(p2) --[[ Line: 690 ]]
			-- upvalues: HttpService (upval), UseCurrentSquadParentChannelIdModuleResult (upval), SquadToastTypeModule (upval), UseSignalStateResult (upval), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreModule (upval), UseDispatchResult (upval), RoduxSquadsModule (upval), UseContextResult (upval), EventNamesModule (upval), CryoModule (upval), SquadToastActionsAndStatesModule (upval), UseResult2 (upval), ExperienceInviteVoteType (upval)
			if p2 and p2.userActionType == "click" and p2.visualItem and p2.visualItem.actionEventParams then
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				local config = {
					parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
					experienceInviteId = Data.experienceInviteId,
					toastType = SquadToastTypeModule.ExperienceInvite
				}
				
				if not UseSignalStateResult then
					if FFlagUseSignalsForSquadExperienceInvite then
						GetSquadExperienceInviteStoreModule(false).currentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationData.id, Data.isInviter)
					else
						UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationData.id, Data.isInviter))
					end
				end
				if p2.visualItem.eventName == "GroupUpSquadExperience" then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, CryoModule.Dictionary.union(config, {
						toastAction = SquadToastActionsAndStatesModule.ExpInvAccept
					}))
					UseResult2(Data.experienceInviteId, ExperienceInviteVoteType.Accept, Data.membershipEntityId)
					
					return
				end
				if p2.visualItem.eventName == "DismissSquadExperienceInvited" then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, CryoModule.Dictionary.union(config, {
						toastAction = SquadToastActionsAndStatesModule.ExpInvDecline
					}))
					UseResult2(Data.experienceInviteId, ExperienceInviteVoteType.Decline, Data.membershipEntityId)
					
					return
				end
				if p2.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, CryoModule.Dictionary.union(config, {
						toastAction = SquadToastActionsAndStatesModule.ExpInvCancel
					}))
					UseResult2(Data.experienceInviteId, ExperienceInviteVoteType.Cancel, Data.membershipEntityId)
				end
			end
		end)
		
		return function() --[[ Line: 767 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, {
		UseSignalStateResult,
		UseCurrentSquadParentChannelIdModuleResult,
		UseDispatchResult,
		UseContextResult.fireSquadAnalytics,
		UseResult2
	})
	ReactModule.useEffect(function() --[[ Line: 779 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), UseContextResult (copy), EventNamesModule (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadExperienceInvitation, function(p2) --[[ Line: 783 ]]
			-- upvalues: HttpService (upval), UseContextResult (upval), EventNamesModule (upval)
			local ActionEventParams = p2 and (p2.state and (p2.state.visualItems and (p2.state.visualItems.button and (p2.state.visualItems.button[1] and p2.state.visualItems.button[1].actionEventParams))))
			
			if ActionEventParams then
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadExperienceInviteImpression, {
					experienceInviteId = HttpService:JSONDecode(ActionEventParams).experienceInviteId,
					notificationId = p2.id,
					clientTimestamp = os.time()
				})
			end
		end)
		
		return function() --[[ Line: 803 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { UseContextResult.fireSquadAnalytics })
	ReactModule.useEffect(function() --[[ Line: 809 ]]
		-- upvalues: SoundManager (upval), Sounds (upval), LifecycleEvents (upval), NotificationTypeEnum (upval)
		local function v95(p2) --[[ Line: 810 ]]
			-- upvalues: SoundManager (upval), Sounds (upval)
			if p2.currentState == "invited" then
				SoundManager:PlaySound(Sounds.PartyToast.Name)
			end
		end
		
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadExperienceInvitation, v95)
		local RegisterResult1 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Update, NotificationTypeEnum.SquadExperienceInvitation, v95)
		
		return function() --[[ Line: 828 ]]
			-- upvalues: RegisterResult (copy), RegisterResult1 (copy)
			RegisterResult()
			RegisterResult1()
		end
	end, {})
	
	return nil
end