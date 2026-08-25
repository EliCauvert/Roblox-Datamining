return function(p0, p1)
	local var0
	for i, v in pairs(p1) do
		var0 = p0:FindFirstChild(v)
		
		if var0 then
			return if var0:IsA("Attachment") then var0 else var0
		end
	end
	return nil
end