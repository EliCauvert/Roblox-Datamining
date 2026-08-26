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
local var1 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then function()
	-- upvalues: getFFlagEnableReferredPlayerJoinRemoteEventForAll (ref)
	return getFFlagEnableReferredPlayerJoinRemoteEventForAll()
end else nil

local function getNames(p1, p2)
	-- upvalues: promiseModule (ref), userProfilesModule (ref), getCombinedNameFromId (ref)
	local t = {}
	
	for i = 1, #p2 do
		t[i] = tostring(p2[i])
	end
	return promiseModule.new(function(p3, _)
		-- upvalues: p1 (ref), userProfilesModule (copy), t (ref), p2 (ref), getCombinedNameFromId (copy)
		p1:query({
			query = userProfilesModule.Queries.userProfilesAllNamesByUserIds,
			variables = { userIds = t }
		}):andThen(function(p4)
			-- upvalues: p2 (copy), getCombinedNameFromId (copy), p3 (ref)
			local t = {}
			
			for i = 1, #p2 do
				table.insert(t, {
					userId = p2[i],
					name = getCombinedNameFromId(p4.data, p2[i])
				})
			end
			p3(t)
		end)
	end)
end

local function _(p3, p4, p5)
	-- upvalues: cryoModule (ref)
	if p5 then
		local var2 = cryoModule.List.removeValue(p3, p4)
		table.insert(var2, 1, p4)
		
		return var2
	end
	return p3
end

local function showYouJoinedFriendsToast(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: setToastContentModule (ref), socialContextToastDiagKeysModule (ref), getFFlagSocialContextToastEventStream (ref), socialContextToastEventsModule (ref), toastTypesModule (ref), socialContextToastAnalyticsActionTypesModule (ref), cryoModule (ref), getNames (ref)
	if #p6 == 0 then
		return p4(setToastContentModule(nil))
	end
	p3.analytics.Diag:reportCounter(socialContextToastDiagKeysModule.YouJoinedFriends, 1)
	
	if getFFlagSocialContextToastEventStream() then
		socialContextToastEventsModule(p3.eventIngest, {
			toastType = toastTypesModule.YouJoinedFriends,
			friendId = table.concat(p6, ","),
			universeId = p8,
			placeId = p9,
			actionType = socialContextToastAnalyticsActionTypesModule.Shown
		})
	end
	if p5 > 0 then
		local var2 = p6
		
		if p7 then
			var2 = cryoModule.List.removeValue(var2, p5)
			table.insert(var2, 1, p5)
			p6 = var2
		else
			p6 = var2
		end
	end
	return getNames(p3.apolloClient, p6):andThen(function(p10)
		-- upvalues: p4 (ref), setToastContentModule (copy), toastTypesModule (copy)
		p4(setToastContentModule({
			toastType = toastTypesModule.YouJoinedFriends,
			userList = p10
		}))
	end)
end

local function handleFollowedPlayerDisconnected(p3, p4, p5, _, p6, p7)
	-- upvalues: usersGetPresence (ref), socialContextToastDiagKeysModule (ref), getFFlagSocialContextToastEventStream (ref), socialContextToastEventsModule (ref), toastTypesModule (ref), socialContextToastAnalyticsActionTypesModule (ref), getNames (ref), setToastContentModule (ref), setConfirmationModalModule (ref), joinExperience (ref), postSendExperienceInvite (ref)
	local analytics = p3.analytics
	usersGetPresence(p3.networking, { p5 }):andThen(function(p8)
		-- upvalues: p6 (ref), analytics (ref), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p3 (ref), toastTypesModule (copy), p5 (ref), p7 (ref), socialContextToastAnalyticsActionTypesModule (copy), getNames (copy), p4 (ref), setToastContentModule (copy), setConfirmationModalModule (copy), joinExperience (copy), postSendExperienceInvite (copy)
		if not p8.responseBody or not p8.responseBody.userPresences or #p8.responseBody.userPresences == 0 then return end
		local var2 = p8.responseBody.userPresences[1]
		local universeId = var2.universeId
		
		if tostring(universeId) == tostring(p6) then
			analytics.Diag:reportCounter(socialContextToastDiagKeysModule.FollowedFriendInOtherPlace, 1)
			
			if getFFlagSocialContextToastEventStream() then
				socialContextToastEventsModule(p3.eventIngest, {
					toastType = toastTypesModule.FriendInNonRootPlace,
					friendId = tostring(p5),
					universeId = p6,
					placeId = p7,
					actionType = socialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			return getNames(p3.apolloClient, { p5 }):andThen(function(p9)
				-- upvalues: p4 (copy), setToastContentModule (copy), toastTypesModule (copy), p5 (copy)
				if #p9 == 0 then
					return
				end
				p4(setToastContentModule({
					toastType = toastTypesModule.FriendInNonRootPlace,
					joinerUserId = p5,
					joinerName = p9[1].name
				}))
			end)
		elseif universeId == nil then
			analytics.Diag:reportCounter(socialContextToastDiagKeysModule.FollowedFriendNotInGame, 1)
			
			if getFFlagSocialContextToastEventStream() then
				socialContextToastEventsModule(p3.eventIngest, {
					toastType = toastTypesModule.InviteBack,
					friendId = tostring(p5),
					universeId = p6,
					placeId = p7,
					actionType = socialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			local function onInviteBackButtonClick()
				-- upvalues: analytics (copy), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p3 (copy), toastTypesModule (copy), p5 (copy), p6 (copy), p7 (copy), socialContextToastAnalyticsActionTypesModule (copy), postSendExperienceInvite (copy), p4 (copy), setToastContentModule (copy)
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.InviteBackButtonClicked, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(p3.eventIngest, {
						toastType = toastTypesModule.InviteBack,
						friendId = tostring(p5),
						universeId = p6,
						placeId = p7,
						actionType = socialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				postSendExperienceInvite(p3.networking, tostring(p5), tostring(p7), "SocialContextToast"):andThen(function(_)
					-- upvalues: p4 (copy), setToastContentModule (copy), toastTypesModule (copy)
					p4(setToastContentModule({ toastType = toastTypesModule.InviteSuccess }))
				end, function(_)
					-- upvalues: p4 (copy), setToastContentModule (copy), toastTypesModule (copy)
					p4(setToastContentModule({ toastType = toastTypesModule.InviteFailure }))
				end)
			end
			
			return getNames(p3.apolloClient, { p5 }):andThen(function(p9)
				-- upvalues: p4 (copy), setToastContentModule (copy), toastTypesModule (copy), p5 (copy), onInviteBackButtonClick (ref)
				if #p9 == 0 then
					return
				end
				p4(setToastContentModule({
					toastType = toastTypesModule.InviteBack,
					joinerUserId = p5,
					joinerName = p9[1].name,
					onActivated = onInviteBackButtonClick
				}))
			end)
		else
			analytics.Diag:reportCounter(socialContextToastDiagKeysModule.FollowedFriendInOtherUniverse, 1)
			
			if getFFlagSocialContextToastEventStream() then
				socialContextToastEventsModule(p3.eventIngest, {
					toastType = toastTypesModule.FollowYourFriend,
					friendId = tostring(p5),
					universeId = p6,
					placeId = p7,
					actionType = socialContextToastAnalyticsActionTypesModule.Shown
				})
			end
			local function closeCallback(p9)
				-- upvalues: p4 (copy), setConfirmationModalModule (copy), analytics (copy), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p3 (copy), p5 (copy), p6 (copy), p7 (copy), socialContextToastAnalyticsActionTypesModule (copy), var2 (ref), joinExperience (copy)
				if not p9 then
					p4(setConfirmationModalModule(false))
					
					return
				end
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.ConfirmLeaveGameButtonClicked, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(p3.eventIngest, {
						toastType = "LeaveGameConfirmationModal",
						friendId = tostring(p5),
						universeId = p6,
						placeId = p7,
						actionType = socialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				joinExperience(string.format("roblox://userid=%s&placeid=%s", tostring(p5), var2.placeId), true)
			end
			
			local function onJoinFriendButtonClick()
				-- upvalues: analytics (copy), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), p3 (copy), toastTypesModule (copy), p5 (copy), p6 (copy), p7 (copy), socialContextToastAnalyticsActionTypesModule (copy), p4 (copy), setConfirmationModalModule (copy), closeCallback (ref)
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.JoinFriendButtonClicked, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(p3.eventIngest, {
						toastType = toastTypesModule.FollowYourFriend,
						friendId = tostring(p5),
						universeId = p6,
						placeId = p7,
						actionType = socialContextToastAnalyticsActionTypesModule.ButtonClicked
					})
				end
				p4(setConfirmationModalModule(true, closeCallback))
			end
			
			return getNames(p3.apolloClient, { p5 }):andThen(function(p9)
				-- upvalues: p4 (copy), setToastContentModule (copy), toastTypesModule (copy), p5 (copy), var2 (ref), onJoinFriendButtonClick (ref)
				if #p9 == 0 then
					return
				end
				p4(setToastContentModule({
					toastType = toastTypesModule.FollowYourFriend,
					joinerUserId = p5,
					joinerName = p9[1].name,
					experienceName = var2.lastLocation,
					onActivated = onJoinFriendButtonClick
				}))
			end)
		end
	end, function(_)
		-- upvalues: analytics (ref), socialContextToastDiagKeysModule (copy)
		analytics.Diag:reportCounter(socialContextToastDiagKeysModule.ErrorFetchingPresence, 1)
	end)
end

function SocialContextToastDispatcher(p3)
	-- upvalues: reactModule (ref), getFFlagEnableReferredPlayerJoinRemoteEvent (ref), useDispatch (ref), DEPRECATED_FriendsGetFriendStatuses (ref), handleFollowedPlayerDisconnected (ref), showYouJoinedFriendsToast (ref), socialContextToastDiagKeysModule (ref), getFFlagSocialContextToastEventStream (ref), socialContextToastEventsModule (ref), toastTypesModule (ref), socialContextToastAnalyticsActionTypesModule (ref), getNames (ref), setToastContentModule (ref), fFlagEnablePartyNudgeAfterJoin (ref), useOneToOnePartyNudgeStartPartyRejected (ref), getFIntMaxReferredPlayerJoinToasts (ref), socialContextToastDelay (ref), var1 (write)
	local services = p3.services
	local analytics = services.analytics
	local playersService = services.playersService
	local var2 = reactModule.createRef()
	local networking = services.networking
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then reactModule.useRef(nil) else nil
	local var6 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then reactModule.useRef(0) else nil
	local var7 = useDispatch()
	
	local function showToastOnJoin()
		-- upvalues: playersService (ref), DEPRECATED_FriendsGetFriendStatuses (copy), networking (ref), handleFollowedPlayerDisconnected (copy), services (ref), var7 (ref), p3 (ref), showYouJoinedFriendsToast (copy)
		local followUserId = playersService.LocalPlayer.FollowUserId
		local var8 = false
		local t = {}
		local t_1 = {}
		
		for i, v in pairs(playersService:GetPlayers()) do
			table.insert(t_1, v.UserId)
		end
		DEPRECATED_FriendsGetFriendStatuses(networking, t_1):andThen(function(p4)
			-- upvalues: followUserId (ref), var8 (write), t (ref), handleFollowedPlayerDisconnected (copy), services (copy), var7 (copy), p3 (copy), showYouJoinedFriendsToast (copy)
			if not p4 or not p4.responseBody or not p4.responseBody.data then return end
			for i, v in pairs(p4.responseBody.data) do
				local id = v.id
				
				if id == followUserId then
					var8 = true
				end
				if v.status == "Friends" then
					table.insert(t, id)
				end
			end
			return if followUserId > 0 and not var8 then handleFollowedPlayerDisconnected(services, var7, followUserId, t, p3.gameId, p3.placeId) else showYouJoinedFriendsToast(services, var7, followUserId, t, var8, p3.gameId, p3.placeId)
		end)
	end
	
	local function onPlayerAdded(p4)
		-- upvalues: playersService (ref), analytics (ref), socialContextToastDiagKeysModule (copy), getFFlagSocialContextToastEventStream (copy), socialContextToastEventsModule (copy), services (ref), toastTypesModule (copy), p3 (ref), socialContextToastAnalyticsActionTypesModule (copy), getNames (copy), var7 (ref), setToastContentModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if p4.FollowUserId == localPlayer.UserId then
			local ok, status = pcall(function()
				-- upvalues: localPlayer (ref), p4 (ref)
				return localPlayer:IsFriendsWithAsync(p4.UserId)
			end)
			
			if ok and status then
				analytics.Diag:reportCounter(socialContextToastDiagKeysModule.YouWereFollowed, 1)
				
				if getFFlagSocialContextToastEventStream() then
					socialContextToastEventsModule(services.eventIngest, {
						toastType = toastTypesModule.FriendJoinedYou,
						friendId = tostring(p4.UserId),
						universeId = p3.gameId,
						placeId = p3.placeId,
						actionType = socialContextToastAnalyticsActionTypesModule.Shown
					})
				end
				getNames(services.apolloClient, { p4.UserId }):andThen(function(p5)
					-- upvalues: p4 (ref), var7 (copy), setToastContentModule (copy), toastTypesModule (copy)
					local name = p5[1].name
					
					if name == nil then
						name = p4.DisplayName
					end
					var7(setToastContentModule({
						toastType = toastTypesModule.FriendJoinedYou,
						joinerUserId = p4.UserId,
						joinerName = name
					}))
				end)
			end
		end
	end
	
	if fFlagEnablePartyNudgeAfterJoin then
		useOneToOnePartyNudgeStartPartyRejected(function(p4)
			-- upvalues: playersService (ref), onPlayerAdded (ref)
			if p4 and p4.inviterId then
				local inviterIdPlayerByUserId = playersService:GetPlayerByUserId(p4.inviterId)
				
				if inviterIdPlayerByUserId then
					onPlayerAdded(inviterIdPlayerByUserId)
				end
			end
		end)
	end
	local var9 = if getFFlagEnableReferredPlayerJoinRemoteEvent() then reactModule.useCallback(function(p4)
		-- upvalues: var6 (ref), getFIntMaxReferredPlayerJoinToasts (copy), var7 (ref), setToastContentModule (copy), toastTypesModule (copy)
		if getFIntMaxReferredPlayerJoinToasts() <= var6.current then
			return
		end
		var6.current += 1
		var7(setToastContentModule({
			toastType = toastTypesModule.InviteeJoinedYou,
			joinerUserId = p4.UserId,
			joinerName = p4.DisplayName
		}))
	end, {}) else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagEnablePartyNudgeAfterJoin (copy), services (ref), var4 (ref), socialContextToastDelay (copy), var2 (ref), playersService (ref), showToastOnJoin (ref), var3 (ref), onPlayerAdded (ref), getFFlagEnableReferredPlayerJoinRemoteEvent (copy), var1 (copy), var5 (ref), var9 (write)
		local var10 = true
		
		if fFlagEnablePartyNudgeAfterJoin and services.showPlayerJoinedFriendsToastRemoteEvent then
			var10 = false
			var4.current = services.showPlayerJoinedFriendsToastRemoteEvent.OnClientEvent:Connect(function()
				-- upvalues: var10 (write)
				var10 = true
			end)
		end
		task.delay(socialContextToastDelay, function()
			-- upvalues: var2 (copy), playersService (copy), var10 (write), showToastOnJoin (copy), fFlagEnablePartyNudgeAfterJoin (copy), services (copy), var3 (copy), onPlayerAdded (copy), getFFlagEnableReferredPlayerJoinRemoteEvent (copy), var1 (copy), var5 (copy), var9 (copy)
			if not var2.current then
				if #playersService:GetPlayers() > 0 and var10 then
					showToastOnJoin()
				end
				if not fFlagEnablePartyNudgeAfterJoin then
					var3.current = playersService.PlayerAdded:Connect(onPlayerAdded)
				elseif services.showFriendJoinedPlayerToastRemoteEvent then
					var3.current = services.showFriendJoinedPlayerToastRemoteEvent.OnClientEvent:Connect(onPlayerAdded)
				end
				if getFFlagEnableReferredPlayerJoinRemoteEvent() and services.referredPlayerJoinRemoteEvent and var1() then
					var5.current = services.referredPlayerJoinRemoteEvent.OnClientEvent:Connect(var9)
				end
			end
		end)
		
		return function()
			-- upvalues: var2 (copy), var3 (copy), fFlagEnablePartyNudgeAfterJoin (copy), var4 (copy), getFFlagEnableReferredPlayerJoinRemoteEvent (copy), var5 (copy)
			var2.current = true
			
			if var3.current then
				var3.current:disconnect()
			end
			if fFlagEnablePartyNudgeAfterJoin and var4.current then
				var4.current:disconnect()
			end
			if getFFlagEnableReferredPlayerJoinRemoteEvent() and var5.current then
				var5.current:disconnect()
			end
		end
	end, {
		playersService,
		var9,
		services.referredPlayerJoinRemoteEvent,
		if fFlagEnablePartyNudgeAfterJoin then services.showFriendJoinedPlayerToastRemoteEvent else nil,
		if fFlagEnablePartyNudgeAfterJoin then services.showPlayerJoinedFriendsToastRemoteEvent else nil
	})
end

return SocialContextToastDispatcher