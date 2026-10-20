return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, Average)
	return { isClient = IsClient, average = Average }
end)