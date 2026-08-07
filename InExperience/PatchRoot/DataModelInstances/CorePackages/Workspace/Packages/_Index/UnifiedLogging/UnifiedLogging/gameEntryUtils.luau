return {
	extractFieldsFromGameEntry = function(p0) --[[ line: 6 ]]
		return if p0 then { universeId = p0.universeId, placeId = p0.placeId } else {}
	end
}