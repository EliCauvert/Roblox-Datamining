return function(Text: string, p1): boolean --[[ Line: 8 ]]
	if not Text or Text == "" then
		return true
	end
	local DisplayName = p1.displayName
	
	if p1.alias ~= nil then
		DisplayName ..= p1.alias
	end
	return string.find(string.lower(DisplayName), string.lower(Text), 1, true) ~= nil
end