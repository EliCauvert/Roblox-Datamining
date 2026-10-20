return function(Object, ChildNames)
	local Child = nil
	for _, childName in pairs(ChildNames) do
		Child = Object:FindFirstChild(childName)
		
		if Child then
			return if Child:IsA("Attachment") then Child else Child
		end
	end
	return nil
end