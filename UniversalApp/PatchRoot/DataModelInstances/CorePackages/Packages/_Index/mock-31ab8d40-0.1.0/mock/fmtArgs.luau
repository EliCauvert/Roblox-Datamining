return function(p0)
	local t = {}
	
	for i = 1, p0.n do
		if type(p0[i]) == "string" then
			table.insert(t, "\"" .. p0[i] .. "\"")
		else
			table.insert(t, tostring(p0[i]))
		end
	end
	return "{" .. table.concat(t, ", ") .. "}"
end