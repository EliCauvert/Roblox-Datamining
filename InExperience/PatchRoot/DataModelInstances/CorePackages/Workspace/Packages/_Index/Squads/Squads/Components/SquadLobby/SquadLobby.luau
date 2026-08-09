local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local UIBloxModule = require(parent.UIBlox)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useVoiceStatus = require(parent.CrossExperienceVoice).Hooks.useVoiceStatus
local constantsModule = require(squads.Common.Constants)
local dependenciesModule = require(squads.dependencies)
local loggerModule = require(squads.Logger)
local _ = require(squads.Common.ModelTypes)
local squadLobbyActionBarModule = require(script.Parent.SquadLobbyActionBar)
local squadLobbyUserGridModule = require(script.Parent.SquadLobbyUserGrid)
local squadLobbyRegroupRowModule = require(script.Parent.SquadLobbyRegroupRow)
local squadLobbyVoiceChatMenuModule = require(script.Parent.SquadLobbyVoiceChatMenu)
local squadLobbyBannersModule = require(script.Parent.SquadLobbyBanners)
local squadLobbyUserDropdownMenuModule = require(script.Parent.SquadLobbyUserDropdownMenu)
local squadPartySheetActionEnumModule = require(squads.Enums.SquadPartySheetActionEnum)
local squadUserPartyStatusModule = require(squads.Enums.SquadUserPartyStatus)
local cryo = dependenciesModule.Cryo
local foundation = dependenciesModule.Foundation
local luauPolyfill = dependenciesModule.LuauPolyfill
local networkingPresence = dependenciesModule.NetworkingPresence
local networkingSquads = dependenciesModule.NetworkingSquads
local react = dependenciesModule.React
local roact = dependenciesModule.Roact
local sharedFlags = dependenciesModule.SharedFlags
local enumsModule = require(parent.SquadsCore.Enums)
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadPromptType = enumsModule.SquadPromptType
local squadCoplayJoin = enumsModule.SquadCoplayJoin
local squadViewFlags = require(parent.SquadsCore.SquadExternalContractProvider).SquadViewFlags
local squadLobbySessionProvider = require(parent.SquadsCore.SquadSessionProvider).SquadLobbySessionProvider
local logInExpCoplayTelemetryModule = require(parent.SquadsCore.logInExpCoplayTelemetry)
local createOrJoinSquad = require(parent.SquadsCore.Thunks).createOrJoinSquad
local userBlockingNetworking = dependenciesModule.UserBlockingNetworking
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useEffectOnce = dependenciesModule.Hooks.useEffectOnce
local useNavigation = dependenciesModule.useNavigation
local usePrevious = dependenciesModule.Hooks.usePrevious
local useSelector = dependenciesModule.Hooks.useSelector
local useStore = dependenciesModule.Hooks.useStore
local useSquadState = require(parent.SquadsCore.Hooks).useSquadState
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local stateLayerAffordance = foundation.Enums.StateLayerAffordance
local useStyle = UIBloxModule.Core.Style.useStyle
local useTokens = foundation.Hooks.useTokens
local clearInterval = luauPolyfill.clearInterval
local setInterval = luauPolyfill.setInterval
local enableSquadLobbyBanners = game:DefineFastFlag("EnableSquadLobbyBanners", false)
local fFlagEnableSquadCoplayAnalytic = sharedFlags.FFlagEnableSquadCoplayAnalytic
local fFlagEnableSquadTopBannerWideMode = sharedFlags.FFlagEnableSquadTopBannerWideMode
local fFlagMakeCreateOrJoinSquadAThunks = sharedFlags.FFlagMakeCreateOrJoinSquadAThunks
local partyInviteeNoResponseDurationSeconds = game:DefineFastInt("PartyInviteeNoResponseDurationSeconds", 3)
local partyUserInvitedDurationSeconds = game:DefineFastInt("PartyUserInvitedDurationSeconds", 10)
local squadQuickStartExperimentation = dependenciesModule.SocialExperiments.SquadQuickStartExperimentation
local squadCoordinationExperienceJoinExperimentation = dependenciesModule.SocialExperiments.SquadCoordinationExperienceJoinExperimentation
local squadRegroupExperimentation = dependenciesModule.SocialExperiments.SquadRegroupExperimentation
local fFlagEnablePartyQuickStartButton = sharedFlags.FFlagEnablePartyQuickStartButton
local fFlagEnablePartyVoiceChangersInLua = sharedFlags.FFlagEnablePartyVoiceChangersInLua
local fFlagEnableSquadRegroupExperimentation = sharedFlags.FFlagEnableSquadRegroupExperimentation
local fFlagEnableSquadRegroupExperimentationSmallScreenFix = sharedFlags.FFlagEnableSquadRegroupExperimentationSmallScreenFix
local fFlagEnableSquadRegroupServerCapacityCheck = sharedFlags.FFlagEnableSquadRegroupServerCapacityCheck
local fFlagAppChatShowOSAOnPageEntry = sharedFlags.FFlagAppChatShowOSAOnPageEntry
local fFlagEnableScheduledSquads = sharedFlags.FFlagEnableScheduledSquads

return function(p0) --[[ line: 98 | named "SquadLobby" ]]
	-- upvalues: useTokens (ref), useDispatch (ref), useLocalUserId (ref), useStyle (ref), useSquadState (ref), useNavigation (ref), react (ref), squadExternalContractContext (ref), useVoiceStatus (ref), fFlagEnableSquadTopBannerWideMode (ref), httpService (ref), roactNavigationModule (ref), squadViewFlags (ref), useCurrentSquadSelector (ref), useSelector (ref), useStore (ref), squadQuickStartExperimentation (ref), fFlagEnablePartyQuickStartButton (ref), fFlagEnableScheduledSquads (ref), squadPromptType (ref), fFlagMakeCreateOrJoinSquadAThunks (ref), createOrJoinSquad (ref), networkingSquads (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoin (ref), useEffectOnce (ref), fFlagAppChatShowOSAOnPageEntry (ref), loggerModule (ref), cryo (ref), squadUserPartyStatusModule (ref), partyUserInvitedDurationSeconds (ref), partyInviteeNoResponseDurationSeconds (ref), setInterval (ref), clearInterval (ref), usePrevious (ref), userBlockingNetworking (ref), networkingPresence (ref), constantsModule (ref), fFlagEnableSquadRegroupServerCapacityCheck (ref), playersService (ref), squadRegroupExperimentation (ref), presenceType (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (ref), enableSquadLobbyBanners (ref), squadLobbyBannersModule (ref), foundation (ref), squadLobbyUserGridModule (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadLobbyRegroupRowModule (ref), squadLobbyActionBarModule (ref), stateLayerAffordance (ref), squadLobbyVoiceChatMenuModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), squadLobbyUserDropdownMenuModule (ref), squadCoordinationExperienceJoinExperimentation (ref), fFlagEnableSquadRegroupExperimentation (ref), roact (ref), squadLobbySessionProvider (ref)
	local var22 = useTokens()
	local var23 = useDispatch()
	local var24 = tonumber(useLocalUserId()) or 0
	local var25 = useStyle()
	local var26 = useSquadState()
	local var27 = useNavigation()
	local isWideMode = p0.isWideMode
	local var28 = react.useContext(squadExternalContractContext)
	local var29, var30 = react.useState(0)
	local var31 = useVoiceStatus()
	
	if fFlagEnableSquadTopBannerWideMode then
		local var32 = react.useRef(httpService:GenerateGUID())
		react.useEffect(function() --[[ line: 113 ]]
			-- upvalues: isWideMode (ref), var32 (ref), var28 (ref), var27 (ref), roactNavigationModule (copy)
			if isWideMode then
				return function() --[[ line: 139 ]] end
			end
			local current = var32.current
			var28.disableSquadTopBanner(current, true)
			local willBlur = var27 and var27.addListener(roactNavigationModule.Events.WillBlur, function(p1) --[[ line: 118 ]]
				-- upvalues: var28 (copy), current (ref)
				if p1.state.routeName == "SquadInviteFriends" or p1.state.routeName == "SquadLobby" then
					var28.disableSquadTopBanner(current, true)
					
					return
				end
				var28.disableSquadTopBanner(current, false)
			end)
			
			return function() --[[ line: 129 ]]
				-- upvalues: willBlur (write), var28 (copy), current (ref)
				if willBlur then
					willBlur.remove()
					willBlur = nil
				end
				var28.disableSquadTopBanner(current, false)
			end
		end, { var28.disableSquadTopBanner, var27, isWideMode })
		react.useEffect(function() --[[ line: 142 ]]
			-- upvalues: var28 (ref), squadViewFlags (copy)
			var28.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
			
			return function() --[[ line: 144 ]]
				-- upvalues: var28 (copy), squadViewFlags (copy)
				var28.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end
		end, { var28.updateSquadViewFlags })
	else
		react.useEffect(function() --[[ line: 152 ]]
			-- upvalues: var28 (ref), squadViewFlags (copy), var27 (ref), roactNavigationModule (copy)
			var28.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
			local willBlur = var27 and var27.addListener(roactNavigationModule.Events.WillBlur, function(p2) --[[ line: 155 ]]
				-- upvalues: var28 (copy), squadViewFlags (copy)
				if p2.state.routeName == "SquadInviteFriends" or p2.state.routeName == "SquadLobby" then
					var28.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
					
					return
				end
				var28.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end)
			
			return function() --[[ line: 162 ]]
				-- upvalues: willBlur (write), var28 (copy), squadViewFlags (copy)
				if willBlur then
					willBlur.remove()
					willBlur = nil
				end
				var28.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end
		end, { var28.updateSquadViewFlags, var27 })
	end
	local var33, var34 = react.useState(false)
	local var35, var36 = react.useState(Vector2.zero)
	local var37 = react.useCallback(function(p3) --[[ line: 174 ]]
		-- upvalues: var36 (ref)
		var36(p3.AbsoluteSize)
	end, { var36 })
	local var38 = useCurrentSquadSelector()
	local var39 = if var38 then var38.squadId else ""
	local members = var38 and var38.members
	local var41 = useSelector(react.useCallback(function(p4) --[[ line: 182 ]]
		return if p4.Squad and p4.Squad.Squad and p4.Squad.Squad.currentSquad then p4.Squad.Squad.currentSquad.parentChannelId or "" else ""
	end, {}))
	local var42 = useStore()
	local conversationId = var27.getParam("conversationId") or ""
	local var44 = var28.useGetConversationFromId(conversationId)
	local participants = var44 and var44.participants
	local invitees = var38 and var38.invitees
	local _ = nil
	local _ = nil
	local squadCreateOrJoinAttemptId = nil
	local extraParams = var27.getParam("extraParams") or {}
	local squadId = extraParams.squadId
	
	if squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and fFlagEnablePartyQuickStartButton then
		squadCreateOrJoinAttemptId = extraParams.squadCreateOrJoinAttemptId
	end
	local var66
	extraParams = if fFlagEnableScheduledSquads then extraParams.scheduledGroupUpId else nil
	local var48 = react.useCallback(function() --[[ line: 208 ]]
		-- upvalues: var28 (ref), var42 (ref), squadPromptType (copy), p0 (ref)
		var28.setSquadPrompt(var42, {
			hideCancelButton = true,
			promptType = squadPromptType.Error,
			onConfirm = function() --[[ line: 212 ]]
				-- upvalues: p0 (copy)
				p0.navigateAwayFromSquad()
			end
		})
	end, { p0.navigateAwayFromSquad, var42, var28.setSquadPrompt })
	local var49 = react.useCallback(function(p5) --[[ line: 218 ]]
		-- upvalues: fFlagMakeCreateOrJoinSquadAThunks (copy), var23 (ref), createOrJoinSquad (copy), var28 (ref), squadCreateOrJoinAttemptId (write), p0 (ref), fFlagEnableScheduledSquads (copy), extraParams (ref), networkingSquads (copy), fFlagEnableSquadCoplayAnalytic (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoin (copy), var48 (ref)
		if fFlagMakeCreateOrJoinSquadAThunks then
			var23(createOrJoinSquad(p5, var28.setSquadPrompt, var28.fireSquadAnalytics, var28.squadLocation, squadCreateOrJoinAttemptId, p0.navigateAwayFromSquad, if fFlagEnableScheduledSquads then extraParams else nil))
			
			return
		end
		local var81 = var23(networkingSquads.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = p5,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then var28.squadLocation else nil,
			partyAttemptId = squadCreateOrJoinAttemptId
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var81 = var81:andThen(function(p6) --[[ line: 242 ]]
				-- upvalues: logInExpCoplayTelemetryModule (copy), var28 (copy), squadCoplayJoin (copy)
				local groupUpId = p6.responseBody.groupUp.groupUpId
				local members = p6.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, var28.squadLocation, squadCoplayJoin.PartyJoin, var28.fireSquadAnalytics)
				end
			end)
		end
		var81:catch(function(_) --[[ line: 258 ]]
			-- upvalues: var48 (copy)
			var48()
		end)
	end, {
		var23, if fFlagMakeCreateOrJoinSquadAThunks then createOrJoinSquad else nil,
		if fFlagMakeCreateOrJoinSquadAThunks then p0.navigateAwayFromSquad else nil,
		if not fFlagMakeCreateOrJoinSquadAThunks then var48 else nil,
		if fFlagMakeCreateOrJoinSquadAThunks then var28.setSquadPrompt else nil,
		var28.squadLocation, var28.fireSquadAnalytics, squadCreateOrJoinAttemptId,
		if fFlagEnableScheduledSquads then extraParams else nil
	})
	local var50 = squadId and squadId ~= var39
	react.useEffect(function() --[[ line: 277 ]]
		-- upvalues: var50 (ref), var28 (ref), var42 (ref), squadPromptType (copy), var49 (ref), conversationId (ref), p0 (ref), var27 (ref)
		if var50 then
			var28.setSquadPrompt(var42, {
				promptType = squadPromptType.JoinAnotherSquad,
				onConfirm = function() --[[ line: 281 ]]
					-- upvalues: var49 (copy), conversationId (copy)
					var49(conversationId)
				end,
				onCancel = function() --[[ line: 284 ]]
					-- upvalues: p0 (copy)
					p0.navigateAwayFromSquad()
				end
			})
			var27.setParams({ squadId = nil })
		end
	end, {
		squadId, var28.setSquadPrompt, var49, conversationId, p0.navigateAwayFromSquad,
		var50
	})
	useEffectOnce(function() --[[ line: 303 ]]
		-- upvalues: var50 (ref), fFlagAppChatShowOSAOnPageEntry (copy), var28 (ref), var44 (ref), p0 (ref), var39 (ref), loggerModule (copy), conversationId (ref), var23 (ref), var49 (ref), var48 (ref)
		if var50 then return end
		if fFlagAppChatShowOSAOnPageEntry and var28.shouldShowOSAForConversation and var28.shouldShowOSAForConversation(var44) then
			p0.navigateAwayFromSquad()
			
			return
		elseif var39 == "" then
			if var44 and var44.source == "friends" then
				loggerModule:debug("Channel does not exist for: {}. Creating a friend conversation.", conversationId)
				var23(var28.createFriendConversation(conversationId)):andThen(function(p8) --[[ line: 327 ]]
					-- upvalues: var49 (copy)
					if p8 and p8.id then
						var49(p8.id)
					end
				end):catch(function(p7) --[[ line: 332 ]]
					-- upvalues: loggerModule (copy), var48 (copy)
					loggerModule:debug("Error while trying to create a friend conversation: {}", p7)
					var48()
				end)
				
				return
			end
			var49(conversationId)
		end
	end, {
		var23, var28.createFriendConversation, conversationId, var44, var49, var48
	})
	local var51, var52 = react.useState({})
	local var53 = react.useMemo(function() --[[ line: 352 ]]
		-- upvalues: members (ref)
		local t = {}
		
		if members then
			for i, v in ipairs(members) do
				t[tostring(v.userId)] = true
			end
		end
		return t
	end, { members })
	local var54 = react.useCallback(function(p9, p10, p11) --[[ line: 373 ]]
		-- upvalues: cryo (copy), var24 (ref), squadUserPartyStatusModule (copy), partyUserInvitedDurationSeconds (copy), partyInviteeNoResponseDurationSeconds (copy)
		local t = {}
		local var84 = 0
		
		if p10 and #cryo.Dictionary.keys(p10) == 0 then
			table.insert(t, {
				userId = var24,
				partyStatus = squadUserPartyStatusModule.Connecting
			})
		elseif p9 then
			local timestamp = os.time()
			
			for i, v in ipairs(p9) do
				local inactive = squadUserPartyStatusModule.Inactive
				
				if p10[v] then
					inactive = squadUserPartyStatusModule.Active
				else
					local var86 = p11 and cryo.List.findWhere(p11, function(p12) --[[ line: 398 ]]
						-- upvalues: v (ref)
						return v == tostring(p12.userId)
					end)
					
					if var86 then
						local var87 = math.floor(p11[var86].invitedAtTimestampMs / 1000) or 0
						
						if timestamp >= var87 then
							if timestamp - var87 < partyUserInvitedDurationSeconds then
								inactive = squadUserPartyStatusModule.Invited
								var84 += 1
							elseif timestamp - var87 < partyInviteeNoResponseDurationSeconds + partyUserInvitedDurationSeconds then
								inactive = squadUserPartyStatusModule.NoResponse
								var84 += 1
							end
						end
					else
						table.insert(t, { userId = tonumber(v), partyStatus = inactive })
					end
				end
			end
		end
		return { users = t, numberOfUpdatesPending = var84 }
	end, {})
	react.useEffect(function() --[[ line: 442 ]]
		-- upvalues: var54 (ref), participants (ref), var53 (ref), invitees (ref), var52 (ref), setInterval (copy), clearInterval (copy)
		var52(var54(participants, var53, invitees).users)
		local var88 = nil
		var88 = setInterval(function() --[[ line: 448 ]]
			-- upvalues: var54 (copy), participants (copy), var53 (copy), invitees (copy), var52 (copy), clearInterval (copy), var88 (write)
			local var89 = var54(participants, var53, invitees)
			var52(var89.users)
			
			if var89.numberOfUpdatesPending == 0 then
				clearInterval(var88)
			end
		end, 1000)
		
		return function() --[[ line: 457 ]]
			-- upvalues: clearInterval (copy), var88 (write)
			clearInterval(var88)
		end
	end, { var53, invitees, participants, var54 })
	local var55 = usePrevious(var39) or ""
	react.useEffect(function() --[[ line: 464 ]]
		-- upvalues: var55 (ref), var39 (ref), p0 (ref), conversationId (ref), var41 (ref), roactNavigationModule (copy), isWideMode (ref), var27 (ref)
		if var55 ~= "" and var39 == "" then
			p0.navigateAwayFromSquad()
			
			return
		elseif var39 ~= "" and conversationId ~= "" and (var41 ~= "" and var41 ~= conversationId) then
			local list = {
				roactNavigationModule.Actions.navigate({
					routeName = "ChatConversation",
					params = { conversationId = var41 }
				}),
				roactNavigationModule.Actions.navigate({
					routeName = "SquadLobby",
					params = { conversationId = var41 }
				})
			}
			
			if isWideMode then
				var27.navigate("ChatLanding", { conversationId = var41 }, roactNavigationModule.StackActions.reset({ index = 2, actions = list }))
				
				return
			end
			table.insert(list, 1, roactNavigationModule.Actions.navigate({ routeName = "ChatLanding" }))
			var27.navigate("ChatLandingStack", { conversationId = var41 }, roactNavigationModule.StackActions.reset({ index = 3, actions = list }))
		end
	end, {
		var27,
		var41,
		conversationId,
		var39,
		p0.navigateAwayFromSquad
	})
	local var56 = usePrevious(members)
	react.useEffect(function() --[[ line: 528 ]]
		-- upvalues: members (ref), var56 (ref), var24 (ref), var23 (ref), userBlockingNetworking (copy), networkingPresence (copy)
		local t = {}
		
		if members then
			local var92
			for i, v in pairs(members) do
				var92 = false
				
				if var56 then
					for i_1, v_1 in pairs(var56) do
						if v_1.userId == v.userId then
							var92 = true
							break
						end
					end
				end
				if not var92 then
					table.insert(t, v.userId)
					
					if var24 ~= v.userId then
						var23(userBlockingNetworking.IsBlockedById.API({ userId = v.userId, currentUserId = var24 }))
					end
				end
			end
		end
		var23(networkingPresence.GetPresencesFromUserIds.API(t))
	end, { members, var24, var56 })
	local var57 = react.useCallback(function() --[[ line: 558 ]]
		-- upvalues: var34 (ref), var33 (ref)
		var34(not var33)
	end, { var33, var34 })
	local var58 = constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20
	local var59 = constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20
	local var60, var61 = react.useState(nil)
	local var62, var63 = react.useState(false)
	local var64 = react.useCallback(function(p13) --[[ line: 570 ]]
		-- upvalues: var30 (ref), var22 (ref)
		if p13.Y > 0 then
			var30(p13.Y + var22.Gap.Medium)
			
			return
		end
		var30(0)
	end, { var30, var22 })
	local var65 = useSelector(react.useCallback(function(p14) --[[ line: 578 ]]
		-- upvalues: members (ref)
		local byUserId = p14.Squad and (p14.Squad.Presence and (p14.Squad.Presence.byUserId or {}))
		local t = {}
		
		for i, v in ipairs(members or {}) do
			local var95 = tostring(v.userId)
			t[var95] = byUserId[var95]
		end
		return t
	end, { members }))
	
	if fFlagEnableSquadRegroupServerCapacityCheck then
		var66 = playersService.MaxPlayers > 1
		var66 = nil
	else
		var66 = true
	end
	local var67 = react.useMemo(function() --[[ line: 594 ]]
		-- upvalues: squadRegroupExperimentation (copy), p0 (ref), var66 (ref), var38 (ref), var65 (ref), var24 (ref), presenceType (copy)
		if not squadRegroupExperimentation.getSquadRegroupEnabled() or not p0.isInExperience or (not var66 or not var38) or (not var38.members or #var38.members <= 1 or (not var38.selfPermissions or not var38.selfPermissions.canSeeRegroupJoinButton)) then
			return false
		end
		local var96 = var65[tostring(var24)]
		
		if var96 == nil then
			return false
		end
		for i, v in pairs(var65) do
			if v ~= nil and i ~= tostring(var24) and (v.userPresenceType == presenceType.Online or v.userPresenceType == presenceType.InGame and var96.gameId ~= nil and (v.gameId ~= nil and var96.gameId ~= v.gameId)) then
				return true
			end
		end
		return false
	end, {
		var65,
		var24,
		p0.isInExperience,
		var38,
		var66
	})
	local var68 = var22.Size.Size_1000 + var22.Padding.Medium * 2
	local var67_1 = fFlagEnableSquadRegroupExperimentationSmallScreenFix and var67
	local var70 = if var67_1 or not var67 then 0 else var22.Gap.XXLarge + var68
	local var71 = react.useMemo(function() --[[ line: 648 ]]
		-- upvalues: enableSquadLobbyBanners (copy), react (copy), squadLobbyBannersModule (copy), var64 (ref)
		return if enableSquadLobbyBanners then react.createElement(squadLobbyBannersModule, { onAbsoluteSizeChanged = var64 }) else nil
	end, { var64 })
	local var72 = react.useCallback(function() --[[ line: 656 ]]
		-- upvalues: p0 (ref), var41 (ref)
		p0.navigateToSquadInviteFriends(var41)
	end, { var41, p0.navigateToSquadInviteFriends })
	local var73 = react.useMemo(function() --[[ line: 661 ]]
		-- upvalues: react (copy), var29 (ref), var70 (ref), var25 (ref), var37 (ref), var67_1 (ref), foundation (copy), squadLobbyUserGridModule (copy), var35 (ref), var58 (ref), var22 (ref), var68 (ref), var51 (ref), p0 (ref), var28 (ref), eventNamesModule (copy), var41 (ref), squadPartySheetActionEnumModule (copy), var31 (ref), var61 (ref), var63 (ref), var72 (ref), squadLobbyRegroupRowModule (copy), var24 (ref)
		return react.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, var29),
			Size = UDim2.new(1, 0, 1, -(var29 + var70)),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageColor3 = var25.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var25.Theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			Selectable = false,
			ZIndex = 0,
			[react.Change.AbsoluteSize] = var37
		}, {
			FrameContents = if var67_1 then react.createElement(foundation.View, {
				tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
			}, {
				UserGridContainer = react.createElement(foundation.View, { tag = "auto-y size-full-0 bg-surface-0", LayoutOrder = 1 }, {
					SquadLobbyUserGrid = react.createElement(squadLobbyUserGridModule, {
						containerSize = var35 - Vector2.new(0, var58 + var22.Gap.Medium + var68),
						paddingBottom = UDim.new(0, 0),
						users = var51,
						isInExperience = p0.isInExperience,
						onUserCardActivated = function(p15) --[[ line: 691 ]]
							-- upvalues: var28 (copy), eventNamesModule (copy), var41 (copy), squadPartySheetActionEnumModule (copy), var31 (copy), var61 (copy), var63 (copy)
							var28.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
								parentChannelId = var41,
								actionType = squadPartySheetActionEnumModule.UserCardClicked,
								voiceStatus = var31
							})
							var61(p15)
							var63(true)
						end,
						navigateToHomePage = p0.navigateToHomePage,
						navigateToSquadInviteFriends = var72
					})
				}),
				RegroupRowSpacer = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var22.Gap.Medium)
				}),
				SquadLobbyRegroupRow = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var68)
				}, {
					Row = react.createElement(squadLobbyRegroupRowModule, { localUserId = var24 })
				}),
				BottomPadding = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var58)
				})
			}) else nil,
			SquadLobbyUserGrid = if var67_1 then nil else react.createElement(squadLobbyUserGridModule, {
				containerSize = var35 - Vector2.new(0, var58),
				paddingBottom = UDim.new(0, var58),
				users = var51,
				isInExperience = p0.isInExperience,
				onUserCardActivated = function(p16) --[[ line: 733 ]]
					-- upvalues: var28 (copy), eventNamesModule (copy), var41 (copy), squadPartySheetActionEnumModule (copy), var31 (copy), var61 (copy), var63 (copy)
					var28.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
						parentChannelId = var41,
						actionType = squadPartySheetActionEnumModule.UserCardClicked,
						voiceStatus = var31
					})
					var61(p16)
					var63(true)
				end,
				navigateToHomePage = p0.navigateToHomePage,
				navigateToSquadInviteFriends = var72
			})
		})
	end, {
		var61, var63, var35, members, var72, var37, p0.navigateToHomePage, var58,
		var29, if var67 then var70 else nil, var51, var67_1,
		if var67_1 then var68 else nil, if var67_1 then var24 else nil, var31
	})
	local var74 = react.useMemo(function() --[[ line: 764 ]]
		-- upvalues: react (copy), squadLobbyActionBarModule (copy), var26 (ref), var44 (ref), p0 (ref), var57 (ref), var39 (ref)
		return react.createElement(squadLobbyActionBarModule, {
			squadState = var26,
			anchorPoint = Vector2.new(0.5, 1),
			hasUnreadMessages = if var44 and var44.hasUnreadMessages then var44.hasUnreadMessages else false,
			navigateAwayFromSquad = p0.navigateAwayFromSquad,
			navigateToHomePage = p0.navigateToHomePage,
			toggleVoiceChatMenu = var57,
			position = UDim2.new(0.5, 0, 1, -20),
			squadId = var39,
			isInExperience = p0.isInExperience
		})
	end, {
		var39, p0.isInExperience, p0.navigateToHomePage, var26, var57,
		var44 and var44.hasUnreadMessages
	})
	local var75 = react.useMemo(function() --[[ line: 787 ]]
		-- upvalues: var67_1 (ref), var67 (ref), react (copy), foundation (copy), constantsModule (copy), var22 (ref), var68 (ref), squadLobbyRegroupRowModule (copy), var24 (ref)
		return if var67_1 or not var67 then nil else react.createElement(foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + var22.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, var68)
		}, {
			Row = react.createElement(squadLobbyRegroupRowModule, { localUserId = var24 })
		})
	end, { var67, var24, var22, var68 })
	local var76 = react.useMemo(function() --[[ line: 808 ]]
		-- upvalues: var33 (ref), react (copy), foundation (copy), stateLayerAffordance (copy), var34 (ref), var59 (ref), var22 (ref), squadLobbyVoiceChatMenuModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), p0 (ref)
		return if var33 then react.createElement(foundation.View, {
			Size = UDim2.new(1, 0, 1, 0),
			stateLayer = { affordance = stateLayerAffordance.None },
			onActivated = function() --[[ line: 814 ]]
				-- upvalues: var34 (copy)
				var34(false)
			end
		}, {
			react.createElement(foundation.ScrollView, {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				sizeConstraint = { MaxSize = Vector2.new(350, 1e999) },
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				FlexibleSpace = react.createElement(foundation.View, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, var59),
					flexItem = { FlexMode = Enum.UIFlexMode.Fill },
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function() --[[ line: 838 ]]
						-- upvalues: var34 (copy)
						var34(false)
					end
				}),
				Menu = react.createElement(foundation.View, {
					LayoutOrder = 2,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 1, 0),
					flexItem = { ItemLineAlignment = Enum.ItemLineAlignment.Center },
					AutomaticSize = Enum.AutomaticSize.Y,
					padding = Vector2.new(var22.Padding.XLarge, var22.Padding.Medium),
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function() --[[ line: 851 ]] end
				}, {
					SquadLobbyVoiceChatMenu = react.createElement(squadLobbyVoiceChatMenuModule, {
						openSquadVoiceChangers = if fFlagEnablePartyVoiceChangersInLua then p0.openSquadVoiceChangers else nil
					})
				}),
				BottomPadding = react.createElement(foundation.View, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var59),
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function() --[[ line: 864 ]]
						-- upvalues: var34 (copy)
						var34(false)
					end
				})
			})
		}) else nil
	end, { var59, var33, var34, var22 })
	local var77 = react.useMemo(function() --[[ line: 873 ]]
		-- upvalues: var62 (ref), var60 (ref), react (copy), squadLobbyUserDropdownMenuModule (copy), p0 (ref), var61 (ref), var63 (ref), var41 (ref)
		return if var62 and var60 then react.createElement(squadLobbyUserDropdownMenuModule, {
			userId = var60,
			isInExperience = p0.isInExperience,
			onDismiss = function() --[[ line: 878 ]]
				-- upvalues: var61 (copy), var63 (copy)
				var61(nil)
				var63(false)
			end,
			openViewProfile = function() --[[ line: 882 ]]
				-- upvalues: p0 (copy), var60 (copy)
				p0.openViewProfile(var60)
			end,
			openSquadVoiceAbuseReport = p0.openSquadVoiceAbuseReport,
			parentChannelId = var41
		}) else nil
	end, {
		var41, p0.isInExperience, var62, var63, p0.openViewProfile, var60, var61
	})
	react.useEffect(function() --[[ line: 899 ]]
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), fFlagEnableSquadRegroupExperimentation (copy), squadRegroupExperimentation (copy)
		squadCoordinationExperienceJoinExperimentation.logExposure()
		
		if fFlagEnableSquadRegroupExperimentation then
			squadRegroupExperimentation.logExposure()
		end
	end, {})
	local var78 = roact.createFragment({
		SquadLobbyBanners = var71,
		SquadLobbyUsersScrollingFrame = var73,
		SquadLobbyRegroupRow = var75,
		SquadLobbyActionBar = var74,
		SquadLobbyVoiceChatMenu = var76,
		UserDropdownMenu = var77
	})
	
	if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
		var78 = react.createElement(squadLobbySessionProvider.Provider, nil, var78)
	end
	return var78
end