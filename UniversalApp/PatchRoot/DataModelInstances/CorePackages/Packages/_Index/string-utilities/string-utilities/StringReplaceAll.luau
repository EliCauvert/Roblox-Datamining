return function(p0, p1) --[[ line: 9 ]]
	if type(p0) ~= "string" then
		return ""
	elseif type(p1) ~= "table" then
		return p0
	end
	local var0 = p0
	
	for i, v in pairs(p1) do
		if type(i) == "string" and type(v) == "string" then
			var0 = string.gsub(var0, i, v)
		end
	end
	return var0
end