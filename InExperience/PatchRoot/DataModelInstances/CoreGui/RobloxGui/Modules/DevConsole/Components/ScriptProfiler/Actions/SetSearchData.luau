return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, State) --[[ Line: 4 ]]
	return { isClient = IsClient, state = State }
end)