local SocialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local Parent = SocialContextToasts.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local UsersGetPresenceFunction = require(Parent.UserLib).Requests.UsersGetPresence
local UserProfilesModule = require(Parent.UserProfiles)
local GetCombinedNameFromIdFunction = UserProfilesModule.Selectors.getCombinedNameFromId
local PostSendExperienceInviteFunction = require(Parent.GameInvite).PostSendExperienceInvite
local JoinExperienceFunction = require(Parent.NotificationsCommon).JoinExperience
local SocialContextToastDiagKeysModule = require(SocialContextToasts.Enums.SocialContextToastDiagKeys)
local SetToastContentModule = require(SocialContextToasts.Actions.SetToastContent)
local SetConfirmationModalModule = require(SocialContextToasts.Actions.SetConfirmationModal)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ToastTypesModule = require(SocialContextToasts.Enums.ToastTypes)
local SocialContextToastAnalyticsActionTypesModule = require(SocialContextToasts.Enums.SocialContextToastAnalyticsActionTypes)
local SocialContextToastEventsModule = require(SocialContextToasts.SocialContextToastEvents)
local UseOneToOnePartyNudgeStartPartyRejectedFunction = require(Parent.SquadsCore.Hooks).useOneToOnePartyNudgeStartPartyRejected
local DEPRECATEDFriendsGetFriendStatusesFunction = require(Parent.Http).Requests.DEPRECATED_FriendsGetFriendStatuses
local GetFFlagSocialContextToastEventStreamFunction = require(Parent.SharedFlags).GetFFlagSocialContextToastEventStream
local GetFFlagEnableReferredPlayerJoinRemoteEventFunction = require(Parent.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent
local GetFFlagEnableReferredPlayerJoinRemoteEventForAllFunction = require(Parent.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEventForAll
local GetFIntMaxReferredPlayerJoinToastsFunction = require(Parent.SharedFlags).GetFIntMaxReferredPlayerJoinToasts
local FFlagEnablePartyNudgeAfterJoin = require(Parent.SharedFlags).FFlagEnablePartyNudgeAfterJoin
local SocialContextToastDelay = game:DefineFastInt("SocialContextToastDelay", 10)
local Callback = if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() then function(): boolean
	-- upvalues: GetFFlagEnableReferredPlayerJoinRemoteEventForAllFunction (copy)
	return if GetFFlagEnableReferredPlayerJoinRemoteEventForAllFunction() then true else false
end else nil

local function getNames(ApolloClient, p1)
	-- upvalues: PromiseModule (copy), UserProfilesModule (copy), GetCombinedNameFromIdFunction (copy)
	local UserIds = {}
	
	for i = 1, #p1 do
		UserIds[i] = tostring(p1[i])
	end
	return PromiseModule.new(function(Callback, _)
		-- upvalues: ApolloClient (copy), UserProfilesModule (upval), UserIds (copy), p1 (copy), GetCombinedNameFromIdFunction (upval)
		ApolloClient:query({
			query = UserProfilesModule.Queries.userProfilesAllNamesByUserIds,
			variables = { userIds = UserIds }
		}):andThen(function(Result)
			-- upvalues: p1 (upval), GetCombinedNameFromIdFunction (upval), Callback (copy)
			local List = {}
			
			for i = 1, #p1 do
				table.insert(List, {
					userId = p1[i],
					name = GetCombinedNameFromIdFunction(Result.data, p1[i])
				})
			end
			Callback(List)
		end)
	end)
end

local function _(p2, p3, p4)
	-- upvalues: CryoModule (copy)
	if p4 then
		local RemoveValueResult = CryoModule.List.removeValue(p2, p3)
		table.insert(RemoveValueResult, 1, p3)
		
		return RemoveValueResult
	else
		return p2
	end
end

local function showYouJoinedFriendsToast(Services, Callback, FollowUserId: number, List, p2, UniverseId, PlaceId)
	-- upvalues: SetToastContentModule (copy), SocialContextToastDiagKeysModule (copy), GetFFlagSocialContextToastEventStreamFunction (copy), SocialContextToastEventsModule (copy), ToastTypesModule (copy), SocialContextToastAnalyticsActionTypesModule (copy), CryoModule (copy), getNames (copy)
	if #List == 0 then
		return Callback(SetToastContentModule(nil))
	end
	Services.analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.YouJoinedFriends, 1)
	
	if GetFFlagSocialContextToastEventStreamFunction() then
		SocialContextToastEventsModule(Services.eventIngest, {
			toastType = ToastTypesModule.YouJoinedFriends,
			friendId = table.concat(List, ","),
			universeId = UniverseId,
			placeId = PlaceId,
			actionType = SocialContextToastAnalyticsActionTypesModule.Shown
		})
	end
	if FollowUserId > 0 then
		local List1 = List
		
		if p2 then
			local RemoveValueResult = CryoModule.List.removeValue(List1, FollowUserId)
			table.insert(RemoveValueResult, 1, FollowUserId)
			List = RemoveValueResult
		else
			List = List1
		end
	end
	return getNames(Services.apolloClient, List):andThen(function(Result)
		-- upvalues: Callback (copy), SetToastContentModule (upval), ToastTypesModule (upval)
		Callback(SetToastContentModule({
			toastType = ToastTypesModule.YouJoinedFriends,
			userList = Result
		}))
	end)
end

local function handleFollowedPlayerDisconnected(Services, Callback, JoinerUserId, _, UniverseId, PlaceId)
	-- upvalues: UsersGetPresenceFunction (copy), SocialContextToastDiagKeysModule (copy), GetFFlagSocialContextToastEventStreamFunction (copy), SocialContextToastEventsModule (copy), ToastTypesModule (copy), SocialContextToastAnalyticsActionTypesModule (copy), getNames (copy), SetToastContentModule (copy), SetConfirmationModalModule (copy), JoinExperienceFunction (copy), PostSendExperienceInviteFunction (copy)
	local Analytics = Services.analytics
	UsersGetPresenceFunction(Services.networking, { JoinerUserId }):andThen(function(Result)
		-- upvalues: UniverseId (copy), Analytics (copy), SocialContextToastDiagKeysModule (upval), GetFFlagSocialContextToastEventStreamFunction (upval), SocialContextToastEventsModule (upval), Services (copy), ToastTypesModule (upval), JoinerUserId (copy), PlaceId (copy), SocialContextToastAnalyticsActionTypesModule (upval), getNames (upval), Callback (copy), SetToastContentModule (upval), SetConfirmationModalModule (upval), JoinExperienceFunction (upval), PostSendExperienceInviteFunction (upval)
		if not Result.responseBody or not Result.responseBody.userPresences or #Result.responseBody.userPresences == 0 then return end
		local UserPresence = Result.responseBody.userPresences[1]
		local UniverseId1 = UserPresence.universeId
		
		if tostring(UniverseId1) == tostring(UniverseId) then
			Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.FollowedFriendInOtherPlace, 1)
			
			if GetFFlagSocialContextToastEventStreamFunction() then
				SocialContextToastEventsModule(Services.eventIngest, {
					toastType = ToastTypesModule.FriendInNonRootPlace,
					friendId = tostring(JoinerUserId),
					universeId = UniverseId,
					placeId = PlaceId,
					actionType = SocialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			return getNames(Services.apolloClient, { JoinerUserId }):andThen(function(Entry)
				-- upvalues: Callback (upval), SetToastContentModule (upval), ToastTypesModule (upval), JoinerUserId (upval)
				if #Entry ~= 0 then
					Callback(SetToastContentModule({
						toastType = ToastTypesModule.FriendInNonRootPlace,
						joinerUserId = JoinerUserId,
						joinerName = Entry[1].name
					}))
					
					return
				end
			end)
		elseif UniverseId1 == nil then
			Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.FollowedFriendNotInGame, 1)
			
			if GetFFlagSocialContextToastEventStreamFunction() then
				SocialContextToastEventsModule(Services.eventIngest, {
					toastType = ToastTypesModule.InviteBack,
					friendId = tostring(JoinerUserId),
					universeId = UniverseId,
					placeId = PlaceId,
					actionType = SocialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			local function onInviteBackButtonClick()
				-- upvalues: Analytics (upval), SocialContextToastDiagKeysModule (upval), GetFFlagSocialContextToastEventStreamFunction (upval), SocialContextToastEventsModule (upval), Services (upval), ToastTypesModule (upval), JoinerUserId (upval), UniverseId (upval), PlaceId (upval), SocialContextToastAnalyticsActionTypesModule (upval), PostSendExperienceInviteFunction (upval), Callback (upval), SetToastContentModule (upval)
				Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.InviteBackButtonClicked, 1)
				
				if GetFFlagSocialContextToastEventStreamFunction() then
					SocialContextToastEventsModule(Services.eventIngest, {
						toastType = ToastTypesModule.InviteBack,
						friendId = tostring(JoinerUserId),
						universeId = UniverseId,
						placeId = PlaceId,
						actionType = SocialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				PostSendExperienceInviteFunction(Services.networking, tostring(JoinerUserId), tostring(PlaceId), "SocialContextToast"):andThen(function(_)
					-- upvalues: Callback (upval), SetToastContentModule (upval), ToastTypesModule (upval)
					Callback(SetToastContentModule({ toastType = ToastTypesModule.InviteSuccess }))
				end, function(_)
					-- upvalues: Callback (upval), SetToastContentModule (upval), ToastTypesModule (upval)
					Callback(SetToastContentModule({ toastType = ToastTypesModule.InviteFailure }))
				end)
			end
			
			return getNames(Services.apolloClient, { JoinerUserId }):andThen(function(Entry)
				-- upvalues: Callback (upval), SetToastContentModule (upval), ToastTypesModule (upval), JoinerUserId (upval), onInviteBackButtonClick (copy)
				if #Entry ~= 0 then
					Callback(SetToastContentModule({
						toastType = ToastTypesModule.InviteBack,
						joinerUserId = JoinerUserId,
						joinerName = Entry[1].name,
						onActivated = onInviteBackButtonClick
					}))
					
					return
				end
			end)
		else
			Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.FollowedFriendInOtherUniverse, 1)
			
			if GetFFlagSocialContextToastEventStreamFunction() then
				SocialContextToastEventsModule(Services.eventIngest, {
					toastType = ToastTypesModule.FollowYourFriend,
					friendId = tostring(JoinerUserId),
					universeId = UniverseId,
					placeId = PlaceId,
					actionType = SocialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			local function closeCallback(p2)
				-- upvalues: Callback (upval), SetConfirmationModalModule (upval), Analytics (upval), SocialContextToastDiagKeysModule (upval), GetFFlagSocialContextToastEventStreamFunction (upval), SocialContextToastEventsModule (upval), Services (upval), JoinerUserId (upval), UniverseId (upval), PlaceId (upval), SocialContextToastAnalyticsActionTypesModule (upval), UserPresence (copy), JoinExperienceFunction (upval)
				if not p2 then
					Callback(SetConfirmationModalModule(false))
					
					return
				end
				Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.ConfirmLeaveGameButtonClicked, 1)
				
				if GetFFlagSocialContextToastEventStreamFunction() then
					SocialContextToastEventsModule(Services.eventIngest, {
						toastType = "LeaveGameConfirmationModal",
						friendId = tostring(JoinerUserId),
						universeId = UniverseId,
						placeId = PlaceId,
						actionType = SocialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				JoinExperienceFunction(string.format("roblox://userid=%s&placeid=%s", tostring(JoinerUserId), UserPresence.placeId), true)
			end
			
			local function onJoinFriendButtonClick()
				-- upvalues: Analytics (upval), SocialContextToastDiagKeysModule (upval), GetFFlagSocialContextToastEventStreamFunction (upval), SocialContextToastEventsModule (upval), Services (upval), ToastTypesModule (upval), JoinerUserId (upval), UniverseId (upval), PlaceId (upval), SocialContextToastAnalyticsActionTypesModule (upval), Callback (upval), SetConfirmationModalModule (upval), closeCallback (copy)
				Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.JoinFriendButtonClicked, 1)
				
				if GetFFlagSocialContextToastEventStreamFunction() then
					SocialContextToastEventsModule(Services.eventIngest, {
						toastType = ToastTypesModule.FollowYourFriend,
						friendId = tostring(JoinerUserId),
						universeId = UniverseId,
						placeId = PlaceId,
						actionType = SocialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				Callback(SetConfirmationModalModule(true, closeCallback))
			end
			
			return getNames(Services.apolloClient, { JoinerUserId }):andThen(function(Entry)
				-- upvalues: Callback (upval), SetToastContentModule (upval), ToastTypesModule (upval), JoinerUserId (upval), UserPresence (copy), onJoinFriendButtonClick (copy)
				if #Entry ~= 0 then
					Callback(SetToastContentModule({
						toastType = ToastTypesModule.FollowYourFriend,
						joinerUserId = JoinerUserId,
						joinerName = Entry[1].name,
						experienceName = UserPresence.lastLocation,
						onActivated = onJoinFriendButtonClick
					}))
					
					return
				end
			end)
		end
	end, function(_)
		-- upvalues: Analytics (copy), SocialContextToastDiagKeysModule (upval)
		Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.ErrorFetchingPresence, 1)
	end)
end

function SocialContextToastDispatcher(p2)
	-- upvalues: ReactModule (copy), GetFFlagEnableReferredPlayerJoinRemoteEventFunction (copy), UseDispatchFunction (copy), DEPRECATEDFriendsGetFriendStatusesFunction (copy), handleFollowedPlayerDisconnected (copy), showYouJoinedFriendsToast (copy), SocialContextToastDiagKeysModule (copy), GetFFlagSocialContextToastEventStreamFunction (copy), SocialContextToastEventsModule (copy), ToastTypesModule (copy), SocialContextToastAnalyticsActionTypesModule (copy), getNames (copy), SetToastContentModule (copy), FFlagEnablePartyNudgeAfterJoin (copy), UseOneToOnePartyNudgeStartPartyRejectedFunction (copy), GetFIntMaxReferredPlayerJoinToastsFunction (copy), SocialContextToastDelay (copy), Callback (ref)
	local Services = p2.services
	local Analytics = Services.analytics
	local PlayersService = Services.playersService
	local Ref = ReactModule.createRef()
	local Networking = Services.networking
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() then ReactModule.useRef(nil) else nil
	local UseRefResult3 = if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() then ReactModule.useRef(0) else nil
	local UseDispatchResult = UseDispatchFunction()
	
	local function showToastOnJoin()
		-- upvalues: PlayersService (copy), DEPRECATEDFriendsGetFriendStatusesFunction (upval), Networking (copy), handleFollowedPlayerDisconnected (upval), Services (copy), UseDispatchResult (copy), p2 (copy), showYouJoinedFriendsToast (upval)
		local FollowUserId = PlayersService.LocalPlayer.FollowUserId
		local Flag = false
		local Ids = {}
		local List = {}
		
		for _, player in pairs(PlayersService:GetPlayers()) do
			table.insert(List, player.UserId)
		end
		DEPRECATEDFriendsGetFriendStatusesFunction(Networking, List):andThen(function(Result)
			-- upvalues: FollowUserId (copy), Flag (ref), Ids (copy), handleFollowedPlayerDisconnected (upval), Services (upval), UseDispatchResult (upval), p2 (upval), showYouJoinedFriendsToast (upval)
			if not Result or not Result.responseBody or not Result.responseBody.data then return end
			for _, entry in pairs(Result.responseBody.data) do
				local Id = entry.id
				
				if Id == FollowUserId then
					Flag = true
				end
				if entry.status == "Friends" then
					table.insert(Ids, Id)
				end
			end
			return if FollowUserId > 0 and not Flag then handleFollowedPlayerDisconnected(Services, UseDispatchResult, FollowUserId, Ids, p2.gameId, p2.placeId) else showYouJoinedFriendsToast(Services, UseDispatchResult, FollowUserId, Ids, Flag, p2.gameId, p2.placeId)
		end)
	end
	
	local function onPlayerAdded(Player: Player)
		-- upvalues: PlayersService (copy), Analytics (copy), SocialContextToastDiagKeysModule (upval), GetFFlagSocialContextToastEventStreamFunction (upval), SocialContextToastEventsModule (upval), Services (copy), ToastTypesModule (upval), p2 (copy), SocialContextToastAnalyticsActionTypesModule (upval), getNames (upval), UseDispatchResult (copy), SetToastContentModule (upval)
		local LocalPlayer = PlayersService.LocalPlayer
		
		if Player.FollowUserId == LocalPlayer.UserId then
			local Success, Result = pcall(function()
				-- upvalues: LocalPlayer (copy), Player (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then LocalPlayer:IsFriendsWithAsync(Player.UserId) else LocalPlayer:IsFriendsWith(Player.UserId)
			end)
			
			if Success and Result then
				Analytics.Diag:reportCounter(SocialContextToastDiagKeysModule.YouWereFollowed, 1)
				
				if GetFFlagSocialContextToastEventStreamFunction() then
					SocialContextToastEventsModule(Services.eventIngest, {
						toastType = ToastTypesModule.FriendJoinedYou,
						friendId = tostring(Player.UserId),
						universeId = p2.gameId,
						placeId = p2.placeId,
						actionType = SocialContextToastAnalyticsActionTypesModule.Shown
					})
				end
				getNames(Services.apolloClient, { Player.UserId }):andThen(function(Entry)
					-- upvalues: Player (copy), UseDispatchResult (upval), SetToastContentModule (upval), ToastTypesModule (upval)
					local Name = Entry[1].name
					
					if Name == nil then
						Name = Player.DisplayName
					end
					UseDispatchResult(SetToastContentModule({
						toastType = ToastTypesModule.FriendJoinedYou,
						joinerUserId = Player.UserId,
						joinerName = Name
					}))
				end)
			end
		end
	end
	
	if FFlagEnablePartyNudgeAfterJoin then
		UseOneToOnePartyNudgeStartPartyRejectedFunction(function(p3)
			-- upvalues: PlayersService (copy), onPlayerAdded (copy)
			if p3 and p3.inviterId then
				local Player = PlayersService:GetPlayerByUserId(p3.inviterId)
				
				if Player then
					onPlayerAdded(Player)
				end
			end
		end)
	end
	local UseResult = if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() then ReactModule.useCallback(function(Player: Player)
		-- upvalues: UseRefResult3 (copy), GetFIntMaxReferredPlayerJoinToastsFunction (upval), UseDispatchResult (copy), SetToastContentModule (upval), ToastTypesModule (upval)
		if GetFIntMaxReferredPlayerJoinToastsFunction() > UseRefResult3.current then
			UseRefResult3.current += 1
			UseDispatchResult(SetToastContentModule({
				toastType = ToastTypesModule.InviteeJoinedYou,
				joinerUserId = Player.UserId,
				joinerName = Player.DisplayName
			}))
			
			return
		end
	end, {}) else nil
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnablePartyNudgeAfterJoin (upval), Services (copy), UseRefResult1 (copy), SocialContextToastDelay (upval), Ref (copy), PlayersService (copy), showToastOnJoin (copy), UseRefResult (copy), onPlayerAdded (copy), GetFFlagEnableReferredPlayerJoinRemoteEventFunction (upval), Callback (upval), UseRefResult2 (copy), UseResult (ref)
		local Flag = true
		
		if FFlagEnablePartyNudgeAfterJoin and Services.showPlayerJoinedFriendsToastRemoteEvent then
			Flag = false
			UseRefResult1.current = Services.showPlayerJoinedFriendsToastRemoteEvent.OnClientEvent:Connect(function()
				-- upvalues: Flag (ref)
				Flag = true
			end)
		end
		task.delay(SocialContextToastDelay, function()
			-- upvalues: Ref (upval), PlayersService (upval), Flag (ref), showToastOnJoin (upval), FFlagEnablePartyNudgeAfterJoin (upval), Services (upval), UseRefResult (upval), onPlayerAdded (upval), GetFFlagEnableReferredPlayerJoinRemoteEventFunction (upval), Callback (upval), UseRefResult2 (upval), UseResult (upval)
			if not Ref.current then
				if #PlayersService:GetPlayers() > 0 and Flag then
					showToastOnJoin()
				end
				if FFlagEnablePartyNudgeAfterJoin then
					if Services.showFriendJoinedPlayerToastRemoteEvent then
						UseRefResult.current = Services.showFriendJoinedPlayerToastRemoteEvent.OnClientEvent:Connect(onPlayerAdded)
					end
				else
					UseRefResult.current = PlayersService.PlayerAdded:Connect(onPlayerAdded)
				end
				if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() and Services.referredPlayerJoinRemoteEvent and Callback() then
					UseRefResult2.current = Services.referredPlayerJoinRemoteEvent.OnClientEvent:Connect(UseResult)
				end
			end
		end)
		
		return function()
			-- upvalues: Ref (upval), UseRefResult (upval), FFlagEnablePartyNudgeAfterJoin (upval), UseRefResult1 (upval), GetFFlagEnableReferredPlayerJoinRemoteEventFunction (upval), UseRefResult2 (upval)
			Ref.current = true
			
			if UseRefResult.current then
				UseRefResult.current:disconnect()
			end
			if FFlagEnablePartyNudgeAfterJoin and UseRefResult1.current then
				UseRefResult1.current:disconnect()
			end
			if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() and UseRefResult2.current then
				UseRefResult2.current:disconnect()
			end
		end
	end, {
		PlayersService,
		UseResult,
		Services.referredPlayerJoinRemoteEvent,
		if FFlagEnablePartyNudgeAfterJoin then Services.showFriendJoinedPlayerToastRemoteEvent else nil,
		if FFlagEnablePartyNudgeAfterJoin then Services.showPlayerJoinedFriendsToastRemoteEvent else nil
	})
end

return SocialContextToastDispatcher