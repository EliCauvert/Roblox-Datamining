return require(script.Parent.Parent.Action)(script.Name, function(RootNode, RootFunc, RootNodeName)
	return {
		rootNode = RootNode,
		rootFunc = RootFunc,
		rootNodeName = RootNodeName
	}
end)