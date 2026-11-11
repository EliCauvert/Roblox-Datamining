return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, ShowGC)
	return { isClient = IsClient, showGC = ShowGC }
end)