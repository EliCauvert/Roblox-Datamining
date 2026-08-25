return {
	new = function(p0)
		local t = {}
		p0 = p0 or {}
		
		function t.getLayerData(p1)
			-- upvalues: p0 (ref)
			return p0[p1]
		end
		
		function t.logUserLayerExposure(p2)
			-- upvalues: p0 (ref)
			return p0[p2]
		end
		
		return t
	end
}