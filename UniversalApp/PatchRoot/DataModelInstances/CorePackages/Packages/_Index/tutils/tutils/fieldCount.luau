return function(List): number --[[ Line: 4 ]]
	local Count = 0
	
	for _ in pairs(List) do
		Count += 1
	end
	return Count
end