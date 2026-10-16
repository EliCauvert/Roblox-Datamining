return function(Text: string, Text1): boolean --[[ Line: 16 | Named "startsWith" ]]
	return Text:sub(1, Text1:len()) == Text1
end