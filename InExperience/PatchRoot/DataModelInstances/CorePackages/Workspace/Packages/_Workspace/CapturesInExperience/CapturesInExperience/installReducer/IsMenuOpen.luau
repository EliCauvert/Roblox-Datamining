local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(false, {
	[require(Parent.Actions.MenuClosed).name] = function(_, _): boolean --[[ Line: 14 ]]
		return false
	end,
	[require(Parent.Actions.MenuOpened).name] = function(_, _): boolean --[[ Line: 18 ]]
		return true
	end
})