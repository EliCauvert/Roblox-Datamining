return function(Object) --[[ Line: 5 | Named "getMakeupDescriptionsFromHumanoidDescription" ]]
	local List = {}
	
	for _, MakeupDescription in Object:GetChildren() do
		if MakeupDescription:IsA("MakeupDescription") then
			table.insert(List, MakeupDescription)
		end
	end
	return List
end