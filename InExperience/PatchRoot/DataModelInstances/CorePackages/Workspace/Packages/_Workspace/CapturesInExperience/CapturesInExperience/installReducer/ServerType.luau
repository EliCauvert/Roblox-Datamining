local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(require(parent.Enums.ServerType).StandardServer, {
	[require(parent.Actions.ServerTypeDetected).name] = function(_, p1)
		return p1.serverType
	end
})