local Array = require(script:FindFirstAncestor("ApolloLocalState").Parent.LuauPolyfill).Array

return function(_, p1, p2)
	-- upvalues: Array (copy)
	local Tbl = p1 or {}
	local P2 = p2 or {}
	
	return if #P2 == 0 then Tbl elseif #Tbl == 0 then P2 else Array.concat(table.clone(Tbl), P2)
end