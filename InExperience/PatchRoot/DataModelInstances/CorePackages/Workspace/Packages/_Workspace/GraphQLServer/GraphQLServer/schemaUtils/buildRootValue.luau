local Object = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object

return function(p1) --[[ Line: 6 | Named "buildRootValue" ]]
	-- upvalues: Object (copy)
	return (Object.assign({}, p1.Query or {}, p1.Mutation or {}))
end