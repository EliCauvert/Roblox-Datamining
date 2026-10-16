return function(Text: string, Text1: string): boolean --[[ Line: 11 | Named "matchesSearchQuery" ]]
	return Text1 == "" or Text ~= nil and Text ~= "" and string.find(string.lower(Text), string.lower(Text1), 1, true) ~= nil
end