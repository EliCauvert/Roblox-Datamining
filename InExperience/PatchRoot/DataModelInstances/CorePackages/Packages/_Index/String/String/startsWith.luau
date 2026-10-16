return function(Text1: string, Text: string, p1: number): boolean --[[ Line: 16 | Named "startsWith" ]]
	if string.len(Text) == 0 then
		return true
	else
		local StartIndex = if p1 == nil or p1 < 1 then 1 else p1
		
		return string.len(Text1) >= StartIndex and Text1:find(Text, StartIndex, true) == StartIndex
	end
end