return function(Text1: string, Text: string): boolean
	return not Text1 or Text1 == "" or string.find(string.lower(Text), string.lower(Text1), 1, true) ~= nil
end