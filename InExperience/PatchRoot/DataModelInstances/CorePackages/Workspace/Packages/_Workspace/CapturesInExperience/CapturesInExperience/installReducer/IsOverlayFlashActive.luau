local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(false, {
	[require(Parent.Actions.OverlayFlashActivated).name] = function(_, _): boolean --[[ Line: 14 ]]
		return true
	end,
	[require(Parent.Actions.OverlayFlashDeactivated).name] = function(_, _): boolean --[[ Line: 18 ]]
		return false
	end
})