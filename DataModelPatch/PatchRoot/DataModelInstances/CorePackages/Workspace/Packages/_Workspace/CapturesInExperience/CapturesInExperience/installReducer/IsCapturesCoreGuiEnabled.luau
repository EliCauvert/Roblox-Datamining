local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(true, {
	[require(Parent.Actions.CapturesCoreGuiDisabled).name] = function(_, _): boolean
		return false
	end,
	[require(Parent.Actions.CapturesCoreGuiEnabled).name] = function(_, _): boolean
		return true
	end
})