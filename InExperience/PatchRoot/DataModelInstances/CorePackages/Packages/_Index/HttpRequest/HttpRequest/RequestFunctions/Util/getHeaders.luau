return function(p1, p2)
	p1 = p1 or {}
	
	if (p2 == "POST" or p2 == "PATCH") and not p1["Content-Type"] then
		p1["Content-Type"] = "application/json"
	end
	return p1
end