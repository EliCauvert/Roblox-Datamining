local fmtArgsModule = require(script.Parent.fmtArgs)

return function(p1, p2)
	-- upvalues: fmtArgsModule (ref)
	if p1.n ~= p2.n then
		return false, "number of literals in " .. fmtArgsModule(p1) .. " does not match number of args in " .. fmtArgsModule(p2)
	end
	for i = 1, p1.n do
		if p1[i] == p2[i] then
			continue
		end
		return false, "expected " .. fmtArgsModule(p1) .. ", got " .. fmtArgsModule(p2)
	end
	return true
end