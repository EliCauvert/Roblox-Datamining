return function(p0) --[[ line: 5 | named "destroyMakeupDescriptions" ]]
	for i, v in p0:GetChildren() do
		if v:IsA("MakeupDescription") then
			v:Destroy()
		end
	end
end