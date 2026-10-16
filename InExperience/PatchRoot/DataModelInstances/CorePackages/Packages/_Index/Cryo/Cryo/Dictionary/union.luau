return function(Tbl, List) --[[ Line: 2 | Named "union" ]]
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end