return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, LiveUpdate)
	return { isClient = IsClient, liveUpdate = LiveUpdate }
end)