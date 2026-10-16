local FmtArgsModule = require(script.Parent.fmtArgs)

return function(p1, p2) --[[ Line: 4 ]]
	-- upvalues: FmtArgsModule (copy)
	if p1.n ~= p2.n then
		return false, "number of literals in " .. FmtArgsModule(p1) .. " does not match number of args in " .. FmtArgsModule(p2)
	end
	for i = 1, p1.n do
		if p1[i] ~= p2[i] then
			return false, "expected " .. FmtArgsModule(p1) .. ", got " .. FmtArgsModule(p2)
		end
	end
	return true
end