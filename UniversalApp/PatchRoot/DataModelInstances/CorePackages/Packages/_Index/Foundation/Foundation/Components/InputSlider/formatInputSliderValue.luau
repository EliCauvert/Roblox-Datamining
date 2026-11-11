return function(p1: number): string
	local FlooredRatio = math.floor(p1 * 1000 + 0.5) / 1000
	
	if FlooredRatio == 0 then
		FlooredRatio = 0
	end
	return (tostring(FlooredRatio))
end