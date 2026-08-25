local object = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object

return function(p0)
	-- upvalues: object (ref)
	return object.assign({}, p0.Query or {}, p0.Mutation or {})
end