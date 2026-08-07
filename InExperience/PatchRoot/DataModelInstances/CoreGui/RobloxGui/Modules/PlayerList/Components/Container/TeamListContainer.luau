local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local leaderboardStoreModule = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local _ = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore)
local useLeaderboardStore = playerListModule.Hooks.useLeaderboardStore
local teamListViewModule = require(parent.Components.PresentationCommon.TeamListView)
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook

return reactModule.memo(roactRoduxModule.connect(function(p1) --[[ line: 127 | named "mapStateToProps" ]]
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship
	}
end)(function(p0) --[[ line: 60 | named "TeamListContainer" ]]
	-- upvalues: useLeaderboardStore (ref), signalsReactModule (ref), reactModule (ref), leaderboardStoreModule (ref), fFlagPlayerListUseFocusNavHook (ref), teamListViewModule (ref)
	local var7 = signalsReactModule.useSignalState(useLeaderboardStore().getTeamList().getCount)
	local var8 = signalsReactModule.useSignalState(p0.teamData.players.getCount)
	local var9 = signalsReactModule.useSignalBinding(p0.teamData.order)
	local var10 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: p0 (ref), leaderboardStoreModule (copy), var7 (ref), var8 (ref)
		if p0.teamData.name(false) == leaderboardStoreModule.SpecialNeutralTeamName then
			return if var7 == 1 then false else var8 ~= 0
		end
	end, { var7, var8, p0.teamData.name })
	local var11 = nil
	local var12 = nil
	
	if fFlagPlayerListUseFocusNavHook then
		local var13, var14 = reactModule.useMemo(function() --[[ line: 86 ]]
			-- upvalues: p0 (ref)
			if p0.registerTeamInstance and p0.teamId then
				local var15 = p0.registerTeamInstance(p0.teamId, p0.teamData.order)
				
				return var15.registerPlayerInstance, var15.unregisterPlayerInstance
			end
			return nil, nil
		end, { p0.registerTeamInstance, p0.teamId, p0.teamData })
		var11 = var13
		var12 = var14
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function() --[[ line: 97 ]]
			-- upvalues: p0 (ref)
			return function() --[[ line: 98 ]]
				-- upvalues: p0 (copy)
				if p0.unregisterTeamInstance and p0.teamId then
					p0.unregisterTeamInstance(p0.teamId)
				end
			end
		end, { p0.unregisterTeamInstance, p0.teamId })
	end
	return reactModule.createElement(teamListViewModule, {
		layoutOrder = var9,
		showTeamEntry = var10,
		teamPlayersCount = var8,
		entrySizeX = p0.entrySizeX,
		teamData = p0.teamData,
		playerIconInfos = p0.playerIconInfos,
		playerRelationships = p0.playerRelationships,
		firstPlayerRef = p0.firstPlayerRef,
		setDropDownPlayerDimensionY = p0.setDropDownPlayerDimensionY,
		prevFocusedEntry = p0.prevFocusedEntry,
		destroyedFocusedPlayerId = p0.destroyedFocusedPlayerId,
		registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then var11 else nil,
		unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then var12 else nil,
		setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then p0.setSelectedPlayerId else nil,
		isSmallTouchDevice = p0.isSmallTouchDevice,
		isDirectionalPreferred = p0.isDirectionalPreferred
	})
end))