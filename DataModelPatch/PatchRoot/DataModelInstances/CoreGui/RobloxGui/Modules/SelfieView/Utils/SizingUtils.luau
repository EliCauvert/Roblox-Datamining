local function _(p1: number): number
	return p1 * 0.6596491228070176
end

return {
	getSize = function(p1, p2): Vector2
		local Smallest = math.min(math.round(p1.Y * 0.7), 285)
		local X = Smallest * 0.6596491228070176
		
		if not p2 then
			Smallest *= 0.45614035087719296
		end
		return Vector2.new(X, Smallest)
	end
}