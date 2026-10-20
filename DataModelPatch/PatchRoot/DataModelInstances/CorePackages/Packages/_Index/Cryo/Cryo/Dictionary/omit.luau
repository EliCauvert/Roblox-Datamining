return function(Tbl, ...)
	local Copy = table.clone(Tbl)
	
	for _, value in { ... } do
		Copy[value] = nil
	end
	return Copy
end