local t = {}

return function(Vector, p1): string --[[ Line: 7 | Named "prettyPrintVector3" ]]
	-- upvalues: t (copy)
	local P1 = p1 or 2
	
	if not t[P1] then
		local Formatted = string.format("%%.%df", P1)
		t[P1] = string.format("%s, %s, %s", Formatted, Formatted, Formatted)
	end
	return string.format(t[P1], Vector.X, Vector.Y, Vector.Z)
end