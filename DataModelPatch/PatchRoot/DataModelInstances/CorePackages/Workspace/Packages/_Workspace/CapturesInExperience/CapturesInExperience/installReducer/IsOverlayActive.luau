local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(false, {
	[require(Parent.Actions.OverlayActivated).name] = function(_, _): boolean
		return true
	end,
	[require(Parent.Actions.OverlayDeactivated).name] = function(_, _): boolean
		return false
	end
})