return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, Average) --[[ Line: 4 ]]
	return { isClient = IsClient, average = Average }
end)