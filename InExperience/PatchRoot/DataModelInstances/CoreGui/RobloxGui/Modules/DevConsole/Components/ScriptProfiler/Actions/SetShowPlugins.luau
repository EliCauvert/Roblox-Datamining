return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, ShowPlugins)
	return { isClient = IsClient, showPlugins = ShowPlugins }
end)