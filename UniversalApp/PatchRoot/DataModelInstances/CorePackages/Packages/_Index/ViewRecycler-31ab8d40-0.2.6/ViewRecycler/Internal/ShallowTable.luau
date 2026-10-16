local config = {
	cloneFrozen = function(Tbl) --[[ Line: 3 ]]
		return (table.freeze(table.clone(Tbl)))
	end,
	containsEqual = function(p1, p2, List): boolean --[[ Line: 7 ]]
		for _, value in List do
			if p1[value] ~= p2[value] then
				return false
			end
		end
		return true
	end
}

function config.optionalContainsEqual(p3, p4, p5) --[[ Line: 18 ]]
	-- upvalues: config (copy)
	return p3 == p4 or p3 ~= nil and (p4 ~= nil and config.containsEqual(p3, p4, p5))
end

function config.equal(List, List1): boolean --[[ Line: 22 ]]
	if List == List1 then
		return true
	end
	for i, value in List do
		if List1[i] ~= value then
			return false
		end
	end
	for i1, value1 in List1 do
		if List[i1] ~= value1 then
			return false
		end
	end
	return true
end

return table.freeze(config)