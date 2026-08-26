return {
	new = function(p1)
		p1 = p1 or {}
		local sampleInterval = p1.sampleInterval or 8
		local driftThreshold = p1.driftThreshold or 8
		local var1 = 0
		local initialAverage = p1.initialAverage or 0
		
		return {
			recordMeasurementAndShouldUpdateEstimates = function(p2)
				-- upvalues: var1 (write), sampleInterval (ref), initialAverage (write), driftThreshold (ref)
				var1 += 1
				
				if var1 < sampleInterval then
					return false
				elseif math.abs(p2 - initialAverage) < driftThreshold then
					return false
				end
				initialAverage = p2
				var1 = 0
				
				return true
			end
		}
	end
}