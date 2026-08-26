return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { placesInfos = p1 }
end)