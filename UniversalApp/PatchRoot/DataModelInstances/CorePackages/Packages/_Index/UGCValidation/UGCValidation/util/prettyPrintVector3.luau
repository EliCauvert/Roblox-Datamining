local t = {}

return function(p1, p2)
	-- upvalues: t (ref)
	p2 = p2 or 2
	
	if not t[p2] then
		local formattedText = string.format("%%.%df", p2)
		t[p2] = string.format("%s, %s, %s", formattedText, formattedText, formattedText)
	end
	return string.format(t[p2], p1.X, p1.Y, p1.Z)
end