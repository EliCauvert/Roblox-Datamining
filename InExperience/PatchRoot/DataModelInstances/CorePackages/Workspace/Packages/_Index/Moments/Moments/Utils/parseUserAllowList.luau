return function(p0, p1) --[[ line: 7 | named "parseUserAllowList" ]]
	if not p0 or p0 == "" then
		return false
	end
	for i, v in string.split(p0, ",") do
		local var0 = v:match("^%s*(.-)%s*$")
		
		if var0 and tonumber(var0) == p1 then
			return true
		end
	end
	return false
end