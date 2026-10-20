local FmtArgsModule = require(script.Parent.fmtArgs)

return function(p1, p2)
	-- upvalues: FmtArgsModule (copy)
	if p1.n ~= p2.n then
		return false, "number of args in " .. FmtArgsModule(p2) .. " does not match number of predicates"
	end
	for i = 1, p2.n do
		if not p1[i](p2[i]) then
			return false, FmtArgsModule(p2) .. " does not match predicates at position " .. i
		end
	end
	return true
end