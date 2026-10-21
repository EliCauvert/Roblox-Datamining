local config = { columns = 0, rows = 0, cardSize = Vector2.zero }

return function(Vector, p1: number, p2)
	-- upvalues: config (copy)
	if p1 <= 0 or Vector.X <= 0 or Vector.Y <= 0 then
		return config
	end
	local config1 = config
	local v1 = 0
	
	for i = 1, p1 do
		local Ceiled = math.ceil(p1 / i)
		local Smallest = math.min((Vector.X - (i - 1) * p2) / i, (Vector.Y - (Ceiled - 1) * p2) / Ceiled * 0.75)
		
		if v1 < Smallest then
			v1 = Smallest
			config1 = {
				columns = i,
				rows = Ceiled,
				cardSize = Vector2.new(math.floor(Smallest), (math.floor(Smallest / 0.75)))
			}
		end
	end
	return config1
end