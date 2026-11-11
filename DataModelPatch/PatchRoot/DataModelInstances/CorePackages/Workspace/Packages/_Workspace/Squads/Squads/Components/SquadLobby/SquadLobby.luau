local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseVoiceStatusFunction = require(Parent.CrossExperienceVoice).Hooks.useVoiceStatus
local ConstantsModule = require(Squads.Common.Constants)
local DependenciesModule = require(Squads.dependencies)
local LoggerModule = require(Squads.Logger)
local _ = require(Squads.Common.ModelTypes)
local SquadLobbyActionBarModule = require(script.Parent.SquadLobbyActionBar)
local SquadLobbyUserGridModule = require(script.Parent.SquadLobbyUserGrid)
local SquadLobbyRegroupRowModule = require(script.Parent.SquadLobbyRegroupRow)
local SquadLobbyVoiceChatMenuModule = require(script.Parent.SquadLobbyVoiceChatMenu)
local SquadLobbyBannersModule = require(script.Parent.SquadLobbyBanners)
local SquadLobbyUserDropdownMenuModule = require(script.Parent.SquadLobbyUserDropdownMenu)
local SquadPartySheetActionEnumModule = require(Squads.Enums.SquadPartySheetActionEnum)
local SquadUserPartyStatusModule = require(Squads.Enums.SquadUserPartyStatus)
local Cryo = DependenciesModule.Cryo
local Foundation = DependenciesModule.Foundation
local LuauPolyfill = DependenciesModule.LuauPolyfill
local NetworkingPresence = DependenciesModule.NetworkingPresence
local NetworkingSquads = DependenciesModule.NetworkingSquads
local React = DependenciesModule.React
local Roact = DependenciesModule.Roact
local SharedFlags = DependenciesModule.SharedFlags
local EnumsModule = require(Parent.SquadsCore.Enums)
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = EnumsModule.SquadPromptType
local SquadCoplayJoin = EnumsModule.SquadCoplayJoin
local SquadViewFlags = require(Parent.SquadsCore.SquadExternalContractProvider).SquadViewFlags
local SquadLobbySessionProvider = require(Parent.SquadsCore.SquadSessionProvider).SquadLobbySessionProvider
local LogInExpCoplayTelemetryModule = require(Parent.SquadsCore.logInExpCoplayTelemetry)
local CreateOrJoinSquadFunction = require(Parent.SquadsCore.Thunks).createOrJoinSquad
local UserBlockingNetworking = DependenciesModule.UserBlockingNetworking
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseEffectOnceFunction = DependenciesModule.Hooks.useEffectOnce
local UseNavigationFunction = DependenciesModule.useNavigation
local UsePreviousFunction = DependenciesModule.Hooks.usePrevious
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseStoreFunction = DependenciesModule.Hooks.useStore
local UseSquadStateFunction = require(Parent.SquadsCore.Hooks).useSquadState
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local StateLayerAffordance = Foundation.Enums.StateLayerAffordance
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseTokensFunction = Foundation.Hooks.useTokens
local ClearIntervalFunction = LuauPolyfill.clearInterval
local SetIntervalFunction = LuauPolyfill.setInterval
local EnableSquadLobbyBanners = game:DefineFastFlag("EnableSquadLobbyBanners", false)
local FFlagEnableSquadCoplayAnalytic = SharedFlags.FFlagEnableSquadCoplayAnalytic
local FFlagEnableSquadTopBannerWideMode = SharedFlags.FFlagEnableSquadTopBannerWideMode
local FFlagMakeCreateOrJoinSquadAThunks = SharedFlags.FFlagMakeCreateOrJoinSquadAThunks
local PartyInviteeNoResponseDurationSeconds = game:DefineFastInt("PartyInviteeNoResponseDurationSeconds", 3)
local PartyUserInvitedDurationSeconds = game:DefineFastInt("PartyUserInvitedDurationSeconds", 10)
local SquadQuickStartExperimentation = DependenciesModule.SocialExperiments.SquadQuickStartExperimentation
local SquadCoordinationExperienceJoinExperimentation = DependenciesModule.SocialExperiments.SquadCoordinationExperienceJoinExperimentation
local SquadRegroupExperimentation = DependenciesModule.SocialExperiments.SquadRegroupExperimentation
local FFlagEnablePartyQuickStartButton = SharedFlags.FFlagEnablePartyQuickStartButton
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local FFlagEnableSquadRegroupExperimentation = SharedFlags.FFlagEnableSquadRegroupExperimentation
local FFlagEnableSquadRegroupExperimentationSmallScreenFix = SharedFlags.FFlagEnableSquadRegroupExperimentationSmallScreenFix
local FFlagEnableSquadRegroupServerCapacityCheck = SharedFlags.FFlagEnableSquadRegroupServerCapacityCheck
local FFlagAppChatShowOSAOnPageEntry = SharedFlags.FFlagAppChatShowOSAOnPageEntry
local FFlagEnableScheduledSquads = SharedFlags.FFlagEnableScheduledSquads

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseStyleFunction (copy), UseSquadStateFunction (copy), UseNavigationFunction (copy), React (copy), SquadExternalContractContext (copy), UseVoiceStatusFunction (copy), FFlagEnableSquadTopBannerWideMode (copy), HttpService (copy), RoactNavigationModule (copy), SquadViewFlags (copy), UseCurrentSquadSelectorFunction (copy), UseSelectorFunction (copy), UseStoreFunction (copy), SquadQuickStartExperimentation (copy), FFlagEnablePartyQuickStartButton (copy), FFlagEnableScheduledSquads (copy), SquadPromptType (copy), FFlagMakeCreateOrJoinSquadAThunks (copy), CreateOrJoinSquadFunction (copy), NetworkingSquads (copy), FFlagEnableSquadCoplayAnalytic (copy), LogInExpCoplayTelemetryModule (copy), SquadCoplayJoin (copy), UseEffectOnceFunction (copy), FFlagAppChatShowOSAOnPageEntry (copy), LoggerModule (copy), Cryo (copy), SquadUserPartyStatusModule (copy), PartyUserInvitedDurationSeconds (copy), PartyInviteeNoResponseDurationSeconds (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), UsePreviousFunction (copy), UserBlockingNetworking (copy), NetworkingPresence (copy), ConstantsModule (copy), FFlagEnableSquadRegroupServerCapacityCheck (copy), Players (copy), SquadRegroupExperimentation (copy), PresenceType (copy), FFlagEnableSquadRegroupExperimentationSmallScreenFix (copy), EnableSquadLobbyBanners (copy), SquadLobbyBannersModule (copy), Foundation (copy), SquadLobbyUserGridModule (copy), EventNamesModule (copy), SquadPartySheetActionEnumModule (copy), SquadLobbyRegroupRowModule (copy), SquadLobbyActionBarModule (copy), StateLayerAffordance (copy), SquadLobbyVoiceChatMenuModule (copy), FFlagEnablePartyVoiceChangersInLua (copy), SquadLobbyUserDropdownMenuModule (copy), SquadCoordinationExperienceJoinExperimentation (copy), FFlagEnableSquadRegroupExperimentation (copy), Roact (copy), SquadLobbySessionProvider (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Number: number = tonumber(UseLocalUserIdFunction()) or 0
	local UseStyleResult = UseStyleFunction()
	local UseSquadStateResult = UseSquadStateFunction()
	local UseNavigationResult = UseNavigationFunction()
	local IsWideMode = p1.isWideMode
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseStateResult, UseStateResult2 = React.useState(0)
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	
	if FFlagEnableSquadTopBannerWideMode then
		local UseRefResult = React.useRef(HttpService:GenerateGUID())
		React.useEffect(function()
			-- upvalues: IsWideMode (copy), UseRefResult (copy), UseContextResult (copy), UseNavigationResult (copy), RoactNavigationModule (upval)
			if IsWideMode then
				return function() end
			else
				local Current = UseRefResult.current
				UseContextResult.disableSquadTopBanner(Current, true)
				local AddListenerResult = UseNavigationResult and UseNavigationResult.addListener(RoactNavigationModule.Events.WillBlur, function(p2)
					-- upvalues: UseContextResult (upval), Current (copy)
					if p2.state.routeName == "SquadInviteFriends" or p2.state.routeName == "SquadLobby" then
						UseContextResult.disableSquadTopBanner(Current, true)
						
						return
					else
						UseContextResult.disableSquadTopBanner(Current, false)
					end
				end)
				
				return function()
					-- upvalues: AddListenerResult (ref), UseContextResult (upval), Current (copy)
					if AddListenerResult then
						AddListenerResult.remove()
						AddListenerResult = nil
					end
					UseContextResult.disableSquadTopBanner(Current, false)
				end
			end
		end, {
			UseContextResult.disableSquadTopBanner,
			UseNavigationResult,
			IsWideMode
		})
		React.useEffect(function()
			-- upvalues: UseContextResult (copy), SquadViewFlags (upval)
			UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadLobby, true)
			
			return function()
				-- upvalues: UseContextResult (upval), SquadViewFlags (upval)
				UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadLobby, false)
			end
		end, { UseContextResult.updateSquadViewFlags })
	else
		React.useEffect(function()
			-- upvalues: UseContextResult (copy), SquadViewFlags (upval), UseNavigationResult (copy), RoactNavigationModule (upval)
			UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadLobby, true)
			local AddListenerResult = UseNavigationResult and UseNavigationResult.addListener(RoactNavigationModule.Events.WillBlur, function(p2)
				-- upvalues: UseContextResult (upval), SquadViewFlags (upval)
				if p2.state.routeName == "SquadInviteFriends" or p2.state.routeName == "SquadLobby" then
					UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadLobby, true)
					
					return
				else
					UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadLobby, false)
				end
			end)
			
			return function()
				-- upvalues: AddListenerResult (ref), UseContextResult (upval), SquadViewFlags (upval)
				if AddListenerResult then
					AddListenerResult.remove()
					AddListenerResult = nil
				end
				UseContextResult.updateSquadViewFlags(SquadViewFlags.SquadLobby, false)
			end
		end, {
			UseContextResult.updateSquadViewFlags,
			UseNavigationResult
		})
	end
	local UseStateResult1, UseStateResult2_1 = React.useState(false)
	local UseStateResult3, UseStateResult2_2 = React.useState(Vector2.zero)
	local UseResult = React.useCallback(function(Frame)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(Frame.AbsoluteSize)
	end, { UseStateResult2_2 })
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local SquadId = if UseCurrentSquadSelectorResult then UseCurrentSquadSelectorResult.squadId else ""
	local Members = UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.members
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		return p2.Squad and p2.Squad.Squad and p2.Squad.Squad.currentSquad and p2.Squad.Squad.currentSquad.parentChannelId or ""
	end, {})))
	local UseStoreResult = UseStoreFunction()
	local ConversationIdParam = UseNavigationResult.getParam("conversationId") or ""
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(ConversationIdParam)
	local Participants = UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants
	local Invitees = UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.invitees
	local SquadCreateOrJoinAttemptId = nil
	local ExtraParamsParam = UseNavigationResult.getParam("extraParams") or {}
	local SquadId1 = ExtraParamsParam.squadId
	
	if SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and FFlagEnablePartyQuickStartButton then
		SquadCreateOrJoinAttemptId = ExtraParamsParam.squadCreateOrJoinAttemptId
	end
	local ScheduledGroupUpId = if FFlagEnableScheduledSquads then ExtraParamsParam.scheduledGroupUpId else nil
	local UseResult1 = React.useCallback(function()
		-- upvalues: UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval), p1 (copy)
		UseContextResult.setSquadPrompt(UseStoreResult, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error,
			onConfirm = function()
				-- upvalues: p1 (upval)
				p1.navigateAwayFromSquad()
			end
		})
	end, {
		p1.navigateAwayFromSquad,
		UseStoreResult,
		UseContextResult.setSquadPrompt
	})
	local UseResult2 = React.useCallback(function(ParentChannelId)
		-- upvalues: FFlagMakeCreateOrJoinSquadAThunks (upval), UseDispatchResult (copy), CreateOrJoinSquadFunction (upval), UseContextResult (copy), SquadCreateOrJoinAttemptId (ref), p1 (copy), FFlagEnableScheduledSquads (upval), ScheduledGroupUpId (copy), NetworkingSquads (upval), FFlagEnableSquadCoplayAnalytic (upval), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoin (upval), UseResult1 (copy)
		if FFlagMakeCreateOrJoinSquadAThunks then
			UseDispatchResult(CreateOrJoinSquadFunction(ParentChannelId, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, SquadCreateOrJoinAttemptId, p1.navigateAwayFromSquad, if FFlagEnableScheduledSquads then ScheduledGroupUpId else nil))
			
			return
		end
		local UseDispatchResultResult = UseDispatchResult(NetworkingSquads.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = ParentChannelId,
			squadLocation = if FFlagEnableSquadCoplayAnalytic then UseContextResult.squadLocation else nil,
			partyAttemptId = SquadCreateOrJoinAttemptId
		}))
		
		if FFlagEnableSquadCoplayAnalytic then
			UseDispatchResultResult = UseDispatchResultResult:andThen(function(Result)
				-- upvalues: LogInExpCoplayTelemetryModule (upval), UseContextResult (upval), SquadCoplayJoin (upval)
				local GroupUpId = Result.responseBody.groupUp.groupUpId
				local Members = Result.responseBody.groupUp.members
				
				if GroupUpId and Members then
					LogInExpCoplayTelemetryModule(GroupUpId, Members, UseContextResult.squadLocation, SquadCoplayJoin.PartyJoin, UseContextResult.fireSquadAnalytics)
				end
			end)
		end
		UseDispatchResultResult:catch(function(_)
			-- upvalues: UseResult1 (upval)
			UseResult1()
		end)
	end, {
		UseDispatchResult,
		if FFlagMakeCreateOrJoinSquadAThunks then CreateOrJoinSquadFunction else nil,
		if FFlagMakeCreateOrJoinSquadAThunks then p1.navigateAwayFromSquad else nil,
		if FFlagMakeCreateOrJoinSquadAThunks then nil else UseResult1,
		if FFlagMakeCreateOrJoinSquadAThunks then UseContextResult.setSquadPrompt else nil,
		UseContextResult.squadLocation, UseContextResult.fireSquadAnalytics,
		SquadCreateOrJoinAttemptId,
		if FFlagEnableScheduledSquads then ScheduledGroupUpId else nil
	})
	local IsNotSquadIdMatch: boolean = SquadId1 and SquadId1 ~= SquadId
	React.useEffect(function()
		-- upvalues: IsNotSquadIdMatch (copy), UseContextResult (copy), UseStoreResult (copy), SquadPromptType (upval), UseResult2 (copy), ConversationIdParam (copy), p1 (copy), UseNavigationResult (copy)
		if IsNotSquadIdMatch then
			UseContextResult.setSquadPrompt(UseStoreResult, {
				promptType = SquadPromptType.JoinAnotherSquad,
				onConfirm = function()
					-- upvalues: UseResult2 (upval), ConversationIdParam (upval)
					UseResult2(ConversationIdParam)
				end,
				onCancel = function()
					-- upvalues: p1 (upval)
					p1.navigateAwayFromSquad()
				end
			})
			UseNavigationResult.setParams({ squadId = nil })
		end
	end, {
		SquadId1, UseContextResult.setSquadPrompt, UseResult2, ConversationIdParam,
		p1.navigateAwayFromSquad, IsNotSquadIdMatch
	})
	UseEffectOnceFunction(function()
		-- upvalues: IsNotSquadIdMatch (copy), FFlagAppChatShowOSAOnPageEntry (upval), UseContextResult (copy), UseGetConversationFromIdResult (copy), p1 (copy), SquadId (copy), LoggerModule (upval), ConversationIdParam (copy), UseDispatchResult (copy), UseResult2 (copy), UseResult1 (copy)
		if IsNotSquadIdMatch then return end
		if FFlagAppChatShowOSAOnPageEntry and UseContextResult.shouldShowOSAForConversation and UseContextResult.shouldShowOSAForConversation(UseGetConversationFromIdResult) then
			p1.navigateAwayFromSquad()
			
			return
		end
		if SquadId == "" then
			if UseGetConversationFromIdResult and UseGetConversationFromIdResult.source == "friends" then
				LoggerModule:debug("Channel does not exist for: {}. Creating a friend conversation.", ConversationIdParam)
				UseDispatchResult(UseContextResult.createFriendConversation(ConversationIdParam)):andThen(function(Result)
					-- upvalues: UseResult2 (upval)
					if Result and Result.id then
						UseResult2(Result.id)
					end
				end):catch(function(Err)
					-- upvalues: LoggerModule (upval), UseResult1 (upval)
					LoggerModule:debug("Error while trying to create a friend conversation: {}", Err)
					UseResult1()
				end)
				
				return
			else
				UseResult2(ConversationIdParam)
			end
		end
	end, {
		UseDispatchResult, UseContextResult.createFriendConversation,
		ConversationIdParam, UseGetConversationFromIdResult, UseResult2, UseResult1
	})
	local UseStateResult4, UseStateResult2_3 = React.useState({})
	local UseMemoResult = React.useMemo(function()
		-- upvalues: Members (copy)
		local t = {}
		
		if Members then
			for _, member in ipairs(Members) do
				t[tostring(member.userId)] = true
			end
		end
		return t
	end, { Members })
	local UseResult3 = React.useCallback(function(List, p2, p3)
		-- upvalues: Cryo (upval), Number (copy), SquadUserPartyStatusModule (upval), PartyUserInvitedDurationSeconds (upval), PartyInviteeNoResponseDurationSeconds (upval)
		local List1 = {}
		local Count = 0
		
		if p2 and #Cryo.Dictionary.keys(p2) == 0 then
			table.insert(List1, {
				userId = Number,
				partyStatus = SquadUserPartyStatusModule.Connecting
			})
		elseif List then
			local Timestamp = os.time()
			
			for _, value in ipairs(List) do
				local Inactive = SquadUserPartyStatusModule.Inactive
				
				if p2[value] then
					Inactive = SquadUserPartyStatusModule.Active
				else
					local Where = p3 and Cryo.List.findWhere(p3, function(p4): boolean
						-- upvalues: value (copy)
						return value == tostring(p4.userId)
					end)
					
					if Where then
						local Floored: number = math.floor(p3[Where].invitedAtTimestampMs / 1000) or 0
						
						if Timestamp >= Floored then
							if Timestamp - Floored < PartyUserInvitedDurationSeconds then
								Inactive = SquadUserPartyStatusModule.Invited
								Count += 1
							elseif Timestamp - Floored < PartyInviteeNoResponseDurationSeconds + PartyUserInvitedDurationSeconds then
								Inactive = SquadUserPartyStatusModule.NoResponse
								Count += 1
							end
						else
							continue
						end
					end
				end
				table.insert(List1, { userId = tonumber(value), partyStatus = Inactive })
			end
		end
		return { users = List1, numberOfUpdatesPending = Count }
	end, {})
	React.useEffect(function()
		-- upvalues: UseResult3 (copy), Participants (copy), UseMemoResult (copy), Invitees (copy), UseStateResult2_3 (copy), SetIntervalFunction (upval), ClearIntervalFunction (upval)
		UseStateResult2_3(UseResult3(Participants, UseMemoResult, Invitees).users)
		local v1 = nil
		v1 = SetIntervalFunction(function()
			-- upvalues: UseResult3 (upval), Participants (upval), UseMemoResult (upval), Invitees (upval), UseStateResult2_3 (upval), ClearIntervalFunction (upval), v1 (ref)
			local UseResultResult = UseResult3(Participants, UseMemoResult, Invitees)
			UseStateResult2_3(UseResultResult.users)
			
			if UseResultResult.numberOfUpdatesPending == 0 then
				ClearIntervalFunction(v1)
			end
		end, 1000)
		
		return function()
			-- upvalues: ClearIntervalFunction (upval), v1 (ref)
			ClearIntervalFunction(v1)
		end
	end, { UseMemoResult, Invitees, Participants, UseResult3 })
	local UsePreviousResult = UsePreviousFunction(SquadId) or ""
	React.useEffect(function()
		-- upvalues: UsePreviousResult (copy), SquadId (copy), p1 (copy), ConversationIdParam (copy), UseSelectorResult (copy), RoactNavigationModule (upval), IsWideMode (copy), UseNavigationResult (copy)
		if UsePreviousResult ~= "" and SquadId == "" then
			p1.navigateAwayFromSquad()
			
			return
		end
		if SquadId ~= "" and ConversationIdParam ~= "" and UseSelectorResult ~= "" and UseSelectorResult ~= ConversationIdParam then
			local Actions = {
				RoactNavigationModule.Actions.navigate({
					routeName = "ChatConversation",
					params = { conversationId = UseSelectorResult }
				}),
				RoactNavigationModule.Actions.navigate({
					routeName = "SquadLobby",
					params = { conversationId = UseSelectorResult }
				})
			}
			
			if IsWideMode then
				UseNavigationResult.navigate("ChatLanding", { conversationId = UseSelectorResult }, RoactNavigationModule.StackActions.reset({ index = 2, actions = Actions }))
				
				return
			end
			table.insert(Actions, 1, RoactNavigationModule.Actions.navigate({ routeName = "ChatLanding" }))
			UseNavigationResult.navigate("ChatLandingStack", { conversationId = UseSelectorResult }, RoactNavigationModule.StackActions.reset({ index = 3, actions = Actions }))
		end
	end, {
		UseNavigationResult,
		UseSelectorResult,
		ConversationIdParam,
		SquadId,
		p1.navigateAwayFromSquad
	})
	local UsePreviousResult1 = UsePreviousFunction(Members)
	React.useEffect(function()
		-- upvalues: Members (copy), UsePreviousResult1 (copy), Number (copy), UseDispatchResult (copy), UserBlockingNetworking (upval), NetworkingPresence (upval)
		local List = {}
		
		if Members then
			local Flag = nil
			for _, member in pairs(Members) do
				Flag = false
				
				if UsePreviousResult1 then
					for _, value in pairs(UsePreviousResult1) do
						if value.userId == member.userId then
							Flag = true
							break
						end
					end
				end
				local IsUserIdMatch: boolean = Flag
				
				if not IsUserIdMatch then
					table.insert(List, member.userId)
					IsUserIdMatch = Number == member.userId
				end
				if not IsUserIdMatch then
					UseDispatchResult(UserBlockingNetworking.IsBlockedById.API({ userId = member.userId, currentUserId = Number }))
				end
			end
		end
		UseDispatchResult(NetworkingPresence.GetPresencesFromUserIds.API(List))
	end, { Members, Number, UsePreviousResult1 })
	local UseResult4 = React.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy)
		UseStateResult2_1(not UseStateResult1)
	end, { UseStateResult1, UseStateResult2_1 })
	local NewSQUADLOBBYACTIONBARHEIGHT = ConstantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20
	local NewSQUADLOBBYACTIONBARHEIGHT1 = ConstantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20
	local UseStateResult5, UseStateResult2_4 = React.useState(nil)
	local UseStateResult6, UseStateResult2_5 = React.useState(false)
	local UseResult5 = React.useCallback(function(Vector)
		-- upvalues: UseStateResult2 (copy), UseTokensResult (copy)
		if Vector.Y > 0 then
			UseStateResult2(Vector.Y + UseTokensResult.Gap.Medium)
			
			return
		else
			UseStateResult2(0)
		end
	end, { UseStateResult2, UseTokensResult })
	local UseSelectorResult1 = UseSelectorFunction((React.useCallback(function(p4)
		-- upvalues: Members (copy)
		local ByUserId = p4.Squad and p4.Squad.Presence and p4.Squad.Presence.byUserId or {}
		local t = {}
		local Iterator = ipairs
		local Members1 = Members or {}
		for _, value in Iterator(Members1) do
			local Text = tostring(value.userId)
			t[Text] = ByUserId[Text]
		end
		return t
	end, { Members })))
	local NoFFlagEnableSquadRegroupServerCapacityCheck: boolean = not FFlagEnableSquadRegroupServerCapacityCheck or Players.MaxPlayers > 1
	local UseMemoResult1 = React.useMemo(function(): boolean
		-- upvalues: SquadRegroupExperimentation (upval), p1 (copy), NoFFlagEnableSquadRegroupServerCapacityCheck (copy), UseCurrentSquadSelectorResult (copy), UseSelectorResult1 (copy), Number (copy), PresenceType (upval)
		if not SquadRegroupExperimentation.getSquadRegroupEnabled() or not p1.isInExperience or not NoFFlagEnableSquadRegroupServerCapacityCheck or not UseCurrentSquadSelectorResult or not UseCurrentSquadSelectorResult.members or #UseCurrentSquadSelectorResult.members <= 1 or not UseCurrentSquadSelectorResult.selfPermissions or not UseCurrentSquadSelectorResult.selfPermissions.canSeeRegroupJoinButton then
			return false
		end
		local UseSelectorResultEntry = UseSelectorResult1[tostring(Number)]
		
		if UseSelectorResultEntry == nil then
			return false
		end
		for i, value in pairs(UseSelectorResult1) do
			if value ~= nil and i ~= tostring(Number) and (value.userPresenceType == PresenceType.Online or value.userPresenceType == PresenceType.InGame and UseSelectorResultEntry.gameId ~= nil and value.gameId ~= nil and UseSelectorResultEntry.gameId ~= value.gameId) then
				return true
			end
		end
		return false
	end, {
		UseSelectorResult1,
		Number,
		p1.isInExperience,
		UseCurrentSquadSelectorResult,
		NoFFlagEnableSquadRegroupServerCapacityCheck
	})
	local NewSize = UseTokensResult.Size.Size_1000 + UseTokensResult.Padding.Medium * 2
	local UseMemoResult1_1 = FFlagEnableSquadRegroupExperimentationSmallScreenFix and UseMemoResult1
	local NewXXLarge = if UseMemoResult1_1 or not UseMemoResult1 then 0 else UseTokensResult.Gap.XXLarge + NewSize
	local UseMemoResult2 = React.useMemo(function()
		-- upvalues: EnableSquadLobbyBanners (upval), React (upval), SquadLobbyBannersModule (upval), UseResult5 (copy)
		return if EnableSquadLobbyBanners then React.createElement(SquadLobbyBannersModule, { onAbsoluteSizeChanged = UseResult5 }) else nil
	end, { UseResult5 })
	local UseResult6 = React.useCallback(function()
		-- upvalues: p1 (copy), UseSelectorResult (copy)
		p1.navigateToSquadInviteFriends(UseSelectorResult)
	end, { UseSelectorResult, p1.navigateToSquadInviteFriends })
	local UseMemoResult3 = React.useMemo(function()
		-- upvalues: React (upval), UseStateResult (copy), NewXXLarge (copy), UseStyleResult (copy), UseResult (copy), UseMemoResult1_1 (copy), Foundation (upval), SquadLobbyUserGridModule (upval), UseStateResult3 (copy), NewSQUADLOBBYACTIONBARHEIGHT (copy), UseTokensResult (copy), NewSize (copy), UseStateResult4 (copy), p1 (copy), UseContextResult (copy), EventNamesModule (upval), UseSelectorResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseResult6 (copy), SquadLobbyRegroupRowModule (upval), Number (copy)
		return React.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, UseStateResult),
			Size = UDim2.new(1, 0, 1, -(UseStateResult + NewXXLarge)),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageColor3 = UseStyleResult.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = UseStyleResult.Theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			Selectable = false,
			ZIndex = 0,
			[React.Change.AbsoluteSize] = UseResult
		}, {
			FrameContents = if UseMemoResult1_1 then React.createElement(Foundation.View, {
				tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
			}, {
				UserGridContainer = React.createElement(Foundation.View, { tag = "auto-y size-full-0 bg-surface-0", LayoutOrder = 1 }, {
					SquadLobbyUserGrid = React.createElement(SquadLobbyUserGridModule, {
						containerSize = UseStateResult3 - Vector2.new(0, NewSQUADLOBBYACTIONBARHEIGHT + UseTokensResult.Gap.Medium + NewSize),
						paddingBottom = UDim.new(0, 0),
						users = UseStateResult4,
						isInExperience = p1.isInExperience,
						onUserCardActivated = function(p5)
							-- upvalues: UseContextResult (upval), EventNamesModule (upval), UseSelectorResult (upval), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (upval), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
							UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
								parentChannelId = UseSelectorResult,
								actionType = SquadPartySheetActionEnumModule.UserCardClicked,
								voiceStatus = UseVoiceStatusResult
							})
							UseStateResult2_4(p5)
							UseStateResult2_5(true)
						end,
						navigateToHomePage = p1.navigateToHomePage,
						navigateToSquadInviteFriends = UseResult6
					})
				}),
				RegroupRowSpacer = React.createElement(Foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Gap.Medium)
				}),
				SquadLobbyRegroupRow = React.createElement(Foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, NewSize)
				}, {
					Row = React.createElement(SquadLobbyRegroupRowModule, { localUserId = Number })
				}),
				BottomPadding = React.createElement(Foundation.View, {
					tag = "bg-surface-0",
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, NewSQUADLOBBYACTIONBARHEIGHT)
				})
			}) else nil,
			SquadLobbyUserGrid = if UseMemoResult1_1 then nil else React.createElement(SquadLobbyUserGridModule, {
				containerSize = UseStateResult3 - Vector2.new(0, NewSQUADLOBBYACTIONBARHEIGHT),
				paddingBottom = UDim.new(0, NewSQUADLOBBYACTIONBARHEIGHT),
				users = UseStateResult4,
				isInExperience = p1.isInExperience,
				onUserCardActivated = function(p5)
					-- upvalues: UseContextResult (upval), EventNamesModule (upval), UseSelectorResult (upval), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (upval), UseStateResult2_4 (upval), UseStateResult2_5 (upval)
					UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
						parentChannelId = UseSelectorResult,
						actionType = SquadPartySheetActionEnumModule.UserCardClicked,
						voiceStatus = UseVoiceStatusResult
					})
					UseStateResult2_4(p5)
					UseStateResult2_5(true)
				end,
				navigateToHomePage = p1.navigateToHomePage,
				navigateToSquadInviteFriends = UseResult6
			})
		})
	end, {
		UseStateResult2_4, UseStateResult2_5, UseStateResult3, Members, UseResult6,
		UseResult, p1.navigateToHomePage, NewSQUADLOBBYACTIONBARHEIGHT, UseStateResult,
		if UseMemoResult1 then NewXXLarge else nil, UseStateResult4, UseMemoResult1_1,
		if UseMemoResult1_1 then NewSize else nil,
		if UseMemoResult1_1 then Number else nil, UseVoiceStatusResult
	})
	local UseMemoResult4 = React.useMemo(function()
		-- upvalues: React (upval), SquadLobbyActionBarModule (upval), UseSquadStateResult (copy), UseGetConversationFromIdResult (copy), p1 (copy), UseResult4 (copy), SquadId (copy)
		return React.createElement(SquadLobbyActionBarModule, {
			squadState = UseSquadStateResult,
			anchorPoint = Vector2.new(0.5, 1),
			hasUnreadMessages = if UseGetConversationFromIdResult and UseGetConversationFromIdResult.hasUnreadMessages then UseGetConversationFromIdResult.hasUnreadMessages else false,
			navigateAwayFromSquad = p1.navigateAwayFromSquad,
			navigateToHomePage = p1.navigateToHomePage,
			toggleVoiceChatMenu = UseResult4,
			position = UDim2.new(0.5, 0, 1, -20),
			squadId = SquadId,
			isInExperience = p1.isInExperience
		})
	end, {
		SquadId, p1.isInExperience, p1.navigateToHomePage, UseSquadStateResult,
		UseResult4,
		UseGetConversationFromIdResult and UseGetConversationFromIdResult.hasUnreadMessages
	})
	local UseMemoResult5 = React.useMemo(function()
		-- upvalues: UseMemoResult1_1 (copy), UseMemoResult1 (copy), React (upval), Foundation (upval), ConstantsModule (upval), UseTokensResult (copy), NewSize (copy), SquadLobbyRegroupRowModule (upval), Number (copy)
		return if UseMemoResult1_1 or not UseMemoResult1 then nil else React.createElement(Foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + ConstantsModule.SQUAD_LOBBY_ACTION_BAR_HEIGHT + UseTokensResult.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, NewSize)
		}, {
			Row = React.createElement(SquadLobbyRegroupRowModule, { localUserId = Number })
		})
	end, { UseMemoResult1, Number, UseTokensResult, NewSize })
	local UseMemoResult6 = React.useMemo(function()
		-- upvalues: UseStateResult1 (copy), React (upval), Foundation (upval), StateLayerAffordance (upval), UseStateResult2_1 (copy), NewSQUADLOBBYACTIONBARHEIGHT1 (copy), UseTokensResult (copy), SquadLobbyVoiceChatMenuModule (upval), FFlagEnablePartyVoiceChangersInLua (upval), p1 (copy)
		return if UseStateResult1 then React.createElement(Foundation.View, {
			Size = UDim2.new(1, 0, 1, 0),
			stateLayer = { affordance = StateLayerAffordance.None },
			onActivated = function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end
		}, {
			React.createElement(Foundation.ScrollView, {
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
				FlexibleSpace = React.createElement(Foundation.View, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, NewSQUADLOBBYACTIONBARHEIGHT1),
					flexItem = { FlexMode = Enum.UIFlexMode.Fill },
					stateLayer = { affordance = StateLayerAffordance.None },
					onActivated = function()
						-- upvalues: UseStateResult2_1 (upval)
						UseStateResult2_1(false)
					end
				}),
				Menu = React.createElement(Foundation.View, {
					LayoutOrder = 2,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 1, 0),
					flexItem = { ItemLineAlignment = Enum.ItemLineAlignment.Center },
					AutomaticSize = Enum.AutomaticSize.Y,
					padding = Vector2.new(UseTokensResult.Padding.XLarge, UseTokensResult.Padding.Medium),
					stateLayer = { affordance = StateLayerAffordance.None },
					onActivated = function() end
				}, {
					SquadLobbyVoiceChatMenu = React.createElement(SquadLobbyVoiceChatMenuModule, {
						openSquadVoiceChangers = if FFlagEnablePartyVoiceChangersInLua then p1.openSquadVoiceChangers else nil
					})
				}),
				BottomPadding = React.createElement(Foundation.View, {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, NewSQUADLOBBYACTIONBARHEIGHT1),
					stateLayer = { affordance = StateLayerAffordance.None },
					onActivated = function()
						-- upvalues: UseStateResult2_1 (upval)
						UseStateResult2_1(false)
					end
				})
			})
		}) else nil
	end, {
		NewSQUADLOBBYACTIONBARHEIGHT1,
		UseStateResult1,
		UseStateResult2_1,
		UseTokensResult
	})
	local UseMemoResult7 = React.useMemo(function()
		-- upvalues: UseStateResult6 (copy), UseStateResult5 (copy), React (upval), SquadLobbyUserDropdownMenuModule (upval), p1 (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseSelectorResult (copy)
		return if UseStateResult6 and UseStateResult5 then React.createElement(SquadLobbyUserDropdownMenuModule, {
			userId = UseStateResult5,
			isInExperience = p1.isInExperience,
			onDismiss = function()
				-- upvalues: UseStateResult2_4 (upval), UseStateResult2_5 (upval)
				UseStateResult2_4(nil)
				UseStateResult2_5(false)
			end,
			openViewProfile = function()
				-- upvalues: p1 (upval), UseStateResult5 (upval)
				p1.openViewProfile(UseStateResult5)
			end,
			openSquadVoiceAbuseReport = p1.openSquadVoiceAbuseReport,
			parentChannelId = UseSelectorResult
		}) else nil
	end, {
		UseSelectorResult, p1.isInExperience, UseStateResult6, UseStateResult2_5,
		p1.openViewProfile, UseStateResult5, UseStateResult2_4
	})
	React.useEffect(function()
		-- upvalues: SquadCoordinationExperienceJoinExperimentation (upval), FFlagEnableSquadRegroupExperimentation (upval), SquadRegroupExperimentation (upval)
		SquadCoordinationExperienceJoinExperimentation.logExposure()
		
		if FFlagEnableSquadRegroupExperimentation then
			SquadRegroupExperimentation.logExposure()
		end
	end, {})
	local Fragment = Roact.createFragment({
		SquadLobbyBanners = UseMemoResult2,
		SquadLobbyUsersScrollingFrame = UseMemoResult3,
		SquadLobbyRegroupRow = UseMemoResult5,
		SquadLobbyActionBar = UseMemoResult4,
		SquadLobbyVoiceChatMenu = UseMemoResult6,
		UserDropdownMenu = UseMemoResult7
	})
	
	if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
		Fragment = React.createElement(SquadLobbySessionProvider.Provider, nil, Fragment)
	end
	return Fragment
end