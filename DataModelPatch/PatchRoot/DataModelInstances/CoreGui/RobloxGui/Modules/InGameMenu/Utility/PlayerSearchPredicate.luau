return function(Text: string, Text1: string, p1): boolean
	return Text == nil or Text == "" or (p1 and string.find(utf8.nfdnormalize(p1):lower(), utf8.nfdnormalize(Text):lower(), 1, true) ~= nil or string.find(Text1:lower(), Text:lower(), 1, true) ~= nil)
end