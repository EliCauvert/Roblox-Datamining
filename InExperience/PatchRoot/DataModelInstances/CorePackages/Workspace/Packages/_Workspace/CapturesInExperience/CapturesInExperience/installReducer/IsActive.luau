local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(false, {
	[require(Parent.Actions.CapturesActivated).name] = function(_, _): boolean --[[ Line: 14 ]]
		return true
	end,
	[require(Parent.Actions.CapturesDeactivated).name] = function(_, _): boolean --[[ Line: 18 ]]
		return false
	end
})