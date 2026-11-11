return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, State)
	return { isClient = IsClient, state = State }
end)