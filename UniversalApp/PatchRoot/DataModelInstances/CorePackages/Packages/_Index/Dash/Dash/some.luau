return function(List, Callback): boolean
	for i, value in List do
		if Callback(value, i) then
			return true
		end
	end
	return false
end