return function(p1, p2)
	if p1 == nil or p2 == nil then
		return true
	end
	local var1 = p2.Position - p1
	
	return Vector2.new(var1.X, var1.Y).Magnitude <= 10
end