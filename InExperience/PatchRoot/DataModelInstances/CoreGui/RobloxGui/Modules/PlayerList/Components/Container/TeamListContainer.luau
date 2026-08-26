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

return reactModule.memo(roactRoduxModule.connect(function(p1)
	return {
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship
	}
end)(function(p1)
	-- upvalues: useLeaderboardStore (ref), signalsReactModule (ref), reactModule (ref), leaderboardStoreModule (ref), fFlagPlayerListUseFocusNavHook (ref), teamListViewModule (ref)
	local var1 = signalsReactModule.useSignalState(useLeaderboardStore().getTeamList().getCount)
	local var2 = signalsReactModule.useSignalState(p1.teamData.players.getCount)
	local var3 = signalsReactModule.useSignalBinding(p1.teamData.order)
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), leaderboardStoreModule (copy), var1 (ref), var2 (ref)
		if p1.teamData.name(false) == leaderboardStoreModule.SpecialNeutralTeamName then
			return if var1 == 1 then false else var2 ~= 0
		end
	end, { var1, var2, p1.teamData.name })
	local var5 = nil
	local var6 = nil
	
	if fFlagPlayerListUseFocusNavHook then
		local var7, var8 = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			if p1.registerTeamInstance and p1.teamId then
				local var9 = p1.registerTeamInstance(p1.teamId, p1.teamData.order)
				
				return var9.registerPlayerInstance, var9.unregisterPlayerInstance
			end
			return nil, nil
		end, { p1.registerTeamInstance, p1.teamId, p1.teamData })
		var5 = var7
		var6 = var8
	end
	if fFlagPlayerListUseFocusNavHook then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref)
			return function()
				-- upvalues: p1 (copy)
				if p1.unregisterTeamInstance and p1.teamId then
					p1.unregisterTeamInstance(p1.teamId)
				end
			end
		end, { p1.unregisterTeamInstance, p1.teamId })
	end
	return reactModule.createElement(teamListViewModule, {
		layoutOrder = var3,
		showTeamEntry = var4,
		teamPlayersCount = var2,
		entrySizeX = p1.entrySizeX,
		teamData = p1.teamData,
		playerIconInfos = p1.playerIconInfos,
		playerRelationships = p1.playerRelationships,
		firstPlayerRef = p1.firstPlayerRef,
		setDropDownPlayerDimensionY = p1.setDropDownPlayerDimensionY,
		prevFocusedEntry = p1.prevFocusedEntry,
		destroyedFocusedPlayerId = p1.destroyedFocusedPlayerId,
		registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then var5 else nil,
		unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then var6 else nil,
		setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then p1.setSelectedPlayerId else nil,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred
	})
end))