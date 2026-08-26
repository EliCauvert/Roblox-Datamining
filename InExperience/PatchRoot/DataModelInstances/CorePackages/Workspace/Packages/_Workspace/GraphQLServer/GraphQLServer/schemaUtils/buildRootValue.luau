local object = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object

return function(p1)
	-- upvalues: object (ref)
	return object.assign({}, p1.Query or {}, p1.Mutation or {})
end