local t = {}

return function(p0, p1) --[[ line: 7 | named "prettyPrintVector3" ]]
	-- upvalues: t (ref)
	p1 = p1 or 2
	
	if not t[p1] then
		local formattedText = string.format("%%.%df", p1)
		t[p1] = string.format("%s, %s, %s", formattedText, formattedText, formattedText)
	end
	return string.format(t[p1], p0.X, p0.Y, p0.Z)
end