local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local LeaderboardStoreModule = require(CorePackages.Workspace.Packages.LeaderboardStore)
local _ = require(CorePackages.Workspace.Packages.PlayerIconInfoStore)
local UseLeaderboardStoreFunction = PlayerListModule.Hooks.useLeaderboardStore
local TeamListViewModule = require(script.Parent.Parent.Parent.Components.PresentationCommon.TeamListView)
local FFlagPlayerListUseFocusNavHook = PlayerListModule.Flags.FFlagPlayerListUseFocusNavHook

return ReactModule.memo(require(CorePackages.Packages.RoactRodux).connect(function(p1) --[[ Line: 127 | Named "mapStateToProps" ]]
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship
	}
end)(function(p1) --[[ Line: 60 | Named "TeamListContainer" ]]
	-- upvalues: UseLeaderboardStoreFunction (copy), SignalsReactModule (copy), ReactModule (copy), LeaderboardStoreModule (copy), FFlagPlayerListUseFocusNavHook (copy), TeamListViewModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseLeaderboardStoreFunction().getTeamList().getCount)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p1.teamData.players.getCount)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(p1.teamData.order)
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 70 ]]
		-- upvalues: p1 (copy), LeaderboardStoreModule (upval), UseSignalStateResult (copy), UseSignalStateResult1 (copy)
		if p1.teamData.name(false) == LeaderboardStoreModule.SpecialNeutralTeamName then
			if UseSignalStateResult == 1 then
				return false
			elseif UseSignalStateResult1 == 0 then
				return false
			end
		end
		return true
	end, {
		UseSignalStateResult,
		UseSignalStateResult1,
		p1.teamData.name
	})
	local v1 = nil
	local v2 = nil
	
	if FFlagPlayerListUseFocusNavHook then
		v1, v13 = ReactModule.useMemo(function() --[[ Line: 86 ]]
			-- upvalues: p1 (copy)
			if p1.registerTeamInstance and p1.teamId then
				local RegisterTeamInstanceResult = p1.registerTeamInstance(p1.teamId, p1.teamData.order)
				
				return RegisterTeamInstanceResult.registerPlayerInstance, RegisterTeamInstanceResult.unregisterPlayerInstance
			else
				return nil, nil
			end
		end, { p1.registerTeamInstance, p1.teamId, p1.teamData })
	end
	if FFlagPlayerListUseFocusNavHook then
		ReactModule.useEffect(function() --[[ Line: 97 ]]
			-- upvalues: p1 (copy)
			return function() --[[ Line: 98 ]]
				-- upvalues: p1 (upval)
				if p1.unregisterTeamInstance and p1.teamId then
					p1.unregisterTeamInstance(p1.teamId)
				end
			end
		end, { p1.unregisterTeamInstance, p1.teamId })
	end
	return ReactModule.createElement(TeamListViewModule, {
		layoutOrder = UseSignalBindingResult,
		showTeamEntry = UseMemoResult,
		teamPlayersCount = UseSignalStateResult1,
		entrySizeX = p1.entrySizeX,
		teamData = p1.teamData,
		playerIconInfos = p1.playerIconInfos,
		playerRelationships = p1.playerRelationships,
		firstPlayerRef = p1.firstPlayerRef,
		setDropDownPlayerDimensionY = p1.setDropDownPlayerDimensionY,
		prevFocusedEntry = p1.prevFocusedEntry,
		destroyedFocusedPlayerId = p1.destroyedFocusedPlayerId,
		registerPlayerInstance = if FFlagPlayerListUseFocusNavHook then v1 else nil,
		unregisterPlayerInstance = if FFlagPlayerListUseFocusNavHook then v2 else nil,
		setSelectedPlayerId = if FFlagPlayerListUseFocusNavHook then p1.setSelectedPlayerId else nil,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred
	})
end))