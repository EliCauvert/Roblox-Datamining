return {
	new = function(p0) --[[ line: 37 ]]
		p0 = p0 or {}
		local sampleInterval = p0.sampleInterval or 8
		local driftThreshold = p0.driftThreshold or 8
		local var3 = 0
		local initialAverage = p0.initialAverage or 0
		
		return {
			recordMeasurementAndShouldUpdateEstimates = function(p1) --[[ line: 45 ]]
				-- upvalues: var3 (write), sampleInterval (ref), initialAverage (write), driftThreshold (ref)
				var3 += 1
				
				if var3 < sampleInterval then
					return false
				elseif math.abs(p1 - initialAverage) < driftThreshold then
					return false
				end
				initialAverage = p1
				var3 = 0
				
				return true
			end
		}
	end
}