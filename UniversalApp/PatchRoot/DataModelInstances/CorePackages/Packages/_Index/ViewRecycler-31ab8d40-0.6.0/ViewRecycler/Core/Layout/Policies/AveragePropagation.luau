return {
	new = function(p1) --[[ Line: 37 ]]
		local P0 = p1 or {}
		local SampleInterval = P0.sampleInterval or 8
		local DriftThreshold = P0.driftThreshold or 8
		local Count = 0
		local InitialAverage = P0.initialAverage or 0
		
		return {
			recordMeasurementAndShouldUpdateEstimates = function(p2): boolean --[[ Line: 45 ]]
				-- upvalues: Count (ref), SampleInterval (copy), InitialAverage (ref), DriftThreshold (copy)
				Count += 1
				
				if Count < SampleInterval then
					return false
				elseif math.abs(p2 - InitialAverage) < DriftThreshold then
					return false
				else
					InitialAverage = p2
					Count = 0
					
					return true
				end
			end
		}
	end
}