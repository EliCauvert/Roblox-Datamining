return {
	new = function()
		return {}
	end,
	fromWeb = function(p0)
		p0 = p0 or {}
		p0.placeId = tostring(p0.placeId)
		
		return p0
	end
}