return {
	lerp = function(p1, p2, p3: number)
		return p2 * p3 + p1 * (1 - p3)
	end,
	inverseLerp = function(p1, p2, p3)
		return if p2 - p1 == 0 then 0 else (p3 - p1) / (p2 - p1)
	end,
	signedPow = function(Value: number, p1: number): number
		return math.pow(math.abs(Value), p1) * math.sign(Value)
	end,
	log = function(p1: number, p2: number): number
		return if p1 == 10 then math.log10(p2) else math.log(p2) / math.log(p1)
	end,
	roundToNearest = function(p1, p2)
		return math.round(p1 / p2) * p2
	end
}