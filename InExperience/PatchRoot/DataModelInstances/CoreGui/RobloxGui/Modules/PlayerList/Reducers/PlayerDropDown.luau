local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local actions = script.Parent.Parent.Actions
local fFlagAddNewPlayerListMobileFocusNav = require(corePackagesService.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav

return roduxModule.createReducer({ isVisible = false, selectedPlayer = nil }, {
	[require(actions.SetPlayerListVisibility).name] = function(p0, p1) --[[ line: 21 ]]
		-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref)
		return if p1.isVisible then p0 else {
			isVisible = false,
			selectedPlayer = if fFlagAddNewPlayerListMobileFocusNav then nil else p0.selectedPlayer
		}
	end,
	[require(actions.OpenPlayerDropDown).name] = function(_, p2) --[[ line: 31 ]]
		return { isVisible = true, selectedPlayer = p2.selectedPlayer }
	end,
	[require(actions.ClosePlayerDropDown).name] = function(p3, _) --[[ line: 38 ]]
		return { isVisible = false, selectedPlayer = p3.selectedPlayer }
	end,
	[require(actions.RemovePlayer).name] = function(p4, p5) --[[ line: 45 ]]
		return if p5.player == p4.selectedPlayer then { isVisible = false, selectedPlayer = nil } else p4
	end
})