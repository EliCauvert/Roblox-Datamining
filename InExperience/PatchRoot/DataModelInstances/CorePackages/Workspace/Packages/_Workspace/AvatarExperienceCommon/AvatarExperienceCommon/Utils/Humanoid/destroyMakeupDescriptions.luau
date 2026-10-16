return function(Object) --[[ Line: 5 | Named "destroyMakeupDescriptions" ]]
	for _, MakeupDescription in Object:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") then
			MakeupDescription:Destroy()
		end
	end
end