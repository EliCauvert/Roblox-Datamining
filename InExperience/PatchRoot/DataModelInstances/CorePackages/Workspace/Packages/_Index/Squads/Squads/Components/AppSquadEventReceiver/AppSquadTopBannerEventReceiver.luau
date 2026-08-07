local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local appTopBannerModule = require(parent.AppTopBanner)
local appTopBannerType = appTopBannerModule.Enums.AppTopBannerType
local setAppTopBanner = appTopBannerModule.Actions.SetAppTopBanner
local dependenciesModule = require(squads.dependencies)
local cryo = dependenciesModule.Cryo
local react = dependenciesModule.React
local sharedFlags = dependenciesModule.SharedFlags
local hooksModule = require(parent.SquadsCore.Hooks)
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadViewFlags = require(parent.SquadsCore.SquadExternalContractProvider).SquadViewFlags
local squadRootViewType = require(parent.SquadsCore.Enums).SquadRootViewType
local encodeSquadMembersModule = require(parent.SquadsCore.encodeSquadMembers)
local useCurrentSquadId = hooksModule.useCurrentSquadId
local useCurrentSquadMembers = hooksModule.useCurrentSquadMembers
local useCurrentSquadParentChannelId = hooksModule.useCurrentSquadParentChannelId
local useDispatch = dependenciesModule.Hooks.useDispatch
local useCanAccessPartyModule = require(squads.Hooks.useCanAccessParty)
local fFlagEnableSquadTopBannerWideMode = sharedFlags.FFlagEnableSquadTopBannerWideMode
local fFlagIntroduceTopBannerPartyStatesModule = require(squads.Flags.FFlagIntroduceTopBannerPartyStates)
local fixSquadTopBannerMemo = game:DefineFastFlag("FixSquadTopBannerMemo", false)

return function() --[[ line: 33 ]]
	-- upvalues: useDispatch (ref), react (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), fFlagIntroduceTopBannerPartyStatesModule (ref), useCurrentSquadMembers (ref), fixSquadTopBannerMemo (ref), cryo (ref), encodeSquadMembersModule (ref), eventNamesModule (ref), useCanAccessPartyModule (ref), fFlagEnableSquadTopBannerWideMode (ref), squadRootViewType (ref), setAppTopBanner (ref), appTopBannerType (ref), squadViewFlags (ref)
	local var9 = useDispatch()
	local var10 = react.useContext(squadExternalContractContext)
	local var11 = useCurrentSquadId()
	local var12 = useCurrentSquadParentChannelId()
	local var13 = if fFlagIntroduceTopBannerPartyStatesModule then useCurrentSquadMembers() else nil
	local _ = nil
	local var14 = if fixSquadTopBannerMemo then react.useMemo(function() --[[ line: 43 ]]
		-- upvalues: fFlagIntroduceTopBannerPartyStatesModule (copy), var13 (ref), cryo (copy)
		return if fFlagIntroduceTopBannerPartyStatesModule and var13 then cryo.List.map(var13, function(p1) --[[ line: 45 ]]
			return p1.userId
		end) else {}
	end, {
		if fFlagIntroduceTopBannerPartyStatesModule then var13 else nil
	}) elseif fFlagIntroduceTopBannerPartyStatesModule and var13 then cryo.List.map(var13, function(p0) --[[ line: 52 ]]
		return p0.userId
	end) else {}
	local var15 = if fFlagIntroduceTopBannerPartyStatesModule then react.useRef(os.clock()) else nil
	local var16 = react.useCallback(function() --[[ line: 63 ]]
		-- upvalues: var10 (ref), var12 (ref), var9 (ref), fFlagIntroduceTopBannerPartyStatesModule (copy), encodeSquadMembersModule (copy), var13 (ref), eventNamesModule (copy), var11 (ref), var15 (ref)
		if var10.navigateIntoSquadLobby and var12 then
			var9(var10.navigateIntoSquadLobby({ conversationId = var12 }, true))
		end
		if fFlagIntroduceTopBannerPartyStatesModule then
			var10.fireSquadAnalytics(eventNamesModule.SquadTopBannerClicked, {
				squadId = var11,
				parentChannelId = var12,
				squadMembers = encodeSquadMembersModule(var13),
				timePassedSinceLastStateUpdatedInSec = os.clock() - var15.current
			})
		end
	end, {
		if fFlagIntroduceTopBannerPartyStatesModule then var11 else nil, var12, var9,
		var10.navigateIntoSquadLobby,
		if fFlagIntroduceTopBannerPartyStatesModule then var10.fireSquadAnalytics else nil,
		if fFlagIntroduceTopBannerPartyStatesModule then var13 else nil
	})
	local var17 = var10.useGetConversationFromId(var12)
	local type = var17 and var17.type
	local participants = var17 and var17.participants
	local var20 = useCanAccessPartyModule()
	local var21 = var10.useSquadRootView()
	
	if fFlagEnableSquadTopBannerWideMode then
		local var23 = var10.useSquadTopBannerDisabled()
		react.useEffect(function() --[[ line: 97 ]]
			-- upvalues: var11 (ref), var23 (ref), var21 (ref), squadRootViewType (copy), var20 (ref), fFlagIntroduceTopBannerPartyStatesModule (copy), var15 (ref), var9 (ref), setAppTopBanner (copy), appTopBannerType (copy), var14 (write), type (ref), participants (ref), var16 (ref)
			if not var20 or (not var11 or var23 and var21 ~= squadRootViewType.None) then
				var9(setAppTopBanner(false, appTopBannerType.None, nil))
				
				return
			elseif fFlagIntroduceTopBannerPartyStatesModule then
				var15.current = os.clock()
			end
			var9(setAppTopBanner(true, appTopBannerType.ActiveSquad, if fFlagIntroduceTopBannerPartyStatesModule then {
				squadMemberList = var14,
				parentChannelType = type,
				parentChannelParticipants = participants
			} else nil, var16))
		end, {
			var11, if fFlagIntroduceTopBannerPartyStatesModule then var14 else nil, var9,
			var16, type, participants, var23, var21
		})
	else
		local var22 = var10.useSquadViewFlags()
		react.useEffect(function() --[[ line: 138 ]]
			-- upvalues: var11 (ref), var22 (ref), squadViewFlags (copy), var21 (ref), squadRootViewType (copy), var20 (ref), fFlagIntroduceTopBannerPartyStatesModule (copy), var15 (ref), var9 (ref), setAppTopBanner (copy), appTopBannerType (copy), var14 (write), type (ref), participants (ref), var16 (ref)
			if not var20 or not (var11 and (if bit32.band(var22, squadViewFlags.SquadLobby) ~= 0 then var21 == squadRootViewType.None else true)) then
				var9(setAppTopBanner(false, appTopBannerType.None, nil))
				
				return
			elseif fFlagIntroduceTopBannerPartyStatesModule then
				var15.current = os.clock()
			end
			var9(setAppTopBanner(true, appTopBannerType.ActiveSquad, if fFlagIntroduceTopBannerPartyStatesModule then {
				squadMemberList = var14,
				parentChannelType = type,
				parentChannelParticipants = participants
			} else nil, var16))
		end, {
			var11, if fFlagIntroduceTopBannerPartyStatesModule then var14 else nil, var9,
			var16, var22, type, participants, var21
		})
	end
	return nil
end