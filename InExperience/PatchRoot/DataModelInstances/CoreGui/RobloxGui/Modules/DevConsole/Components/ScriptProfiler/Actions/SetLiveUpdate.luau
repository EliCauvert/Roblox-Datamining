return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(p1, p2)
	return { isClient = p1, liveUpdate = p2 }
end)