return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(ServerType)
	return { serverType = ServerType }
end)