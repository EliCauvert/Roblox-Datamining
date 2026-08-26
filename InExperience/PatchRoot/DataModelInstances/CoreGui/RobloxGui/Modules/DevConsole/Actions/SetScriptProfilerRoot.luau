return require(script.Parent.Parent.Action)(script.Name, function(p1, p2, p3)
	return { rootNode = p1, rootFunc = p2, rootNodeName = p3 }
end)