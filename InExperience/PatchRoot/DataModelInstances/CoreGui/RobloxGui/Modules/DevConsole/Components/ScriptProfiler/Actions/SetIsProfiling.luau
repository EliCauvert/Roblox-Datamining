return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, IsProfiling) --[[ Line: 4 ]]
	return { isClient = IsClient, isProfiling = IsProfiling }
end)