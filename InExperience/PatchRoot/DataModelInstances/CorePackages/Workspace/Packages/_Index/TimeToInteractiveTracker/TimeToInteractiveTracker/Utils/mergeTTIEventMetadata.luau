local _ = require(script.Parent.Parent.Stores.types)

return function(p0, p1) --[[ line: 6 | named "mergeTTIEventMetadata" ]]
	local cloned = table.clone(p0)
	
	for i, v in p1 do
		cloned[i] = v
	end
	return cloned
end