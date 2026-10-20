return function(List, Callback)
	for i, value in List do
		if Callback(value, i) then
			return value
		end
	end
	return nil
end