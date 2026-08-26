return function(p1)
	for i, v in p1:GetChildren() do
		if v:IsA("MakeupDescription") then
			v:Destroy()
		end
	end
end