return function(p1, p2)
	local var1
	for i, v in pairs(p2) do
		var1 = p1:FindFirstChild(v)
		
		if var1 then
			return if var1:IsA("Attachment") then var1 else var1
		end
	end
	return nil
end