return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, Frequency) --[[ Line: 4 ]]
	return { isClient = IsClient, frequency = Frequency }
end)