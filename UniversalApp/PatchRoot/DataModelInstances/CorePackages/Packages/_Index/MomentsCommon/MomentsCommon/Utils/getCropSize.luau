return function(p0, p1) --[[ line: 1 | named "getCropSize" ]]
	if p0.X == 0 or p0.Y == 0 or (p1.X == 0 or p1.Y == 0) then
		return UDim2.fromScale(1, 1)
	end
	local var0 = p0.X / p0.Y
	local var1 = p1.X / p1.Y
	
	return if var1 < var0 then UDim2.fromScale(1, var0 / var1) else UDim2.fromScale(var1 / var0, 1)
end