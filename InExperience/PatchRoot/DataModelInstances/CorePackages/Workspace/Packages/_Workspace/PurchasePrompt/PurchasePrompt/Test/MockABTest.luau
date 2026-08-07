return {
	new = function(p0) --[[ line: 9 ]]
		local t = {}
		p0 = p0 or {}
		
		function t.getLayerData(p1) --[[ line: 14 ]]
			-- upvalues: p0 (ref)
			return p0[p1]
		end
		
		function t.logUserLayerExposure(p2) --[[ line: 18 ]]
			-- upvalues: p0 (ref)
			return p0[p2]
		end
		
		return t
	end
}