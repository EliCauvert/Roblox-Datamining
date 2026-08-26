return require(script.Parent.Parent.Action)("ServerLogUpdateSearchFilter", function(p1, p2)
	return { searchTerm = p1, filterTypes = p2 }
end)