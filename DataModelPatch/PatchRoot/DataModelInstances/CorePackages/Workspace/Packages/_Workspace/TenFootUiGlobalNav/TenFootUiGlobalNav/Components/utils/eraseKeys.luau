function eraseKeys(List, Tbl)
	local Copy = table.clone(Tbl)
	
	for _, value in pairs(List) do
		Copy[value] = nil
	end
	return Copy
end

return eraseKeys