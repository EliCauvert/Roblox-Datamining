local t = {
	cloneFrozen = function(p0)
		return table.freeze(table.clone(p0))
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

function t.equal(p7, p8)
	if p7 == p8 then
		return true
	end
	for i, v in p7 do
		if p8[i] ~= v then
			return false
		end
	end
	for i, v in p8 do
		if p7[i] ~= v then
			return false
		end
	end
	return true
end

return table.freeze(t)