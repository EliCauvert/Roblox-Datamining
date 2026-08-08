return function(p0, p1) --[[ line: 11 | named "getPlayer" ]]
	for i, v in pairs(p0) do
		if v.userId == p1 then
			return v
		end
	end
	return nil
end