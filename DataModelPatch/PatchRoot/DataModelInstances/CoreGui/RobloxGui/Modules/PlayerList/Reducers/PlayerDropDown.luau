local CorePackages = game:GetService("CorePackages")
local Actions = script.Parent.Parent.Actions
local FFlagAddNewPlayerListMobileFocusNav = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav

return (require(CorePackages.Packages.Rodux).createReducer({ isVisible = false, selectedPlayer = nil }, {
	[require(Actions.SetPlayerListVisibility).name] = function(p1, p2)
		-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy)
		return if p2.isVisible then p1 else {
			isVisible = false,
			selectedPlayer = if FFlagAddNewPlayerListMobileFocusNav then nil else p1.selectedPlayer
		}
	end,
	[require(Actions.OpenPlayerDropDown).name] = function(_, p1)
		return { isVisible = true, selectedPlayer = p1.selectedPlayer }
	end,
	[require(Actions.ClosePlayerDropDown).name] = function(p1, _)
		return { isVisible = false, selectedPlayer = p1.selectedPlayer }
	end,
	[require(Actions.RemovePlayer).name] = function(p1, p2)
		return if p2.player == p1.selectedPlayer then { isVisible = false, selectedPlayer = nil } else p1
	end
}))