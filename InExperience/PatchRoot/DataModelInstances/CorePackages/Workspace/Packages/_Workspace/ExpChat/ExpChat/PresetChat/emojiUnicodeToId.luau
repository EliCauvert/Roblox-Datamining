return function(p1)
	local t = {}
	
	for i, v in utf8.codes(p1) do
		table.insert(t, string.format("%x", v))
	end
	return table.concat(t, "-")
end