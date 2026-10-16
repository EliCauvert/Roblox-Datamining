return function(Replaced, List) --[[ Line: 9 ]]
	if type(Replaced) ~= "string" then
		return ""
	end
	if type(List) ~= "table" then
		return Replaced
	end
	local Text: string = Replaced
	
	for i, value in pairs(List) do
		if type(i) == "string" and type(value) == "string" then
			Text = string.gsub(Text, i, value)
		end
	end
	return Text
end