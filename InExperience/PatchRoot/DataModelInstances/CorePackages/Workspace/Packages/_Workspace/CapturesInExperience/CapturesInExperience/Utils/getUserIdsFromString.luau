return function(Text: string) --[[ Line: 1 | Named "getUserIdsFromString" ]]
	local t = {}
	
	for _, value in string.split(Text, ",") do
		if tonumber(value) then
			t[value] = true
		end
	end
	return t
end