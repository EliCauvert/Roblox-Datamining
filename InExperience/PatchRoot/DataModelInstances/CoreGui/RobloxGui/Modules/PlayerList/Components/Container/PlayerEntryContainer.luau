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
local var1 = if fFlagReplacePlayerIconRoduxWithSignal then playerIconInfoStoreModule.PlayerIconInfoStore else nil
local fFlagPlayerListFixLeaderstatsStacking = sharedFlagsModule.FFlagPlayerListFixLeaderstatsStacking
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook

return reactModule.memo(roactRoduxModule.connect(function(p1)
	return {
		selectedPlayer = p1.playerDropDown.selectedPlayer,
		dropdownOpen = p1.playerDropDown.isVisible,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface
	}
end, function(p1)
	-- upvalues: closePlayerDropDownModule (ref), openPlayerDropDownModule (ref)
	return {
		closeDropdown = function()
			-- upvalues: p1 (ref), closePlayerDropDownModule (copy)
			return p1(closePlayerDropDownModule())
		end,
		openDropdown = function(p2)
			-- upvalues: p1 (ref), openPlayerDropDownModule (copy)
			return p1(openPlayerDropDownModule(p2))
		end
	}
end)(function(p1)
	-- upvalues: useLeaderboardStore (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), var1 (ref), signalsReactModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref), reactModule (ref), playerEntryViewModule (ref), fFlagPlayerListUseFocusNavHook (ref)
	local var2 = useLeaderboardStore()
	local var3 = if fFlagReplacePlayerIconRoduxWithSignal then signalsReactModule.useSignalState(var1.getPlayerIconInfoReactive(p1.player.UserId)) else p1.playerIconInfo
	local gameStatsList = var2.getGameStatsList()
	local playerEntry = var2.getPlayerEntry(p1.player, false)
	
	return if playerEntry then reactModule.createElement(playerEntryViewModule, {
		playerData = playerEntry,
		gameStats = gameStatsList,
		gameStatsCount = if fFlagPlayerListFixLeaderstatsStacking then nil elseif fFlagPlayerListFixLeaderstatsStacking then nil else signalsReactModule.useSignalState(gameStatsList.getCount),
		size = p1.size,
		entrySizeX = p1.entrySizeX,
		layoutOrder = p1.layoutOrder,
		player = p1.player,
		titlePlayerEntry = p1.titlePlayerEntry,
		playerIconInfo = var3,
		playerRelationship = p1.playerRelationship,
		dropdownOpen = p1.dropdownOpen,
		selectedPlayer = p1.selectedPlayer,
		firstPlayerRef = p1.firstPlayerRef,
		openDropdown = p1.openDropdown,
		closeDropdown = p1.closeDropdown,
		setDropDownPlayerDimensionY = p1.setDropDownPlayerDimensionY,
		prevFocusedEntry = p1.prevFocusedEntry,
		destroyedFocusedPlayerId = p1.destroyedFocusedPlayerId,
		registerPlayerInstance = if fFlagPlayerListUseFocusNavHook then p1.registerPlayerInstance else nil,
		unregisterPlayerInstance = if fFlagPlayerListUseFocusNavHook then p1.unregisterPlayerInstance else nil,
		setSelectedPlayerId = if fFlagPlayerListUseFocusNavHook then p1.setSelectedPlayerId else nil,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred
	}) else nil
end))