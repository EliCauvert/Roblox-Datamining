return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, IsProfiling)
	return { isClient = IsClient, isProfiling = IsProfiling }
end)