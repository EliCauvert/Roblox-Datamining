return function(p0)
	if p0:IsA("Accessory") then
		local handle = p0:FindFirstChild("Handle")
		
		return handle and handle:IsA("MeshPart")
	end
end