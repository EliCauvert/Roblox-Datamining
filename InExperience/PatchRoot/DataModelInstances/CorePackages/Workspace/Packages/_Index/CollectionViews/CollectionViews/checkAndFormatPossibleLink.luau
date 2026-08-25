return function(p0, p1, p2, p3, p4)
	if p0 == nil or p0 == "" or typeof(p0) ~= "string" then
		return false, p0
	end
	assert(p0 ~= nil, "Text can't be nil")
	assert(typeof(p0) == "string", "Text must be a string")
	p1 = p1 or "{linkStart}"
	p2 = p2 or "{linkEnd}"
	p3 = p3 or "<u><b>"
	p4 = p4 or "</b></u>"
	local var4 = string.find(p0, p1) ~= nil and string.find(p0, p2) ~= nil
	
	if var4 then
		return var4, string.gsub(p0, p1, p3):gsub(p2, p4)
	end
	return var4, p0
end