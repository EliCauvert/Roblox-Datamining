return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(PlaceIds)
	return { placeIds = PlaceIds }
end)