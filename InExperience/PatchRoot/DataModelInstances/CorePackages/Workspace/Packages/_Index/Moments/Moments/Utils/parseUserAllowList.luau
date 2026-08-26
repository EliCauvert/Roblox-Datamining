return function(p1, p2)
	if not p1 or p1 == "" then
		return false
	end
	for i, v in string.split(p1, ",") do
		local var1 = v:match("^%s*(.-)%s*$")
		
		if var1 and tonumber(var1) == p2 then
			return true
		end
	end
	return false
end