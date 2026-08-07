local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(false, {
	[require(parent.Actions.MenuClosed).name] = function(_, _) --[[ line: 14 ]]
		return false
	end,
	[require(parent.Actions.MenuOpened).name] = function(_, _) --[[ line: 18 ]]
		return true
	end
})