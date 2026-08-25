local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(false, {
	[require(parent.Actions.OverlayFlashActivated).name] = function(_, _)
		return true
	end,
	[require(parent.Actions.OverlayFlashDeactivated).name] = function(_, _)
		return false
	end
})