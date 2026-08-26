local fmtArgsModule = require(script.Parent.fmtArgs)

return function(p1, p2)
	-- upvalues: fmtArgsModule (ref)
	if p1.n ~= p2.n then
		return false, "number of args in " .. fmtArgsModule(p2) .. " does not match number of predicates"
	end
	for i = 1, p2.n do
		if p1[i](p2[i]) then
			continue
		end
		return false, fmtArgsModule(p2) .. " does not match predicates at position " .. i
	end
	return true
end