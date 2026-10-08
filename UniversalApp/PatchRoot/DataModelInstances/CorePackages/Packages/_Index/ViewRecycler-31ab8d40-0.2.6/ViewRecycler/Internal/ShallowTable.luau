local t = {
	cloneFrozen = function(p1)
		return table.freeze(table.clone(p1))
	end,
	containsEqual = function(p1, p2, p3)
		for i, v in p3 do
			if p1[v] ~= p2[v] then
				return false
			end
		end
		return true
	end
}

function t.optionalContainsEqual(p4, p5, p6)
	-- upvalues: t (ref)
	return if p4 ~= p5 then p4 ~= nil and (p5 ~= nil and t.containsEqual(p4, p5, p6)) else true
end

function t.equal(p4, p5)
	if p4 == p5 then
		return true
	end
	for i, v in p4 do
		if p5[i] ~= v then
			return false
		end
	end
	for i, v in p5 do
		if p4[i] ~= v then
			return false
		end
	end
	return true
end

return table.freeze(t)