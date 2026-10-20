return function(List)
	if not List then
		return nil
	end
	for i, value in pairs(List) do
		if i ~= "measurement_score" and type(value) == "table" then
			return value
		end
	end
	return nil
end