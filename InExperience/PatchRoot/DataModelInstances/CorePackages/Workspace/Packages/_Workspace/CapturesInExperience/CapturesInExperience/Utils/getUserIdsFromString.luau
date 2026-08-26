return function(p1)
	local t = {}
	
	for i, v in string.split(p1, ",") do
		if tonumber(v) then
			t[v] = true
		end
	end
	return t
end