return function(p0) --[[ line: 1 | named "getUserIdsFromString" ]]
	local t = {}
	
	for i, v in string.split(p0, ",") do
		if tonumber(v) then
			t[v] = true
		end
	end
	return t
end