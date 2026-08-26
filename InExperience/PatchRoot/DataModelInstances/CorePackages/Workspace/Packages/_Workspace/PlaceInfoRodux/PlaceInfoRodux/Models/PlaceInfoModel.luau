return {
	new = function()
		return {}
	end,
	fromWeb = function(p1)
		p1 = p1 or {}
		p1.placeId = tostring(p1.placeId)
		
		return p1
	end
}