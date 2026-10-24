return function(p1, p2, p3: number, Degrees: number): number
	if p3 <= 0 then
		return 0
	else
		local Radians = math.rad(Degrees)
		
		return (math.clamp((p1 - p2):Dot((Vector2.new(math.cos(Radians), (math.sin(Radians))))) / p3 + 0.5, 0, 1))
	end
end