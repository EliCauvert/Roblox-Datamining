local _ = require(script.Parent.AssetLibraryTypes)

return function(value, p1)
	local lowerText = string.lower(p1 or "")
	
	if lowerText == "" then
		return value
	end
	local t = {}
	
	for i, v in value do
		if string.find(string.lower(v.displayName), lowerText, 1, true) ~= nil then
			table.insert(t, v)
		end
	end
	return t
end