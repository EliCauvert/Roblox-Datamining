return function(Text: string, Text1): boolean --[[ Line: 14 | Named "endsWith" ]]
	return Text:sub(-Text1:len()) == Text1
end