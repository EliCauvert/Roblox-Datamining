return {
	lerp = function(startValue, endValue, alpha)
		return endValue * alpha + startValue * (1 - alpha)
	end,
	inverseLerp = function(startValue, endValue, alpha)
		return if endValue - startValue == 0 then 0 else (alpha - startValue) / (endValue - startValue)
	end,
	signedPow = function(value, p1)
		return math.pow(math.abs(value), p1) * math.sign(value)
	end,
	log = function(p1, p2)
		return if p1 == 10 then math.log10(p2) else math.log(p2) / math.log(p1)
	end,
	roundToNearest = function(value, p1)
		return math.round(value / p1) * p1
	end
}