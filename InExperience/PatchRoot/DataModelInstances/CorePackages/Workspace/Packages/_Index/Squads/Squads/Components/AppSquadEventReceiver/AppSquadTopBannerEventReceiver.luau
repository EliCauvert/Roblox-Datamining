local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local appTopBannerModule = require(parent.AppTopBanner)
local appTopBannerType = appTopBannerModule.Enums.AppTopBannerType
local setAppTopBanner = appTopBannerModule.Actions.SetAppTopBanner
local getAppTopBannerStore = appTopBannerModule.GetAppTopBannerStore
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
local fFlagUseSignalsForAppTopBanner = sharedFlags.FFlagUseSignalsForAppTopBanner
local fFlagIntroduceTopBannerPartyStatesModule = require(squads.Flags.FFlagIntroduceTopBannerPartyStates)
local fixSquadTopBannerMemo = game:DefineFastFlag("FixSquadTopBannerMemo", false)

return function()
	-- upvalues: useDispatch (ref), react (ref), squadExternalContractContext (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), fFlagIntroduceTopBannerPartyStatesModule (ref), useCurrentSquadMembers (ref), fixSquadTopBannerMemo (ref), cryo (ref), encodeSquadMembersModule (ref), eventNamesModule (ref), useCanAccessPartyModule (ref), fFlagEnableSquadTopBannerWideMode (ref), squadRootViewType (ref), fFlagUseSignalsForAppTopBanner (ref), getAppTopBannerStore (ref), appTopBannerType (ref), setAppTopBanner (ref), squadViewFlags (ref)
	local var1 = useDispatch()
	local var2 = react.useContext(squadExternalContractContext)
	local var3 = useCurrentSquadId()
	local var4 = useCurrentSquadParentChannelId()
	local var5 = if fFlagIntroduceTopBannerPartyStatesModule then useCurrentSquadMembers() else nil
	local _ = nil
	local var6 = if fixSquadTopBannerMemo then react.useMemo(function()
		-- upvalues: fFlagIntroduceTopBannerPartyStatesModule (copy), var5 (ref), cryo (copy)
		return if fFlagIntroduceTopBannerPartyStatesModule and var5 then cryo.List.map(var5, function(p1)
			return p1.userId
		end) else {}
	end, {
		if fFlagIntroduceTopBannerPartyStatesModule then var5 else nil
	}) elseif fFlagIntroduceTopBannerPartyStatesModule and var5 then cryo.List.map(var5, function(p1)
		return p1.userId
	end) else {}
	local var7 = if fFlagIntroduceTopBannerPartyStatesModule then react.useRef(os.clock()) else nil
	local var8 = react.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref), var1 (ref), fFlagIntroduceTopBannerPartyStatesModule (copy), encodeSquadMembersModule (copy), var5 (ref), eventNamesModule (copy), var3 (ref), var7 (ref)
		if var2.navigateIntoSquadLobby and var4 then
			var1(var2.navigateIntoSquadLobby({ conversationId = var4 }, true))
		end
		if fFlagIntroduceTopBannerPartyStatesModule then
			var2.fireSquadAnalytics(eventNamesModule.SquadTopBannerClicked, {
				squadId = var3,
				parentChannelId = var4,
				squadMembers = encodeSquadMembersModule(var5),
				timePassedSinceLastStateUpdatedInSec = os.clock() - var7.current
			})
		end
	end, {
		if fFlagIntroduceTopBannerPartyStatesModule then var3 else nil, var4, var1,
		var2.navigateIntoSquadLobby,
		if fFlagIntroduceTopBannerPartyStatesModule then var2.fireSquadAnalytics else nil,
		if fFlagIntroduceTopBannerPartyStatesModule then var5 else nil
	})
	local var9 = var2.useGetConversationFromId(var4)
	local type = var9 and var9.type
	local participants = var9 and var9.participants
	local var10 = useCanAccessPartyModule()
	local var11 = var2.useSquadRootView()
	
	if fFlagEnableSquadTopBannerWideMode then
		local var12 = var2.useSquadTopBannerDisabled()
		react.useEffect(function()
			-- upvalues: var3 (ref), var12 (ref), var11 (ref), squadRootViewType (copy), var10 (ref), fFlagIntroduceTopBannerPartyStatesModule (copy), var7 (ref), fFlagUseSignalsForAppTopBanner (copy), getAppTopBannerStore (copy), appTopBannerType (copy), var6 (write), type (ref), participants (ref), var8 (ref), var1 (ref), setAppTopBanner (copy)
			if var10 and (var3 and (not var12 or var11 == squadRootViewType.None)) then
				if fFlagIntroduceTopBannerPartyStatesModule then
					var7.current = os.clock()
				end
				if fFlagUseSignalsForAppTopBanner then
					getAppTopBannerStore(false).setAppTopBanner(true, appTopBannerType.ActiveSquad, if fFlagIntroduceTopBannerPartyStatesModule then {
						squadMemberList = var6,
						parentChannelType = type,
						parentChannelParticipants = participants
					} else nil, var8)
					
					return
				end
				var1(setAppTopBanner(true, appTopBannerType.ActiveSquad, if fFlagIntroduceTopBannerPartyStatesModule then {
					squadMemberList = var6,
					parentChannelType = type,
					parentChannelParticipants = participants
				} else nil, var8))
				
				return
			elseif fFlagUseSignalsForAppTopBanner then
				getAppTopBannerStore(false).setAppTopBanner(false, appTopBannerType.None, nil)
				
				return
			end
			var1(setAppTopBanner(false, appTopBannerType.None, nil))
		end, {
			var3, if fFlagIntroduceTopBannerPartyStatesModule then var6 else nil, var1,
			var8, type, participants, var12, var11
		})
	else
		local var13 = var2.useSquadViewFlags()
		react.useEffect(function()
			-- upvalues: var3 (ref), var13 (ref), squadViewFlags (copy), var11 (ref), squadRootViewType (copy), var10 (ref), fFlagIntroduceTopBannerPartyStatesModule (copy), var7 (ref), fFlagUseSignalsForAppTopBanner (copy), getAppTopBannerStore (copy), appTopBannerType (copy), var6 (write), type (ref), participants (ref), var8 (ref), var1 (ref), setAppTopBanner (copy)
			if var10 and (var3 and (if bit32.band(var13, squadViewFlags.SquadLobby) ~= 0 then var11 == squadRootViewType.None else true)) then
				if fFlagIntroduceTopBannerPartyStatesModule then
					var7.current = os.clock()
				end
				if fFlagUseSignalsForAppTopBanner then
					getAppTopBannerStore(false).setAppTopBanner(true, appTopBannerType.ActiveSquad, if fFlagIntroduceTopBannerPartyStatesModule then {
						squadMemberList = var6,
						parentChannelType = type,
						parentChannelParticipants = participants
					} else nil, var8)
					
					return
				end
				var1(setAppTopBanner(true, appTopBannerType.ActiveSquad, if fFlagIntroduceTopBannerPartyStatesModule then {
					squadMemberList = var6,
					parentChannelType = type,
					parentChannelParticipants = participants
				} else nil, var8))
				
				return
			elseif fFlagUseSignalsForAppTopBanner then
				getAppTopBannerStore(false).setAppTopBanner(false, appTopBannerType.None, nil)
				
				return
			end
			var1(setAppTopBanner(false, appTopBannerType.None, nil))
		end, {
			var3, if fFlagIntroduceTopBannerPartyStatesModule then var6 else nil, var1,
			var8, var13, type, participants, var11
		})
	end
	return nil
end