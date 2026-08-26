local function _(p1)
	return p1 * 0.659649122807
end

return {
	getSize = function(p1, p2)
		local minValue = math.min(math.round(p1.Y * 0.7), 285)
		local var1 = minValue * 0.659649122807
		
		if not p2 then
			minValue *= 0.456140350877
		end
		return Vector2.new(var1, minValue)
	end
}