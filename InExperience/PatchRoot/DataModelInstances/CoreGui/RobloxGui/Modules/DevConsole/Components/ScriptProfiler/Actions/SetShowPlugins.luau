return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, ShowPlugins) --[[ Line: 4 ]]
	return { isClient = IsClient, showPlugins = ShowPlugins }
end)