local object = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object

return function(p1, p2)
	-- upvalues: object (ref)
	local var1 = object.assign({}, p1, p2)
	object.assign(var1, {
		Query = object.assign({}, p1.Query or {}, p2.Query or {}),
		Mutation = object.assign({}, p1.Mutation or {}, p2.Mutation or {})
	})
	
	return var1
end