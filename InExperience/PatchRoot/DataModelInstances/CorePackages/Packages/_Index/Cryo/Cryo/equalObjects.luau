return function(...): boolean --[[ Line: 2 | Named "equalObjects" ]]
	local Selected = select(1, ...)
	
	for i = 2, select("#", ...) do
		if Selected ~= select(i, ...) then
			return false
		end
	end
	return true
end