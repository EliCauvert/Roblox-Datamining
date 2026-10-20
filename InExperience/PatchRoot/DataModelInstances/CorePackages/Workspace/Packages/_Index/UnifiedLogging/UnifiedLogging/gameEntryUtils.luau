return {
	extractFieldsFromGameEntry = function(p1)
		return if p1 then { universeId = p1.universeId, placeId = p1.placeId } else {}
	end
}