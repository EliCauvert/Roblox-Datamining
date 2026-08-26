return function(p1, p2, p3, p4)
	if p1 + p2 == 0 then
		return p3 or "--"
	end
	local rounded = math.round(p1 / (p1 + p2) * 100)
	
	return if p4 then `{rounded}%` else tostring(rounded)
end