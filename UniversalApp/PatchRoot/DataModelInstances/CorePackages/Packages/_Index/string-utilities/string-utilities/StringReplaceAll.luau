return function(p1, p2)
	if type(p1) ~= "string" then
		return ""
	elseif type(p2) ~= "table" then
		return p1
	end
	local var1 = p1
	
	for i, v in pairs(p2) do
		if type(i) == "string" and type(v) == "string" then
			var1 = string.gsub(var1, i, v)
		end
	end
	return var1
end