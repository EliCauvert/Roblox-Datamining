local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local PlayerIconInfoStoreModule = require(CorePackages.Workspace.Packages.PlayerIconInfoStore)
local UseLeaderboardStoreFunction = PlayerListModule.Hooks.useLeaderboardStore
local PlayerEntryViewModule = require(Parent.Components.PresentationCommon.PlayerEntryView)
local ClosePlayerDropDownModule = require(Parent.Actions.ClosePlayerDropDown)
local OpenPlayerDropDownModule = require(Parent.Actions.OpenPlayerDropDown)
local FFlagReplacePlayerIconRoduxWithSignal = SharedFlagsModule.FFlagReplacePlayerIconRoduxWithSignal
local PlayerIconInfoStore = if FFlagReplacePlayerIconRoduxWithSignal then PlayerIconInfoStoreModule.PlayerIconInfoStore else nil
local FFlagPlayerListFixLeaderstatsStacking = SharedFlagsModule.FFlagPlayerListFixLeaderstatsStacking
local FFlagPlayerListUseFocusNavHook = PlayerListModule.Flags.FFlagPlayerListUseFocusNavHook

return ReactModule.memo(require(CorePackages.Packages.RoactRodux).connect(function(p1)
	return {
		selectedPlayer = p1.playerDropDown.selectedPlayer,
		dropdownOpen = p1.playerDropDown.isVisible,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface
	}
end, function(Callback)
	-- upvalues: ClosePlayerDropDownModule (copy), OpenPlayerDropDownModule (copy)
	return {
		closeDropdown = function()
			-- upvalues: Callback (copy), ClosePlayerDropDownModule (upval)
			return Callback(ClosePlayerDropDownModule())
		end,
		openDropdown = function(p1)
			-- upvalues: Callback (copy), OpenPlayerDropDownModule (upval)
			return Callback(OpenPlayerDropDownModule(p1))
		end
	}
end)(function(p1)
	-- upvalues: UseLeaderboardStoreFunction (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), SignalsReactModule (copy), FFlagPlayerListFixLeaderstatsStacking (copy), ReactModule (copy), PlayerEntryViewModule (copy), FFlagPlayerListUseFocusNavHook (copy)
	local UseLeaderboardStoreResult = UseLeaderboardStoreFunction()
	local UseSignalStateResult = if FFlagReplacePlayerIconRoduxWithSignal then SignalsReactModule.useSignalState((PlayerIconInfoStore.getPlayerIconInfoReactive(p1.player.UserId))) else p1.playerIconInfo
	local GameStatsList = UseLeaderboardStoreResult.getGameStatsList()
	local PlayerEntry = UseLeaderboardStoreResult.getPlayerEntry(p1.player, false)
	local UseSignalStateResult1 = if FFlagPlayerListFixLeaderstatsStacking then nil else SignalsReactModule.useSignalState(GameStatsList.getCount)
	
	return if PlayerEntry then ReactModule.createElement(PlayerEntryViewModule, {
		playerData = PlayerEntry,
		gameStats = GameStatsList,
		gameStatsCount = if FFlagPlayerListFixLeaderstatsStacking then nil else UseSignalStateResult1,
		size = p1.size,
		entrySizeX = p1.entrySizeX,
		layoutOrder = p1.layoutOrder,
		player = p1.player,
		titlePlayerEntry = p1.titlePlayerEntry,
		playerIconInfo = UseSignalStateResult,
		playerRelationship = p1.playerRelationship,
		dropdownOpen = p1.dropdownOpen,
		selectedPlayer = p1.selectedPlayer,
		firstPlayerRef = p1.firstPlayerRef,
		openDropdown = p1.openDropdown,
		closeDropdown = p1.closeDropdown,
		setDropDownPlayerDimensionY = p1.setDropDownPlayerDimensionY,
		prevFocusedEntry = p1.prevFocusedEntry,
		destroyedFocusedPlayerId = p1.destroyedFocusedPlayerId,
		registerPlayerInstance = if FFlagPlayerListUseFocusNavHook then p1.registerPlayerInstance else nil,
		unregisterPlayerInstance = if FFlagPlayerListUseFocusNavHook then p1.unregisterPlayerInstance else nil,
		setSelectedPlayerId = if FFlagPlayerListUseFocusNavHook then p1.setSelectedPlayerId else nil,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred
	}) else nil
end))