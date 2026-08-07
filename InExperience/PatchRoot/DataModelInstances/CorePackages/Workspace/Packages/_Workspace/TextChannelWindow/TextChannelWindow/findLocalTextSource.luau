return function(p0, p1) --[[ line: 3 | named "findLocalTextSource" ]]
	if p0 == nil or p1 == nil then
		return nil
	end
	for i, v in p0:GetChildren() do
		if v:IsA("TextSource") and tostring(v.UserId) == p1 then
			return v
		end
	end
	return nil
end