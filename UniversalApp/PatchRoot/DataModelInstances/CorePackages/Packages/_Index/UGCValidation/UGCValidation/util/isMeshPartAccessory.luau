return function(p1)
	if p1:IsA("Accessory") then
		local handle = p1:FindFirstChild("Handle")
		
		return handle and handle:IsA("MeshPart")
	end
end