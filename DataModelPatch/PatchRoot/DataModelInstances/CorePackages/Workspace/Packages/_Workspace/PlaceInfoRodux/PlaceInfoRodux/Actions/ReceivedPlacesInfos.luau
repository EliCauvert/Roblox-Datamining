return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(PlacesInfos)
	return { placesInfos = PlacesInfos }
end)