return function(p1, PlaceId)
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	p1:setRBXEventStream("PlacesList", "openModalFromGameTile", { placeId = PlaceId })
end