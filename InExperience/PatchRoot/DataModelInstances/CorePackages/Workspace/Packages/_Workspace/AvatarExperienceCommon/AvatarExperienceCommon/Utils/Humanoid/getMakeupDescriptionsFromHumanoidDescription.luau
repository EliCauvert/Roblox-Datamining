return function(p1)
	local t = {}
	
	for i, v in p1:GetChildren() do
		if v:IsA("MakeupDescription") then
			table.insert(t, v)
		end
	end
	return t
end