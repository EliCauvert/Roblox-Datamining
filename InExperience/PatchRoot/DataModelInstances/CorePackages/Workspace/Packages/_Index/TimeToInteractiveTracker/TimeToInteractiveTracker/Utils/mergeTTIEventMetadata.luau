local _ = require(script.Parent.Parent.Stores.types)

return function(Tbl, List) --[[ Line: 6 | Named "mergeTTIEventMetadata" ]]
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end