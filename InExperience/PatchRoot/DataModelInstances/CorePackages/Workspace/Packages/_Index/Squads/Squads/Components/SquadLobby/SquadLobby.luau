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
local squadLobbyLuckyRecommendationRowModule = require(script.Parent.SquadLobbyLuckyRecommendationRow)
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
local fFlagSquadsPresenceStoreMigration = require(parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local var22 = if fFlagSquadsPresenceStoreMigration then dataHydrationModule.Presence.PresenceStore.get() else nil
local var23 = if fFlagSquadsPresenceStoreMigration then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
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
local luckyRecommendationExperimentation = dependenciesModule.SocialExperiments.LuckyRecommendationExperimentation
local fFlagEnablePartyQuickStartButton = sharedFlags.FFlagEnablePartyQuickStartButton
local fFlagEnablePartyVoiceChangersInLua = sharedFlags.FFlagEnablePartyVoiceChangersInLua
local fFlagEnableSquadRegroupExperimentation = sharedFlags.FFlagEnableSquadRegroupExperimentation
local fFlagEnableSquadRegroupExperimentationSmallScreenFix = sharedFlags.FFlagEnableSquadRegroupExperimentationSmallScreenFix
local fFlagEnableSquadRegroupServerCapacityCheck = sharedFlags.FFlagEnableSquadRegroupServerCapacityCheck
local fFlagAppChatShowOSAOnPageEntry = sharedFlags.FFlagAppChatShowOSAOnPageEntry

return function(p0)
	-- upvalues: useTokens (ref), useDispatch (ref), useLocalUserId (ref), useStyle (ref), useSquadState (ref), useNavigation (ref), react (ref), squadExternalContractContext (ref), useVoiceStatus (ref), fFlagEnableSquadTopBannerWideMode (ref), httpService (ref), roactNavigationModule (ref), squadViewFlags (ref), useCurrentSquadSelector (ref), useSelector (ref), useStore (ref), squadQuickStartExperimentation (ref), fFlagEnablePartyQuickStartButton (ref), squadPromptType (ref), fFlagMakeCreateOrJoinSquadAThunks (ref), createOrJoinSquad (ref), networkingSquads (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoin (ref), useEffectOnce (ref), fFlagAppChatShowOSAOnPageEntry (ref), loggerModule (ref), cryo (ref), squadUserPartyStatusModule (ref), partyUserInvitedDurationSeconds (ref), partyInviteeNoResponseDurationSeconds (ref), setInterval (ref), clearInterval (ref), usePrevious (ref), userBlockingNetworking (ref), fFlagSquadsPresenceStoreMigration (ref), networkingPresence (ref), constantsModule (ref), signalsModule (ref), var22 (ref), useSignalState (ref), fFlagEnableSquadRegroupServerCapacityCheck (ref), playersService (ref), squadRegroupExperimentation (ref), var23 (ref), presenceType (ref), luckyRecommendationExperimentation (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (ref), enableSquadLobbyBanners (ref), squadLobbyBannersModule (ref), foundation (ref), squadLobbyUserGridModule (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadLobbyRegroupRowModule (ref), squadLobbyActionBarModule (ref), squadLobbyLuckyRecommendationRowModule (ref), stateLayerAffordance (ref), squadLobbyVoiceChatMenuModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), squadLobbyUserDropdownMenuModule (ref), squadCoordinationExperienceJoinExperimentation (ref), fFlagEnableSquadRegroupExperimentation (ref), roact (ref), squadLobbySessionProvider (ref)
	local var27 = useTokens()
	local var28 = useDispatch()
	local var29 = tonumber(useLocalUserId()) or 0
	local var30 = useStyle()
	local var31 = useSquadState()
	local var32 = useNavigation()
	local isWideMode = p0.isWideMode
	local var33 = react.useContext(squadExternalContractContext)
	local var34, var35 = react.useState(0)
	local var36 = useVoiceStatus()
	
	if fFlagEnableSquadTopBannerWideMode then
		local var37 = react.useRef(httpService:GenerateGUID())
		react.useEffect(function()
			-- upvalues: isWideMode (ref), var37 (ref), var33 (ref), var32 (ref), roactNavigationModule (copy)
			if isWideMode then
				return function() end
			end
			local current = var37.current
			var33.disableSquadTopBanner(current, true)
			local willBlur = var32 and var32.addListener(roactNavigationModule.Events.WillBlur, function(p1)
				-- upvalues: var33 (copy), current (ref)
				if p1.state.routeName == "SquadInviteFriends" or p1.state.routeName == "SquadLobby" then
					var33.disableSquadTopBanner(current, true)
					
					return
				end
				var33.disableSquadTopBanner(current, false)
			end)
			
			return function()
				-- upvalues: willBlur (write), var33 (copy), current (ref)
				if willBlur then
					willBlur.remove()
					willBlur = nil
				end
				var33.disableSquadTopBanner(current, false)
			end
		end, { var33.disableSquadTopBanner, var32, isWideMode })
		react.useEffect(function()
			-- upvalues: var33 (ref), squadViewFlags (copy)
			var33.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
			
			return function()
				-- upvalues: var33 (copy), squadViewFlags (copy)
				var33.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end
		end, { var33.updateSquadViewFlags })
	else
		react.useEffect(function()
			-- upvalues: var33 (ref), squadViewFlags (copy), var32 (ref), roactNavigationModule (copy)
			var33.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
			local willBlur = var32 and var32.addListener(roactNavigationModule.Events.WillBlur, function(p2)
				-- upvalues: var33 (copy), squadViewFlags (copy)
				if p2.state.routeName == "SquadInviteFriends" or p2.state.routeName == "SquadLobby" then
					var33.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
					
					return
				end
				var33.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end)
			
			return function()
				-- upvalues: willBlur (write), var33 (copy), squadViewFlags (copy)
				if willBlur then
					willBlur.remove()
					willBlur = nil
				end
				var33.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end
		end, { var33.updateSquadViewFlags, var32 })
	end
	local var38, var39 = react.useState(false)
	local var40, var41 = react.useState(Vector2.zero)
	local var42 = react.useCallback(function(p3)
		-- upvalues: var41 (ref)
		var41(p3.AbsoluteSize)
	end, { var41 })
	local var43 = useCurrentSquadSelector()
	local var44 = if var43 then var43.squadId else ""
	local members = var43 and var43.members
	local var46 = useSelector(react.useCallback(function(p4)
		return if p4.Squad and p4.Squad.Squad and p4.Squad.Squad.currentSquad then p4.Squad.Squad.currentSquad.parentChannelId or "" else ""
	end, {}))
	local var47 = useStore()
	local conversationId = var32.getParam("conversationId") or ""
	local var49 = var33.useGetConversationFromId(conversationId)
	local participants = var49 and var49.participants
	local invitees = var43 and var43.invitees
	local _ = nil
	local _ = nil
	local squadCreateOrJoinAttemptId = nil
	local extraParams = var32.getParam("extraParams") or {}
	local squadId = extraParams.squadId
	
	if squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and fFlagEnablePartyQuickStartButton then
		squadCreateOrJoinAttemptId = extraParams.squadCreateOrJoinAttemptId
	end
	local var71
	extraParams = extraParams.scheduledGroupUpId
	local var53 = react.useCallback(function()
		-- upvalues: var33 (ref), var47 (ref), squadPromptType (copy), p0 (ref)
		var33.setSquadPrompt(var47, {
			hideCancelButton = true,
			promptType = squadPromptType.Error,
			onConfirm = function()
				-- upvalues: p0 (copy)
				p0.navigateAwayFromSquad()
			end
		})
	end, { p0.navigateAwayFromSquad, var47, var33.setSquadPrompt })
	local var54 = react.useCallback(function(p5)
		-- upvalues: fFlagMakeCreateOrJoinSquadAThunks (copy), var28 (ref), createOrJoinSquad (copy), var33 (ref), squadCreateOrJoinAttemptId (write), p0 (ref), extraParams (ref), networkingSquads (copy), fFlagEnableSquadCoplayAnalytic (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoin (copy), var53 (ref)
		if fFlagMakeCreateOrJoinSquadAThunks then
			var28(createOrJoinSquad(p5, var33.setSquadPrompt, var33.fireSquadAnalytics, var33.squadLocation, squadCreateOrJoinAttemptId, p0.navigateAwayFromSquad, extraParams))
			
			return
		end
		local var87 = var28(networkingSquads.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = p5,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then var33.squadLocation else nil,
			partyAttemptId = squadCreateOrJoinAttemptId
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var87 = var87:andThen(function(p6)
				-- upvalues: logInExpCoplayTelemetryModule (copy), var33 (copy), squadCoplayJoin (copy)
				local groupUpId = p6.responseBody.groupUp.groupUpId
				local members = p6.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, var33.squadLocation, squadCoplayJoin.PartyJoin, var33.fireSquadAnalytics)
				end
			end)
		end
		var87:catch(function(_)
			-- upvalues: var53 (copy)
			var53()
		end)
	end, {
		var28, if fFlagMakeCreateOrJoinSquadAThunks then createOrJoinSquad else nil,
		if fFlagMakeCreateOrJoinSquadAThunks then p0.navigateAwayFromSquad else nil,
		if not fFlagMakeCreateOrJoinSquadAThunks then var53 else nil,
		if fFlagMakeCreateOrJoinSquadAThunks then var33.setSquadPrompt else nil,
		var33.squadLocation, var33.fireSquadAnalytics, squadCreateOrJoinAttemptId,
		extraParams
	})
	local var55 = squadId and squadId ~= var44
	react.useEffect(function()
		-- upvalues: var55 (ref), var33 (ref), var47 (ref), squadPromptType (copy), var54 (ref), conversationId (ref), p0 (ref), var32 (ref)
		if var55 then
			var33.setSquadPrompt(var47, {
				promptType = squadPromptType.JoinAnotherSquad,
				onConfirm = function()
					-- upvalues: var54 (copy), conversationId (copy)
					var54(conversationId)
				end,
				onCancel = function()
					-- upvalues: p0 (copy)
					p0.navigateAwayFromSquad()
				end
			})
			var32.setParams({ squadId = nil })
		end
	end, {
		squadId, var33.setSquadPrompt, var54, conversationId, p0.navigateAwayFromSquad,
		var55
	})
	useEffectOnce(function()
		-- upvalues: var55 (ref), fFlagAppChatShowOSAOnPageEntry (copy), var33 (ref), var49 (ref), p0 (ref), var44 (ref), loggerModule (copy), conversationId (ref), var28 (ref), var54 (ref), var53 (ref)
		if var55 then return end
		if fFlagAppChatShowOSAOnPageEntry and var33.shouldShowOSAForConversation and var33.shouldShowOSAForConversation(var49) then
			p0.navigateAwayFromSquad()
			
			return
		elseif var44 == "" then
			if var49 and var49.source == "friends" then
				loggerModule:debug("Channel does not exist for: {}. Creating a friend conversation.", conversationId)
				var28(var33.createFriendConversation(conversationId)):andThen(function(p8)
					-- upvalues: var54 (copy)
					if p8 and p8.id then
						var54(p8.id)
					end
				end):catch(function(p7)
					-- upvalues: loggerModule (copy), var53 (copy)
					loggerModule:debug("Error while trying to create a friend conversation: {}", p7)
					var53()
				end)
				
				return
			end
			var54(conversationId)
		end
	end, {
		var28, var33.createFriendConversation, conversationId, var49, var54, var53
	})
	local var56, var57 = react.useState({})
	local var58 = react.useMemo(function()
		-- upvalues: members (ref)
		local t = {}
		
		if members then
			for i, v in ipairs(members) do
				t[tostring(v.userId)] = true
			end
		end
		return t
	end, { members })
	local var59 = react.useCallback(function(p9, p10, p11)
		-- upvalues: cryo (copy), var29 (ref), squadUserPartyStatusModule (copy), partyUserInvitedDurationSeconds (copy), partyInviteeNoResponseDurationSeconds (copy)
		local t = {}
		local var90 = 0
		
		if p10 and #cryo.Dictionary.keys(p10) == 0 then
			table.insert(t, {
				userId = var29,
				partyStatus = squadUserPartyStatusModule.Connecting
			})
		elseif p9 then
			local timestamp = os.time()
			
			for i, v in ipairs(p9) do
				local inactive = squadUserPartyStatusModule.Inactive
				
				if p10[v] then
					inactive = squadUserPartyStatusModule.Active
				else
					local var92 = p11 and cryo.List.findWhere(p11, function(p12)
						-- upvalues: v (ref)
						return v == tostring(p12.userId)
					end)
					
					if var92 then
						local var93 = math.floor(p11[var92].invitedAtTimestampMs / 1000) or 0
						
						if timestamp >= var93 then
							if timestamp - var93 < partyUserInvitedDurationSeconds then
								inactive = squadUserPartyStatusModule.Invited
								var90 += 1
							elseif timestamp - var93 < partyInviteeNoResponseDurationSeconds + partyUserInvitedDurationSeconds then
								inactive = squadUserPartyStatusModule.NoResponse
								var90 += 1
							end
						end
					else
						table.insert(t, { userId = tonumber(v), partyStatus = inactive })
					end
				end
			end
		end
		return { users = t, numberOfUpdatesPending = var90 }
	end, {})
	react.useEffect(function()
		-- upvalues: var59 (ref), participants (ref), var58 (ref), invitees (ref), var57 (ref), setInterval (copy), clearInterval (copy)
		var57(var59(participants, var58, invitees).users)
		local var94 = nil
		var94 = setInterval(function()
			-- upvalues: var59 (copy), participants (copy), var58 (copy), invitees (copy), var57 (copy), clearInterval (copy), var94 (write)
			local var95 = var59(participants, var58, invitees)
			var57(var95.users)
			
			if var95.numberOfUpdatesPending == 0 then
				clearInterval(var94)
			end
		end, 1000)
		
		return function()
			-- upvalues: clearInterval (copy), var94 (write)
			clearInterval(var94)
		end
	end, { var58, invitees, participants, var59 })
	local var60 = usePrevious(var44) or ""
	react.useEffect(function()
		-- upvalues: var60 (ref), var44 (ref), p0 (ref), conversationId (ref), var46 (ref), roactNavigationModule (copy), isWideMode (ref), var32 (ref)
		if var60 ~= "" and var44 == "" then
			p0.navigateAwayFromSquad()
			
			return
		elseif var44 ~= "" and conversationId ~= "" and (var46 ~= "" and var46 ~= conversationId) then
			local list = {
				roactNavigationModule.Actions.navigate({
					routeName = "ChatConversation",
					params = { conversationId = var46 }
				}),
				roactNavigationModule.Actions.navigate({
					routeName = "SquadLobby",
					params = { conversationId = var46 }
				})
			}
			
			if isWideMode then
				var32.navigate("ChatLanding", { conversationId = var46 }, roactNavigationModule.StackActions.reset({ index = 2, actions = list }))
				
				return
			end
			table.insert(list, 1, roactNavigationModule.Actions.navigate({ routeName = "ChatLanding" }))
			var32.navigate("ChatLandingStack", { conversationId = var46 }, roactNavigationModule.StackActions.reset({ index = 3, actions = list }))
		end
	end, {
		var32,
		var46,
		conversationId,
		var44,
		p0.navigateAwayFromSquad
	})
	local var61 = usePrevious(members)
	react.useEffect(function()
		-- upvalues: members (ref), var61 (ref), var29 (ref), var28 (ref), userBlockingNetworking (copy), fFlagSquadsPresenceStoreMigration (copy), networkingPresence (copy)
		local t = {}
		
		if members then
			local var98
			for i, v in pairs(members) do
				var98 = false
				
				if var61 then
					for i_1, v_1 in pairs(var61) do
						if v_1.userId == v.userId then
							var98 = true
							break
						end
					end
				end
				if not var98 then
					table.insert(t, v.userId)
					
					if var29 ~= v.userId then
						var28(userBlockingNetworking.IsBlockedById.API({ userId = v.userId, currentUserId = var29 }))
					end
				end
			end
		end
		if not fFlagSquadsPresenceStoreMigration then
			var28(networkingPresence.GetPresencesFromUserIds.API(t))
		end
	end, { members, var29, var61 })
	local var62 = react.useCallback(function()
		-- upvalues: var39 (ref), var38 (ref)
		var39(not var38)
	end, { var38, var39 })
	local var63 = constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20
	local var64 = constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20
	local var65, var66 = react.useState(nil)
	local var67, var68 = react.useState(false)
	local var69 = react.useCallback(function(p13)
		-- upvalues: var35 (ref), var27 (ref)
		if p13.Y > 0 then
			var35(p13.Y + var27.Gap.Medium)
			
			return
		end
		var35(0)
	end, { var35, var27 })
	local var70 = if fFlagSquadsPresenceStoreMigration then useSignalState(if fFlagSquadsPresenceStoreMigration then react.useMemo(function()
		-- upvalues: signalsModule (copy), members (ref), var22 (copy)
		return signalsModule.createComputed(function(p15)
			-- upvalues: members (copy), var22 (copy)
			local t = {}
			
			for i, v in ipairs(members or {}) do
				local var103 = tostring(v.userId)
				t[var103] = var22.GetPresenceByUserId(var103).data(p15)
			end
			return t
		end)
	end, { members }) else nil) else useSelector(react.useCallback(function(p14)
		-- upvalues: members (ref)
		local byUserId = p14.Squad and (p14.Squad.Presence and (p14.Squad.Presence.byUserId or {}))
		local t = {}
		
		for i, v in ipairs(members or {}) do
			local var101 = tostring(v.userId)
			t[var101] = byUserId[var101]
		end
		return t
	end, { members }))
	
	if fFlagEnableSquadRegroupServerCapacityCheck then
		var71 = playersService.MaxPlayers > 1
		var71 = nil
	else
		var71 = true
	end
	local var72 = react.useMemo(function()
		-- upvalues: squadRegroupExperimentation (copy), p0 (ref), var71 (ref), var43 (ref), var70 (ref), var29 (ref), fFlagSquadsPresenceStoreMigration (copy), var23 (copy), presenceType (copy)
		if not squadRegroupExperimentation.getSquadRegroupEnabled() or not p0.isInExperience or (not var71 or not var43) or (not var43.members or #var43.members <= 1 or (not var43.selfPermissions or not var43.selfPermissions.canSeeRegroupJoinButton)) then
			return false
		end
		local var104 = var70[tostring(var29)]
		
		if var104 == nil then
			return false
		end
		for i, v in pairs(var70) do
			if v ~= nil and i ~= tostring(var29) and (v.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var23.Online else presenceType.Online) or v.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var23.InGame else presenceType.InGame) and var104.gameId ~= (if fFlagSquadsPresenceStoreMigration then "" else nil) and (v.gameId ~= (if fFlagSquadsPresenceStoreMigration then "" else nil) and var104.gameId ~= v.gameId)) then
				return true
			end
		end
		return false
	end, {
		var70,
		var29,
		p0.isInExperience,
		var43,
		var71
	})
	local var73 = false
	
	if luckyRecommendationExperimentation.getLuckyRecommendationEnabled() then
		var73 = not p0.isInExperience and (members ~= nil and #members >= 2)
	end
	local var74 = var27.Size.Size_1000 + var27.Padding.Medium * 2
	local var72_1 = fFlagEnableSquadRegroupExperimentationSmallScreenFix and var72
	local var76 = if var72 and not var72_1 or var73 then var27.Gap.XXLarge + var74 else 0
	local var77 = react.useMemo(function()
		-- upvalues: enableSquadLobbyBanners (copy), react (copy), squadLobbyBannersModule (copy), var69 (ref)
		return if enableSquadLobbyBanners then react.createElement(squadLobbyBannersModule, { onAbsoluteSizeChanged = var69 }) else nil
	end, { var69 })
	local var78 = react.useCallback(function()
		-- upvalues: p0 (ref), var46 (ref)
		p0.navigateToSquadInviteFriends(var46)
	end, { var46, p0.navigateToSquadInviteFriends })
	local useMemo = react.useMemo
	useMemo = useMemo(function()
		-- upvalues: react (copy), var34 (ref), var76 (ref), var30 (ref), var42 (ref), var72_1 (ref), foundation (copy), squadLobbyUserGridModule (copy), var40 (ref), var63 (ref), var27 (ref), var74 (ref), var56 (ref), p0 (ref), var33 (ref), eventNamesModule (copy), var46 (ref), squadPartySheetActionEnumModule (copy), var36 (ref), var66 (ref), var68 (ref), var78 (ref), squadLobbyRegroupRowModule (copy), var29 (ref)
		return react.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, var34),
			Size = UDim2.new(1, 0, 1, -(var34 + var76)),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageColor3 = var30.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var30.Theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			Selectable = false,
			ZIndex = 0,
			[react.Change.AbsoluteSize] = var42
		}, {
			FrameContents = if var72_1 then react.createElement(foundation.View, {
				tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
			}, {
				UserGridContainer = react.createElement(foundation.View, { tag = "auto-y size-full-0 bg-surface-0", LayoutOrder = 1 }, {
					SquadLobbyUserGrid = react.createElement(squadLobbyUserGridModule, {
						containerSize = var40 - Vector2.new(0, var63 + var27.Gap.Medium + var74),
						paddingBottom = UDim.new(0, 0),
						users = var56,
						isInExperience = p0.isInExperience,
						onUserCardActivated = function(p16)
							-- upvalues: var33 (copy), eventNamesModule (copy), var46 (copy), squadPartySheetActionEnumModule (copy), var36 (copy), var66 (copy), var68 (copy)
							var33.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
								parentChannelId = var46,
								actionType = squadPartySheetActionEnumModule.UserCardClicked,
								voiceStatus = var36
							})
							var66(p16)
							var68(true)
						end,
						navigateToHomePage = p0.navigateToHomePage,
						navigateToSquadInviteFriends = var78
					})
				}),
				RegroupRowSpacer = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var27.Gap.Medium)
				}),
				SquadLobbyRegroupRow = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var74)
				}, {
					Row = react.createElement(squadLobbyRegroupRowModule, { localUserId = var29 })
				}),
				BottomPadding = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var63)
				})
			}) else nil,
			SquadLobbyUserGrid = if var72_1 then nil else react.createElement(squadLobbyUserGridModule, {
				containerSize = var40 - Vector2.new(0, var63),
				paddingBottom = UDim.new(0, var63),
				users = var56,
				isInExperience = p0.isInExperience,
				onUserCardActivated = function(p17)
					-- upvalues: var33 (copy), eventNamesModule (copy), var46 (copy), squadPartySheetActionEnumModule (copy), var36 (copy), var66 (copy), var68 (copy)
					var33.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
						parentChannelId = var46,
						actionType = squadPartySheetActionEnumModule.UserCardClicked,
						voiceStatus = var36
					})
					var66(p17)
					var68(true)
				end,
				navigateToHomePage = p0.navigateToHomePage,
				navigateToSquadInviteFriends = var78
			})
		})
	end, {
		var66, var68, var40, members, var78, var42, p0.navigateToHomePage, var63,
		var34, if var72 or var73 then var76 else nil, var56, var72_1,
		if var72_1 then var74 else nil, if var72_1 then var29 else nil, var36
	})
	local var79 = react.useMemo(function()
		-- upvalues: react (copy), squadLobbyActionBarModule (copy), var31 (ref), var49 (ref), p0 (ref), var62 (ref), var44 (ref)
		return react.createElement(squadLobbyActionBarModule, {
			squadState = var31,
			anchorPoint = Vector2.new(0.5, 1),
			hasUnreadMessages = if var49 and var49.hasUnreadMessages then var49.hasUnreadMessages else false,
			navigateAwayFromSquad = p0.navigateAwayFromSquad,
			navigateToChat = p0.navigateToChat,
			navigateToHomePage = p0.navigateToHomePage,
			toggleVoiceChatMenu = var62,
			position = UDim2.new(0.5, 0, 1, -20),
			squadId = var44,
			isInExperience = p0.isInExperience
		})
	end, {
		var44, p0.isInExperience, p0.navigateToChat, p0.navigateToHomePage, var31,
		var62, var49 and var49.hasUnreadMessages
	})
	local var80 = react.useMemo(function()
		-- upvalues: var72_1 (ref), var72 (ref), react (copy), foundation (copy), constantsModule (copy), var27 (ref), var74 (ref), squadLobbyRegroupRowModule (copy), var29 (ref)
		return if var72_1 or not var72 then nil else react.createElement(foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + var27.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, var74)
		}, {
			Row = react.createElement(squadLobbyRegroupRowModule, { localUserId = var29 })
		})
	end, { var72, var29, var27, var74 })
	local var81 = react.useMemo(function()
		-- upvalues: var73 (write), react (copy), foundation (copy), constantsModule (copy), var27 (ref), var74 (ref), squadLobbyLuckyRecommendationRowModule (copy)
		return if var73 then react.createElement(foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + var27.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, var74)
		}, {
			Row = react.createElement(squadLobbyLuckyRecommendationRowModule)
		}) else nil
	end, { var73, var27, var74 })
	local var82 = react.useMemo(function()
		-- upvalues: var38 (ref), react (copy), foundation (copy), stateLayerAffordance (copy), var39 (ref), var64 (ref), var27 (ref), squadLobbyVoiceChatMenuModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), p0 (ref)
		return if var38 then react.createElement(foundation.View, {
			Size = UDim2.new(1, 0, 1, 0),
			stateLayer = { affordance = stateLayerAffordance.None },
			onActivated = function()
				-- upvalues: var39 (copy)
				var39(false)
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
					Size = UDim2.new(1, 0, 0, var64),
					flexItem = { FlexMode = Enum.UIFlexMode.Fill },
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function()
						-- upvalues: var39 (copy)
						var39(false)
					end
				}),
				Menu = react.createElement(foundation.View, {
					LayoutOrder = 2,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 1, 0),
					flexItem = { ItemLineAlignment = Enum.ItemLineAlignment.Center },
					AutomaticSize = Enum.AutomaticSize.Y,
					padding = Vector2.new(var27.Padding.XLarge, var27.Padding.Medium),
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function() end
				}, {
					SquadLobbyVoiceChatMenu = react.createElement(squadLobbyVoiceChatMenuModule, {
						openSquadVoiceChangers = if fFlagEnablePartyVoiceChangersInLua then p0.openSquadVoiceChangers else nil
					})
				}),
				BottomPadding = react.createElement(foundation.View, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var64),
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function()
						-- upvalues: var39 (copy)
						var39(false)
					end
				})
			})
		}) else nil
	end, { var64, var38, var39, var27 })
	local var83 = react.useMemo(function()
		-- upvalues: var67 (ref), var65 (ref), react (copy), squadLobbyUserDropdownMenuModule (copy), p0 (ref), var66 (ref), var68 (ref), var46 (ref)
		return if var67 and var65 then react.createElement(squadLobbyUserDropdownMenuModule, {
			userId = var65,
			isInExperience = p0.isInExperience,
			onDismiss = function()
				-- upvalues: var66 (copy), var68 (copy)
				var66(nil)
				var68(false)
			end,
			openViewProfile = function()
				-- upvalues: p0 (copy), var65 (copy)
				p0.openViewProfile(var65)
			end,
			openSquadVoiceAbuseReport = p0.openSquadVoiceAbuseReport,
			parentChannelId = var46
		}) else nil
	end, {
		var46, p0.isInExperience, var67, var68, p0.openViewProfile, var65, var66
	})
	react.useEffect(function()
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), fFlagEnableSquadRegroupExperimentation (copy), squadRegroupExperimentation (copy), luckyRecommendationExperimentation (copy)
		squadCoordinationExperienceJoinExperimentation.logExposure()
		
		if fFlagEnableSquadRegroupExperimentation then
			squadRegroupExperimentation.logExposure()
		end
		luckyRecommendationExperimentation.logExposure()
	end, {})
	local var84 = roact.createFragment({
		SquadLobbyBanners = var77,
		SquadLobbyUsersScrollingFrame = useMemo,
		SquadLobbyRegroupRow = var80,
		SquadLobbyLuckyRecommendationRow = var81,
		SquadLobbyActionBar = var79,
		SquadLobbyVoiceChatMenu = var82,
		UserDropdownMenu = var83
	})
	
	if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
		var84 = react.createElement(squadLobbySessionProvider.Provider, nil, var84)
	end
	return var84
end