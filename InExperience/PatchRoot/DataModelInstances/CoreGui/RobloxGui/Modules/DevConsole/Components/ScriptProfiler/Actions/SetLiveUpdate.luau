return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, LiveUpdate) --[[ Line: 4 ]]
	return { isClient = IsClient, liveUpdate = LiveUpdate }
end)