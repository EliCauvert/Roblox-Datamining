return function(Text: string, Text1: string) --[[ Line: 1 ]]
	local D: string = Text:gsub("%D", "")
	local D1: string = Text1:gsub("%D", "")
	
	if string.find(D, D1) == 1 then
		return Text1, (string.sub(D, string.len(D1) + 1))
	else
		return Text1, D
	end
end