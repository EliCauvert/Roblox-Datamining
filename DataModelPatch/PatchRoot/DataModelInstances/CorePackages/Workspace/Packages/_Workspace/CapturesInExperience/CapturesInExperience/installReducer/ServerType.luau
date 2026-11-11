local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(require(Parent.Enums.ServerType).StandardServer, {
	[require(Parent.Actions.ServerTypeDetected).name] = function(_, p1)
		return p1.serverType
	end
})