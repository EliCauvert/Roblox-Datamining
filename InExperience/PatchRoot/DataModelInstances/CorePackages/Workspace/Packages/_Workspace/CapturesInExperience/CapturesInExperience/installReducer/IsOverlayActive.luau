local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(false, {
	[require(parent.Actions.OverlayActivated).name] = function(_, _) --[[ line: 14 ]]
		return true
	end,
	[require(parent.Actions.OverlayDeactivated).name] = function(_, _) --[[ line: 18 ]]
		return false
	end
})