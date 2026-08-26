return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(p1)
	return { isClient = p1 }
end)