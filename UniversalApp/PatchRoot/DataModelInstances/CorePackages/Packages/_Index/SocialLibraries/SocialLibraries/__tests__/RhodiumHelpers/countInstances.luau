return function(p1, p2)
	local var1 = 0
	
	for i, v in pairs(p1:GetChildren()) do
		if not p2 or v:IsA(p2) then
			var1 += 1
		end
	end
	return var1
end