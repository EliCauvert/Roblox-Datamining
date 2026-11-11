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
local ToastNotificationsMessageId = MessageBusService:GetMessageId("ToastNotifications", "userActionOnToastNotification")

local function _(Input)
	-- upvalues: FFlagDebugSquadLogsEnabled (copy), HttpService (copy)
	return if FFlagDebugSquadLogsEnabled then HttpService:JSONEncode(Input) elseif Input.StatusCode then Input.StatusCode else -1
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), AppStorageService (copy), LocalStorageKey (copy), ToastNotificationsProtocolModule (copy), UseSelectorFunction (copy), UseCurrentSquadParentChannelIdModule (copy), ExperienceInviteVoteType (copy), RoduxSquadsModule (copy), NetworkingSquadsModule (copy), LoggerModule (copy), FFlagDebugSquadLogsEnabled (copy), HttpService (copy), EventNamesModule (copy), CryoModule (copy), SquadCoordinationExperienceJoinExperimentation (copy), SquadExperienceInviteTimeoutSeconds (copy), ExperienceInviteState (copy), FFlagEnablePrivatePartyAcceptInvite (copy), ExperienceInviteType (copy), SquadLocationEnumModule (copy), FFlagSquadLaunchExperienceMobileFix (copy), GameParams (copy), ExperienceService (copy), SquadExperienceInvitePollingIntervalSeconds (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), SerializeTableModule (copy), SquadToastActionsAndStatesModule (copy), SquadToastTypeModule (copy), RealtimeDeliveryModule (copy), NotificationTypeEnum (copy), MessageBusService (copy), ToastNotificationsMessageId (copy), LifecycleEvents (copy), SoundManager (copy), Sounds (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: AppStorageService (upval), LocalStorageKey (upval), UseStateResult2 (copy)
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), LocalStorageKey (upval)
			return AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)
		end)
		
		if Success then
			UseStateResult2(Result)
		end
		local ItemWasSetConnection = AppStorageService.ItemWasSet:Connect(function(BrowserTrackerId, Value)
			-- upvalues: LocalStorageKey (upval), UseStateResult2 (upval)
			if BrowserTrackerId == LocalStorageKey.BrowserTrackerId then
				UseStateResult2(Value)
			end
		end)
		
		return function()
			-- upvalues: ItemWasSetConnection (copy)
			ItemWasSetConnection:Disconnect()
		end
	end, { UseStateResult2 })
	local Default = ToastNotificationsProtocolModule.ToastNotificationProtocol.default
	local UseRefResult = ReactModule.useRef(false)
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad then p2.Squad.Squad.currentExperienceInvite else nil
	end, {})))
	local UseCurrentSquadParentChannelIdModuleResult = UseCurrentSquadParentChannelIdModule()
	local Model = UseSelectorResult and UseSelectorResult.model
	local ExperienceInviteId = Model and Model.experienceInviteId or ""
	local State = Model and Model.state or ""
	local GameInstanceId = Model and Model.experienceDetail.gameInstanceId or ""
	local PlaceId = Model and Model.experienceDetail.placeId or 0
	local InviterId = Model and Model.inviterId or 0
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), ExperienceInviteVoteType (upval), Number (copy), UseStateResult (copy)
		if UseSelectorResult and UseSelectorResult.model then
			for _, vote in ipairs(UseSelectorResult.model.votes) do
				if vote.userId == Number then
					return vote.voteType, if vote.voteIdentifier and vote.voteIdentifier ~= "" then vote.voteIdentifier ~= UseStateResult else false
				end
			end
			return ExperienceInviteVoteType.NoVote, false
		elseif UseSelectorResult and UseSelectorResult.notification.isInviter then
			return ExperienceInviteVoteType.Accept, false
		else
			return ExperienceInviteVoteType.Invalid, false
		end
	end, { UseSelectorResult, Number, UseStateResult })
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: Default (copy), UseDispatchResult (copy), RoduxSquadsModule (upval), UseRefResult (copy)
		if p3 then
			Default:dismissNotification(p2)
		end
		UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteDismissed(p2))
		UseRefResult.current = false
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(ExperienceInviteId, MembershipEntityId)
		-- upvalues: UseDispatchResult (copy), NetworkingSquadsModule (upval), LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval), HttpService (upval)
		return UseDispatchResult(NetworkingSquadsModule.GetExperienceInvite.API({
			experienceInviteId = ExperienceInviteId,
			membershipEntityId = MembershipEntityId
		})):catch(function(Err)
			-- upvalues: LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval), HttpService (upval), ExperienceInviteId (copy), MembershipEntityId (copy)
			LoggerModule:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if FFlagDebugSquadLogsEnabled then HttpService:JSONEncode(Err) elseif Err.StatusCode then Err.StatusCode else -1, ExperienceInviteId, MembershipEntityId)
		end)
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(ExperienceInviteId, VoteType, MembershipEntityId)
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
		})):andThen(function()
			-- upvalues: UseContextResult (upval), EventNamesModule (upval), CryoModule (upval), config (copy)
			UseContextResult.fireSquadAnalytics(EventNamesModule.SquadVoteApiCall, CryoModule.Dictionary.union(config, { isSuccess = true }))
		end):catch(function(Err)
			-- upvalues: HttpService (upval), UseContextResult (upval), EventNamesModule (upval), CryoModule (upval), config (copy), LoggerModule (upval), FFlagDebugSquadLogsEnabled (upval), ExperienceInviteId (copy), MembershipEntityId (copy), VoteType (copy)
			local Body = Err.Body
			local Success, Result = pcall(function()
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
	local UseResult3 = ReactModule.useCallback(function(JoinAttemptId)
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
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), SquadExperienceInviteTimeoutSeconds (upval), UseResult (copy)
		local DelayedThread = if UseSelectorResult then task.delay(SquadExperienceInviteTimeoutSeconds, function()
			-- upvalues: UseResult (upval), UseSelectorResult (upval)
			UseResult(UseSelectorResult.notification.notificationId, true)
		end) else nil
		
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { UseResult, UseSelectorResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseMemoResult (copy), ExperienceInviteVoteType (upval), UseRefResult (copy), ExperienceInviteState (upval), FFlagEnablePrivatePartyAcceptInvite (upval), ExperienceInviteType (upval), LoggerModule (upval), UseResult (copy), UseContextResult (copy), SquadLocationEnumModule (upval), FFlagSquadLaunchExperienceMobileFix (upval), SquadCoordinationExperienceJoinExperimentation (upval), HttpService (upval), UseResult3 (copy), GameParams (upval), ExperienceService (upval)
		if not UseSelectorResult or UseMemoResult ~= ExperienceInviteVoteType.Accept or UseRefResult.current then return end
		local Model = UseSelectorResult.model
		local Notification = UseSelectorResult.notification
		
		if not Model or Model.state ~= ExperienceInviteState.ReservationSuccessful then return end
		local GameInstanceId = Model.experienceDetail.gameInstanceId
		local PlaceId = Model.experienceDetail.placeId
		
		if not FFlagEnablePrivatePartyAcceptInvite or UseSelectorResult.model.inviteType ~= ExperienceInviteType.PlayWithPartyInPrivatePartyServer then
			assert(GameInstanceId, "Game instance id should exist.")
		end
		UseRefResult.current = true
		LoggerModule:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", GameInstanceId, PlaceId)
		local DelayedThread = task.delay(1, function()
			-- upvalues: UseResult (upval), Notification (copy), UseContextResult (upval), SquadLocationEnumModule (upval), FFlagSquadLaunchExperienceMobileFix (upval), SquadCoordinationExperienceJoinExperimentation (upval), HttpService (upval), UseResult3 (upval), GameParams (upval), PlaceId (copy), GameInstanceId (copy), FFlagEnablePrivatePartyAcceptInvite (upval), UseSelectorResult (upval), ExperienceInviteType (upval), ExperienceService (upval)
			UseResult(Notification.notificationId, true)
			
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
			if FFlagEnablePrivatePartyAcceptInvite and UseSelectorResult.model.inviteType == ExperienceInviteType.PlayWithPartyInPrivatePartyServer then
				FromPlaceInstanceResult.isPrivateParty = true
			end
			ExperienceService:LaunchExperience(FromPlaceInstanceResult, SquadExperienceInviteFromUA, nil)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, {
		UseContextResult.squadLocation,
		UseSelectorResult,
		UseResult,
		UseMemoResult,
		if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then UseResult3 else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: SquadExperienceInvitePollingIntervalSeconds (upval), UseSelectorResult (copy), ExperienceInviteState (upval), SetIntervalFunction (upval), UseResult1 (copy), ClearIntervalFunction (upval)
		local SetIntervalResult = if UseSelectorResult and (not UseSelectorResult.model or UseSelectorResult.model.state == ExperienceInviteState.Active or UseSelectorResult.model.state == ExperienceInviteState.Reserving) then SetIntervalFunction(function()
			-- upvalues: UseResult1 (upval), UseSelectorResult (upval)
			UseResult1(UseSelectorResult.notification.experienceInviteId, UseSelectorResult.notification.membershipEntityId)
		end, SquadExperienceInvitePollingIntervalSeconds * 1000) else nil
		
		return function()
			-- upvalues: SetIntervalResult (ref), ClearIntervalFunction (upval)
			if SetIntervalResult then
				ClearIntervalFunction(SetIntervalResult)
			end
		end
	end, { UseSelectorResult, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), p1 (copy), UseMemoResult2 (copy), UseResult (copy)
		if UseSelectorResult and (p1.currentSquadId ~= UseSelectorResult.notification.membershipEntityId or UseMemoResult2) then
			UseResult(UseSelectorResult.notification.notificationId, true)
		end
	end, {
		UseSelectorResult,
		UseResult,
		p1.currentSquadId,
		UseMemoResult2
	})
	ReactModule.useEffect(function()
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
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), LoggerModule (upval), SerializeTableModule (upval), Number (copy), ExperienceInviteState (upval), Default (copy), UseResult (copy), UseMemoResult (copy), ExperienceInviteVoteType (upval), UseContextResult (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdModuleResult (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval)
		if not UseSelectorResult or not UseSelectorResult.model then return end
		LoggerModule:debug("Current experience invite updated: {}", SerializeTableModule(UseSelectorResult.model))
		local NotificationId = UseSelectorResult.notification.notificationId
		local State = UseSelectorResult.model.state
		
		if UseSelectorResult.model.inviterId == Number then
			if State == ExperienceInviteState.Active then
				if UseSelectorResult.model.spotsTaken > 1 then
					Default:updateNotification(NotificationId, UseSelectorResult.model.spotsTaken .. "SpotsFilled")
					
					return
				end
			elseif State == ExperienceInviteState.Reserving or State == ExperienceInviteState.ReservationSuccessful then
				Default:updateNotification(NotificationId, "launching")
				
				return
			else
				UseResult(NotificationId, true)
				
				if State ~= ExperienceInviteState.Cancelled and State ~= ExperienceInviteState.ReservationFailed then
					LoggerModule:warning("Invitee unexpected squad experience invite state: {}", State)
					
					return
				end
			end
		elseif State == ExperienceInviteState.Active then
			if UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote then
				if UseSelectorResult.model.totalSpots <= UseSelectorResult.model.spotsTaken then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
						parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
						experienceInviteId = UseSelectorResult.model.experienceInviteId,
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
					UseResult(NotificationId, true)
					
					return
				end
			end
		elseif State == ExperienceInviteState.Reserving or State == ExperienceInviteState.ReservationSuccessful then
			if UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote then
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
					parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
					experienceInviteId = UseSelectorResult.model.experienceInviteId,
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
				UseResult(NotificationId, true)
				
				return
			end
		elseif State == ExperienceInviteState.Cancelled then
			Default:updateNotification(NotificationId, "cancelled")
			
			return
		else
			UseResult(NotificationId, true)
			
			if State ~= ExperienceInviteState.ReservationFailed then
				LoggerModule:warning("Inviter unexpected squad experience invite state: {}", State)
			end
		end
	end, {
		UseSelectorResult, UseCurrentSquadParentChannelIdModuleResult, UseResult,
		Number, UseContextResult.fireSquadAnalytics, UseMemoResult
	})
	RealtimeDeliveryModule.useRealtimeNamespace("ExperienceInviteUpdate", function(p2)
		-- upvalues: LoggerModule (upval), SerializeTableModule (upval), UseDispatchResult (copy), RoduxSquadsModule (upval)
		LoggerModule:debug("Experience invite RTN received. Detail: {}", SerializeTableModule(p2))
		UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteUpdated(p2))
	end, { UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: Default (copy), UseSelectorResult (copy), UseMemoResult (copy), ExperienceInviteVoteType (upval), UseResult (copy), ExperienceInviteState (upval), UseContextResult (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdModuleResult (copy), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseResult2 (copy)
		local ListenToDismissNotificationResult = Default:listenToDismissNotification(function(p2)
			-- upvalues: UseSelectorResult (upval), UseMemoResult (upval), ExperienceInviteVoteType (upval), UseResult (upval), ExperienceInviteState (upval), UseContextResult (upval), EventNamesModule (upval), UseCurrentSquadParentChannelIdModuleResult (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseResult2 (upval)
			if UseSelectorResult and UseSelectorResult.notification.notificationId == p2.notificationId then
				if UseMemoResult ~= ExperienceInviteVoteType.Accept then
					UseResult(p2.notificationId, false)
				end
				if (not UseSelectorResult.model or UseSelectorResult.model.state == ExperienceInviteState.Active) and (UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote) then
					UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
						parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
						experienceInviteId = UseSelectorResult.notification.experienceInviteId,
						toastAction = SquadToastActionsAndStatesModule.ExpInvDismiss,
						toastType = SquadToastTypeModule.ExperienceInvite
					})
					UseResult2(UseSelectorResult.notification.experienceInviteId, ExperienceInviteVoteType.Dismiss, UseSelectorResult.notification.membershipEntityId)
				end
			end
		end)
		
		return function()
			-- upvalues: ListenToDismissNotificationResult (copy)
			if ListenToDismissNotificationResult then
				ListenToDismissNotificationResult:Disconnect()
			end
		end
	end, {
		UseSelectorResult, UseCurrentSquadParentChannelIdModuleResult, UseResult,
		UseDispatchResult, UseContextResult.fireSquadAnalytics, UseMemoResult,
		UseResult2
	})
	ReactModule.useEffect(function()
		-- upvalues: Default (copy), Number (copy), NotificationTypeEnum (upval), HttpService (upval), UseDispatchResult (copy), RoduxSquadsModule (upval)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p2)
			-- upvalues: Number (upval), NotificationTypeEnum (upval), HttpService (upval), UseDispatchResult (upval), RoduxSquadsModule (upval)
			if not p2 then return end
			if Number <= 0 then return end
			if p2.notificationType == NotificationTypeEnum.SquadExperienceInvitation then
				local Data = HttpService:JSONDecode(p2.lifecycleData)
				UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationId, Data.isInviter))
			end
		end)
		
		return function()
			-- upvalues: ListenToDisplayNotificationResult (copy)
			if ListenToDisplayNotificationResult then
				ListenToDisplayNotificationResult:Disconnect()
			end
		end
	end, { Number })
	ReactModule.useEffect(function()
		-- upvalues: MessageBusService (upval), ToastNotificationsMessageId (upval), NotificationTypeEnum (upval), UseSelectorResult (copy), HttpService (upval), UseDispatchResult (copy), RoduxSquadsModule (upval), Default (copy), ExperienceInviteState (upval), UseMemoResult (copy), ExperienceInviteVoteType (upval)
		local SubscribeResult = MessageBusService:Subscribe(ToastNotificationsMessageId, function(p2)
			-- upvalues: NotificationTypeEnum (upval), UseSelectorResult (upval), HttpService (upval), UseDispatchResult (upval), RoduxSquadsModule (upval), Default (upval), ExperienceInviteState (upval), UseMemoResult (upval), ExperienceInviteVoteType (upval)
			if p2.notificationType == NotificationTypeEnum.SquadExperienceInvitation and p2.userActionType == "timerElapsed" then
				if not UseSelectorResult then
					local Data = HttpService:JSONDecode(p2.parameters)
					UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationId, Data.isInviter))
					UseDispatchResult(function()
						-- upvalues: Default (upval), p2 (copy)
						Default:updateNotification(p2.notificationId, "expired")
					end)
					
					return
				end
				assert(UseSelectorResult, "Experience invite must exist to perform actions.")
				
				if (not UseSelectorResult.model or UseSelectorResult.model.state == ExperienceInviteState.Active) and (UseMemoResult == ExperienceInviteVoteType.Invalid or UseMemoResult == ExperienceInviteVoteType.NoVote) then
					Default:updateNotification(p2.notificationId, "expired")
				end
			end
		end, false, true)
		
		return function()
			-- upvalues: SubscribeResult (copy)
			if SubscribeResult then
				SubscribeResult:Disconnect()
			end
		end
	end, { UseSelectorResult, UseMemoResult, UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), UseCurrentSquadParentChannelIdModuleResult (copy), SquadToastTypeModule (upval), UseSelectorResult (copy), UseDispatchResult (copy), RoduxSquadsModule (upval), UseContextResult (copy), EventNamesModule (upval), CryoModule (upval), SquadToastActionsAndStatesModule (upval), UseResult2 (copy), ExperienceInviteVoteType (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadExperienceInvitation, function(p2)
			-- upvalues: HttpService (upval), UseCurrentSquadParentChannelIdModuleResult (upval), SquadToastTypeModule (upval), UseSelectorResult (upval), UseDispatchResult (upval), RoduxSquadsModule (upval), UseContextResult (upval), EventNamesModule (upval), CryoModule (upval), SquadToastActionsAndStatesModule (upval), UseResult2 (upval), ExperienceInviteVoteType (upval)
			if p2 and p2.userActionType == "click" and p2.visualItem and p2.visualItem.actionEventParams then
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				local config = {
					parentChannelId = UseCurrentSquadParentChannelIdModuleResult,
					experienceInviteId = Data.experienceInviteId,
					toastType = SquadToastTypeModule.ExperienceInvite
				}
				
				if not UseSelectorResult then
					UseDispatchResult(RoduxSquadsModule.Actions.CurrentExperienceInviteReceived(Data.experienceInviteId, Data.membershipEntityId, p2.notificationData.id, Data.isInviter))
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
		
		return function()
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, {
		UseSelectorResult,
		UseCurrentSquadParentChannelIdModuleResult,
		UseDispatchResult,
		UseContextResult.fireSquadAnalytics,
		UseResult2
	})
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), UseContextResult (copy), EventNamesModule (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadExperienceInvitation, function(p2)
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
		
		return function()
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { UseContextResult.fireSquadAnalytics })
	ReactModule.useEffect(function()
		-- upvalues: SoundManager (upval), Sounds (upval), LifecycleEvents (upval), NotificationTypeEnum (upval)
		local function v92(p2)
			-- upvalues: SoundManager (upval), Sounds (upval)
			if p2.currentState == "invited" then
				SoundManager:PlaySound(Sounds.PartyToast.Name)
			end
		end
		
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadExperienceInvitation, v92)
		local RegisterResult1 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Update, NotificationTypeEnum.SquadExperienceInvitation, v92)
		
		return function()
			-- upvalues: RegisterResult (copy), RegisterResult1 (copy)
			RegisterResult()
			RegisterResult1()
		end
	end, {})
	
	return nil
end