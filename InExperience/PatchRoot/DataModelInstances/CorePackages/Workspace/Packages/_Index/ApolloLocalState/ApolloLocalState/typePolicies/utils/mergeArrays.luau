local array = require(script:FindFirstAncestor("ApolloLocalState").Parent.LuauPolyfill).Array

return function(_, p0, p1)
	-- upvalues: array (ref)
	p0 = p0 or {}
	p1 = p1 or {}
	
	return if #p1 == 0 then p0 elseif #p0 == 0 then p1 else array.concat(table.clone(p0), p1)
end