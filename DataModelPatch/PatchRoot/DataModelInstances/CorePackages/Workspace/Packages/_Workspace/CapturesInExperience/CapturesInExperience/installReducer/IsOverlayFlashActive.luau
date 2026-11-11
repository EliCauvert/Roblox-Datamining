local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(false, {
	[require(Parent.Actions.OverlayFlashActivated).name] = function(_, _): boolean
		return true
	end,
	[require(Parent.Actions.OverlayFlashDeactivated).name] = function(_, _): boolean
		return false
	end
})