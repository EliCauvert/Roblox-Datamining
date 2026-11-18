local _ = require(script:FindFirstAncestor("RecycledInlineLayout").Types)

return function(p1)
	return table.freeze({
		type = "DecorationDefinition",
		name = p1.name,
		view = p1.view
	})
end