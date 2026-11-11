return function(p1, p2)
	local P0 = p1 or {}
	
	if (p2 == "POST" or p2 == "PATCH") and not P0["Content-Type"] then
		P0["Content-Type"] = "application/json"
	end
	return P0
end