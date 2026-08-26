return function(p1)
	if not p1 then
		return nil
	end
	for i, v in pairs(p1) do
		if i ~= "measurement_score" and type(v) == "table" then
			return v
		end
	end
	return nil
end