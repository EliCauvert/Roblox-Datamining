local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(true, {
	[require(Parent.Actions.CapturesCoreGuiDisabled).name] = function(_, _): boolean --[[ Line: 14 ]]
		return false
	end,
	[require(Parent.Actions.CapturesCoreGuiEnabled).name] = function(_, _): boolean --[[ Line: 18 ]]
		return true
	end
})