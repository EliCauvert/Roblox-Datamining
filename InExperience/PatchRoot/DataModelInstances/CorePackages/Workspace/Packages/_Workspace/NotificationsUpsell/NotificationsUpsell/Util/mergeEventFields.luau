return function(Tbl, List)
	if List == nil then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end