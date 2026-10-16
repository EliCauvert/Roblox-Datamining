return function(Object, ClassName): number --[[ Line: 7 ]]
	local Count = 0
	
	for _, child in pairs(Object:GetChildren()) do
		if not ClassName or child:IsA(ClassName) then
			Count += 1
		end
	end
	return Count
end