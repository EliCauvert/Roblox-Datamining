local array = require(script:FindFirstAncestor("ApolloLocalState").Parent.LuauPolyfill).Array

return function(p1, p2)
	-- upvalues: array (ref)
	p1 = p1 or {}
	p2 = p2 or {}
	
	return if #p2 == 0 then p1 elseif #p1 == 0 then p2 else array.concat(table.clone(p1), p2)
end