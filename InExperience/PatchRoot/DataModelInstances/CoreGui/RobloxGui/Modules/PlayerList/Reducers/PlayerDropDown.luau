local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local actions = script.Parent.Parent.Actions
local fFlagAddNewPlayerListMobileFocusNav = require(corePackagesService.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav

return roduxModule.createReducer({ isVisible = false, selectedPlayer = nil }, {
	[require(actions.SetPlayerListVisibility).name] = function(p1, p2)
		-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref)
		return if p2.isVisible then p1 else {
			isVisible = false,
			selectedPlayer = if fFlagAddNewPlayerListMobileFocusNav then nil else p1.selectedPlayer
		}
	end,
	[require(actions.OpenPlayerDropDown).name] = function(_, p1)
		return { isVisible = true, selectedPlayer = p1.selectedPlayer }
	end,
	[require(actions.ClosePlayerDropDown).name] = function(p1, _)
		return { isVisible = false, selectedPlayer = p1.selectedPlayer }
	end,
	[require(actions.RemovePlayer).name] = function(p1, p2)
		return if p2.player == p1.selectedPlayer then { isVisible = false, selectedPlayer = nil } else p1
	end
})