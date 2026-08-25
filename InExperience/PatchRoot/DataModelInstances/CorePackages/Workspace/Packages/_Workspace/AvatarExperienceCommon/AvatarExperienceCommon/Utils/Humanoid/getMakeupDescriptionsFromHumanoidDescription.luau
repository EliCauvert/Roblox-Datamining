return function(p0)
	local t = {}
	
	for i, v in p0:GetChildren() do
		if v:IsA("MakeupDescription") then
			table.insert(t, v)
		end
	end
	return t
end