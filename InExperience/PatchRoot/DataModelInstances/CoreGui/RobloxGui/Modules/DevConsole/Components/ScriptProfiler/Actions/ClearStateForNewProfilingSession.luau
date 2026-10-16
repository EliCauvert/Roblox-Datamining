return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient) --[[ Line: 4 ]]
	return { isClient = IsClient }
end)