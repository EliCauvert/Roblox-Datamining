return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, Frequency)
	return { isClient = IsClient, frequency = Frequency }
end)