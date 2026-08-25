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

local function PlayerListDisplayContainer(p0)
	-- upvalues: useLeaderboardStore (ref), signalsReactModule (ref), reactModule (ref), playerListDisplayViewModule (ref)
	local var8 = useLeaderboardStore()
	local teamList = var8.getTeamList()
	
	return if var8 then reactModule.createElement(reactModule.Fragment, nil, reactModule.createElement(playerListDisplayViewModule, {
		teamList = teamList,
		teamListCount = signalsReactModule.useSignalState(teamList.getCount),
		gameStatsCount = signalsReactModule.useSignalState(var8.getGameStatsList().getCount),
		entrySizeX = p0.entrySize,
		screenSizeY = p0.screenSizeY,
		playerIconInfo = p0.playerIconInfo,
		playerRelationship = p0.playerRelationship,
		dropDownPlayer = p0.dropDownPlayer,
		dropDownVisible = p0.dropDownVisible,
		dismissPlayerList = p0.dismissPlayerList,
		isVisible = p0.isVisible,
		isMinimized = p0.isMinimized,
		isSmallTouchDevice = p0.isSmallTouchDevice,
		isDirectionalPreferred = p0.isDirectionalPreferred,
		isUsingGamepad = p0.isUsingGamepad
	})) else nil
end

return reactModule.memo(roactRoduxModule.connect(function(p2)
	-- upvalues: fFlagAddNewPlayerListFocusNav (ref)
	return {
		isVisible = if fFlagAddNewPlayerListFocusNav then nil else p2.displayOptions.isVisible,
		isMinimized = p2.displayOptions.isMinimized,
		isDirectionalPreferred = p2.displayOptions.isTenFootInterface,
		isUsingGamepad = p2.displayOptions.isUsingGamepad,
		isSmallTouchDevice = p2.displayOptions.isSmallTouchDevice,
		playerIconInfo = p2.playerIconInfo,
		playerRelationship = p2.playerRelationship,
		dropDownPlayer = p2.playerDropDown.selectedPlayer,
		dropDownVisible = p2.playerDropDown.isVisible
	}
end, function(p3)
	-- upvalues: setPlayerListVisibilityModule (ref)
	return {
		dismissPlayerList = function()
			-- upvalues: p3 (ref), setPlayerListVisibilityModule (copy)
			return p3(setPlayerListVisibilityModule(false))
		end
	}
end)(function(p1)
	-- upvalues: useLeaderboardStore (ref), PlayerListDisplayContainer (ref)
	return if useLeaderboardStore() then PlayerListDisplayContainer(p1) else nil
end))