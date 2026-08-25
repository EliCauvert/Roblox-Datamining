local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(false, {
	[require(parent.Actions.MenuClosed).name] = function(_, _)
		return false
	end,
	[require(parent.Actions.MenuOpened).name] = function(_, _)
		return true
	end
})