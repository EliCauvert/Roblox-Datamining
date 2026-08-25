local fmtArgsModule = require(script.Parent.fmtArgs)

return function(p0, p1)
	-- upvalues: fmtArgsModule (ref)
	if p0.n ~= p1.n then
		return false, "number of args in " .. fmtArgsModule(p1) .. " does not match number of predicates"
	end
	for i = 1, p1.n do
		if p0[i](p1[i]) then
			continue
		end
		return false, fmtArgsModule(p1) .. " does not match predicates at position " .. i
	end
	return true
end