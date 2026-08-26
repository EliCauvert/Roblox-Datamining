return {
	new = function(p1)
		local t = {}
		p1 = p1 or {}
		
		function t.getLayerData(p2)
			-- upvalues: p1 (ref)
			return p1[p2]
		end
		
		function t.logUserLayerExposure(p2)
			-- upvalues: p1 (ref)
			return p1[p2]
		end
		
		return t
	end
}