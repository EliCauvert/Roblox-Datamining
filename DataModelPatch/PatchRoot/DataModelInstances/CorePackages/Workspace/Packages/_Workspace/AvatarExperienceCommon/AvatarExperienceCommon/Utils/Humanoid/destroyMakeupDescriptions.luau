return function(Object)
	for _, MakeupDescription in Object:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") then
			MakeupDescription:Destroy()
		end
	end
end