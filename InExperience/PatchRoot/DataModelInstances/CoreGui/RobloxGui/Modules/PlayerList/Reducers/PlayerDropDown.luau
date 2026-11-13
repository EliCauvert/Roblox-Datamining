local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local Actions = script.Parent.Parent.Actions
local OpenPlayerDropDownModule = require(Actions.OpenPlayerDropDown)
local ClosePlayerDropDownModule = require(Actions.ClosePlayerDropDown)
local RemovePlayerModule = require(Actions.RemovePlayer)
local SetPlayerListVisibilityModule = require(Actions.SetPlayerListVisibility)
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav

return (RoduxModule.createReducer({ isVisible = false, selectedPlayer = nil }, {
	[SetPlayerListVisibilityModule.name] = function(p1, p2)
		-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy)
		return if p2.isVisible then p1 else {
			isVisible = false,
			selectedPlayer = if FFlagAddNewPlayerListMobileFocusNav then nil else p1.selectedPlayer
		}
	end,
	[OpenPlayerDropDownModule.name] = function(_, p1)
		return { isVisible = true, selectedPlayer = p1.selectedPlayer }
	end,
	[ClosePlayerDropDownModule.name] = function(p1, _)
		return { isVisible = false, selectedPlayer = p1.selectedPlayer }
	end,
	[RemovePlayerModule.name] = function(p1, p2)
		return if p2.player == p1.selectedPlayer then { isVisible = false, selectedPlayer = nil } else p1
	end
}))