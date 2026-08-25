return function(p0, p1)
	if not p0 or p0 == "" then
		return true
	end
	local displayName = p1.displayName
	
	if p1.alias ~= nil then
		displayName ..= p1.alias
	end
	return string.find(string.lower(displayName), string.lower(p0), 1, true) ~= nil
end