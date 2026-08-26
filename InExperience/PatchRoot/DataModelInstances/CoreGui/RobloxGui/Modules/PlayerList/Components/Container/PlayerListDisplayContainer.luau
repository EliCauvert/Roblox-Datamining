local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLeaderboardStore = playerListModule.Hooks.useLeaderboardStore
local playerListDisplayViewModule = require(parent.Components.PresentationCommon.PlayerListDisplayView)
local setPlayerListVisibilityModule = require(parent.Actions.SetPlayerListVisibility)
local fFlagAddNewPlayerListFocusNav = playerListModule.Flags.FFlagAddNewPlayerListFocusNav

local function PlayerListDisplayContainer(p1)
	-- upvalues: useLeaderboardStore (ref), signalsReactModule (ref), reactModule (ref), playerListDisplayViewModule (ref)
	local var1 = useLeaderboardStore()
	local teamList = var1.getTeamList()
	
	return if var1 then reactModule.createElement(reactModule.Fragment, nil, reactModule.createElement(playerListDisplayViewModule, {
		teamList = teamList,
		teamListCount = signalsReactModule.useSignalState(teamList.getCount),
		gameStatsCount = signalsReactModule.useSignalState(var1.getGameStatsList().getCount),
		entrySizeX = p1.entrySize,
		screenSizeY = p1.screenSizeY,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship,
		dropDownPlayer = p1.dropDownPlayer,
		dropDownVisible = p1.dropDownVisible,
		dismissPlayerList = p1.dismissPlayerList,
		isVisible = p1.isVisible,
		isMinimized = p1.isMinimized,
		isSmallTouchDevice = p1.isSmallTouchDevice,
		isDirectionalPreferred = p1.isDirectionalPreferred,
		isUsingGamepad = p1.isUsingGamepad
	})) else nil
end

return reactModule.memo(roactRoduxModule.connect(function(p1)
	-- upvalues: fFlagAddNewPlayerListFocusNav (ref)
	return {
		isVisible = if fFlagAddNewPlayerListFocusNav then nil else p1.displayOptions.isVisible,
		isMinimized = p1.displayOptions.isMinimized,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface,
		isUsingGamepad = p1.displayOptions.isUsingGamepad,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship,
		dropDownPlayer = p1.playerDropDown.selectedPlayer,
		dropDownVisible = p1.playerDropDown.isVisible
	}
end, function(p1)
	-- upvalues: setPlayerListVisibilityModule (ref)
	return {
		dismissPlayerList = function()
			-- upvalues: p1 (ref), setPlayerListVisibilityModule (copy)
			return p1(setPlayerListVisibilityModule(false))
		end
	}
end)(function(p1)
	-- upvalues: useLeaderboardStore (ref), PlayerListDisplayContainer (ref)
	return if useLeaderboardStore() then PlayerListDisplayContainer(p1) else nil
end))