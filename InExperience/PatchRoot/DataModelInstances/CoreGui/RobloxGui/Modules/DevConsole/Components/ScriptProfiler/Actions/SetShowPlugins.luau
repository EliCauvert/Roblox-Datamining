return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(p1, p2)
	return { isClient = p1, showPlugins = p2 }
end)