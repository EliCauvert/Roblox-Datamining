return function(p1)
	local t = {}
	
	for i = 1, p1.n do
		if type(p1[i]) == "string" then
			table.insert(t, "\"" .. p0[i] .. "\"")
		else
			table.insert(t, tostring(p1[i]))
		end
	end
	return "{" .. table.concat(t, ", ") .. "}"
end