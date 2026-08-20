return function(p0) --[[ line: 24 | named "normalizeScreenSizeForWire" ]]
	return if #p0 == 0 then p0 else string.lower(string.sub(p0, 1, 1)) .. string.sub(p0, 2)
end