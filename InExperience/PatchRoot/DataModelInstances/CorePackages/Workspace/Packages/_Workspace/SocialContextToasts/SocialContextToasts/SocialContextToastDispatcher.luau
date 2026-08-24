local socialContextToasts = script:FindFirstAncestor("SocialContextToasts")
local parent = socialContextToasts.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local promiseModule = require(parent.Promise)
local usersGetPresence = require(parent.UserLib).Requests.UsersGetPresence
local userProfilesModule = require(parent.UserProfiles)
local getCombinedNameFromId = userProfilesModule.Selectors.getCombinedNameFromId
local postSendExperienceInvite = require(parent.GameInvite).PostSendExperienceInvite
local joinExperience = require(parent.NotificationsCommon).JoinExperience
local socialContextToastDiagKeysModule = require(socialContextToasts.Enums.SocialContextToastDiagKeys)
local setToastContentModule = require(socialContextToasts.Actions.SetToastContent)
local setConfirmationModalModule = require(socialContextToasts.Actions.SetConfirmationModal)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local toastTypesModule = require(socialContextToasts.Enums.ToastTypes)
local socialContextToastAnalyticsActionTypesModule = require(socialContextToasts.Enums.SocialContextToastAnalyticsActionTypes)
local socialContextToastEventsModule = require(socialContextToasts.SocialContextToastEvents)
local useOneToOnePartyNudgeStartPartyRejected = require(parent.SquadsCore.Hooks).useOneToOnePartyNudgeStartPartyRejected
local DEPRECATED_FriendsGetFriendStatuses = require(parent.Http).Requests.DEPRECATED_FriendsGetFriendStatuses
local getFFlagSocialContextToastEventStream = require(parent.SharedFlags).GetFFlagSocialContextToastEventStream
local getFFlagEnableReferredPlayerJoinRemoteEvent = require(parent.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent
local getFFlagEnableReferredPlayerJoinRemoteEventForAll = require(parent.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEventForAll
local getFIntMaxReferredPlayerJoinToasts = require(parent.SharedFlags).GetFIntMaxReferredPlayerJoinToasts
local fFlagEnablePartyNudgeAfterJoin = require(parent.SharedFlags).FFlagEnablePartyNudgeAfterJoin
local socialContextToastDelay = game:DefineFastInt("SocialContextToastDelay", 10)
local var12 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then function()
	-- upvalues: getFFlagEnableReferredPlayerJoinRemoteEventForAll (ref)
	return getFFlagEnableReferredPlayerJoinRemoteEventForAll()
end else nil

local function getNames(p0, p1)
	-- upvalues: promiseModule (ref), userProfilesModule (ref), getCombinedNameFromId (ref)
	local t = {}
	
	for i = 1, #p1 do
		t[i] = tostring(p1[i])
	end
	return promiseModule.new(function(p2, _)
		-- upvalues: p0 (ref), userProfilesModule (copy), t (ref), p1 (ref), getCombinedNameFromId (copy)
		p0:query({
			query = userProfilesModule.Queries.userProfilesAllNamesByUserIds,
			variables = { userIds = t }
		}):andThen(function(p3)
			-- upvalues: p1 (copy), getCombinedNameFromId (copy), p2 (ref)
			local t = {}
			
			for i = 1, #p1 do
				table.insert(t, {
					userId = p1[i],
					name = getCombinedNameFromId(p3.data, p1[i])
				})
			end
			p2(t)
		end)
	end)
end

local function _(p4, p5, p6)
	-- upvalues: cryoModule (ref)
	if p6 then
		local var18 = cryoModule.List.removeValue(p4, p5)
		table.insert(var18, 1, p5)
		
		return var18
	end
	return p4
end

local function showYouJoinedFriendsToast(p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: setToastContentModule (ref), socialContextToastDiagKeysModule (ref), getFFlagSocialContextToastEventStream (ref), socialContextToastEventsModule (ref), toastTypesModule (ref), socialContextToastAnalyticsActionTypesModule (ref), cryoModule (ref), getNames (ref)
	if #p10 == 0 then
		return p8(setToastContentModule(nil))
	end
	p7.analytics.Diag:reportCounter(socialContextToastDiagKeysModule.YouJoinedFriends, 1)
	
	if getFFlagSocialContextToastEventStream() then
		socialContextToastEventsModule(p7.eventIngest, {
			toastType = toastTypesModule.YouJoinedFriends,
			friendId = table.concat(p10, ","),
			universeId = p12,
			placeId = p13,
			actionType = socialContextToastAnalyticsActionTypesModule.Shown
		})
	end
	if p9 > 0 then
		local var19 = p10
		
		if p11 then
			var19 = cryoModule.List.removeValue(var19, p9)
			table.insert(var19, 1, p9)
			p10 = var19
		else
			p10 = var19
		end
	end
	return getNames(p7.apolloClient, p10):andThen(function(p14)
		-- upvalues: p8 (ref), setToastContentModule (copy), toastTypesModule (copy)
		p8(setToastContentModule({
			toastType = toastTypesModule.YouJoinedFriends,
			userList = p14
		}))
	end)
end

local function handleFollowedPlayerDisconnected(p15, p16, p17, _, p18, p19)
	-- upvalues: usersGetPresence (ref), socialContextToastDiagKeysModule (ref), getFFlagSocialContextToastEventStream (ref), socialContextToastEventsModule (ref), toastTypesModule (ref), socialContextToastAnalyticsActionTypesModule (ref), getNames (ref), setToastContentModule (ref), setConfirmationModalModule (ref), joinExperience (ref), postSendExperienceInvite (ref)
	local analytics = p15.analytics
	usersGetPresence(p15.networking, { p17 }):andThen(function(p20)
		-- upvalues: p18 (ref), analytics (ref), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p15 (ref), toastTypesModule (copy), p17 (ref), p19 (ref), socialContextToastAnalyticsActionTypesModule (copy), getNames (copy), p16 (ref), setToastContentModule (copy), setConfirmationModalModule (copy), joinExperience (copy), postSendExperienceInvite (copy)
		if not p20.responseBody or not p20.responseBody.userPresences or #p20.responseBody.userPresences == 0 then return end
		local var20 = p20.responseBody.userPresences[1]
		local universeId = var20.universeId
		
		if tostring(universeId) == tostring(p18) then
			analytics.Diag:reportCounter(socialContextToastDiagKeysModule.FollowedFriendInOtherPlace, 1)
			
			if getFFlagSocialContextToastEventStream() then
				socialContextToastEventsModule(p15.eventIngest, {
					toastType = toastTypesModule.FriendInNonRootPlace,
					friendId = tostring(p17),
					universeId = p18,
					placeId = p19,
					actionType = socialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			return getNames(p15.apolloClient, { p17 }):andThen(function(p21)
				-- upvalues: p16 (copy), setToastContentModule (copy), toastTypesModule (copy), p17 (copy)
				if #p21 == 0 then
					return
				end
				p16(setToastContentModule({
					toastType = toastTypesModule.FriendInNonRootPlace,
					joinerUserId = p17,
					joinerName = p21[1].name
				}))
			end)
		elseif universeId == nil then
			analytics.Diag:reportCounter(socialContextToastDiagKeysModule.FollowedFriendNotInGame, 1)
			
			if getFFlagSocialContextToastEventStream() then
				socialContextToastEventsModule(p15.eventIngest, {
					toastType = toastTypesModule.InviteBack,
					friendId = tostring(p17),
					universeId = p18,
					placeId = p19,
					actionType = socialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			local function onInviteBackButtonClick()
				-- upvalues: analytics (copy), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p15 (copy), toastTypesModule (copy), p17 (copy), p18 (copy), p19 (copy), socialContextToastAnalyticsActionTypesModule (copy), postSendExperienceInvite (copy), p16 (copy), setToastContentModule (copy)
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.InviteBackButtonClicked, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(p15.eventIngest, {
						toastType = toastTypesModule.InviteBack,
						friendId = tostring(p17),
						universeId = p18,
						placeId = p19,
						actionType = socialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				postSendExperienceInvite(p15.networking, tostring(p17), tostring(p19), "SocialContextToast"):andThen(function(_)
					-- upvalues: p16 (copy), setToastContentModule (copy), toastTypesModule (copy)
					p16(setToastContentModule({ toastType = toastTypesModule.InviteSuccess }))
				end, function(_)
					-- upvalues: p16 (copy), setToastContentModule (copy), toastTypesModule (copy)
					p16(setToastContentModule({ toastType = toastTypesModule.InviteFailure }))
				end)
			end
			
			return getNames(p15.apolloClient, { p17 }):andThen(function(p22)
				-- upvalues: p16 (copy), setToastContentModule (copy), toastTypesModule (copy), p17 (copy), onInviteBackButtonClick (ref)
				if #p22 == 0 then
					return
				end
				p16(setToastContentModule({
					toastType = toastTypesModule.InviteBack,
					joinerUserId = p17,
					joinerName = p22[1].name,
					onActivated = onInviteBackButtonClick
				}))
			end)
		else
			analytics.Diag:reportCounter(socialContextToastDiagKeysModule.FollowedFriendInOtherUniverse, 1)
			
			if getFFlagSocialContextToastEventStream() then
				socialContextToastEventsModule(p15.eventIngest, {
					toastType = toastTypesModule.FollowYourFriend,
					friendId = tostring(p17),
					universeId = p18,
					placeId = p19,
					actionType = socialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			local function closeCallback(p23)
				-- upvalues: p16 (copy), setConfirmationModalModule (copy), analytics (copy), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p15 (copy), p17 (copy), p18 (copy), p19 (copy), socialContextToastAnalyticsActionTypesModule (copy), var20 (ref), joinExperience (copy)
				if not p23 then
					p16(setConfirmationModalModule(false))
					
					return
				end
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.ConfirmLeaveGameButtonClicked, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(p15.eventIngest, {
						toastType = "LeaveGameConfirmationModal",
						friendId = tostring(p17),
						universeId = p18,
						placeId = p19,
						actionType = socialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				joinExperience(string.format("roblox://userid=%s&placeid=%s", tostring(p17), var20.placeId), true)
			end
			
			local function onJoinFriendButtonClick()
				-- upvalues: analytics (copy), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p15 (copy), toastTypesModule (copy), p17 (copy), p18 (copy), p19 (copy), socialContextToastAnalyticsActionTypesModule (copy), p16 (copy), setConfirmationModalModule (copy), closeCallback (ref)
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.JoinFriendButtonClicked, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(p15.eventIngest, {
						toastType = toastTypesModule.FollowYourFriend,
						friendId = tostring(p17),
						universeId = p18,
						placeId = p19,
						actionType = socialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				p16(setConfirmationModalModule(true, closeCallback))
			end
			
			return getNames(p15.apolloClient, { p17 }):andThen(function(p24)
				-- upvalues: p16 (copy), setToastContentModule (copy), toastTypesModule (copy), p17 (copy), var20 (ref), onJoinFriendButtonClick (ref)
				if #p24 == 0 then
					return
				end
				p16(setToastContentModule({
					toastType = toastTypesModule.FollowYourFriend,
					joinerUserId = p17,
					joinerName = p24[1].name,
					experienceName = var20.lastLocation,
					onActivated = onJoinFriendButtonClick
				}))
			end)
		end
	end, function(_)
		-- upvalues: analytics (ref), socialContextToastDiagKeysModule (copy)
		analytics.Diag:reportCounter(socialContextToastDiagKeysModule.ErrorFetchingPresence, 1)
	end)
end

function SocialContextToastDispatcher(p25)
	-- upvalues: reactModule (ref), getFFlagEnableReferredPlayerJoinRemoteEvent (ref), useDispatch (ref), DEPRECATED_FriendsGetFriendStatuses (ref), handleFollowedPlayerDisconnected (ref), showYouJoinedFriendsToast (ref), socialContextToastDiagKeysModule (ref), getFFlagSocialContextToastEventStream (ref), socialContextToastEventsModule (ref), toastTypesModule (ref), socialContextToastAnalyticsActionTypesModule (ref), getNames (ref), setToastContentModule (ref), fFlagEnablePartyNudgeAfterJoin (ref), useOneToOnePartyNudgeStartPartyRejected (ref), getFIntMaxReferredPlayerJoinToasts (ref), socialContextToastDelay (ref), var12 (write)
	local services = p25.services
	local analytics = services.analytics
	local playersService = services.playersService
	local var24 = reactModule.createRef()
	local networking = services.networking
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useRef(nil)
	local var27 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then reactModule.useRef(nil) else nil
	local var28 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then reactModule.useRef(0) else nil
	local var29 = useDispatch()
	
	local function showToastOnJoin()
		-- upvalues: playersService (ref), DEPRECATED_FriendsGetFriendStatuses (copy), networking (ref), handleFollowedPlayerDisconnected (copy), services (ref), var29 (ref), p25 (ref), showYouJoinedFriendsToast (copy)
		local followUserId = playersService.LocalPlayer.FollowUserId
		local var33 = false
		local t = {}
		local t_1 = {}
		
		for i, v in pairs(playersService:GetPlayers()) do
			table.insert(t_1, v.UserId)
		end
		DEPRECATED_FriendsGetFriendStatuses(networking, t_1):andThen(function(p26)
			-- upvalues: followUserId (ref), var33 (write), t (ref), handleFollowedPlayerDisconnected (copy), services (copy), var29 (copy), p25 (copy), showYouJoinedFriendsToast (copy)
			if not p26 or not p26.responseBody or not p26.responseBody.data then return end
			for i, v in pairs(p26.responseBody.data) do
				local id = v.id
				
				if id == followUserId then
					var33 = true
				end
				if v.status == "Friends" then
					table.insert(t, id)
				end
			end
			return if followUserId > 0 and not var33 then handleFollowedPlayerDisconnected(services, var29, followUserId, t, p25.gameId, p25.placeId) else showYouJoinedFriendsToast(services, var29, followUserId, t, var33, p25.gameId, p25.placeId)
		end)
	end
	
	local function onPlayerAdded(p27)
		-- upvalues: playersService (ref), analytics (ref), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), services (ref), toastTypesModule (copy), p25 (ref), socialContextToastAnalyticsActionTypesModule (copy), getNames (copy), var29 (ref), setToastContentModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if p27.FollowUserId == localPlayer.UserId then
			local ok, status = pcall(function()
				-- upvalues: localPlayer (ref), p27 (ref)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then localPlayer:IsFriendsWithAsync(p27.UserId) else localPlayer:IsFriendsWith(p27.UserId)
			end)
			
			if ok and status then
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.YouWereFollowed, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(services.eventIngest, {
						toastType = toastTypesModule.FriendJoinedYou,
						friendId = tostring(p27.UserId),
						universeId = p25.gameId,
						placeId = p25.placeId,
						actionType = socialContextToastAnalyticsActionTypesModule.Shown
					})
				end
				getNames(services.apolloClient, { p27.UserId }):andThen(function(p28)
					-- upvalues: p27 (ref), var29 (copy), setToastContentModule (copy), toastTypesModule (copy)
					local name = p28[1].name
					
					if name == nil then
						name = p27.DisplayName
					end
					var29(setToastContentModule({
						toastType = toastTypesModule.FriendJoinedYou,
						joinerUserId = p27.UserId,
						joinerName = name
					}))
				end)
			end
		end
	end
	
	if fFlagEnablePartyNudgeAfterJoin then
		useOneToOnePartyNudgeStartPartyRejected(function(p29)
			-- upvalues: playersService (ref), onPlayerAdded (ref)
			if p29 and p29.inviterId then
				local inviterIdPlayerByUserId = playersService:GetPlayerByUserId(p29.inviterId)
				
				if inviterIdPlayerByUserId then
					onPlayerAdded(inviterIdPlayerByUserId)
				end
			end
		end)
	end
	local var32 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then reactModule.useCallback(function(p30)
		-- upvalues: var28 (ref), getFIntMaxReferredPlayerJoinToasts (copy), var29 (ref), setToastContentModule (copy), toastTypesModule (copy)
		if getFIntMaxReferredPlayerJoinToasts() <= var28.current then
			return
		end
		var28.current += 1
		var29(setToastContentModule({
			toastType = toastTypesModule.InviteeJoinedYou,
			joinerUserId = p30.UserId,
			joinerName = p30.DisplayName
		}))
	end, {}) else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagEnablePartyNudgeAfterJoin (copy), services (ref), var26 (ref), socialContextToastDelay (copy), var24 (ref), playersService (ref), showToastOnJoin (ref), var25 (ref), onPlayerAdded (ref), getFFlagEnableReferredPlayerJoinRemoteEvent (copy), var12 (copy), var27 (ref), var32 (write)
		local var37 = true
		
		if fFlagEnablePartyNudgeAfterJoin and services.showPlayerJoinedFriendsToastRemoteEvent then
			var37 = false
			var26.current = services.showPlayerJoinedFriendsToastRemoteEvent.OnClientEvent:Connect(function()
				-- upvalues: var37 (write)
				var37 = true
			end)
		end
		task.delay(socialContextToastDelay, function()
			-- upvalues: var24 (copy), playersService (copy), var37 (write), showToastOnJoin (copy), fFlagEnablePartyNudgeAfterJoin (copy), services (copy), var25 (copy), onPlayerAdded (copy), getFFlagEnableReferredPlayerJoinRemoteEvent (copy), var12 (copy), var27 (copy), var32 (copy)
			if not var24.current then
				if #playersService:GetPlayers() > 0 and var37 then
					showToastOnJoin()
				end
				if not fFlagEnablePartyNudgeAfterJoin then
					var25.current = playersService.PlayerAdded:Connect(onPlayerAdded)
				elseif services.showFriendJoinedPlayerToastRemoteEvent then
					var25.current = services.showFriendJoinedPlayerToastRemoteEvent.OnClientEvent:Connect(onPlayerAdded)
				end
				if getFFlagEnableReferredPlayerJoinRemoteEvent() and services.referredPlayerJoinRemoteEvent and var12() then
					var27.current = services.referredPlayerJoinRemoteEvent.OnClientEvent:Connect(var32)
				end
			end
		end)
		
		return function()
			-- upvalues: var24 (copy), var25 (copy), fFlagEnablePartyNudgeAfterJoin (copy), var26 (copy), getFFlagEnableReferredPlayerJoinRemoteEvent (copy), var27 (copy)
			var24.current = true
			
			if var25.current then
				var25.current:disconnect()
			end
			if fFlagEnablePartyNudgeAfterJoin and var26.current then
				var26.current:disconnect()
			end
			if getFFlagEnableReferredPlayerJoinRemoteEvent() and var27.current then
				var27.current:disconnect()
			end
		end
	end, {
		playersService,
		var32,
		services.referredPlayerJoinRemoteEvent,
		if fFlagEnablePartyNudgeAfterJoin then services.showFriendJoinedPlayerToastRemoteEvent else nil,
		if fFlagEnablePartyNudgeAfterJoin then services.showPlayerJoinedFriendsToastRemoteEvent else nil
	})
end

return SocialContextToastDispatcher