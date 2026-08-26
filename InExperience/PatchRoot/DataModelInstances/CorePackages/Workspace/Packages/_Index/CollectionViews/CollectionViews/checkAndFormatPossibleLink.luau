return function(p1, p2, p3, p4, p5)
	if p1 == nil or p1 == "" or typeof(p1) ~= "string" then
		return false, p1
	end
	assert(p1 ~= nil, "Text can't be nil")
	assert(typeof(p1) == "string", "Text must be a string")
	p2 = p2 or "{linkStart}"
	p3 = p3 or "{linkEnd}"
	p4 = p4 or "<u><b>"
	p5 = p5 or "</b></u>"
	local var1 = string.find(p1, p2) ~= nil and string.find(p1, p3) ~= nil
	
	if var1 then
		return var1, string.gsub(p1, p2, p4):gsub(p3, p5)
	end
	return var1, p1
end