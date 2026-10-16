return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, IsFunctionsView) --[[ Line: 4 ]]
	return { isClient = IsClient, isFunctionsView = IsFunctionsView }
end)