return {
	new = function(p1) --[[ Line: 9 ]]
		local P0 = p1 or {}
		
		return {
			getLayerData = function(p2) --[[ Line: 14 ]]
				-- upvalues: P0 (copy)
				return P0[p2]
			end,
			logUserLayerExposure = function(p2) --[[ Line: 18 ]]
				-- upvalues: P0 (copy)
				return P0[p2]
			end
		}
	end
}