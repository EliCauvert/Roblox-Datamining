return function(p1): number
	local ScaledClockTime = (os.clock() - p1) * 1000
	
	return if ScaledClockTime <= 0 then 0 else math.round(ScaledClockTime * 100) / 100
end