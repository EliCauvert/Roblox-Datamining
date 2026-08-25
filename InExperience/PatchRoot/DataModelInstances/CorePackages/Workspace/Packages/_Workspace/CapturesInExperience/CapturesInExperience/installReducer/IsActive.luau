local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(false, {
	[require(parent.Actions.CapturesActivated).name] = function(_, _)
		return true
	end,
	[require(parent.Actions.CapturesDeactivated).name] = function(_, _)
		return false
	end
})