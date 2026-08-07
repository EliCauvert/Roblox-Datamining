return {
	new = function() --[[ line: 3 ]]
		return {}
	end,
	fromWeb = function(p0) --[[ line: 9 ]]
		p0 = p0 or {}
		p0.placeId = tostring(p0.placeId)
		
		return p0
	end
}