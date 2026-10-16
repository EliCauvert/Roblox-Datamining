return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, ShowGC) --[[ Line: 4 ]]
	return { isClient = IsClient, showGC = ShowGC }
end)