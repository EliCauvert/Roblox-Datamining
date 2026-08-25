local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(true, {
	[require(parent.Actions.CapturesCoreGuiDisabled).name] = function(_, _)
		return false
	end,
	[require(parent.Actions.CapturesCoreGuiEnabled).name] = function(_, _)
		return true
	end
})