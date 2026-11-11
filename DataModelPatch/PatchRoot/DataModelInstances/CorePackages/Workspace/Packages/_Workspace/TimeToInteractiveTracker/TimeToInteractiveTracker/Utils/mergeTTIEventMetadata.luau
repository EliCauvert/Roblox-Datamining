local _ = require(script.Parent.Parent.Stores.types)

return function(Tbl, List)
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end