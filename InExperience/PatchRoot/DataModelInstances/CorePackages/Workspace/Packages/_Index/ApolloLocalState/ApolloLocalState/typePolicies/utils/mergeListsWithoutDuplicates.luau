local cryoModule = require(script:FindFirstAncestor("ApolloLocalState").Parent.Cryo)

return function(p0, p1, p2)
	-- upvalues: cryoModule (ref)
	if not p1 or #p1 == 0 then
		return p0
	elseif p0 and #p0 ~= 0 then
		local var1 = cryoModule.List.toSet(cryoModule.List.map(p0, function(p3)
			-- upvalues: p2 (ref)
			return if p2 then p3[p2] else p3
		end))
		
		return cryoModule.List.join(table.clone(p0), cryoModule.List.filter(p1, function(p4)
			-- upvalues: p2 (ref), var1 (ref)
			return not var1[if p2 then p4[p2] else p4]
		end))
	end
	return p1
end