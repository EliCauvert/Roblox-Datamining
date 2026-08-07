return function(p0, p1) --[[ line: 7 ]]
	local var0 = 0
	
	for i, v in pairs(p0:GetChildren()) do
		if not p1 or v:IsA(p1) then
			var0 += 1
		end
	end
	return var0
end