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
local var1 = if fFlagSquadsPresenceStoreMigration then dataHydrationModule.Presence.PresenceStore.get() else nil
local var2 = if fFlagSquadsPresenceStoreMigration then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
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

return function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), useLocalUserId (ref), useStyle (ref), useSquadState (ref), useNavigation (ref), react (ref), squadExternalContractContext (ref), useVoiceStatus (ref), fFlagEnableSquadTopBannerWideMode (ref), httpService (ref), roactNavigationModule (ref), squadViewFlags (ref), useCurrentSquadSelector (ref), useSelector (ref), useStore (ref), squadQuickStartExperimentation (ref), fFlagEnablePartyQuickStartButton (ref), squadPromptType (ref), fFlagMakeCreateOrJoinSquadAThunks (ref), createOrJoinSquad (ref), networkingSquads (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoin (ref), useEffectOnce (ref), fFlagAppChatShowOSAOnPageEntry (ref), loggerModule (ref), cryo (ref), squadUserPartyStatusModule (ref), partyUserInvitedDurationSeconds (ref), partyInviteeNoResponseDurationSeconds (ref), setInterval (ref), clearInterval (ref), usePrevious (ref), userBlockingNetworking (ref), fFlagSquadsPresenceStoreMigration (ref), networkingPresence (ref), constantsModule (ref), signalsModule (ref), var1 (ref), useSignalState (ref), fFlagEnableSquadRegroupServerCapacityCheck (ref), playersService (ref), squadRegroupExperimentation (ref), var2 (ref), presenceType (ref), luckyRecommendationExperimentation (ref), fFlagEnableSquadRegroupExperimentationSmallScreenFix (ref), enableSquadLobbyBanners (ref), squadLobbyBannersModule (ref), foundation (ref), squadLobbyUserGridModule (ref), eventNamesModule (ref), squadPartySheetActionEnumModule (ref), squadLobbyRegroupRowModule (ref), squadLobbyActionBarModule (ref), squadLobbyLuckyRecommendationRowModule (ref), stateLayerAffordance (ref), squadLobbyVoiceChatMenuModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), squadLobbyUserDropdownMenuModule (ref), squadCoordinationExperienceJoinExperimentation (ref), fFlagEnableSquadRegroupExperimentation (ref), roact (ref), squadLobbySessionProvider (ref)
	local var3 = useTokens()
	local var4 = useDispatch()
	local var5 = tonumber(useLocalUserId()) or 0
	local var6 = useStyle()
	local var7 = useSquadState()
	local var8 = useNavigation()
	local isWideMode = p1.isWideMode
	local var9 = react.useContext(squadExternalContractContext)
	local var10, var11 = react.useState(0)
	local var12 = useVoiceStatus()
	
	if fFlagEnableSquadTopBannerWideMode then
		local var13 = react.useRef(httpService:GenerateGUID())
		react.useEffect(function()
			-- upvalues: isWideMode (ref), var13 (ref), var9 (ref), var8 (ref), roactNavigationModule (copy)
			if isWideMode then
				return function() end
			end
			local current = var13.current
			var9.disableSquadTopBanner(current, true)
			local willBlur = var8 and var8.addListener(roactNavigationModule.Events.WillBlur, function(p2)
				-- upvalues: var9 (copy), current (ref)
				if p2.state.routeName == "SquadInviteFriends" or p2.state.routeName == "SquadLobby" then
					var9.disableSquadTopBanner(current, true)
					
					return
				end
				var9.disableSquadTopBanner(current, false)
			end)
			
			return function()
				-- upvalues: willBlur (write), var9 (copy), current (ref)
				if willBlur then
					willBlur.remove()
					willBlur = nil
				end
				var9.disableSquadTopBanner(current, false)
			end
		end, { var9.disableSquadTopBanner, var8, isWideMode })
		react.useEffect(function()
			-- upvalues: var9 (ref), squadViewFlags (copy)
			var9.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
			
			return function()
				-- upvalues: var9 (copy), squadViewFlags (copy)
				var9.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end
		end, { var9.updateSquadViewFlags })
	else
		react.useEffect(function()
			-- upvalues: var9 (ref), squadViewFlags (copy), var8 (ref), roactNavigationModule (copy)
			var9.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
			local willBlur = var8 and var8.addListener(roactNavigationModule.Events.WillBlur, function(p2)
				-- upvalues: var9 (copy), squadViewFlags (copy)
				if p2.state.routeName == "SquadInviteFriends" or p2.state.routeName == "SquadLobby" then
					var9.updateSquadViewFlags(squadViewFlags.SquadLobby, true)
					
					return
				end
				var9.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end)
			
			return function()
				-- upvalues: willBlur (write), var9 (copy), squadViewFlags (copy)
				if willBlur then
					willBlur.remove()
					willBlur = nil
				end
				var9.updateSquadViewFlags(squadViewFlags.SquadLobby, false)
			end
		end, { var9.updateSquadViewFlags, var8 })
	end
	local var14, var15 = react.useState(false)
	local var16, var17 = react.useState(Vector2.zero)
	local var18 = react.useCallback(function(p2)
		-- upvalues: var17 (ref)
		var17(p2.AbsoluteSize)
	end, { var17 })
	local var19 = useCurrentSquadSelector()
	local var20 = if var19 then var19.squadId else ""
	local members = var19 and var19.members
	local var21 = useSelector(react.useCallback(function(p2)
		return if p2.Squad and p2.Squad.Squad and p2.Squad.Squad.currentSquad then p2.Squad.Squad.currentSquad.parentChannelId or "" else ""
	end, {}))
	local var22 = useStore()
	local conversationId = var8.getParam("conversationId") or ""
	local var23 = var9.useGetConversationFromId(conversationId)
	local participants = var23 and var23.participants
	local invitees = var19 and var19.invitees
	local _ = nil
	local _ = nil
	local squadCreateOrJoinAttemptId = nil
	local extraParams = var8.getParam("extraParams") or {}
	local squadId = extraParams.squadId
	
	if squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and fFlagEnablePartyQuickStartButton then
		squadCreateOrJoinAttemptId = extraParams.squadCreateOrJoinAttemptId
	end
	local var24
	extraParams = extraParams.scheduledGroupUpId
	local var25 = react.useCallback(function()
		-- upvalues: var9 (ref), var22 (ref), squadPromptType (copy), p1 (ref)
		var9.setSquadPrompt(var22, {
			hideCancelButton = true,
			promptType = squadPromptType.Error,
			onConfirm = function()
				-- upvalues: p1 (copy)
				p1.navigateAwayFromSquad()
			end
		})
	end, { p1.navigateAwayFromSquad, var22, var9.setSquadPrompt })
	local var26 = react.useCallback(function(p2)
		-- upvalues: fFlagMakeCreateOrJoinSquadAThunks (copy), var4 (ref), createOrJoinSquad (copy), var9 (ref), squadCreateOrJoinAttemptId (write), p1 (ref), extraParams (ref), networkingSquads (copy), fFlagEnableSquadCoplayAnalytic (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoin (copy), var25 (ref)
		if fFlagMakeCreateOrJoinSquadAThunks then
			var4(createOrJoinSquad(p2, var9.setSquadPrompt, var9.fireSquadAnalytics, var9.squadLocation, squadCreateOrJoinAttemptId, p1.navigateAwayFromSquad, extraParams))
			
			return
		end
		local var27 = var4(networkingSquads.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = p2,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then var9.squadLocation else nil,
			partyAttemptId = squadCreateOrJoinAttemptId
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var27 = var27:andThen(function(p3)
				-- upvalues: logInExpCoplayTelemetryModule (copy), var9 (copy), squadCoplayJoin (copy)
				local groupUpId = p3.responseBody.groupUp.groupUpId
				local members = p3.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, var9.squadLocation, squadCoplayJoin.PartyJoin, var9.fireSquadAnalytics)
				end
			end)
		end
		var27:catch(function(_)
			-- upvalues: var25 (copy)
			var25()
		end)
	end, {
		var4, if fFlagMakeCreateOrJoinSquadAThunks then createOrJoinSquad else nil,
		if fFlagMakeCreateOrJoinSquadAThunks then p1.navigateAwayFromSquad else nil,
		if not fFlagMakeCreateOrJoinSquadAThunks then var25 else nil,
		if fFlagMakeCreateOrJoinSquadAThunks then var9.setSquadPrompt else nil,
		var9.squadLocation, var9.fireSquadAnalytics, squadCreateOrJoinAttemptId,
		extraParams
	})
	local var27 = squadId and squadId ~= var20
	react.useEffect(function()
		-- upvalues: var27 (ref), var9 (ref), var22 (ref), squadPromptType (copy), var26 (ref), conversationId (ref), p1 (ref), var8 (ref)
		if var27 then
			var9.setSquadPrompt(var22, {
				promptType = squadPromptType.JoinAnotherSquad,
				onConfirm = function()
					-- upvalues: var26 (copy), conversationId (copy)
					var26(conversationId)
				end,
				onCancel = function()
					-- upvalues: p1 (copy)
					p1.navigateAwayFromSquad()
				end
			})
			var8.setParams({ squadId = nil })
		end
	end, {
		squadId, var9.setSquadPrompt, var26, conversationId, p1.navigateAwayFromSquad,
		var27
	})
	useEffectOnce(function()
		-- upvalues: var27 (ref), fFlagAppChatShowOSAOnPageEntry (copy), var9 (ref), var23 (ref), p1 (ref), var20 (ref), loggerModule (copy), conversationId (ref), var4 (ref), var26 (ref), var25 (ref)
		if var27 then return end
		if fFlagAppChatShowOSAOnPageEntry and var9.shouldShowOSAForConversation and var9.shouldShowOSAForConversation(var23) then
			p1.navigateAwayFromSquad()
			
			return
		elseif var20 == "" then
			if var23 and var23.source == "friends" then
				loggerModule:debug("Channel does not exist for: {}. Creating a friend conversation.", conversationId)
				var4(var9.createFriendConversation(conversationId)):andThen(function(p2)
					-- upvalues: var26 (copy)
					if p2 and p2.id then
						var26(p2.id)
					end
				end):catch(function(p2)
					-- upvalues: loggerModule (copy), var25 (copy)
					loggerModule:debug("Error while trying to create a friend conversation: {}", p2)
					var25()
				end)
				
				return
			end
			var26(conversationId)
		end
	end, {
		var4, var9.createFriendConversation, conversationId, var23, var26, var25
	})
	local var28, var29 = react.useState({})
	local var30 = react.useMemo(function()
		-- upvalues: members (ref)
		local t = {}
		
		if members then
			for i, v in ipairs(members) do
				t[tostring(v.userId)] = true
			end
		end
		return t
	end, { members })
	local var31 = react.useCallback(function(p2, p3, p4)
		-- upvalues: cryo (copy), var5 (ref), squadUserPartyStatusModule (copy), partyUserInvitedDurationSeconds (copy), partyInviteeNoResponseDurationSeconds (copy)
		local t = {}
		local var32 = 0
		
		if p3 and #cryo.Dictionary.keys(p3) == 0 then
			table.insert(t, {
				userId = var5,
				partyStatus = squadUserPartyStatusModule.Connecting
			})
		elseif p2 then
			local timestamp = os.time()
			
			for i, v in ipairs(p2) do
				local inactive = squadUserPartyStatusModule.Inactive
				
				if p3[v] then
					inactive = squadUserPartyStatusModule.Active
				else
					local var33 = p4 and cryo.List.findWhere(p4, function(p5)
						-- upvalues: v (ref)
						return v == tostring(p5.userId)
					end)
					
					if var33 then
						local var34 = math.floor(p4[var33].invitedAtTimestampMs / 1000) or 0
						
						if timestamp >= var34 then
							if timestamp - var34 < partyUserInvitedDurationSeconds then
								inactive = squadUserPartyStatusModule.Invited
								var32 += 1
							elseif timestamp - var34 < partyInviteeNoResponseDurationSeconds + partyUserInvitedDurationSeconds then
								inactive = squadUserPartyStatusModule.NoResponse
								var32 += 1
							end
						end
					else
						table.insert(t, { userId = tonumber(v), partyStatus = inactive })
					end
				end
			end
		end
		return { users = t, numberOfUpdatesPending = var32 }
	end, {})
	react.useEffect(function()
		-- upvalues: var31 (ref), participants (ref), var30 (ref), invitees (ref), var29 (ref), setInterval (copy), clearInterval (copy)
		var29(var31(participants, var30, invitees).users)
		local var35 = nil
		var35 = setInterval(function()
			-- upvalues: var31 (copy), participants (copy), var30 (copy), invitees (copy), var29 (copy), clearInterval (copy), var35 (write)
			local var36 = var31(participants, var30, invitees)
			var29(var36.users)
			
			if var36.numberOfUpdatesPending == 0 then
				clearInterval(var35)
			end
		end, 1000)
		
		return function()
			-- upvalues: clearInterval (copy), var35 (write)
			clearInterval(var35)
		end
	end, { var30, invitees, participants, var31 })
	local var35 = usePrevious(var20) or ""
	react.useEffect(function()
		-- upvalues: var35 (ref), var20 (ref), p1 (ref), conversationId (ref), var21 (ref), roactNavigationModule (copy), isWideMode (ref), var8 (ref)
		if var35 ~= "" and var20 == "" then
			p1.navigateAwayFromSquad()
			
			return
		elseif var20 ~= "" and conversationId ~= "" and (var21 ~= "" and var21 ~= conversationId) then
			local list = {
				roactNavigationModule.Actions.navigate({
					routeName = "ChatConversation",
					params = { conversationId = var21 }
				}),
				roactNavigationModule.Actions.navigate({
					routeName = "SquadLobby",
					params = { conversationId = var21 }
				})
			}
			
			if isWideMode then
				var8.navigate("ChatLanding", { conversationId = var21 }, roactNavigationModule.StackActions.reset({ index = 2, actions = list }))
				
				return
			end
			table.insert(list, 1, roactNavigationModule.Actions.navigate({ routeName = "ChatLanding" }))
			var8.navigate("ChatLandingStack", { conversationId = var21 }, roactNavigationModule.StackActions.reset({ index = 3, actions = list }))
		end
	end, {
		var8,
		var21,
		conversationId,
		var20,
		p1.navigateAwayFromSquad
	})
	local var36 = usePrevious(members)
	react.useEffect(function()
		-- upvalues: members (ref), var36 (ref), var5 (ref), var4 (ref), userBlockingNetworking (copy), fFlagSquadsPresenceStoreMigration (copy), networkingPresence (copy)
		local t = {}
		
		if members then
			local var37
			for i, v in pairs(members) do
				var37 = false
				
				if var36 then
					for i_1, v_1 in pairs(var36) do
						if v_1.userId == v.userId then
							var37 = true
							break
						end
					end
				end
				if not var37 then
					table.insert(t, v.userId)
					
					if var5 ~= v.userId then
						var4(userBlockingNetworking.IsBlockedById.API({ userId = v.userId, currentUserId = var5 }))
					end
				end
			end
		end
		if not fFlagSquadsPresenceStoreMigration then
			var4(networkingPresence.GetPresencesFromUserIds.API(t))
		end
	end, { members, var5, var36 })
	local var38 = react.useCallback(function()
		-- upvalues: var15 (ref), var14 (ref)
		var15(not var14)
	end, { var14, var15 })
	local var39 = constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20
	local var40 = constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20
	local var41, var42 = react.useState(nil)
	local var43, var44 = react.useState(false)
	local var45 = react.useCallback(function(p5)
		-- upvalues: var11 (ref), var3 (ref)
		if p5.Y > 0 then
			var11(p5.Y + var3.Gap.Medium)
			
			return
		end
		var11(0)
	end, { var11, var3 })
	local var46 = if fFlagSquadsPresenceStoreMigration then useSignalState(if fFlagSquadsPresenceStoreMigration then react.useMemo(function()
		-- upvalues: signalsModule (copy), members (ref), var1 (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: members (copy), var1 (copy)
			local t = {}
			
			for i, v in ipairs(members or {}) do
				local var47 = tostring(v.userId)
				t[var47] = var1.GetPresenceByUserId(var47).data(p5)
			end
			return t
		end)
	end, { members }) else nil) else useSelector(react.useCallback(function(p5)
		-- upvalues: members (ref)
		local byUserId = p5.Squad and (p5.Squad.Presence and (p5.Squad.Presence.byUserId or {}))
		local t = {}
		
		for i, v in ipairs(members or {}) do
			local var47 = tostring(v.userId)
			t[var47] = byUserId[var47]
		end
		return t
	end, { members }))
	
	if fFlagEnableSquadRegroupServerCapacityCheck then
		var24 = playersService.MaxPlayers > 1
		var24 = nil
	else
		var24 = true
	end
	local var48 = react.useMemo(function()
		-- upvalues: squadRegroupExperimentation (copy), p1 (ref), var24 (ref), var19 (ref), var46 (ref), var5 (ref), fFlagSquadsPresenceStoreMigration (copy), var2 (copy), presenceType (copy)
		if not squadRegroupExperimentation.getSquadRegroupEnabled() or not p1.isInExperience or (not var24 or not var19) or (not var19.members or #var19.members <= 1 or (not var19.selfPermissions or not var19.selfPermissions.canSeeRegroupJoinButton)) then
			return false
		end
		local var49 = var46[tostring(var5)]
		
		if var49 == nil then
			return false
		end
		for i, v in pairs(var46) do
			if v ~= nil and i ~= tostring(var5) and (v.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.Online else presenceType.Online) or v.userPresenceType == (if fFlagSquadsPresenceStoreMigration then var2.InGame else presenceType.InGame) and var49.gameId ~= (if fFlagSquadsPresenceStoreMigration then "" else nil) and (v.gameId ~= (if fFlagSquadsPresenceStoreMigration then "" else nil) and var49.gameId ~= v.gameId)) then
				return true
			end
		end
		return false
	end, {
		var46,
		var5,
		p1.isInExperience,
		var19,
		var24
	})
	local var50 = false
	
	if luckyRecommendationExperimentation.getLuckyRecommendationEnabled() then
		var50 = not p1.isInExperience and (members ~= nil and #members >= 2)
	end
	local var51 = var3.Size.Size_1000 + var3.Padding.Medium * 2
	local var52 = fFlagEnableSquadRegroupExperimentationSmallScreenFix and var48
	local var53 = if var48 and not var52 or var50 then var3.Gap.XXLarge + var51 else 0
	local var54 = react.useMemo(function()
		-- upvalues: enableSquadLobbyBanners (copy), react (copy), squadLobbyBannersModule (copy), var45 (ref)
		return if enableSquadLobbyBanners then react.createElement(squadLobbyBannersModule, { onAbsoluteSizeChanged = var45 }) else nil
	end, { var45 })
	local var55 = react.useCallback(function()
		-- upvalues: p1 (ref), var21 (ref)
		p1.navigateToSquadInviteFriends(var21)
	end, { var21, p1.navigateToSquadInviteFriends })
	local useMemo = react.useMemo
	useMemo = useMemo(function()
		-- upvalues: react (copy), var10 (ref), var53 (ref), var6 (ref), var18 (ref), var52 (ref), foundation (copy), squadLobbyUserGridModule (copy), var16 (ref), var39 (ref), var3 (ref), var51 (ref), var28 (ref), p1 (ref), var9 (ref), eventNamesModule (copy), var21 (ref), squadPartySheetActionEnumModule (copy), var12 (ref), var42 (ref), var44 (ref), var55 (ref), squadLobbyRegroupRowModule (copy), var5 (ref)
		return react.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, var10),
			Size = UDim2.new(1, 0, 1, -(var10 + var53)),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageColor3 = var6.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = var6.Theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			Selectable = false,
			ZIndex = 0,
			[react.Change.AbsoluteSize] = var18
		}, {
			FrameContents = if var52 then react.createElement(foundation.View, {
				tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
			}, {
				UserGridContainer = react.createElement(foundation.View, { tag = "auto-y size-full-0 bg-surface-0", LayoutOrder = 1 }, {
					SquadLobbyUserGrid = react.createElement(squadLobbyUserGridModule, {
						containerSize = var16 - Vector2.new(0, var39 + var3.Gap.Medium + var51),
						paddingBottom = UDim.new(0, 0),
						users = var28,
						isInExperience = p1.isInExperience,
						onUserCardActivated = function(p6)
							-- upvalues: var9 (copy), eventNamesModule (copy), var21 (copy), squadPartySheetActionEnumModule (copy), var12 (copy), var42 (copy), var44 (copy)
							var9.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
								parentChannelId = var21,
								actionType = squadPartySheetActionEnumModule.UserCardClicked,
								voiceStatus = var12
							})
							var42(p6)
							var44(true)
						end,
						navigateToHomePage = p1.navigateToHomePage,
						navigateToSquadInviteFriends = var55
					})
				}),
				RegroupRowSpacer = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var3.Gap.Medium)
				}),
				SquadLobbyRegroupRow = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var51)
				}, {
					Row = react.createElement(squadLobbyRegroupRowModule, { localUserId = var5 })
				}),
				BottomPadding = react.createElement(foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var39)
				})
			}) else nil,
			SquadLobbyUserGrid = if var52 then nil else react.createElement(squadLobbyUserGridModule, {
				containerSize = var16 - Vector2.new(0, var39),
				paddingBottom = UDim.new(0, var39),
				users = var28,
				isInExperience = p1.isInExperience,
				onUserCardActivated = function(p6)
					-- upvalues: var9 (copy), eventNamesModule (copy), var21 (copy), squadPartySheetActionEnumModule (copy), var12 (copy), var42 (copy), var44 (copy)
					var9.fireSquadAnalytics(eventNamesModule.PartySheetAction, {
						parentChannelId = var21,
						actionType = squadPartySheetActionEnumModule.UserCardClicked,
						voiceStatus = var12
					})
					var42(p6)
					var44(true)
				end,
				navigateToHomePage = p1.navigateToHomePage,
				navigateToSquadInviteFriends = var55
			})
		})
	end, {
		var42, var44, var16, members, var55, var18, p1.navigateToHomePage, var39,
		var10, if var48 or var50 then var53 else nil, var28, var52,
		if var52 then var51 else nil, if var52 then var5 else nil, var12
	})
	local var56 = react.useMemo(function()
		-- upvalues: react (copy), squadLobbyActionBarModule (copy), var7 (ref), var23 (ref), p1 (ref), var38 (ref), var20 (ref)
		return react.createElement(squadLobbyActionBarModule, {
			squadState = var7,
			anchorPoint = Vector2.new(0.5, 1),
			hasUnreadMessages = if var23 and var23.hasUnreadMessages then var23.hasUnreadMessages else false,
			navigateAwayFromSquad = p1.navigateAwayFromSquad,
			navigateToChat = p1.navigateToChat,
			navigateToHomePage = p1.navigateToHomePage,
			toggleVoiceChatMenu = var38,
			position = UDim2.new(0.5, 0, 1, -20),
			squadId = var20,
			isInExperience = p1.isInExperience
		})
	end, {
		var20, p1.isInExperience, p1.navigateToChat, p1.navigateToHomePage, var7,
		var38, var23 and var23.hasUnreadMessages
	})
	local var57 = react.useMemo(function()
		-- upvalues: var52 (ref), var48 (ref), react (copy), foundation (copy), constantsModule (copy), var3 (ref), var51 (ref), squadLobbyRegroupRowModule (copy), var5 (ref)
		return if var52 or not var48 then nil else react.createElement(foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + var3.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, var51)
		}, {
			Row = react.createElement(squadLobbyRegroupRowModule, { localUserId = var5 })
		})
	end, { var48, var5, var3, var51 })
	local var58 = react.useMemo(function()
		-- upvalues: var50 (write), react (copy), foundation (copy), constantsModule (copy), var3 (ref), var51 (ref), squadLobbyLuckyRecommendationRowModule (copy)
		return if var50 then react.createElement(foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + constantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + var3.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, var51)
		}, {
			Row = react.createElement(squadLobbyLuckyRecommendationRowModule)
		}) else nil
	end, { var50, var3, var51 })
	local var59 = react.useMemo(function()
		-- upvalues: var14 (ref), react (copy), foundation (copy), stateLayerAffordance (copy), var15 (ref), var40 (ref), var3 (ref), squadLobbyVoiceChatMenuModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), p1 (ref)
		return if var14 then react.createElement(foundation.View, {
			Size = UDim2.new(1, 0, 1, 0),
			stateLayer = { affordance = stateLayerAffordance.None },
			onActivated = function()
				-- upvalues: var15 (copy)
				var15(false)
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
					Size = UDim2.new(1, 0, 0, var40),
					flexItem = { FlexMode = Enum.UIFlexMode.Fill },
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function()
						-- upvalues: var15 (copy)
						var15(false)
					end
				}),
				Menu = react.createElement(foundation.View, {
					LayoutOrder = 2,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 1, 0),
					flexItem = { ItemLineAlignment = Enum.ItemLineAlignment.Center },
					AutomaticSize = Enum.AutomaticSize.Y,
					padding = Vector2.new(var3.Padding.XLarge, var3.Padding.Medium),
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function() end
				}, {
					SquadLobbyVoiceChatMenu = react.createElement(squadLobbyVoiceChatMenuModule, {
						openSquadVoiceChangers = if fFlagEnablePartyVoiceChangersInLua then p1.openSquadVoiceChangers else nil
					})
				}),
				BottomPadding = react.createElement(foundation.View, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, var40),
					stateLayer = { affordance = stateLayerAffordance.None },
					onActivated = function()
						-- upvalues: var15 (copy)
						var15(false)
					end
				})
			})
		}) else nil
	end, { var40, var14, var15, var3 })
	local var60 = react.useMemo(function()
		-- upvalues: var43 (ref), var41 (ref), react (copy), squadLobbyUserDropdownMenuModule (copy), p1 (ref), var42 (ref), var44 (ref), var21 (ref)
		return if var43 and var41 then react.createElement(squadLobbyUserDropdownMenuModule, {
			userId = var41,
			isInExperience = p1.isInExperience,
			onDismiss = function()
				-- upvalues: var42 (copy), var44 (copy)
				var42(nil)
				var44(false)
			end,
			openViewProfile = function()
				-- upvalues: p1 (copy), var41 (copy)
				p1.openViewProfile(var41)
			end,
			openSquadVoiceAbuseReport = p1.openSquadVoiceAbuseReport,
			parentChannelId = var21
		}) else nil
	end, {
		var21, p1.isInExperience, var43, var44, p1.openViewProfile, var41, var42
	})
	react.useEffect(function()
		-- upvalues: squadCoordinationExperienceJoinExperimentation (copy), fFlagEnableSquadRegroupExperimentation (copy), squadRegroupExperimentation (copy), luckyRecommendationExperimentation (copy)
		squadCoordinationExperienceJoinExperimentation.logExposure()
		
		if fFlagEnableSquadRegroupExperimentation then
			squadRegroupExperimentation.logExposure()
		end
		luckyRecommendationExperimentation.logExposure()
	end, {})
	local var61 = roact.createFragment({
		SquadLobbyBanners = var54,
		SquadLobbyUsersScrollingFrame = useMemo,
		SquadLobbyRegroupRow = var57,
		SquadLobbyLuckyRecommendationRow = var58,
		SquadLobbyActionBar = var56,
		SquadLobbyVoiceChatMenu = var59,
		UserDropdownMenu = var60
	})
	
	if squadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
		var61 = react.createElement(squadLobbySessionProvider.Provider, nil, var61)
	end
	return var61
end