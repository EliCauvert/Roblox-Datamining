return require(script.Parent.Parent.Action)(script.Name, function(DumpPath)
	return { dumpPath = DumpPath }
end)