return {
	extractFieldsFromGameEntry = function(p1) --[[ Line: 6 ]]
		return if p1 then { universeId = p1.universeId, placeId = p1.placeId } else {}
	end
}