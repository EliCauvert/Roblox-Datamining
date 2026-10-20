local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local UseLeaderboardStoreFunction = PlayerListModule.Hooks.useLeaderboardStore
local PlayerListDisplayViewModule = require(Parent.Components.PresentationCommon.PlayerListDisplayView)
local SetPlayerListVisibilityModule = require(Parent.Actions.SetPlayerListVisibility)
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav

local function PlayerListDisplayContainer(p1)
	-- upvalues: UseLeaderboardStoreFunction (copy), SignalsReactModule (copy), ReactModule (copy), PlayerListDisplayViewModule (copy)
	local UseLeaderboardStoreResult = UseLeaderboardStoreFunction()
	local TeamList = UseLeaderboardStoreResult.getTeamList()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseLeaderboardStoreResult.getGameStatsList().getCount)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(TeamList.getCount)
	
	return if UseLeaderboardStoreResult then ReactModule.createElement(ReactModule.Fragment, nil, ReactModule.createElement(PlayerListDisplayViewModule, {
		teamList = TeamList,
		teamListCount = UseSignalStateResult1,
		gameStatsCount = UseSignalStateResult,
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

return ReactModule.memo(require(CorePackages.Packages.RoactRodux).connect(function(p1)
	-- upvalues: FFlagAddNewPlayerListFocusNav (copy)
	return {
		isVisible = if FFlagAddNewPlayerListFocusNav then nil else p1.displayOptions.isVisible,
		isMinimized = p1.displayOptions.isMinimized,
		isDirectionalPreferred = p1.displayOptions.isTenFootInterface,
		isUsingGamepad = p1.displayOptions.isUsingGamepad,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		playerIconInfo = p1.playerIconInfo,
		playerRelationship = p1.playerRelationship,
		dropDownPlayer = p1.playerDropDown.selectedPlayer,
		dropDownVisible = p1.playerDropDown.isVisible
	}
end, function(Callback)
	-- upvalues: SetPlayerListVisibilityModule (copy)
	return {
		dismissPlayerList = function()
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(false))
		end
	}
end)(function(p1)
	-- upvalues: UseLeaderboardStoreFunction (copy), PlayerListDisplayContainer (copy)
	return if UseLeaderboardStoreFunction() then PlayerListDisplayContainer(p1) else nil
end))