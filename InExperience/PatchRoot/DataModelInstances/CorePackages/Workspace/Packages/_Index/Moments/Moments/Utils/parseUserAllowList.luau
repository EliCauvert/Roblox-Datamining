return function(Text: string, Number): boolean --[[ Line: 7 | Named "parseUserAllowList" ]]
	if not Text or Text == "" then
		return false
	end
	for _, value in string.split(Text, ",") do
		local SS = value:match("^%s*(.-)%s*$")
		
		if SS and tonumber(SS) == Number then
			return true
		end
	end
	return false
end