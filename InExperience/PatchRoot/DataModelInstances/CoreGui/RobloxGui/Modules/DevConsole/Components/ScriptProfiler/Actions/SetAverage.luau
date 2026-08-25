return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(p0, p1)
	return { isClient = p0, average = p1 }
end)