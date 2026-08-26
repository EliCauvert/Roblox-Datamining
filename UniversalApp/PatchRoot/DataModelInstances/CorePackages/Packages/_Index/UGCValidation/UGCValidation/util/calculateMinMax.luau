local function _(p1, p2, p3)
	return if p1 and p2 then Vector3.new(p3(p1.X, p2.X), p3(p1.Y, p2.Y), p3(p1.Z, p2.Z)) else p1 or p2
end

return function(a, b, p1, p2)
	local min = math.min
	local var1 = if a and p1 then Vector3.new(min(a.X, p1.X), min(a.Y, p1.Y), min(a.Z, p1.Z)) else a or p1
	local max = math.max
	
	if b and p2 then
		return var1, Vector3.new(max(b.X, p2.X), max(b.Y, p2.Y), max(b.Z, p2.Z))
	end
	return var1, b or p2
end