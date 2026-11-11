return function(Text: string)
	local t = {}
	
	for _, value in string.split(Text, ",") do
		if tonumber(value) then
			t[value] = true
		end
	end
	return t
end