local cryoModule = require(script:FindFirstAncestor("ApolloLocalState").Parent.Cryo)

return function(p1, p2, p3)
	-- upvalues: cryoModule (ref)
	if not p2 or #p2 == 0 then
		return p1
	elseif p1 and #p1 ~= 0 then
		local var1 = cryoModule.List.toSet(cryoModule.List.map(p1, function(p4)
			-- upvalues: p3 (ref)
			return if p3 then p4[p3] else p4
		end))
		
		return cryoModule.List.join(table.clone(p1), cryoModule.List.filter(p2, function(p4)
			-- upvalues: p3 (ref), var1 (ref)
			return not var1[if p3 then p4[p3] else p4]
		end))
	end
	return p2
end