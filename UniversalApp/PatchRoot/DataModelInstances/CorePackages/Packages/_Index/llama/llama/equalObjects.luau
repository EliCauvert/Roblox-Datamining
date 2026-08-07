return function(...) --[[ line: 2 | named "equalObjects" ]]
	for i = 1, select("#", ...) - 1 do
		if select(i, ...) == select(i + 1, ...) then
			continue
		end
		return false
	end
	return true
end