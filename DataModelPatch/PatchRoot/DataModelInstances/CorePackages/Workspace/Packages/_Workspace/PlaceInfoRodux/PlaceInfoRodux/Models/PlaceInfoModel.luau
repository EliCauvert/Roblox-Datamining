return {
	new = function()
		return {}
	end,
	fromWeb = function(p1)
		local P0 = p1 or {}
		P0.placeId = tostring(P0.placeId)
		
		return P0
	end
}