local object = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object

return function(p0, p1)
	-- upvalues: object (ref)
	local var0 = object.assign({}, p0, p1)
	object.assign(var0, {
		Query = object.assign({}, p0.Query or {}, p1.Query or {}),
		Mutation = object.assign({}, p0.Mutation or {}, p1.Mutation or {})
	})
	
	return var0
end