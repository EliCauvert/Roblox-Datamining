return function(p1, p2)
	if not p1 or p1 == "" then
		return true
	end
	local displayName = p2.displayName
	
	if p2.alias ~= nil then
		displayName ..= p2.alias
	end
	return string.find(string.lower(displayName), string.lower(p1), 1, true) ~= nil
end