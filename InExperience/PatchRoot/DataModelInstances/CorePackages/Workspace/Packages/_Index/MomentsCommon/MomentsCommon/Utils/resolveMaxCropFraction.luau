local function _(Vector): boolean
	return Vector.Y < Vector.X
end

return function(Vector, Vector1, p1, p2)
	if Vector1 == nil or Vector.X == 0 or Vector.Y == 0 then
		return 0
	else
		local IsYBelow = Vector1.Y < Vector1.X
		
		return if IsYBelow == (Vector.X > Vector.Y) then if IsYBelow and not p2 then 0 else p1 else 0
	end
end