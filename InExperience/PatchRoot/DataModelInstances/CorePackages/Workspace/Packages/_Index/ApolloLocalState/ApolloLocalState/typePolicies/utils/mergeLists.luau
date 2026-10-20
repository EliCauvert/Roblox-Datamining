local Array = require(script:FindFirstAncestor("ApolloLocalState").Parent.LuauPolyfill).Array

return function(p1, p2)
	-- upvalues: Array (copy)
	local Tbl = p1 or {}
	local P1 = p2 or {}
	
	return if #P1 == 0 then Tbl elseif #Tbl == 0 then P1 else Array.concat(table.clone(Tbl), P1)
end