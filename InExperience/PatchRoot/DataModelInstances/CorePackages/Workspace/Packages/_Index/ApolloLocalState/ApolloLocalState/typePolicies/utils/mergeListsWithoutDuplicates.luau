local CryoModule = require(script:FindFirstAncestor("ApolloLocalState").Parent.Cryo)

return function(Tbl, p1, p2) --[[ Line: 5 | Named "mergeListsWithoutDuplicates" ]]
	-- upvalues: CryoModule (copy)
	if not p1 or #p1 == 0 then
		return Tbl
	elseif Tbl and #Tbl ~= 0 then
		local Set = CryoModule.List.toSet(CryoModule.List.map(Tbl, function(p3) --[[ Line: 13 ]]
			-- upvalues: p2 (copy)
			return if p2 then p3[p2] else p3
		end))
		
		return CryoModule.List.join(table.clone(Tbl), (CryoModule.List.filter(p1, function(p3): boolean --[[ Line: 18 ]]
			-- upvalues: p2 (copy), Set (copy)
			return not Set[if p2 then p3[p2] else p3]
		end)))
	else
		return p1
	end
end