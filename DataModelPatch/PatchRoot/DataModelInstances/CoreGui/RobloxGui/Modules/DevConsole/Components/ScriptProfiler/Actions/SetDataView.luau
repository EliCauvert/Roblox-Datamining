return require(script.Parent.Parent.Parent.Parent.Action)("ScriptProfiler" .. script.Name, function(IsClient, IsFunctionsView)
	return { isClient = IsClient, isFunctionsView = IsFunctionsView }
end)