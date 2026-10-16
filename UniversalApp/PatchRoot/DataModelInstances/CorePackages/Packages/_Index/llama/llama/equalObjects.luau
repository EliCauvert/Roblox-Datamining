return function(...): boolean --[[ Line: 2 | Named "equalObjects" ]]
	for i = 1, select("#", ...) - 1 do
		if select(i, ...) ~= select(i + 1, ...) then
			return false
		end
	end
	return true
end