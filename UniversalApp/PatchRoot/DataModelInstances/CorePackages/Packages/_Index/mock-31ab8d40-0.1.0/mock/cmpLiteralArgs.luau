local fmtArgsModule = require(script.Parent.fmtArgs)

return function(p0, p1)
	-- upvalues: fmtArgsModule (ref)
	if p0.n ~= p1.n then
		return false, "number of literals in " .. fmtArgsModule(p0) .. " does not match number of args in " .. fmtArgsModule(p1)
	end
	for i = 1, p0.n do
		if p0[i] == p1[i] then
			continue
		end
		return false, "expected " .. fmtArgsModule(p0) .. ", got " .. fmtArgsModule(p1)
	end
	return true
end