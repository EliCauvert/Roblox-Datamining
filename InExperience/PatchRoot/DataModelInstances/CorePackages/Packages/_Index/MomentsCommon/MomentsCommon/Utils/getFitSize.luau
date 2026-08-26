return function(p1, p2)
	if p1.X == 0 or p1.Y == 0 or (p2.X == 0 or p2.Y == 0) then
		return UDim2.fromScale(1, 1)
	end
	local var1 = p1.X / p1.Y
	local var2 = p2.X / p2.Y
	
	return if var1 < var2 then UDim2.fromScale(1, var1 / var2) else UDim2.fromScale(var2 / var1, 1)
end