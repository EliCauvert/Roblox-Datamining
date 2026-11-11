local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local AppTopBannerModule = require(Parent.AppTopBanner)
local AppTopBannerType = AppTopBannerModule.Enums.AppTopBannerType
local SetAppTopBannerFunction = AppTopBannerModule.Actions.SetAppTopBanner
local DependenciesModule = require(Squads.dependencies)
local Cryo = DependenciesModule.Cryo
local React = DependenciesModule.React
local HooksModule = require(Parent.SquadsCore.Hooks)
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadViewFlags = require(Parent.SquadsCore.SquadExternalContractProvider).SquadViewFlags
local SquadRootViewType = require(Parent.SquadsCore.Enums).SquadRootViewType
local EncodeSquadMembersModule = require(Parent.SquadsCore.encodeSquadMembers)
local UseCurrentSquadIdFunction = HooksModule.useCurrentSquadId
local UseCurrentSquadMembersFunction = HooksModule.useCurrentSquadMembers
local UseCurrentSquadParentChannelIdFunction = HooksModule.useCurrentSquadParentChannelId
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseCanAccessPartyModule = require(Squads.Hooks.useCanAccessParty)
local FFlagEnableSquadTopBannerWideMode = DependenciesModule.SharedFlags.FFlagEnableSquadTopBannerWideMode
local FFlagIntroduceTopBannerPartyStatesModule = require(Squads.Flags.FFlagIntroduceTopBannerPartyStates)
local FixSquadTopBannerMemo = game:DefineFastFlag("FixSquadTopBannerMemo", false)

return function()
	-- upvalues: UseDispatchFunction (copy), React (copy), SquadExternalContractContext (copy), UseCurrentSquadIdFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), FFlagIntroduceTopBannerPartyStatesModule (copy), UseCurrentSquadMembersFunction (copy), FixSquadTopBannerMemo (copy), Cryo (copy), EncodeSquadMembersModule (copy), EventNamesModule (copy), UseCanAccessPartyModule (copy), FFlagEnableSquadTopBannerWideMode (copy), SquadRootViewType (copy), SetAppTopBannerFunction (copy), AppTopBannerType (copy), SquadViewFlags (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction()
	local UseCurrentSquadMembersResult = if FFlagIntroduceTopBannerPartyStatesModule then UseCurrentSquadMembersFunction() else nil
	local UseMemoResult = nil
	UseMemoResult = if FixSquadTopBannerMemo then React.useMemo(function()
		-- upvalues: FFlagIntroduceTopBannerPartyStatesModule (upval), UseCurrentSquadMembersResult (copy), Cryo (upval)
		return if FFlagIntroduceTopBannerPartyStatesModule and UseCurrentSquadMembersResult then Cryo.List.map(UseCurrentSquadMembersResult, function(p1)
			return p1.userId
		end) else {}
	end, {
		if FFlagIntroduceTopBannerPartyStatesModule then UseCurrentSquadMembersResult else nil
	}) elseif FFlagIntroduceTopBannerPartyStatesModule and UseCurrentSquadMembersResult then Cryo.List.map(UseCurrentSquadMembersResult, function(p1)
		return p1.userId
	end) else {}
	local UseRefResult = if FFlagIntroduceTopBannerPartyStatesModule then React.useRef(os.clock()) else nil
	local UseResult = React.useCallback(function()
		-- upvalues: UseContextResult (copy), UseCurrentSquadParentChannelIdResult (copy), UseDispatchResult (copy), FFlagIntroduceTopBannerPartyStatesModule (upval), EncodeSquadMembersModule (upval), UseCurrentSquadMembersResult (copy), EventNamesModule (upval), UseCurrentSquadIdResult (copy), UseRefResult (copy)
		if UseContextResult.navigateIntoSquadLobby and UseCurrentSquadParentChannelIdResult then
			UseDispatchResult(UseContextResult.navigateIntoSquadLobby({ conversationId = UseCurrentSquadParentChannelIdResult }, true))
		end
		if FFlagIntroduceTopBannerPartyStatesModule then
			UseContextResult.fireSquadAnalytics(EventNamesModule.SquadTopBannerClicked, {
				squadId = UseCurrentSquadIdResult,
				parentChannelId = UseCurrentSquadParentChannelIdResult,
				squadMembers = EncodeSquadMembersModule(UseCurrentSquadMembersResult),
				timePassedSinceLastStateUpdatedInSec = os.clock() - UseRefResult.current
			})
		end
	end, {
		if FFlagIntroduceTopBannerPartyStatesModule then UseCurrentSquadIdResult else nil,
		UseCurrentSquadParentChannelIdResult, UseDispatchResult,
		UseContextResult.navigateIntoSquadLobby,
		if FFlagIntroduceTopBannerPartyStatesModule then UseContextResult.fireSquadAnalytics else nil,
		if FFlagIntroduceTopBannerPartyStatesModule then UseCurrentSquadMembersResult else nil
	})
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(UseCurrentSquadParentChannelIdResult)
	local Type = UseGetConversationFromIdResult and UseGetConversationFromIdResult.type
	local Participants = UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants
	local UseCanAccessPartyModuleResult = UseCanAccessPartyModule()
	local UseSquadRootViewResult = UseContextResult.useSquadRootView()
	
	if FFlagEnableSquadTopBannerWideMode then
		local UseSquadTopBannerDisabledResult = UseContextResult.useSquadTopBannerDisabled()
		React.useEffect(function()
			-- upvalues: UseCurrentSquadIdResult (copy), UseSquadTopBannerDisabledResult (copy), UseSquadRootViewResult (copy), SquadRootViewType (upval), UseCanAccessPartyModuleResult (copy), FFlagIntroduceTopBannerPartyStatesModule (upval), UseRefResult (copy), UseDispatchResult (copy), SetAppTopBannerFunction (upval), AppTopBannerType (upval), UseMemoResult (ref), Type (copy), Participants (copy), UseResult (copy)
			local NoUseSquadTopBannerDisabledResult: boolean = UseCurrentSquadIdResult and (not UseSquadTopBannerDisabledResult or UseSquadRootViewResult == SquadRootViewType.None)
			
			if not UseCanAccessPartyModuleResult or not NoUseSquadTopBannerDisabledResult then
				UseDispatchResult(SetAppTopBannerFunction(false, AppTopBannerType.None, nil))
				
				return
			end
			if FFlagIntroduceTopBannerPartyStatesModule then
				UseRefResult.current = os.clock()
			end
			UseDispatchResult(SetAppTopBannerFunction(true, AppTopBannerType.ActiveSquad, if FFlagIntroduceTopBannerPartyStatesModule then {
				squadMemberList = UseMemoResult,
				parentChannelType = Type,
				parentChannelParticipants = Participants
			} else nil, UseResult))
		end, {
			UseCurrentSquadIdResult,
			if FFlagIntroduceTopBannerPartyStatesModule then UseMemoResult else nil,
			UseDispatchResult, UseResult, Type, Participants,
			UseSquadTopBannerDisabledResult, UseSquadRootViewResult
		})
	else
		local UseSquadViewFlagsResult = UseContextResult.useSquadViewFlags()
		React.useEffect(function()
			-- upvalues: UseCurrentSquadIdResult (copy), UseSquadViewFlagsResult (copy), SquadViewFlags (upval), UseSquadRootViewResult (copy), SquadRootViewType (upval), UseCanAccessPartyModuleResult (copy), FFlagIntroduceTopBannerPartyStatesModule (upval), UseRefResult (copy), UseDispatchResult (copy), SetAppTopBannerFunction (upval), AppTopBannerType (upval), UseMemoResult (ref), Type (copy), Participants (copy), UseResult (copy)
			local IsBitsMatch: boolean = UseCurrentSquadIdResult and (bit32.band(UseSquadViewFlagsResult, SquadViewFlags.SquadLobby) == 0 or UseSquadRootViewResult == SquadRootViewType.None)
			
			if not UseCanAccessPartyModuleResult or not IsBitsMatch then
				UseDispatchResult(SetAppTopBannerFunction(false, AppTopBannerType.None, nil))
				
				return
			end
			if FFlagIntroduceTopBannerPartyStatesModule then
				UseRefResult.current = os.clock()
			end
			UseDispatchResult(SetAppTopBannerFunction(true, AppTopBannerType.ActiveSquad, if FFlagIntroduceTopBannerPartyStatesModule then {
				squadMemberList = UseMemoResult,
				parentChannelType = Type,
				parentChannelParticipants = Participants
			} else nil, UseResult))
		end, {
			UseCurrentSquadIdResult,
			if FFlagIntroduceTopBannerPartyStatesModule then UseMemoResult else nil,
			UseDispatchResult, UseResult, UseSquadViewFlagsResult, Type, Participants,
			UseSquadRootViewResult
		})
	end
	return nil
end