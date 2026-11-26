return {
	Landscape = 1.3333333333333333,
	Portrait = 0.75,
	Square = 1,
	fit = function(p1: number): number
		if p1 <= 0 or p1 >= 1e999 then
			error(`TileAspectRatio.fit needs a positive, finite aspect ratio, got {p1}`)
		elseif p1 > 1.05 then
			return 1.3333333333333333
		elseif p1 < 0.95 then
			return 0.75
		end
		return 1
	end
}