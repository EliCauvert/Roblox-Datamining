return function(Accessory: Accessory): boolean
	if Accessory:IsA("Accessory") then
		local Handle = Accessory:FindFirstChild("Handle")
		
		if Handle and Handle:IsA("MeshPart") then
			return true
		end
	end
	return false
end