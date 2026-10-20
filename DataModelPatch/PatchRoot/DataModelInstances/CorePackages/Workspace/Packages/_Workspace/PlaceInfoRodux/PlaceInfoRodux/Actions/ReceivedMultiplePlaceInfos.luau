return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(PlaceInfos)
	return { placeInfos = PlaceInfos }
end)