local Object = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object

return function(p1, p2) --[[ Line: 6 | Named "addMockResolvers" ]]
	-- upvalues: Object (copy)
	local AssignResult = Object.assign({}, p1, p2)
	Object.assign(AssignResult, {
		Query = Object.assign({}, p1.Query or {}, p2.Query or {}),
		Mutation = Object.assign({}, p1.Mutation or {}, p2.Mutation or {})
	})
	
	return AssignResult
end