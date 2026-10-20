local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(Text: string)
	assert(Text ~= nil, "cannot get entries from a nil value")
	local ValueType = typeof(Text)
	local List = {}
	
	if ValueType == "table" then
		for i, value in pairs(Text) do
			table.insert(List, { i, value })
		end
		return List
	else
		if ValueType == "string" then
			for i1 = 1, string.len(Text) do
				List[i1] = { tostring(i1), (string.sub(Text, i1, i1)) }
			end
		end
		return List
	end
end