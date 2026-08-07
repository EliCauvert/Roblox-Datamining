local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local playerIconInfoStoreModule = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore)
local useLeaderboardStore = playerListModule.Hooks.useLeaderboardStore
local playerEntryViewModule = require(parent.Components.PresentationCommon.PlayerEntryView)
local closePlayerDropDownModule = require(parent.Actions.ClosePlayerDropDown)
local openPlayerDropDownModule = require(parent.Actions.OpenPlayerDropDown)
local fFlagReplacePlayerIconRoduxWithSignal = sharedFlagsModule.FFlagReplacePlayerIconRoduxWithSignal
local var10 = if fFlagReplacePlayerIconRoduxWithSignal then playerIconInfoStoreModule.PlayerIconInfoStore else nil
local fFlagPlayerListFixLeaderstatsStacking = sharedFlagsModule.FFlagPlayerListFixLeaderstatsStacking
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook

return reactModule.memo(roactRoduxModule.connect(function(p1) --[[ line: 116 | named "mapStateToProps" ]]
	return {
		selectedPlayer = p1.playerDropDown.selectedPlayer,
		dropdownOpen = p1.playerDropDown.isVisible,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface
	}
end, function(p2) --[[ line: 126 | named "mapDispatchToProps" ]]
	-- upvalues: closePlayerDropDownModule (ref), openPlayerDropDownModule (ref)
	return {
		closeDropdown = function() --[[ line: 128 ]]
			-- upvalues: p2 (ref), closePlayerDropDownModule (copy)
			return p2(closePlayerDropDownModule())
		end,
		openDropdown = function(p3) --[[ line: 131 ]]
			-- upvalues: p2 (ref), openPlayerDropDownModule (copy)
			return p2(openPlayerDropDownModule(p3))
		end
	}
end)(function(p0) --[[ line: 71 | named "PlayerEntryContainer" ]]
	-- upvalues: useLeaderboardStore (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), var10 (ref), signalsReactModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref), reactModule (ref), playerEntryViewModule (ref), fFlagPlayerListUseFocusNavHook (ref)
	local var11 = useLeaderboardStore()
	local var12 = if fFlagReplacePlayerIconRoduxWithSignal then signalsReactModule.useSignalState(var10.getPlayerIconInfoReactive(p0.player.UserId)) else p0.playerIconInfo
	local gameStatsList = var11.getGameStatsList()
	local playerEntry = var11.getPlayerEntry(p0.player, false)
	
	return if playerEntry then reactModule.createElement(playerEntryViewModule, {
		playerData = playerEntry,
		gameStats = gameStatsList,
		gameStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(gameStatsList.getCount),
		size = p0.size,
		entrySizeX = p0.entrySizeX,
		layoutOrder = p0.layoutOrder,
		player = p0.player,
		titlePlayerEntry = p0.titlePlayerEntry,
		playerIconInfo = var12,
		playerRelationship = p0.playerRelationship,
		dropdownOpen = p0.dropdownOpen,
		selectedPlayer = p0.selectedPlayer,
		firstPlayerRef = p0.firstPlayerRef,
		openDropdown = p0.openDropdown,
		closeDropdown = p0.closeDropdown,
		setDropDownPlayerDimensionY = p0.setDropDownPlayerDimensionY,
		prevFocusedEntry = p0.prevFocusedEntry,
		destroyedFocusedPlayerId = p0.destroyedFocusedPlayerId,
		registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then p0.registerPlayerInstance else nil,
		unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then p0.unregisterPlayerInstance else nil,
		setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then p0.setSelectedPlayerId else nil,
		isSmallTouchDevice = p0.isSmallTouchDevice,
		isDirectionalPreferred = p0.isDirectionalPreferred
	}) else nil
end))