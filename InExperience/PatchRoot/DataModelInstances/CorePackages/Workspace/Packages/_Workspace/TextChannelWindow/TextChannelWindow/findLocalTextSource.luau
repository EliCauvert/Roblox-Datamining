return function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	end
	for i, v in p1:GetChildren() do
		if v:IsA("TextSource") and tostring(v.UserId) == p2 then
			return v
		end
	end
	return nil
end