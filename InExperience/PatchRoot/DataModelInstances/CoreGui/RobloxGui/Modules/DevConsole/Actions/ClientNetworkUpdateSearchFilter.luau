return require(script.Parent.Parent.Action)("ClientNetworkUpdateSearchFilter", function(p1, p2)
	return { searchTerm = p1, filterTypes = p2 }
end)