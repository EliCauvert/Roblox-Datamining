local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(true, {
	[require(parent.Actions.CapturesCoreGuiDisabled).name] = function(_, _) --[[ line: 14 ]]
		return false
	end,
	[require(parent.Actions.CapturesCoreGuiEnabled).name] = function(_, _) --[[ line: 18 ]]
		return true
	end
})