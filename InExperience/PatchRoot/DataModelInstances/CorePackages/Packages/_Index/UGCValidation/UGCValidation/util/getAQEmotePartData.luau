return function(p0)
	if not p0 then
		return nil
	end
	for i, v in pairs(p0) do
		if i ~= "measurement_score" and type(v) == "table" then
			return v
		end
	end
	return nil
end