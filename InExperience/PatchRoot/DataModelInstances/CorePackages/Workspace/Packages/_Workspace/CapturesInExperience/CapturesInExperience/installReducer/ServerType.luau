local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(require(parent.Enums.ServerType).StandardServer, {
	[require(parent.Actions.ServerTypeDetected).name] = function(_, p0) --[[ line: 15 ]]
		return p0.serverType
	end
})