local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(false, {
	[require(Parent.Actions.OverlayActivated).name] = function(_, _): boolean --[[ Line: 14 ]]
		return true
	end,
	[require(Parent.Actions.OverlayDeactivated).name] = function(_, _): boolean --[[ Line: 18 ]]
		return false
	end
})