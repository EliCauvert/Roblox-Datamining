return function(p0, p1)
	p0 = p0 or {}
	
	if (p1 == "POST" or p1 == "PATCH") and not p0["Content-Type"] then
		p0["Content-Type"] = "application/json"
	end
	return p0
end